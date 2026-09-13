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
  // Geographic
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

  // Languages
  `<${WD}Q34770>`,    // language
  `<${WD}Q33742>`,    // natural language
  `<${WD}Q1288568>`,  // modern language

  // Religion
  `<${WD}Q9174>`,     // religion
  `<${WD}Q13414953>`, // religious denomination
  `<${WD}Q879146>`,   // Christian denomination
  `<${WD}Q3220391>`,  // world view (agnosticism, atheism)

  // Zodiac/Astrology
  `<${WD}Q1047539>`,  // astrological sign
  `<${WD}Q192880>`,   // western astrological sign

  // Personality
  `<${WD}Q484876>`,   // Myers-Briggs type
  `<${WD}Q7988703>`,  // attachment style
  `<${WD}Q844569>`,   // personality type

  // Gender & Sexuality
  `<${WD}Q48264>`,    // gender identity
  `<${WD}Q17884>`,    // sexual orientation (also an instance)
  `<${WD}Q290>`,      // sex (male/female)

  // Physical characteristics
  `<${WD}Q1922956>`,  // human hair color
  `<${WD}Q17245823>`, // human eye color
  `<${WD}Q15134695>`, // body shape

  // Relationship
  `<${WD}Q3882219>`,  // marital status
  `<${WD}Q3882233>`,  // relationship status

  // Diet & Lifestyle
  `<${WD}Q179122>`,   // diet (nutrition)
  `<${WD}Q62511>`,    // lifestyle

  // Education
  `<${WD}Q189533>`,   // academic degree
  `<${WD}Q11862829>`, // academic discipline
  `<${WD}Q336>`,      // science
  `<${WD}Q34178>`,    // humanities
  `<${WD}Q8434>`,     // education (field)

  // Occupation/Career
  `<${WD}Q28640>`,    // profession
  `<${WD}Q12737077>`, // occupation
  `<${WD}Q268592>`,   // industry

  // Sports & Fitness
  `<${WD}Q349>`,      // sport
  `<${WD}Q31629>`,    // type of sport
  `<${WD}Q476028>`,   // team sport
  `<${WD}Q2312410>`,  // individual sport
  `<${WD}Q223832>`,   // martial art
  `<${WD}Q61065>`,    // fitness activity

  // Music
  `<${WD}Q188451>`,   // music genre
  `<${WD}Q34379>`,    // musical instrument

  // Entertainment
  `<${WD}Q201658>`,   // film genre
  `<${WD}Q15961987>`, // television genre
  `<${WD}Q659563>`,   // video game genre
  `<${WD}Q21198342>`, // podcast genre

  // Food & Cuisine
  `<${WD}Q1778821>`,  // cuisine
  `<${WD}Q746549>`,   // dish (food)

  // Hobbies & Activities
  `<${WD}Q47728>`,    // hobby
  `<${WD}Q1914636>`,  // activity
  `<${WD}Q11410>`,    // game
  `<${WD}Q131436>`,   // board game
  `<${WD}Q4026292>`,  // outdoor activity
  `<${WD}Q3134219>`,  // indoor activity
  `<${WD}Q17537576>`, // creative work type

  // Pets & Animals
  `<${WD}Q16521>`,    // taxon (for pet species)
  `<${WD}Q729>`,      // animal
  `<${WD}Q39201>`,    // pet

  // Travel
  `<${WD}Q1194747>`,  // type of tourism

  // Values & Traits
  `<${WD}Q169872>`,   // virtue
  `<${WD}Q9332>`,     // human behavior
  `<${WD}Q60539479>`, // personal value
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
  let propertyCount = 0;
  let totalLines = 0;
  const propertiesToKeep = new Set();

  await processFile(inputFile, baseDir, 1, {
    status(lineCount, pct) {
      process.stderr.write(`  [${pct}% ${elapsed()}/${eta(pct)}] ${lineCount.toLocaleString()} lines, ${classCount.toLocaleString()} classes, ${instanceCount.toLocaleString()} instances, ${propertiesToKeep.size.toLocaleString()} properties\n`);
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
      // Save for pass 2 percentage
      totalLines = lineCount;
      process.stderr.write(`[${elapsed()}] Pass 1 complete: ${lineCount.toLocaleString()} lines, ${classCount.toLocaleString()} classes, ${instanceCount.toLocaleString()} instances, ${propertyCount.toLocaleString()} properties\n`);
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
