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
 *   ./filter-wikidata.js latest-truthy.nt.bz2 /tmp/wikidata-keep > filtered.nt
 *   gzip filtered.nt
 */

const fs = require('fs');
const path = require('path');
const readline = require('readline');
const { spawn } = require('child_process');

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

function extractQid(uri) {
  const match = uri.match(/entity\/(Q\d+)>/);
  return match ? match[1] : null;
}

function entityPath(baseDir, qid) {
  const prefix = qid.substring(0, 3);
  return path.join(baseDir, prefix, qid);
}

function markEntity(baseDir, uri) {
  const qid = extractQid(uri);
  if (!qid) return;

  const filePath = entityPath(baseDir, qid);
  const dir = path.dirname(filePath);

  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
  if (!fs.existsSync(filePath)) {
    fs.writeFileSync(filePath, '');
  }
}

function hasEntity(baseDir, uri) {
  const qid = extractQid(uri);
  if (!qid) return false;
  return fs.existsSync(entityPath(baseDir, qid));
}

function createReader(inputFile) {
  let stream;
  if (inputFile.endsWith('.bz2')) {
    const proc = spawn('bzcat', [inputFile]);
    stream = proc.stdout;
  } else if (inputFile.endsWith('.gz')) {
    const proc = spawn('zcat', [inputFile]);
    stream = proc.stdout;
  } else {
    stream = fs.createReadStream(inputFile);
  }
  return readline.createInterface({ input: stream });
}

async function processFile(inputFile, baseDir, passNum, handler) {
  const rl = createReader(inputFile);
  let lineCount = 0;

  for await (const line of rl) {
    lineCount++;
    if (lineCount % 10_000_000 === 0) {
      handler.status(lineCount);
    }

    const triple = parseTriple(line);
    if (triple) {
      handler.process(triple, line);
    }
  }

  handler.done(lineCount);
}

async function main(inputFile, baseDir) {
  if (!fs.existsSync(baseDir)) {
    fs.mkdirSync(baseDir, { recursive: true });
  }

  // Pass 1: build index
  process.stderr.write(`[${elapsed()}] Pass 1: Building entity index in ${baseDir}\n`);
  let classCount = 0;
  let instanceCount = 0;

  await processFile(inputFile, baseDir, 1, {
    status(lineCount) {
      process.stderr.write(`  [${elapsed()}] ${lineCount.toLocaleString()} lines, ${classCount.toLocaleString()} classes, ${instanceCount.toLocaleString()} instances\n`);
    },
    process({ subj, pred, obj }) {
      if (pred === P279) {
        markEntity(baseDir, subj);
        classCount++;
        if (obj.startsWith('<') && obj.includes('/entity/Q')) {
          markEntity(baseDir, obj);
        }
      } else if (pred === P31) {
        if (KEEP_INSTANCE_TYPES.has(obj)) {
          markEntity(baseDir, subj);
          instanceCount++;
        }
      }
    },
    done(lineCount) {
      process.stderr.write(`[${elapsed()}] Pass 1 complete: ${lineCount.toLocaleString()} lines, ${classCount.toLocaleString()} classes, ${instanceCount.toLocaleString()} instances\n`);
    }
  });

  // Pass 2: filter triples
  process.stderr.write(`[${elapsed()}] Pass 2: Filtering triples\n`);
  let keptCount = 0;

  await processFile(inputFile, baseDir, 2, {
    status(lineCount) {
      process.stderr.write(`  [${elapsed()}] ${lineCount.toLocaleString()} lines, ${keptCount.toLocaleString()} kept\n`);
    },
    process({ subj, pred, obj }, line) {
      if (hasEntity(baseDir, subj)) {
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
    },
    done(lineCount) {
      process.stderr.write(`[${elapsed()}] Pass 2 complete: ${keptCount.toLocaleString()} kept from ${lineCount.toLocaleString()} lines\n`);
    }
  });
}

const args = process.argv.slice(2);
if (args.length < 2) {
  process.stderr.write('Usage: ./filter-wikidata.js <input.nt.bz2> <index-dir> > filtered.nt\n');
  process.exit(1);
}

main(args[0], args[1]);
