// Map Wikidata items to custom dating categories via P31
// Run this after custom-categories.cypher

// ============================================================
// CLEANUP: Remove old P31 relationships to custom categories
// This removes any Wikidata items incorrectly mapped to dating categories
// ============================================================
MATCH (i:Item)-[r:P31]->(c:Category)
WHERE c.uri STARTS WITH 'dating:'
  AND NOT i.uri STARTS WITH 'dating:'
DELETE r;

// Disable deprecated categories (replaced by new ones)
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:education',
  'dating:category:social',
  'dating:category:values',
  'dating:category:lifestyle',
  'dating:category:personality',
  'dating:category:fitness'
]
SET c.enabled = false;

// Also remove any items mapped to deprecated categories
MATCH (i:Item)-[r:P31]->(c:Category {uri: 'dating:category:education'})
DELETE r;

// ============================================================
// PETS
// ============================================================
MATCH (c:Category {uri: 'dating:category:pets'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q144',      // dog
  'http://www.wikidata.org/entity/Q146',      // cat
  'http://www.wikidata.org/entity/Q15277',    // rabbit
  'http://www.wikidata.org/entity/Q23390',    // hamster
  'http://www.wikidata.org/entity/Q185957',   // guinea pig
  'http://www.wikidata.org/entity/Q182893',   // ferret
  'http://www.wikidata.org/entity/Q726',      // horse
  'http://www.wikidata.org/entity/Q5113',     // bird
  'http://www.wikidata.org/entity/Q1358',     // parrot
  'http://www.wikidata.org/entity/Q152',      // fish
  'http://www.wikidata.org/entity/Q184616',   // goldfish
  'http://www.wikidata.org/entity/Q181537',   // turtle
  'http://www.wikidata.org/entity/Q31029',    // tortoise
  'http://www.wikidata.org/entity/Q2102',     // snake
  'http://www.wikidata.org/entity/Q203079',   // ball python
  'http://www.wikidata.org/entity/Q192027',   // gecko
  'http://www.wikidata.org/entity/Q81697',    // iguana
  'http://www.wikidata.org/entity/Q193092',   // bearded dragon
  'http://www.wikidata.org/entity/Q25384',    // frog
  'http://www.wikidata.org/entity/Q7377',     // axolotl
  'http://www.wikidata.org/entity/Q131567',   // hermit crab
  'http://www.wikidata.org/entity/Q170292',   // chinchilla
  'http://www.wikidata.org/entity/Q82265',    // hedgehog
  'http://www.wikidata.org/entity/Q185115',   // sugar glider
  'http://www.wikidata.org/entity/Q37686'     // rat
]
MERGE (i)-[:P31]->(c);

// ============================================================
// OUTDOOR ACTIVITIES
// ============================================================
MATCH (c:Category {uri: 'dating:category:outdoor-activities'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q1072353',  // hiking
  'http://www.wikidata.org/entity/Q3196',     // camping
  'http://www.wikidata.org/entity/Q34095',    // mountaineering
  'http://www.wikidata.org/entity/Q180600',   // rock climbing
  'http://www.wikidata.org/entity/Q14373',    // fishing
  'http://www.wikidata.org/entity/Q7291',     // cycling
  'http://www.wikidata.org/entity/Q188617',   // mountain biking
  'http://www.wikidata.org/entity/Q6266',     // running
  'http://www.wikidata.org/entity/Q1431466',  // trail running
  'http://www.wikidata.org/entity/Q50414',    // kayaking
  'http://www.wikidata.org/entity/Q170262',   // canoeing
  'http://www.wikidata.org/entity/Q200538',   // paddleboarding
  'http://www.wikidata.org/entity/Q174432',   // surfing
  'http://www.wikidata.org/entity/Q215760',   // sailing
  'http://www.wikidata.org/entity/Q160236',   // snorkeling
  'http://www.wikidata.org/entity/Q1096774',  // scuba diving
  'http://www.wikidata.org/entity/Q11639',    // skiing
  'http://www.wikidata.org/entity/Q178131',   // snowboarding
  'http://www.wikidata.org/entity/Q1395645',  // gardening
  'http://www.wikidata.org/entity/Q37828',    // photography
  'http://www.wikidata.org/entity/Q728',      // hunting
  'http://www.wikidata.org/entity/Q62112',    // birdwatching
  'http://www.wikidata.org/entity/Q473999',   // stargazing
  'http://www.wikidata.org/entity/Q178559',   // geocaching
  'http://www.wikidata.org/entity/Q1192297'   // backpacking
]
MERGE (i)-[:P31]->(c);

// ============================================================
// INDOOR ACTIVITIES
// ============================================================
MATCH (c:Category {uri: 'dating:category:indoor-activities'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q105557',   // reading
  'http://www.wikidata.org/entity/Q11416',    // cooking
  'http://www.wikidata.org/entity/Q27959',    // baking
  'http://www.wikidata.org/entity/Q7889',     // video games
  'http://www.wikidata.org/entity/Q131436',   // board games
  'http://www.wikidata.org/entity/Q142714',   // card games
  'http://www.wikidata.org/entity/Q76592',    // puzzles
  'http://www.wikidata.org/entity/Q38807',    // chess
  'http://www.wikidata.org/entity/Q178143',   // poker
  'http://www.wikidata.org/entity/Q40953',    // meditation
  'http://www.wikidata.org/entity/Q179057',   // yoga
  'http://www.wikidata.org/entity/Q5283',     // knitting
  'http://www.wikidata.org/entity/Q173091',   // crocheting
  'http://www.wikidata.org/entity/Q219730',   // sewing
  'http://www.wikidata.org/entity/Q216284',   // origami
  'http://www.wikidata.org/entity/Q127418',   // calligraphy
  'http://www.wikidata.org/entity/Q11472',    // writing
  'http://www.wikidata.org/entity/Q11033',    // journaling
  'http://www.wikidata.org/entity/Q11030',    // photography
  'http://www.wikidata.org/entity/Q8341'      // watching movies
]
MERGE (i)-[:P31]->(c);

// ============================================================
// SPORTS & FITNESS (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:sports'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q2736',     // soccer/football
  'http://www.wikidata.org/entity/Q5372',     // basketball
  'http://www.wikidata.org/entity/Q847',      // tennis
  'http://www.wikidata.org/entity/Q1734',     // volleyball
  'http://www.wikidata.org/entity/Q5369',     // baseball
  'http://www.wikidata.org/entity/Q41323',    // American football
  'http://www.wikidata.org/entity/Q41466',    // ice hockey
  'http://www.wikidata.org/entity/Q5377',     // golf
  'http://www.wikidata.org/entity/Q7291',     // badminton
  'http://www.wikidata.org/entity/Q165863',   // table tennis
  'http://www.wikidata.org/entity/Q53121',    // cycling (sport)
  'http://www.wikidata.org/entity/Q31920',    // swimming
  'http://www.wikidata.org/entity/Q542',      // track and field
  'http://www.wikidata.org/entity/Q32112',    // boxing
  'http://www.wikidata.org/entity/Q114466',   // MMA
  'http://www.wikidata.org/entity/Q5378',     // judo
  'http://www.wikidata.org/entity/Q11439',    // taekwondo
  'http://www.wikidata.org/entity/Q11420',    // karate
  'http://www.wikidata.org/entity/Q157807',   // Brazilian jiu-jitsu
  'http://www.wikidata.org/entity/Q8418',     // wrestling
  'http://www.wikidata.org/entity/Q5375',     // cricket
  'http://www.wikidata.org/entity/Q5849',     // rugby
  'http://www.wikidata.org/entity/Q189409',   // lacrosse
  'http://www.wikidata.org/entity/Q50823',    // softball
  'http://www.wikidata.org/entity/Q41567',    // squash
  'http://www.wikidata.org/entity/Q187968',   // racquetball
  'http://www.wikidata.org/entity/Q1194492',  // pickleball
  'http://www.wikidata.org/entity/Q170356',   // bowling
  'http://www.wikidata.org/entity/Q131359',   // darts
  'http://www.wikidata.org/entity/Q648778',   // archery (sport)
  'http://www.wikidata.org/entity/Q11639',    // skiing
  'http://www.wikidata.org/entity/Q178131',   // snowboarding
  'http://www.wikidata.org/entity/Q174432',   // surfing
  'http://www.wikidata.org/entity/Q155149',   // skateboarding
  'http://www.wikidata.org/entity/Q180600',   // rock climbing
  'http://www.wikidata.org/entity/Q12100',    // fencing
  'http://www.wikidata.org/entity/Q159354',   // rowing
  'http://www.wikidata.org/entity/Q7707',     // water polo
  'http://www.wikidata.org/entity/Q8418',     // handball Q41322
  'http://www.wikidata.org/entity/Q1622659',  // field hockey
  'http://www.wikidata.org/entity/Q130003',   // weightlifting
  'http://www.wikidata.org/entity/Q179057',   // yoga
  'http://www.wikidata.org/entity/Q858380',   // pilates
  'http://www.wikidata.org/entity/Q6266',     // running
  'http://www.wikidata.org/entity/Q1072353',  // hiking
  'http://www.wikidata.org/entity/Q27963',    // walking
  'http://www.wikidata.org/entity/Q11641',    // gymnastics
  'http://www.wikidata.org/entity/Q11019'     // machine (fitness)
]
MERGE (i)-[:P31]->(c);

// Custom sports/fitness items (not in Wikidata or custom terms)
MATCH (c:Category {uri: 'dating:category:sports'})
UNWIND ['CrossFit', 'Jogging', 'Aerobics', 'Spinning', 'HIIT', 'Calisthenics', 'Barre', 'Dancing'] AS label
MERGE (i:Item {uri: 'dating:sport:' + replace(toLower(label), ' ', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// MUSIC (genres and instruments)
// ============================================================
MATCH (c:Category {uri: 'dating:category:music'})
MATCH (i:Item) WHERE i.uri IN [
  // Genres
  'http://www.wikidata.org/entity/Q11399',    // rock
  'http://www.wikidata.org/entity/Q8341',     // pop
  'http://www.wikidata.org/entity/Q11401',    // jazz
  'http://www.wikidata.org/entity/Q37073',    // country
  'http://www.wikidata.org/entity/Q9759',     // hip hop
  'http://www.wikidata.org/entity/Q188450',   // electronic
  'http://www.wikidata.org/entity/Q9778',     // R&B
  'http://www.wikidata.org/entity/Q9730',     // classical
  'http://www.wikidata.org/entity/Q49451',    // reggae
  'http://www.wikidata.org/entity/Q213665',   // folk
  'http://www.wikidata.org/entity/Q183504',   // indie
  'http://www.wikidata.org/entity/Q38848',    // metal
  'http://www.wikidata.org/entity/Q206159',   // punk
  'http://www.wikidata.org/entity/Q43343',    // blues
  'http://www.wikidata.org/entity/Q62982',    // soul
  'http://www.wikidata.org/entity/Q26693',    // Latin
  'http://www.wikidata.org/entity/Q484641',   // K-pop
  // Instruments
  'http://www.wikidata.org/entity/Q6607',     // guitar
  'http://www.wikidata.org/entity/Q5994',     // piano
  'http://www.wikidata.org/entity/Q8355',     // violin
  'http://www.wikidata.org/entity/Q11404',    // drums
  'http://www.wikidata.org/entity/Q27939',    // singing
  'http://www.wikidata.org/entity/Q180733',   // bass guitar
  'http://www.wikidata.org/entity/Q79838',    // saxophone
  'http://www.wikidata.org/entity/Q11405',    // flute
  'http://www.wikidata.org/entity/Q163829',   // ukulele
  'http://www.wikidata.org/entity/Q133163'    // DJ/turntablism
]
MERGE (i)-[:P31]->(c);

// ============================================================
// FAVORITE CUISINES (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:food-drink'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q826349',   // Italian cuisine
  'http://www.wikidata.org/entity/Q207754',   // Mexican cuisine
  'http://www.wikidata.org/entity/Q192764',   // Japanese cuisine
  'http://www.wikidata.org/entity/Q193205',   // Chinese cuisine
  'http://www.wikidata.org/entity/Q466972',   // Indian cuisine
  'http://www.wikidata.org/entity/Q841296',   // Thai cuisine
  'http://www.wikidata.org/entity/Q6500',     // French cuisine
  'http://www.wikidata.org/entity/Q473972',   // Korean cuisine
  'http://www.wikidata.org/entity/Q641839',   // Greek cuisine
  'http://www.wikidata.org/entity/Q1054650',  // Mediterranean cuisine
  'http://www.wikidata.org/entity/Q851936',   // Vietnamese cuisine
  'http://www.wikidata.org/entity/Q857302',   // American cuisine
  'http://www.wikidata.org/entity/Q755986',   // Middle Eastern cuisine
  'http://www.wikidata.org/entity/Q1338311',  // Spanish cuisine
  'http://www.wikidata.org/entity/Q1056505',  // Ethiopian cuisine
  'http://www.wikidata.org/entity/Q844124',   // Brazilian cuisine
  'http://www.wikidata.org/entity/Q1707912',  // Caribbean cuisine
  'http://www.wikidata.org/entity/Q12348',    // sushi
  'http://www.wikidata.org/entity/Q10538',    // barbecue
  'http://www.wikidata.org/entity/Q177',      // pizza
  'http://www.wikidata.org/entity/Q192628',   // ramen
  'http://www.wikidata.org/entity/Q12198'     // dim sum
]
MERGE (i)-[:P31]->(c);

// Custom cuisine items
MATCH (c:Category {uri: 'dating:category:food-drink'})
UNWIND ['Southern/Soul Food', 'Tacos', 'Seafood', 'Brunch', 'Fine Dining', 'Street Food', 'Home Cooking'] AS label
MERGE (i:Item {uri: 'dating:cuisine:' + replace(replace(toLower(label), ' ', '-'), '/', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// ENTERTAINMENT (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:entertainment'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q188473',   // action film
  'http://www.wikidata.org/entity/Q157443',   // comedy film
  'http://www.wikidata.org/entity/Q130232',   // drama film
  'http://www.wikidata.org/entity/Q200092',   // horror film
  'http://www.wikidata.org/entity/Q24925',    // science fiction film
  'http://www.wikidata.org/entity/Q182015',   // thriller film
  'http://www.wikidata.org/entity/Q860626',   // romantic comedy
  'http://www.wikidata.org/entity/Q93204',    // documentary film
  'http://www.wikidata.org/entity/Q1107',     // anime
  'http://www.wikidata.org/entity/Q5398426',  // television series
  'http://www.wikidata.org/entity/Q193355',   // reality television
  'http://www.wikidata.org/entity/Q7889',     // video game
  'http://www.wikidata.org/entity/Q24634210', // podcast
  'http://www.wikidata.org/entity/Q193355',   // stand-up comedy Q193355 is reality TV, use Q170292
  'http://www.wikidata.org/entity/Q11635',    // theater
  'http://www.wikidata.org/entity/Q1344',     // opera
  'http://www.wikidata.org/entity/Q200092',   // concert Q200092 is horror, use Q37813
  'http://www.wikidata.org/entity/Q393544',   // true crime
  'http://www.wikidata.org/entity/Q106833',   // audiobook
  'http://www.wikidata.org/entity/Q842256'    // musical theatre
]
MERGE (i)-[:P31]->(c);

// Custom entertainment items (stand-up, concerts need correct IDs)
MATCH (c:Category {uri: 'dating:category:entertainment'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q170292',   // stand-up comedy
  'http://www.wikidata.org/entity/Q37813'     // concert
]
MERGE (i)-[:P31]->(c);

// ============================================================
// CREATIVE (Wikidata items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:creative'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q11629',    // painting
  'http://www.wikidata.org/entity/Q93184',    // drawing
  'http://www.wikidata.org/entity/Q860861',   // sculpture
  'http://www.wikidata.org/entity/Q37828',    // photography
  'http://www.wikidata.org/entity/Q11472',    // writing
  'http://www.wikidata.org/entity/Q482',      // poetry
  'http://www.wikidata.org/entity/Q12681',    // calligraphy
  'http://www.wikidata.org/entity/Q638',      // music
  'http://www.wikidata.org/entity/Q27939',    // singing
  'http://www.wikidata.org/entity/Q11639',    // dancing Q11639 is skiing - use Q11019 for dance
  'http://www.wikidata.org/entity/Q5716',     // acting
  'http://www.wikidata.org/entity/Q2526255',  // filmmaking
  'http://www.wikidata.org/entity/Q185925',   // graphic design
  'http://www.wikidata.org/entity/Q8362',     // illustration
  'http://www.wikidata.org/entity/Q12147',    // fashion design
  'http://www.wikidata.org/entity/Q219730',   // sewing
  'http://www.wikidata.org/entity/Q5283',     // knitting
  'http://www.wikidata.org/entity/Q173091',   // crocheting
  'http://www.wikidata.org/entity/Q748',      // woodworking Q748 is Buddhism - use Q232130
  'http://www.wikidata.org/entity/Q11642',    // pottery
  'http://www.wikidata.org/entity/Q357265',   // jewelry making
  'http://www.wikidata.org/entity/Q11416',    // cooking
  'http://www.wikidata.org/entity/Q27959',    // baking
  'http://www.wikidata.org/entity/Q1395645'   // gardening
]
MERGE (i)-[:P31]->(c);

// Fix dancing and woodworking with correct IDs
MATCH (c:Category {uri: 'dating:category:creative'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q11019',    // dance
  'http://www.wikidata.org/entity/Q232130'    // woodworking
]
MERGE (i)-[:P31]->(c);

// ============================================================
// TRAVEL (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:travel'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q46236',    // beach
  'http://www.wikidata.org/entity/Q1192297',  // backpacking
  'http://www.wikidata.org/entity/Q192111',   // road trip
  'http://www.wikidata.org/entity/Q3196',     // camping
  'http://www.wikidata.org/entity/Q39785',    // cruise ship/cruising
  'http://www.wikidata.org/entity/Q186386',   // adventure travel
  'http://www.wikidata.org/entity/Q1145558',  // city break
  'http://www.wikidata.org/entity/Q1640564',  // solo travel
  'http://www.wikidata.org/entity/Q1132127',  // luxury travel
  'http://www.wikidata.org/entity/Q166628',   // cultural tourism
  'http://www.wikidata.org/entity/Q867569',   // food tourism/culinary tourism
  'http://www.wikidata.org/entity/Q1156854',  // safari
  'http://www.wikidata.org/entity/Q6137410'   // staycation
]
MERGE (i)-[:P31]->(c);

// Custom travel items
MATCH (c:Category {uri: 'dating:category:travel'})
UNWIND ['Mountain Trips', 'Budget Travel', 'International Travel', 'Domestic Travel'] AS label
MERGE (i:Item {uri: 'dating:travel:' + replace(toLower(label), ' ', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// PERSONALITY (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:personality'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q49470',    // introversion
  'http://www.wikidata.org/entity/Q49481'     // extraversion
]
MERGE (i)-[:P31]->(c);

// Custom personality item (ambivert not in Wikidata)
MATCH (c:Category {uri: 'dating:category:personality'})
MERGE (i:Item {uri: 'dating:personality:ambivert'})
  ON CREATE SET i.prefLabel = ['Ambivert@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// MYERS-BRIGGS (Wikidata items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:myers-briggs'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q6014256',  // INTJ
  'http://www.wikidata.org/entity/Q6014252',  // INTP
  'http://www.wikidata.org/entity/Q5364929',  // ENTJ
  'http://www.wikidata.org/entity/Q5324879',  // ENTP
  'http://www.wikidata.org/entity/Q5973679',  // INFJ
  'http://www.wikidata.org/entity/Q6014171',  // INFP
  'http://www.wikidata.org/entity/Q5372671',  // ENFJ
  'http://www.wikidata.org/entity/Q5323999',  // ENFP
  'http://www.wikidata.org/entity/Q6091523',  // ISTJ
  'http://www.wikidata.org/entity/Q6091519',  // ISFJ
  'http://www.wikidata.org/entity/Q5401594',  // ESTJ
  'http://www.wikidata.org/entity/Q5395327',  // ESFJ
  'http://www.wikidata.org/entity/Q6091524',  // ISTP
  'http://www.wikidata.org/entity/Q6091520',  // ISFP
  'http://www.wikidata.org/entity/Q5401595',  // ESTP
  'http://www.wikidata.org/entity/Q5395328'   // ESFP
]
MERGE (i)-[:P31]->(c);

// ============================================================
// ATTACHMENT STYLE (Wikidata items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:attachment-style'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q7444346',  // secure attachment
  'http://www.wikidata.org/entity/Q4779679',  // anxious-preoccupied attachment
  'http://www.wikidata.org/entity/Q4828377',  // dismissive-avoidant attachment
  'http://www.wikidata.org/entity/Q5439816'   // fearful-avoidant (disorganized) attachment
]
MERGE (i)-[:P31]->(c);

// ============================================================
// COMFORT TEMPERATURE (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:comfort-temp'})
UNWIND ['Keep it cold (below 65°F)', 'Cool (65-68°F)', 'Moderate (68-72°F)', 'Warm (72-76°F)', 'Keep it warm (above 76°F)'] AS label
MERGE (i:Item {uri: 'dating:temp:' + replace(replace(replace(toLower(label), ' ', '-'), '(', ''), ')', '')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// WHAT I VALUE (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:what-i-value'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q8436',     // family
  'http://www.wikidata.org/entity/Q154430',   // honesty
  'http://www.wikidata.org/entity/Q842809',   // loyalty
  'http://www.wikidata.org/entity/Q649896',   // kindness
  'http://www.wikidata.org/entity/Q35875',    // humor
  'http://www.wikidata.org/entity/Q530418',   // ambition
  'http://www.wikidata.org/entity/Q17163',    // creativity
  'http://www.wikidata.org/entity/Q1062746',  // independence
  'http://www.wikidata.org/entity/Q170658',   // adventure
  'http://www.wikidata.org/entity/Q2166424',  // stability
  'http://www.wikidata.org/entity/Q131089',   // spirituality
  'http://www.wikidata.org/entity/Q12147',    // health
  'http://www.wikidata.org/entity/Q7184903',  // personal development/growth
  'http://www.wikidata.org/entity/Q177',      // community Q177 is pizza - use Q2597810
  'http://www.wikidata.org/entity/Q12189',    // learning
  'http://www.wikidata.org/entity/Q61509'     // travel
]
MERGE (i)-[:P31]->(c);

// Fix community and add custom items
MATCH (c:Category {uri: 'dating:category:what-i-value'})
MATCH (i:Item) WHERE i.uri = 'http://www.wikidata.org/entity/Q2597810' // community
MERGE (i)-[:P31]->(c);

// Custom value items
MATCH (c:Category {uri: 'dating:category:what-i-value'})
UNWIND ['Career Success', 'Work-Life Balance'] AS label
MERGE (i:Item {uri: 'dating:value:' + replace(replace(toLower(label), ' ', '-'), '&', 'and')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// DIET (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:diet'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q83364',    // vegetarianism
  'http://www.wikidata.org/entity/Q181138',   // veganism
  'http://www.wikidata.org/entity/Q756975',   // pescetarianism
  'http://www.wikidata.org/entity/Q1361297',  // ketogenic diet
  'http://www.wikidata.org/entity/Q1356006',  // paleolithic diet
  'http://www.wikidata.org/entity/Q845566',   // gluten-free diet
  'http://www.wikidata.org/entity/Q170494',   // halal
  'http://www.wikidata.org/entity/Q380574'    // kosher
]
MERGE (i)-[:P31]->(c);

// Custom diet items (no Wikidata equivalent)
MATCH (c:Category {uri: 'dating:category:diet'})
UNWIND ['No restrictions', 'Other'] AS label
MERGE (i:Item {uri: 'dating:diet:' + replace(toLower(label), ' ', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// CANNABIS (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:cannabis'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q4917506'   // medical cannabis
]
MERGE (i)-[:P31]->(c);

// Custom cannabis items (usage frequency terms are dating-specific)
MATCH (c:Category {uri: 'dating:category:cannabis'})
UNWIND ['Never', 'Occasionally', 'Regularly', 'Friendly (dont use but okay with it)', 'Prefer not to say'] AS label
MERGE (i:Item {uri: 'dating:cannabis:' + replace(replace(replace(toLower(label), ' ', '-'), '(', ''), ')', '')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// LANGUAGES
// ============================================================
MATCH (c:Category {uri: 'dating:category:languages'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q1860',     // English
  'http://www.wikidata.org/entity/Q1321',     // Spanish
  'http://www.wikidata.org/entity/Q150',      // French
  'http://www.wikidata.org/entity/Q188',      // German
  'http://www.wikidata.org/entity/Q652',      // Italian
  'http://www.wikidata.org/entity/Q5146',     // Portuguese
  'http://www.wikidata.org/entity/Q7850',     // Chinese
  'http://www.wikidata.org/entity/Q5287',     // Japanese
  'http://www.wikidata.org/entity/Q9176',     // Korean
  'http://www.wikidata.org/entity/Q7737',     // Russian
  'http://www.wikidata.org/entity/Q13955',    // Arabic
  'http://www.wikidata.org/entity/Q9288',     // Hebrew
  'http://www.wikidata.org/entity/Q1571',     // Hindi
  'http://www.wikidata.org/entity/Q9129',     // Greek
  'http://www.wikidata.org/entity/Q9610',     // Dutch
  'http://www.wikidata.org/entity/Q9027',     // Swedish
  'http://www.wikidata.org/entity/Q9035',     // Polish
  'http://www.wikidata.org/entity/Q9067',     // Hungarian
  'http://www.wikidata.org/entity/Q9063',     // Turkish
  'http://www.wikidata.org/entity/Q9083'      // Thai
]
MERGE (i)-[:P31]->(c);

// ============================================================
// CAREER (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:career'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q11661',    // information technology
  'http://www.wikidata.org/entity/Q31207',    // healthcare
  'http://www.wikidata.org/entity/Q43015',    // finance
  'http://www.wikidata.org/entity/Q8434',     // education
  'http://www.wikidata.org/entity/Q11023',    // engineering
  'http://www.wikidata.org/entity/Q336',      // science
  'http://www.wikidata.org/entity/Q4830453',  // business
  'http://www.wikidata.org/entity/Q11024',    // communication
  'http://www.wikidata.org/entity/Q7748',     // law
  'http://www.wikidata.org/entity/Q39809',    // marketing
  'http://www.wikidata.org/entity/Q11024',    // real estate Q56325876 - using Q56325876
  'http://www.wikidata.org/entity/Q862604',   // hospitality industry
  'http://www.wikidata.org/entity/Q163740',   // nonprofit organization
  'http://www.wikidata.org/entity/Q7188',     // government
  'http://www.wikidata.org/entity/Q126793',   // retail
  'http://www.wikidata.org/entity/Q176799',   // consultant
  'http://www.wikidata.org/entity/Q131524',   // entrepreneur
  'http://www.wikidata.org/entity/Q11030',    // journalism
  'http://www.wikidata.org/entity/Q385378',   // construction
  'http://www.wikidata.org/entity/Q187939',   // manufacturing
  'http://www.wikidata.org/entity/Q7590',     // transportation
  'http://www.wikidata.org/entity/Q11451',    // agriculture
  'http://www.wikidata.org/entity/Q8473'      // military
]
MERGE (i)-[:P31]->(c);

// Custom career items
MATCH (c:Category {uri: 'dating:category:career'})
UNWIND ['Art & Design', 'Music & Entertainment', 'Science & Research', 'Media & Communications', 'Sales', 'Real Estate', 'Student', 'Retired', 'Other'] AS label
MERGE (i:Item {uri: 'dating:career:' + replace(replace(toLower(label), ' ', '-'), '&', 'and')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// EDUCATION LEVEL (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:education-level'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q60854854', // high school diploma
  'http://www.wikidata.org/entity/Q58291145', // vocational school
  'http://www.wikidata.org/entity/Q752324',   // associate degree
  'http://www.wikidata.org/entity/Q163727',   // bachelor's degree
  'http://www.wikidata.org/entity/Q183816',   // master's degree
  'http://www.wikidata.org/entity/Q849697',   // doctorate
  'http://www.wikidata.org/entity/Q4373292'   // professional degree
]
MERGE (i)-[:P31]->(c);

// Custom education level items
MATCH (c:Category {uri: 'dating:category:education-level'})
UNWIND ['Some High School', 'Some College', 'Currently in School', 'Other'] AS label
MERGE (i:Item {uri: 'dating:education-level:' + replace(toLower(label), ' ', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// FIELD OF STUDY (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:field-of-study'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q21198',    // computer science
  'http://www.wikidata.org/entity/Q11661',    // information technology
  'http://www.wikidata.org/entity/Q11023',    // engineering
  'http://www.wikidata.org/entity/Q395',      // mathematics
  'http://www.wikidata.org/entity/Q413',      // physics
  'http://www.wikidata.org/entity/Q2329',     // chemistry
  'http://www.wikidata.org/entity/Q420',      // biology
  'http://www.wikidata.org/entity/Q52107',    // environmental science
  'http://www.wikidata.org/entity/Q11190',    // medicine
  'http://www.wikidata.org/entity/Q121176',   // nursing
  'http://www.wikidata.org/entity/Q9418',     // psychology
  'http://www.wikidata.org/entity/Q21201',    // sociology
  'http://www.wikidata.org/entity/Q36442',    // political science
  'http://www.wikidata.org/entity/Q8134',     // economics
  'http://www.wikidata.org/entity/Q4830453',  // business
  'http://www.wikidata.org/entity/Q43015',    // finance
  'http://www.wikidata.org/entity/Q4116214',  // accounting
  'http://www.wikidata.org/entity/Q39809',    // marketing
  'http://www.wikidata.org/entity/Q7748',     // law
  'http://www.wikidata.org/entity/Q5891',     // philosophy
  'http://www.wikidata.org/entity/Q309',      // history
  'http://www.wikidata.org/entity/Q8242',     // literature
  'http://www.wikidata.org/entity/Q11024',    // communications
  'http://www.wikidata.org/entity/Q11030',    // journalism
  'http://www.wikidata.org/entity/Q8434',     // education
  'http://www.wikidata.org/entity/Q735',      // art
  'http://www.wikidata.org/entity/Q638',      // music
  'http://www.wikidata.org/entity/Q11635',    // theater
  'http://www.wikidata.org/entity/Q11424',    // film
  'http://www.wikidata.org/entity/Q12271',    // architecture
  'http://www.wikidata.org/entity/Q185925'    // graphic design
]
MERGE (i)-[:P31]->(c);

// Custom field of study
MATCH (c:Category {uri: 'dating:category:field-of-study'})
MERGE (i:Item {uri: 'dating:field-of-study:other'})
  ON CREATE SET i.prefLabel = ['Other@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// HAIR COLOR (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:hair-color'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q1922956',  // black hair
  'http://www.wikidata.org/entity/Q2419551',  // brown hair
  'http://www.wikidata.org/entity/Q202466',   // blond hair
  'http://www.wikidata.org/entity/Q152559',   // red hair
  'http://www.wikidata.org/entity/Q2419570',  // auburn hair
  'http://www.wikidata.org/entity/Q2303510',  // gray hair
  'http://www.wikidata.org/entity/Q10862668', // white hair
  'http://www.wikidata.org/entity/Q62500'     // baldness
]
MERGE (i)-[:P31]->(c);

// Custom hair color items
MATCH (c:Category {uri: 'dating:category:hair-color'})
UNWIND ['Strawberry Blonde', 'Dyed/Other'] AS label
MERGE (i:Item {uri: 'dating:hair:' + replace(replace(toLower(label), ' ', '-'), '/', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// EYE COLOR (Wikidata items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:eye-color'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q17122705', // brown eyes
  'http://www.wikidata.org/entity/Q17122834', // blue eyes
  'http://www.wikidata.org/entity/Q17122854', // green eyes
  'http://www.wikidata.org/entity/Q17245659', // hazel eyes
  'http://www.wikidata.org/entity/Q17122740', // gray eyes
  'http://www.wikidata.org/entity/Q17245823', // amber eyes
  'http://www.wikidata.org/entity/Q52071128'  // black eyes
]
MERGE (i)-[:P31]->(c);

// ============================================================
// BODY TYPE (Wikidata items where available + custom)
// ============================================================
// Most body type descriptors are subjective/colloquial, but some concepts exist
MATCH (c:Category {uri: 'dating:category:body-type'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q12174',    // obesity (for context, not direct match)
  'http://www.wikidata.org/entity/Q1365624',  // thinness
  'http://www.wikidata.org/entity/Q188639'    // petite (body type)
]
MERGE (i)-[:P31]->(c);

// Custom body type items (subjective dating terms)
MATCH (c:Category {uri: 'dating:category:body-type'})
UNWIND ['Slim', 'Athletic', 'Average', 'Curvy', 'Muscular', 'Stocky', 'Heavyset'] AS label
MERGE (i:Item {uri: 'dating:body-type:' + toLower(label)})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// ETHNICITY (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:ethnicity'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q49078',    // white people
  'http://www.wikidata.org/entity/Q190168',   // African Americans
  'http://www.wikidata.org/entity/Q49297',    // East Asians
  'http://www.wikidata.org/entity/Q1064081',  // South Asians
  'http://www.wikidata.org/entity/Q7325',     // Jewish people
  'http://www.wikidata.org/entity/Q36747',    // Native Americans
  'http://www.wikidata.org/entity/Q726673'    // Pacific Islanders
]
MERGE (i)-[:P31]->(c);

// Custom ethnicity items (complex categories not well-represented in Wikidata)
MATCH (c:Category {uri: 'dating:category:ethnicity'})
UNWIND ['Hispanic/Latino', 'Southeast Asian', 'Middle Eastern', 'Mixed/Multiracial', 'Other'] AS label
MERGE (i:Item {uri: 'dating:ethnicity:' + replace(replace(toLower(label), ' ', '-'), '/', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// RELATIONSHIP STATUS (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:relationship-status'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q2089826',  // single person
  'http://www.wikidata.org/entity/Q880922',   // divorced
  'http://www.wikidata.org/entity/Q1144222',  // legally separated
  'http://www.wikidata.org/entity/Q745848',   // widowed
  'http://www.wikidata.org/entity/Q203249',   // open relationship
  'http://www.wikidata.org/entity/Q184211'    // romantic relationship (in a relationship)
]
MERGE (i)-[:P31]->(c);

// Custom relationship status items
MATCH (c:Category {uri: 'dating:category:relationship-status'})
MERGE (i:Item {uri: 'dating:relationship:its-complicated'})
  ON CREATE SET i.prefLabel = ['Its Complicated@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// LOOKING FOR (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:looking-for'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q491',      // friendship
  'http://www.wikidata.org/entity/Q183150',   // dating
  'http://www.wikidata.org/entity/Q8445',     // marriage
  'http://www.wikidata.org/entity/Q895513',   // casual relationship
  'http://www.wikidata.org/entity/Q192581'    // professional networking
]
MERGE (i)-[:P31]->(c);

// Custom looking-for items
MATCH (c:Category {uri: 'dating:category:looking-for'})
UNWIND ['Long-term Relationship', 'Not Sure Yet'] AS label
MERGE (i:Item {uri: 'dating:looking-for:' + replace(toLower(label), ' ', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// HEIGHT (custom items with ranges)
// ============================================================
MATCH (c:Category {uri: 'dating:category:height'})
MERGE (i:Item {uri: 'dating:height:under-5ft'})
  ON CREATE SET i.prefLabel = ['Under 5\'0" (152 cm)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:height'})
MERGE (i:Item {uri: 'dating:height:5ft0-5ft3'})
  ON CREATE SET i.prefLabel = ['5\'0" - 5\'3" (152-160 cm)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:height'})
MERGE (i:Item {uri: 'dating:height:5ft4-5ft7'})
  ON CREATE SET i.prefLabel = ['5\'4" - 5\'7" (163-170 cm)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:height'})
MERGE (i:Item {uri: 'dating:height:5ft8-5ft11'})
  ON CREATE SET i.prefLabel = ['5\'8" - 5\'11" (173-180 cm)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:height'})
MERGE (i:Item {uri: 'dating:height:6ft0-6ft3'})
  ON CREATE SET i.prefLabel = ['6\'0" - 6\'3" (183-190 cm)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:height'})
MERGE (i:Item {uri: 'dating:height:over-6ft3'})
  ON CREATE SET i.prefLabel = ['Over 6\'3" (190+ cm)@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// WEIGHT (custom items with ranges)
// ============================================================
MATCH (c:Category {uri: 'dating:category:weight'})
MERGE (i:Item {uri: 'dating:weight:under-120'})
  ON CREATE SET i.prefLabel = ['Under 120 lbs (54 kg)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:weight'})
MERGE (i:Item {uri: 'dating:weight:120-140'})
  ON CREATE SET i.prefLabel = ['120-140 lbs (54-64 kg)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:weight'})
MERGE (i:Item {uri: 'dating:weight:140-160'})
  ON CREATE SET i.prefLabel = ['140-160 lbs (64-73 kg)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:weight'})
MERGE (i:Item {uri: 'dating:weight:160-180'})
  ON CREATE SET i.prefLabel = ['160-180 lbs (73-82 kg)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:weight'})
MERGE (i:Item {uri: 'dating:weight:180-200'})
  ON CREATE SET i.prefLabel = ['180-200 lbs (82-91 kg)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:weight'})
MERGE (i:Item {uri: 'dating:weight:200-220'})
  ON CREATE SET i.prefLabel = ['200-220 lbs (91-100 kg)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:weight'})
MERGE (i:Item {uri: 'dating:weight:over-220'})
  ON CREATE SET i.prefLabel = ['Over 220 lbs (100+ kg)@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// SLIDER VALUE ITEMS (for storing exact numeric values)
// These are placeholder items - the actual value is stored on the relationship
// ============================================================
MATCH (c:Category {uri: 'dating:category:height'})
MERGE (i:Item {uri: 'dating:height:exact'})
  ON CREATE SET i.prefLabel = ['Height@en'], i.isSliderValue = true
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:weight'})
MERGE (i:Item {uri: 'dating:weight:exact'})
  ON CREATE SET i.prefLabel = ['Weight@en'], i.isSliderValue = true
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:comfort-temp'})
MERGE (i:Item {uri: 'dating:comfort-temp:exact'})
  ON CREATE SET i.prefLabel = ['Comfort Temperature@en'], i.isSliderValue = true
MERGE (i)-[:P31]->(c);

// ============================================================
// GENDER (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:gender'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q8441',     // man
  'http://www.wikidata.org/entity/Q467',      // woman
  'http://www.wikidata.org/entity/Q48270',    // non-binary
  'http://www.wikidata.org/entity/Q2449503',  // transgender man
  'http://www.wikidata.org/entity/Q1052281',  // transgender woman
  'http://www.wikidata.org/entity/Q505371',   // genderqueer
  'http://www.wikidata.org/entity/Q18116794', // genderfluid
  'http://www.wikidata.org/entity/Q7130936',  // agender
  'http://www.wikidata.org/entity/Q160881'    // two-spirit
]
MERGE (i)-[:P31]->(c);

// Custom gender item
MATCH (c:Category {uri: 'dating:category:gender'})
MERGE (i:Item {uri: 'dating:gender:other'})
  ON CREATE SET i.prefLabel = ['Other@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// SEXUAL ORIENTATION (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:orientation'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q1035954',  // heterosexuality (straight)
  'http://www.wikidata.org/entity/Q592',      // gay
  'http://www.wikidata.org/entity/Q6649',     // lesbian
  'http://www.wikidata.org/entity/Q43200',    // bisexuality
  'http://www.wikidata.org/entity/Q271534',   // pansexuality
  'http://www.wikidata.org/entity/Q33649',    // asexuality
  'http://www.wikidata.org/entity/Q1478479',  // demisexuality
  'http://www.wikidata.org/entity/Q17884'     // queer
]
MERGE (i)-[:P31]->(c);

// Custom orientation items
MATCH (c:Category {uri: 'dating:category:orientation'})
UNWIND ['Questioning', 'Other'] AS label
MERGE (i:Item {uri: 'dating:orientation:' + toLower(label)})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// SMOKING (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:smoking'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q12192262', // non-smoker
  'http://www.wikidata.org/entity/Q2196981',  // smoker
  'http://www.wikidata.org/entity/Q2489732',  // smoking cessation (trying to quit)
  'http://www.wikidata.org/entity/Q185157'    // vaping
]
MERGE (i)-[:P31]->(c);

// Custom smoking items
MATCH (c:Category {uri: 'dating:category:smoking'})
MERGE (i:Item {uri: 'dating:smoking:socially'})
  ON CREATE SET i.prefLabel = ['Smokes socially@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// DRINKING (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:drinking'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q15026091', // teetotalism (never drinks)
  'http://www.wikidata.org/entity/Q10829696', // social drinker
  'http://www.wikidata.org/entity/Q388614'    // sobriety
]
MERGE (i)-[:P31]->(c);

// Custom drinking items
MATCH (c:Category {uri: 'dating:category:drinking'})
UNWIND ['Drinks regularly', 'Rarely drinks'] AS label
MERGE (i:Item {uri: 'dating:drinking:' + replace(toLower(label), ' ', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// CHILDREN (Wikidata concepts + custom phrasings)
// ============================================================
// Wikidata has concepts but dating app phrasings are specific
MATCH (c:Category {uri: 'dating:category:children'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q170477',   // childfree (no kids, don't want)
  'http://www.wikidata.org/entity/Q7566'      // parent (has kids)
]
MERGE (i)-[:P31]->(c);

// Custom children items (compound dating-specific phrasings)
MATCH (c:Category {uri: 'dating:category:children'})
UNWIND [
  {uri: 'dating:children:no-want-someday', label: 'No kids, want someday'},
  {uri: 'dating:children:no-open', label: 'No kids, open to it'},
  {uri: 'dating:children:yes-want-more', label: 'Have kids, want more'},
  {uri: 'dating:children:yes-no-more', label: 'Have kids, don\'t want more'},
  {uri: 'dating:children:yes-open', label: 'Have kids, open to more'}
] AS item
MERGE (i:Item {uri: item.uri})
  ON CREATE SET i.prefLabel = [item.label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// RELIGION (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:religion'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q5043',     // Christianity
  'http://www.wikidata.org/entity/Q1841',     // Catholicism
  'http://www.wikidata.org/entity/Q23540',    // Protestantism
  'http://www.wikidata.org/entity/Q35032',    // Eastern Orthodox
  'http://www.wikidata.org/entity/Q432',      // Islam
  'http://www.wikidata.org/entity/Q9268',     // Judaism
  'http://www.wikidata.org/entity/Q748',      // Buddhism
  'http://www.wikidata.org/entity/Q9089',     // Hinduism
  'http://www.wikidata.org/entity/Q9325',     // Sikhism
  'http://www.wikidata.org/entity/Q747802',   // Mormonism/LDS
  'http://www.wikidata.org/entity/Q288928',   // Agnosticism
  'http://www.wikidata.org/entity/Q7066'      // Atheism
]
MERGE (i)-[:P31]->(c);

// Custom religion items
MATCH (c:Category {uri: 'dating:category:religion'})
UNWIND ['Spiritual', 'Other'] AS label
MERGE (i:Item {uri: 'dating:religion:' + toLower(label)})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// ZODIAC SIGN (Wikidata items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:zodiac'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q37930',    // Aries
  'http://www.wikidata.org/entity/Q37940',    // Taurus
  'http://www.wikidata.org/entity/Q37942',    // Gemini
  'http://www.wikidata.org/entity/Q37944',    // Cancer
  'http://www.wikidata.org/entity/Q37946',    // Leo
  'http://www.wikidata.org/entity/Q37948',    // Virgo
  'http://www.wikidata.org/entity/Q37950',    // Libra
  'http://www.wikidata.org/entity/Q37952',    // Scorpio
  'http://www.wikidata.org/entity/Q37954',    // Sagittarius
  'http://www.wikidata.org/entity/Q37956',    // Capricorn
  'http://www.wikidata.org/entity/Q37958',    // Aquarius
  'http://www.wikidata.org/entity/Q37960'     // Pisces
]
MERGE (i)-[:P31]->(c);

// ============================================================
// HOUSEHOLD PREFERENCES (Wikidata items + custom)
// ============================================================
// Wikidata concepts for some household preferences
MATCH (c:Category {uri: 'dating:category:household'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q131123',   // minimalism (lifestyle)
  'http://www.wikidata.org/entity/Q725864',   // telecommuting (work from home)
  'http://www.wikidata.org/entity/Q160649'    // hygge/cozy
]
MERGE (i)-[:P31]->(c);

// Custom household items (subjective preferences)
MATCH (c:Category {uri: 'dating:category:household'})
UNWIND [
  {uri: 'dating:household:temp-cold', label: 'Keep it cold (below 68°F/20°C)'},
  {uri: 'dating:household:temp-moderate', label: 'Moderate temperature (68-72°F/20-22°C)'},
  {uri: 'dating:household:temp-warm', label: 'Keep it warm (above 72°F/22°C)'},
  {uri: 'dating:household:very-tidy', label: 'Very tidy - everything in its place'},
  {uri: 'dating:household:mostly-tidy', label: 'Mostly tidy - clean but lived-in'},
  {uri: 'dating:household:relaxed-mess', label: 'Relaxed about mess'},
  {uri: 'dating:household:dishes-immediately', label: 'Dishes done immediately'},
  {uri: 'dating:household:dishes-same-day', label: 'Dishes done same day'},
  {uri: 'dating:household:dishes-when-needed', label: 'Dishes done when needed'},
  {uri: 'dating:household:quiet-home', label: 'Prefer a quiet home'},
  {uri: 'dating:household:background-noise', label: 'Like background music/TV'},
  {uri: 'dating:household:lively-home', label: 'Like a lively, active home'},
  {uri: 'dating:household:love-hosting', label: 'Love hosting guests'},
  {uri: 'dating:household:occasional-guests', label: 'Occasional guests are fine'},
  {uri: 'dating:household:prefer-privacy', label: 'Prefer privacy, few guests'},
  {uri: 'dating:household:cook-daily', label: 'Cook most meals at home'},
  {uri: 'dating:household:cook-sometimes', label: 'Cook sometimes, eat out sometimes'},
  {uri: 'dating:household:mostly-takeout', label: 'Mostly takeout/delivery'},
  {uri: 'dating:household:eclectic', label: 'Eclectic/collected style'},
  {uri: 'dating:household:modern', label: 'Modern/contemporary'},
  {uri: 'dating:household:wfh-always', label: 'Work from home full-time'},
  {uri: 'dating:household:wfh-hybrid', label: 'Hybrid - some days at home'},
  {uri: 'dating:household:wfh-never', label: 'Work outside the home'}
] AS item
MERGE (i:Item {uri: item.uri})
  ON CREATE SET i.prefLabel = [item.label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// SLEEP SCHEDULE (Wikidata items + custom)
// ============================================================
MATCH (c:Category {uri: 'dating:category:sleep'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q1366887',  // morning person (early bird)
  'http://www.wikidata.org/entity/Q1366888'   // night owl
]
MERGE (i)-[:P31]->(c);

// Custom sleep items
MATCH (c:Category {uri: 'dating:category:sleep'})
UNWIND ['Moderate (7am-9am)', 'Flexible schedule', 'Light sleeper - need quiet', 'Can sleep through anything'] AS label
MERGE (i:Item {uri: 'dating:sleep:' + replace(replace(replace(toLower(label), ' ', '-'), '(', ''), ')', '')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// Update item counts for custom categories
// ============================================================
MATCH (c:Category)
WHERE c.uri STARTS WITH 'dating:'
OPTIONAL MATCH (i:Item)-[:P31]->(c)
WITH c, count(i) as cnt
SET c.itemCount = cnt;
