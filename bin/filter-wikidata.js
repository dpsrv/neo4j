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

// Instance types to always keep (small bounded sets)
const KEEP_INSTANCE_TYPES = new Set([
  // Geographic (original - needed for location features)
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

  // Languages (original)
  `<${WD}Q34770>`,    // language
  `<${WD}Q33742>`,    // natural language
  `<${WD}Q1288568>`,  // modern language

  // === DATING PROFILE SPECIFIC (small bounded sets) ===

  // Zodiac signs (~12 items)
  `<${WD}Q192880>`,   // western astrological sign

  // MBTI types (~16 items)
  `<${WD}Q484876>`,   // Myers-Briggs type

  // Attachment styles (~4 items)
  `<${WD}Q7988703>`,  // attachment style

  // Gender identity (~15 items)
  `<${WD}Q48264>`,    // gender identity

  // Sexual orientation (~10 items)
  `<${WD}Q17884>`,    // sexual orientation

  // Hair color (~10 items)
  `<${WD}Q1922956>`,  // human hair color

  // Eye color (~8 items)
  `<${WD}Q17122705>`, // human eye color

  // Marital status (~7 items)
  `<${WD}Q3882219>`,  // marital status

  // Diet types (~15 items)
  `<${WD}Q179122>`,   // diet
]);

// Instance types to keep ONLY IF they are also classes (have subclasses)
// This filters out leaf nodes like "First Baptist Church of Springfield"
// but keeps "Christianity" (which has subclasses like Catholicism)
const KEEP_INSTANCE_TYPES_IF_CLASS = new Set([
  `<${WD}Q9174>`,     // religion - keep major religions that have subdenominations
  `<${WD}Q13414953>`, // religious denomination - keep major denominations
  `<${WD}Q189533>`,   // academic degree - keep major degree types
  `<${WD}Q11862829>`, // academic discipline - keep fields of study
  `<${WD}Q28640>`,    // profession - keep job categories
  `<${WD}Q12737077>`, // occupation - keep job categories
]);

const startTime = Date.now();

function formatDuration(secs) {
  const h = Math.floor(secs / 3600);
  const m = Math.floor((secs % 3600) / 60);
  const s = Math.floor(secs % 60);
  return `${h}h${m.toString().padStart(2, '0')}m${s.toString().padStart(2, '0')}s`;
}

function elapsed() {
  return formatDuration((Date.now() - startTime) / 1000);
}

