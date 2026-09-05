// Map Wikidata items to custom dating categories via P31
// Run this after custom-categories.cypher

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
// SPORTS
// ============================================================
MATCH (c:Category {uri: 'dating:category:sports'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q2736',     // football/soccer
  'http://www.wikidata.org/entity/Q5372',     // basketball
  'http://www.wikidata.org/entity/Q847',      // tennis
  'http://www.wikidata.org/entity/Q1734',     // volleyball
  'http://www.wikidata.org/entity/Q5369',     // baseball
  'http://www.wikidata.org/entity/Q41323',    // American football
  'http://www.wikidata.org/entity/Q38867',    // ice hockey
  'http://www.wikidata.org/entity/Q5375',     // golf
  'http://www.wikidata.org/entity/Q8418',     // badminton
  'http://www.wikidata.org/entity/Q165704',   // table tennis
  'http://www.wikidata.org/entity/Q7291',     // cycling
  'http://www.wikidata.org/entity/Q5386',     // swimming
  'http://www.wikidata.org/entity/Q542',      // athletics/track
  'http://www.wikidata.org/entity/Q36908',    // boxing
  'http://www.wikidata.org/entity/Q37517',    // MMA
  'http://www.wikidata.org/entity/Q11424',    // judo
  'http://www.wikidata.org/entity/Q103496',   // taekwondo
  'http://www.wikidata.org/entity/Q37930',    // karate
  'http://www.wikidata.org/entity/Q131359',   // Brazilian jiu-jitsu
  'http://www.wikidata.org/entity/Q718',      // cricket
  'http://www.wikidata.org/entity/Q5849',     // rugby
  'http://www.wikidata.org/entity/Q178095',   // lacrosse
  'http://www.wikidata.org/entity/Q5377',     // softball
  'http://www.wikidata.org/entity/Q12100',    // squash
  'http://www.wikidata.org/entity/Q189177',   // pickleball
  'http://www.wikidata.org/entity/Q1434',     // bowling
  'http://www.wikidata.org/entity/Q125629',   // darts
  'http://www.wikidata.org/entity/Q82821',    // archery
  'http://www.wikidata.org/entity/Q11639',    // skiing
  'http://www.wikidata.org/entity/Q178131',   // snowboarding
  'http://www.wikidata.org/entity/Q174432',   // surfing
  'http://www.wikidata.org/entity/Q4967666'   // skateboarding
]
MERGE (i)-[:P31]->(c);

// ============================================================
// FITNESS
// ============================================================
MATCH (c:Category {uri: 'dating:category:fitness'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q309252',   // physical exercise
  'http://www.wikidata.org/entity/Q104812',   // weightlifting
  'http://www.wikidata.org/entity/Q184872',   // CrossFit
  'http://www.wikidata.org/entity/Q179057',   // yoga
  'http://www.wikidata.org/entity/Q166314',   // Pilates
  'http://www.wikidata.org/entity/Q6266',     // running
  'http://www.wikidata.org/entity/Q215616',   // jogging
  'http://www.wikidata.org/entity/Q7291',     // cycling
  'http://www.wikidata.org/entity/Q5386',     // swimming
  'http://www.wikidata.org/entity/Q193833',   // aerobics
  'http://www.wikidata.org/entity/Q180592',   // spinning
  'http://www.wikidata.org/entity/Q7270',     // gymnastics
  'http://www.wikidata.org/entity/Q36908',    // boxing
  'http://www.wikidata.org/entity/Q180600',   // rock climbing
  'http://www.wikidata.org/entity/Q181393',   // calisthenics
  'http://www.wikidata.org/entity/Q188528',   // barre
  'http://www.wikidata.org/entity/Q1072353',  // hiking
  'http://www.wikidata.org/entity/Q5638',     // walking
  'http://www.wikidata.org/entity/Q203005',   // martial arts
  'http://www.wikidata.org/entity/Q27115'     // dancing
]
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
// FOOD & DRINK
// ============================================================
MATCH (c:Category {uri: 'dating:category:food-drink'})
MATCH (i:Item) WHERE i.uri IN [
  // Cuisines
  'http://www.wikidata.org/entity/Q11246',    // Italian cuisine
  'http://www.wikidata.org/entity/Q200664',   // Mexican cuisine
  'http://www.wikidata.org/entity/Q184275',   // Japanese cuisine
  'http://www.wikidata.org/entity/Q192764',   // Chinese cuisine
  'http://www.wikidata.org/entity/Q127995',   // Indian cuisine
  'http://www.wikidata.org/entity/Q192781',   // Thai cuisine
  'http://www.wikidata.org/entity/Q132922',   // French cuisine
  'http://www.wikidata.org/entity/Q200540',   // Korean cuisine
  'http://www.wikidata.org/entity/Q181674',   // Greek cuisine
  'http://www.wikidata.org/entity/Q728564',   // Mediterranean cuisine
  'http://www.wikidata.org/entity/Q192935',   // Vietnamese cuisine
  'http://www.wikidata.org/entity/Q181696',   // American cuisine
  // Dietary preferences
  'http://www.wikidata.org/entity/Q181138',   // veganism
  'http://www.wikidata.org/entity/Q11404',    // vegetarianism
  'http://www.wikidata.org/entity/Q1135104',  // pescatarian
  'http://www.wikidata.org/entity/Q379813',   // gluten-free
  'http://www.wikidata.org/entity/Q207952',   // kosher
  'http://www.wikidata.org/entity/Q165950',   // halal
  // Beverages
  'http://www.wikidata.org/entity/Q8851',     // coffee
  'http://www.wikidata.org/entity/Q6097',     // tea
  'http://www.wikidata.org/entity/Q44',       // beer
  'http://www.wikidata.org/entity/Q282',      // wine
  'http://www.wikidata.org/entity/Q134768',   // cocktails
  'http://www.wikidata.org/entity/Q185102'    // whiskey
]
MERGE (i)-[:P31]->(c);

// ============================================================
// ENTERTAINMENT
// ============================================================
MATCH (c:Category {uri: 'dating:category:entertainment'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q11424',    // action films
  'http://www.wikidata.org/entity/Q157443',   // comedy films
  'http://www.wikidata.org/entity/Q130232',   // drama films
  'http://www.wikidata.org/entity/Q959790',   // horror films
  'http://www.wikidata.org/entity/Q188473',   // science fiction
  'http://www.wikidata.org/entity/Q52162262', // thriller
  'http://www.wikidata.org/entity/Q203775',   // romantic comedy
  'http://www.wikidata.org/entity/Q130232',   // documentaries
  'http://www.wikidata.org/entity/Q1107',     // anime
  'http://www.wikidata.org/entity/Q5398426',  // TV series
  'http://www.wikidata.org/entity/Q590870',   // reality TV
  'http://www.wikidata.org/entity/Q7889',     // video games
  'http://www.wikidata.org/entity/Q200092',   // podcasts
  'http://www.wikidata.org/entity/Q51424',    // stand-up comedy
  'http://www.wikidata.org/entity/Q7569',     // theater
  'http://www.wikidata.org/entity/Q1344',     // opera
  'http://www.wikidata.org/entity/Q9730',     // concerts
  'http://www.wikidata.org/entity/Q622812',   // true crime
  'http://www.wikidata.org/entity/Q17143321', // audiobooks
  'http://www.wikidata.org/entity/Q131272'    // musicals
]
MERGE (i)-[:P31]->(c);

// ============================================================
// CREATIVE
// ============================================================
MATCH (c:Category {uri: 'dating:category:creative'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q3305213',  // painting
  'http://www.wikidata.org/entity/Q860861',   // sculpture
  'http://www.wikidata.org/entity/Q11030',    // photography
  'http://www.wikidata.org/entity/Q93184',    // drawing
  'http://www.wikidata.org/entity/Q11472',    // writing
  'http://www.wikidata.org/entity/Q482',      // poetry
  'http://www.wikidata.org/entity/Q127418',   // calligraphy
  'http://www.wikidata.org/entity/Q638',      // music
  'http://www.wikidata.org/entity/Q27939',    // singing
  'http://www.wikidata.org/entity/Q27115',    // dancing
  'http://www.wikidata.org/entity/Q11633',    // acting
  'http://www.wikidata.org/entity/Q83067',    // filmmaking
  'http://www.wikidata.org/entity/Q193977',   // graphic design
  'http://www.wikidata.org/entity/Q207645',   // illustration
  'http://www.wikidata.org/entity/Q190382',   // fashion design
  'http://www.wikidata.org/entity/Q219730',   // sewing
  'http://www.wikidata.org/entity/Q5283',     // knitting
  'http://www.wikidata.org/entity/Q11498746', // woodworking
  'http://www.wikidata.org/entity/Q128824',   // pottery
  'http://www.wikidata.org/entity/Q131559'    // jewelry making
]
MERGE (i)-[:P31]->(c);

// ============================================================
// TRAVEL
// ============================================================
MATCH (c:Category {uri: 'dating:category:travel'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q192296',   // beach vacation
  'http://www.wikidata.org/entity/Q34095',    // mountain trip
  'http://www.wikidata.org/entity/Q1192297',  // backpacking
  'http://www.wikidata.org/entity/Q1076354',  // road trip
  'http://www.wikidata.org/entity/Q3196',     // camping
  'http://www.wikidata.org/entity/Q187916',   // cruise
  'http://www.wikidata.org/entity/Q376',      // adventure travel
  'http://www.wikidata.org/entity/Q473478',   // city break
  'http://www.wikidata.org/entity/Q20743048', // solo travel
  'http://www.wikidata.org/entity/Q171845',   // ecotourism
  'http://www.wikidata.org/entity/Q174698',   // cultural tourism
  'http://www.wikidata.org/entity/Q908648'    // food tourism
]
MERGE (i)-[:P31]->(c);

// ============================================================
// SOCIAL STYLE
// ============================================================
MATCH (c:Category {uri: 'dating:category:social'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q270673',   // introvert
  'http://www.wikidata.org/entity/Q930747',   // extrovert
  'http://www.wikidata.org/entity/Q370627'    // ambivert
]
MERGE (i)-[:P31]->(c);

// ============================================================
// VALUES
// ============================================================
MATCH (c:Category {uri: 'dating:category:values'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q7566',     // family
  'http://www.wikidata.org/entity/Q8161',     // honesty
  'http://www.wikidata.org/entity/Q12796',    // loyalty
  'http://www.wikidata.org/entity/Q33196',    // kindness
  'http://www.wikidata.org/entity/Q41317',    // ambition
  'http://www.wikidata.org/entity/Q179632',   // creativity
  'http://www.wikidata.org/entity/Q15911314', // humor
  'http://www.wikidata.org/entity/Q82494',    // independence
  'http://www.wikidata.org/entity/Q13129925', // open-mindedness
  'http://www.wikidata.org/entity/Q176949',   // adventure
  'http://www.wikidata.org/entity/Q3551428',  // spirituality
  'http://www.wikidata.org/entity/Q629925',   // environmentalism
  'http://www.wikidata.org/entity/Q132137',   // feminism
  'http://www.wikidata.org/entity/Q1065118'   // equality
]
MERGE (i)-[:P31]->(c);

// ============================================================
// LIFESTYLE
// ============================================================
MATCH (c:Category {uri: 'dating:category:lifestyle'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q181138',   // vegan
  'http://www.wikidata.org/entity/Q11404',    // vegetarian
  'http://www.wikidata.org/entity/Q2140862',  // minimalism
  'http://www.wikidata.org/entity/Q134041',   // entrepreneur
  'http://www.wikidata.org/entity/Q2598',     // remote work
  'http://www.wikidata.org/entity/Q217012',   // digital nomad
  'http://www.wikidata.org/entity/Q1349417',  // early bird
  'http://www.wikidata.org/entity/Q55451',    // night owl
  'http://www.wikidata.org/entity/Q12050673', // fitness lifestyle
  'http://www.wikidata.org/entity/Q21102'     // homebody
]
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
// CAREER (fields, not specific jobs)
// ============================================================
MATCH (c:Category {uri: 'dating:category:career'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q11016',    // technology
  'http://www.wikidata.org/entity/Q132151',   // healthcare
  'http://www.wikidata.org/entity/Q8134',     // finance
  'http://www.wikidata.org/entity/Q8065',     // education
  'http://www.wikidata.org/entity/Q735',      // art
  'http://www.wikidata.org/entity/Q638',      // music
  'http://www.wikidata.org/entity/Q11016',    // engineering
  'http://www.wikidata.org/entity/Q336',      // science
  'http://www.wikidata.org/entity/Q4830453',  // business
  'http://www.wikidata.org/entity/Q5398426',  // media
  'http://www.wikidata.org/entity/Q7187',     // law
  'http://www.wikidata.org/entity/Q11229',    // marketing
  'http://www.wikidata.org/entity/Q131257',   // real estate
  'http://www.wikidata.org/entity/Q11366',    // hospitality
  'http://www.wikidata.org/entity/Q23017427', // nonprofit
  'http://www.wikidata.org/entity/Q7278',     // government
  'http://www.wikidata.org/entity/Q28114423', // retail
  'http://www.wikidata.org/entity/Q1348589',  // consulting
  'http://www.wikidata.org/entity/Q134041',   // entrepreneurship
  'http://www.wikidata.org/entity/Q11184'     // journalism
]
MERGE (i)-[:P31]->(c);

// ============================================================
// EDUCATION (fields of study)
// ============================================================
MATCH (c:Category {uri: 'dating:category:education'})
MATCH (i:Item) WHERE i.uri IN [
  'http://www.wikidata.org/entity/Q21198',    // computer science
  'http://www.wikidata.org/entity/Q8134',     // economics
  'http://www.wikidata.org/entity/Q7184903',  // engineering
  'http://www.wikidata.org/entity/Q413',      // physics
  'http://www.wikidata.org/entity/Q420',      // biology
  'http://www.wikidata.org/entity/Q2329',     // chemistry
  'http://www.wikidata.org/entity/Q395',      // mathematics
  'http://www.wikidata.org/entity/Q9418',     // psychology
  'http://www.wikidata.org/entity/Q5891',     // philosophy
  'http://www.wikidata.org/entity/Q309',      // history
  'http://www.wikidata.org/entity/Q8242',     // literature
  'http://www.wikidata.org/entity/Q7187',     // law
  'http://www.wikidata.org/entity/Q11190',    // medicine
  'http://www.wikidata.org/entity/Q21201',    // sociology
  'http://www.wikidata.org/entity/Q7163',     // political science
  'http://www.wikidata.org/entity/Q735',      // art
  'http://www.wikidata.org/entity/Q11639',    // architecture
  'http://www.wikidata.org/entity/Q11184',    // journalism
  'http://www.wikidata.org/entity/Q11016',    // business
  'http://www.wikidata.org/entity/Q8065'      // education
]
MERGE (i)-[:P31]->(c);

// ============================================================
// Update item counts for custom categories
// ============================================================
MATCH (c:Category)
WHERE c.uri STARTS WITH 'dating:'
OPTIONAL MATCH (i:Item)-[:P31]->(c)
WITH c, count(i) as cnt
SET c.itemCount = cnt;
