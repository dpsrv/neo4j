#!/usr/bin/env node
/**
 * Filter Wikidata N-Triples dump for taxonomy and selected instances.
 *
 * Keeps:
 *   - All classes (entities with P279 subclass-of relationships)
 *   - Instances of: cities, countries, regions, settlements, languages
 *   - English labels only
 *
 * Usage:
 *   # Pass 1: identify entities to keep (may have duplicates due to memory flushing)
 *   bzcat latest-truthy.nt.bz2 | ./filter-wikidata.js | sort -u > /tmp/keep-entities.txt
 *
 *   # Pass 2: extract triples for those entities
 *   bzcat latest-truthy.nt.bz2 | ./filter-wikidata.js --pass2 /tmp/keep-entities.txt > filtered.nt
 *
 *   # Compress for neo4j import
 *   gzip filtered.nt
 */

const fs = require('fs');
const readline = require('readline');

const WD = 'http://www.wikidata.org/entity/';
const WDT = 'http://www.wikidata.org/prop/direct/';
const RDFS_LABEL = 'http://www.w3.org/2000/01/rdf-schema#label';

const P31 = `<${WDT}P31>`;
const P279 = `<${WDT}P279>`;

const KEEP_INSTANCE_TYPES = new Set([
  `<${WD}Q515>`,      // city
  `<${WD}Q6256>`,     // country
  `<${WD}Q3624078>`,  // sovereign state
  `<${WD}Q10864048>`, // first-level administrative division
  `<${WD}Q13220204>`, // second-level administrative division
  `<${WD}Q5119>`,     // capital city
  `<${WD}Q1549591>`,  // big city
  `<${WD}Q200250>`,   // metropolis
  `<${WD}Q532>`,      // village
  `<${WD}Q3957>`,     // town
  `<${WD}Q486972>`,   // human settlement
  `<${WD}Q34770>`,    // language
  `<${WD}Q33742>`,    // natural language
  `<${WD}Q1288568>`,  // modern language
]);

const startTime = Date.now();

function elapsed() {
  const secs = Math.floor((Date.now() - startTime) / 1000);
  const h = Math.floor(secs / 3600);
  const m = Math.floor((secs % 3600) / 60);
  const s = secs % 60;
  return `${h}h${m.toString().padStart(2, '0')}m${s.toString().padStart(2, '0')}s`;
}

function parseTriple(line) {
  line = line.trim();
  if (!line || line.startsWith('#')) return null;

  const match = line.match(/^(<[^>]+>)\s+(<[^>]+>)\s+(.+)\s+\.\s*$/);
  if (match) {
    return { subj: match[1], pred: match[2], obj: match[3] };
  }
  return null;
}

async function pass1() {
  const classes = new Set();
  const keepInstances = new Set();

  const rl = readline.createInterface({ input: process.stdin });

  let lineCount = 0;
  for await (const line of rl) {
    lineCount++;
    if (lineCount % 10_000_000 === 0) {
      process.stderr.write(`  [${elapsed()}] Pass 1: ${lineCount.toLocaleString()} lines, ${classes.size.toLocaleString()} classes, ${keepInstances.size.toLocaleString()} instances\n`);
    }

    const triple = parseTriple(line);
    if (!triple) continue;

    const { subj, pred, obj } = triple;

    if (pred === P279) {
      classes.add(subj);
      if (obj.startsWith('<')) {
        classes.add(obj);
      }
    } else if (pred === P31) {
      if (KEEP_INSTANCE_TYPES.has(obj)) {
        keepInstances.add(subj);
      }
    }

    // Periodically flush to stdout to reduce memory pressure
    if (lineCount % 50_000_000 === 0) {
      for (const entity of classes) {
        console.log(entity);
      }
      for (const entity of keepInstances) {
        console.log(entity);
      }
      classes.clear();
      keepInstances.clear();
      process.stderr.write(`  [${elapsed()}] Flushed to stdout, memory cleared\n`);
    }
  }

  process.stderr.write(`[${elapsed()}] Pass 1 complete: ${classes.size.toLocaleString()} classes, ${keepInstances.size.toLocaleString()} instances remaining\n`);

  for (const entity of classes) {
    console.log(entity);
  }
  for (const entity of keepInstances) {
    console.log(entity);
  }
}

async function pass2(keepFile) {
  process.stderr.write(`Loading entities from ${keepFile}...\n`);

  const keepEntities = new Set(
    fs.readFileSync(keepFile, 'utf8').trim().split('\n')
  );

  process.stderr.write(`Loaded ${keepEntities.size.toLocaleString()} entities\n`);
  process.stderr.write('Pass 2: Filtering triples...\n');

  const rl = readline.createInterface({ input: process.stdin });

  let lineCount = 0;
  let keptCount = 0;

  for await (const line of rl) {
    lineCount++;
    if (lineCount % 10_000_000 === 0) {
      process.stderr.write(`  [${elapsed()}] Pass 2: ${lineCount.toLocaleString()} lines, ${keptCount.toLocaleString()} kept\n`);
    }

    const triple = parseTriple(line);
    if (!triple) continue;

    const { subj, pred, obj } = triple;

    if (keepEntities.has(subj)) {
      if (pred.includes(RDFS_LABEL)) {
        if (obj.includes('@en')) {
          console.log(line);
          keptCount++;
        }
      } else {
        console.log(line);
        keptCount++;
      }
    }
  }

  process.stderr.write(`[${elapsed()}] Pass 2 complete: ${keptCount.toLocaleString()} triples kept from ${lineCount.toLocaleString()}\n`);
}

const args = process.argv.slice(2);
if (args[0] === '--pass2') {
  if (!args[1]) {
    process.stderr.write('Usage: ... | node filter-wikidata.js --pass2 <keep-entities.txt>\n');
    process.exit(1);
  }
  pass2(args[1]);
} else {
  pass1();
}