function eta(pct) {
  if (pct <= 0) return '?';
  const elapsedSecs = (Date.now() - startTime) / 1000;
  const remainingSecs = elapsedSecs * (100 - pct) / pct;
  return formatDuration(remainingSecs);
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

function extractId(uri) {
  // Match both Q-entities and P-properties
  const match = uri.match(/entity\/([QP]\d+)>/);
  return match ? match[1] : null;
}

function entityPath(baseDir, id) {
  // Q123 -> Q12/Q123, P31 -> P31/P31
  const prefix = id.substring(0, 3);
  return path.join(baseDir, prefix, id);
}

function markEntity(baseDir, uri) {
  const id = extractId(uri);
  if (!id) return;

  const filePath = entityPath(baseDir, id);
  const dir = path.dirname(filePath);

  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
  if (!fs.existsSync(filePath)) {
    fs.writeFileSync(filePath, '');
  }
}

function hasEntity(baseDir, uri) {
  const id = extractId(uri);
  if (!id) return false;
  return fs.existsSync(entityPath(baseDir, id));
}

function extractPropertyId(predicate) {
  // <http://www.wikidata.org/prop/direct/P31> -> P31
  const match = predicate.match(/prop\/direct\/(P\d+)>/);
  return match ? match[1] : null;
}

function createReader(inputFile, onProgress) {
  let stream;
  const fileSize = fs.statSync(inputFile).size;

  if (inputFile.endsWith('.bz2')) {
    const fileStream = fs.createReadStream(inputFile);
    let bytesRead = 0;
    fileStream.on('data', chunk => {
      bytesRead += chunk.length;
      if (onProgress) onProgress(bytesRead, fileSize);
    });
    const proc = spawn('bzcat', ['-'], { stdio: ['pipe', 'pipe', 'inherit'] });
    fileStream.pipe(proc.stdin);
    stream = proc.stdout;
  } else if (inputFile.endsWith('.gz')) {
    const fileStream = fs.createReadStream(inputFile);
    let bytesRead = 0;
    fileStream.on('data', chunk => {
      bytesRead += chunk.length;
      if (onProgress) onProgress(bytesRead, fileSize);
    });
    const proc = spawn('zcat', ['-'], { stdio: ['pipe', 'pipe', 'inherit'] });
    fileStream.pipe(proc.stdin);
    stream = proc.stdout;
  } else {
    stream = fs.createReadStream(inputFile);
    let bytesRead = 0;
    stream.on('data', chunk => {
      bytesRead += chunk.length;
      if (onProgress) onProgress(bytesRead, fileSize);
    });
  }
  return readline.createInterface({ input: stream });
}

async function processFile(inputFile, baseDir, passNum, handler) {
  let currentPct = 0;
  const rl = createReader(inputFile, (bytesRead, totalBytes) => {
    currentPct = Math.floor(100 * bytesRead / totalBytes);
  });
  let lineCount = 0;

  for await (const line of rl) {
    lineCount++;
    if (lineCount % 10_000_000 === 0) {
      handler.status(lineCount, currentPct);
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

  // Pass 1: build index of entities to keep
  process.stderr.write(`[${elapsed()}] Pass 1: Building entity index in ${baseDir}\n`);
  let classCount = 0;
  let instanceCount = 0;
  let conditionalInstanceCount = 0;
  let propertyCount = 0;
  let totalLines = 0;
  const propertiesToKeep = new Set();

  // Track instances of KEEP_INSTANCE_TYPES_IF_CLASS - will filter after pass 1
  const conditionalInstances = new Set();

  await processFile(inputFile, baseDir, 1, {
    status(lineCount, pct) {
      process.stderr.write(`  [${pct}% ${elapsed()}/${eta(pct)}] ${lineCount.toLocaleString()} lines, ${classCount.toLocaleString()} classes, ${instanceCount.toLocaleString()} instances, ${conditionalInstances.size.toLocaleString()} conditional\n`);
    },
    process({ subj, pred, obj }) {
      // Track properties used
      const propId = extractPropertyId(pred);
      if (propId) {
        propertiesToKeep.add(propId);
      }

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
        } else if (KEEP_INSTANCE_TYPES_IF_CLASS.has(obj)) {
          // Don't mark yet - collect for filtering after we know all classes
          conditionalInstances.add(subj);
        }
      }
    },
    done(lineCount) {
      // Mark all used properties for keeping
      for (const propId of propertiesToKeep) {
        const filePath = entityPath(baseDir, propId);
        const dir = path.dirname(filePath);
        if (!fs.existsSync(dir)) {
          fs.mkdirSync(dir, { recursive: true });
        }
        if (!fs.existsSync(filePath)) {
          fs.writeFileSync(filePath, '');
          propertyCount++;
        }
      }

      // Filter conditional instances: only keep those that are also classes
      // (i.e., already marked via P279 relationships)
      process.stderr.write(`[${elapsed()}] Filtering ${conditionalInstances.size.toLocaleString()} conditional instances...\n`);
      for (const subj of conditionalInstances) {
        if (hasEntity(baseDir, subj)) {
          // Already a class, count it as a conditional instance kept
          conditionalInstanceCount++;
        }
        // If not already marked as class, don't mark it - filters out leaf instances
      }
      process.stderr.write(`[${elapsed()}] Kept ${conditionalInstanceCount.toLocaleString()} conditional instances (are also classes)\n`);

      // Save for pass 2 percentage
      totalLines = lineCount;
      process.stderr.write(`[${elapsed()}] Pass 1 complete: ${lineCount.toLocaleString()} lines, ${classCount.toLocaleString()} classes, ${instanceCount.toLocaleString()} instances, ${conditionalInstanceCount.toLocaleString()} conditional, ${propertyCount.toLocaleString()} properties\n`);
    }
  });

  // Pass 2: filter triples
  process.stderr.write(`[${elapsed()}] Pass 2: Filtering triples\n`);
  let keptCount = 0;

  await processFile(inputFile, baseDir, 2, {
    status(lineCount, pct) {
      process.stderr.write(`  [${pct}% ${elapsed()}/${eta(pct)}] ${lineCount.toLocaleString()} lines, ${keptCount.toLocaleString()} kept\n`);
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
