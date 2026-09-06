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
  'http://www.wikidata.org/entity/Q11420',    // judo
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
// HAIR COLOR (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:hair-color'})
FOREACH (label IN ['Black', 'Brown', 'Blonde', 'Red', 'Auburn', 'Strawberry Blonde', 'Gray', 'White', 'Bald', 'Dyed/Other'] |
  MERGE (i:Item {uri: 'dating:hair:' + replace(toLower(label), ' ', '-')})
    ON CREATE SET i.prefLabel = [label + '@en']
  MERGE (i)-[:P31]->(c)
);

// ============================================================
// EYE COLOR (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:eye-color'})
FOREACH (label IN ['Brown', 'Blue', 'Green', 'Hazel', 'Gray', 'Amber', 'Black'] |
  MERGE (i:Item {uri: 'dating:eyes:' + toLower(label)})
    ON CREATE SET i.prefLabel = [label + '@en']
  MERGE (i)-[:P31]->(c)
);

// ============================================================
// BODY TYPE (custom items - subjective dating terms not in Wikidata)
// ============================================================
MATCH (c:Category {uri: 'dating:category:body-type'})
MERGE (i1:Item {uri: 'dating:body-type:slim'})
  ON CREATE SET i1.prefLabel = ['Slim@en']
MERGE (i1)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:body-type'})
MERGE (i2:Item {uri: 'dating:body-type:athletic'})
  ON CREATE SET i2.prefLabel = ['Athletic@en']
MERGE (i2)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:body-type'})
MERGE (i3:Item {uri: 'dating:body-type:average'})
  ON CREATE SET i3.prefLabel = ['Average@en']
MERGE (i3)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:body-type'})
MERGE (i4:Item {uri: 'dating:body-type:curvy'})
  ON CREATE SET i4.prefLabel = ['Curvy@en']
MERGE (i4)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:body-type'})
MERGE (i5:Item {uri: 'dating:body-type:muscular'})
  ON CREATE SET i5.prefLabel = ['Muscular@en']
MERGE (i5)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:body-type'})
MERGE (i6:Item {uri: 'dating:body-type:stocky'})
  ON CREATE SET i6.prefLabel = ['Stocky@en']
MERGE (i6)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:body-type'})
MERGE (i7:Item {uri: 'dating:body-type:heavyset'})
  ON CREATE SET i7.prefLabel = ['Heavyset@en']
MERGE (i7)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:body-type'})
MERGE (i8:Item {uri: 'dating:body-type:petite'})
  ON CREATE SET i8.prefLabel = ['Petite@en']
MERGE (i8)-[:P31]->(c);

// ============================================================
// ETHNICITY (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:ethnicity'})
FOREACH (label IN ['White/Caucasian', 'Black/African American', 'Hispanic/Latino', 'East Asian', 'South Asian', 'Southeast Asian', 'Middle Eastern', 'Native American', 'Pacific Islander', 'Mixed/Multiracial', 'Other'] |
  MERGE (i:Item {uri: 'dating:ethnicity:' + replace(replace(toLower(label), ' ', '-'), '/', '-')})
    ON CREATE SET i.prefLabel = [label + '@en']
  MERGE (i)-[:P31]->(c)
);

// ============================================================
// RELATIONSHIP STATUS (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:relationship-status'})
FOREACH (label IN ['Single', 'Divorced', 'Separated', 'Widowed', 'In a Relationship', 'Its Complicated', 'Open Relationship'] |
  MERGE (i:Item {uri: 'dating:relationship:' + replace(toLower(label), ' ', '-')})
    ON CREATE SET i.prefLabel = [label + '@en']
  MERGE (i)-[:P31]->(c)
);

// ============================================================
// LOOKING FOR (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:looking-for'})
FOREACH (label IN ['Friendship', 'Dating', 'Long-term Relationship', 'Marriage', 'Casual', 'Networking', 'Not Sure Yet'] |
  MERGE (i:Item {uri: 'dating:looking-for:' + replace(toLower(label), ' ', '-')})
    ON CREATE SET i.prefLabel = [label + '@en']
  MERGE (i)-[:P31]->(c)
);

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
// GENDER (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:gender'})
FOREACH (label IN ['Man', 'Woman', 'Non-binary', 'Transgender Man', 'Transgender Woman', 'Genderqueer', 'Genderfluid', 'Agender', 'Two-Spirit', 'Other'] |
  MERGE (i:Item {uri: 'dating:gender:' + replace(toLower(label), ' ', '-')})
    ON CREATE SET i.prefLabel = [label + '@en']
  MERGE (i)-[:P31]->(c)
);

// ============================================================
// SEXUAL ORIENTATION (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:orientation'})
FOREACH (label IN ['Straight', 'Gay', 'Lesbian', 'Bisexual', 'Pansexual', 'Asexual', 'Demisexual', 'Queer', 'Questioning', 'Other'] |
  MERGE (i:Item {uri: 'dating:orientation:' + toLower(label)})
    ON CREATE SET i.prefLabel = [label + '@en']
  MERGE (i)-[:P31]->(c)
);

// ============================================================
// SMOKING
// ============================================================
MATCH (c:Category {uri: 'dating:category:smoking'})
MERGE (i:Item {uri: 'dating:smoking:never'})
  ON CREATE SET i.prefLabel = ['Never smokes@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:smoking'})
MERGE (i:Item {uri: 'dating:smoking:socially'})
  ON CREATE SET i.prefLabel = ['Smokes socially@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:smoking'})
MERGE (i:Item {uri: 'dating:smoking:regularly'})
  ON CREATE SET i.prefLabel = ['Smokes regularly@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:smoking'})
MERGE (i:Item {uri: 'dating:smoking:trying-to-quit'})
  ON CREATE SET i.prefLabel = ['Trying to quit@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:smoking'})
MERGE (i:Item {uri: 'dating:smoking:vapes'})
  ON CREATE SET i.prefLabel = ['Vapes@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// DRINKING
// ============================================================
MATCH (c:Category {uri: 'dating:category:drinking'})
MERGE (i:Item {uri: 'dating:drinking:never'})
  ON CREATE SET i.prefLabel = ['Never drinks@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:drinking'})
MERGE (i:Item {uri: 'dating:drinking:socially'})
  ON CREATE SET i.prefLabel = ['Drinks socially@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:drinking'})
MERGE (i:Item {uri: 'dating:drinking:regularly'})
  ON CREATE SET i.prefLabel = ['Drinks regularly@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:drinking'})
MERGE (i:Item {uri: 'dating:drinking:rarely'})
  ON CREATE SET i.prefLabel = ['Rarely drinks@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:drinking'})
MERGE (i:Item {uri: 'dating:drinking:sober'})
  ON CREATE SET i.prefLabel = ['Sober@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// CHILDREN
// ============================================================
MATCH (c:Category {uri: 'dating:category:children'})
MERGE (i:Item {uri: 'dating:children:no-dont-want'})
  ON CREATE SET i.prefLabel = ['No kids, don\'t want any@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:children'})
MERGE (i:Item {uri: 'dating:children:no-want-someday'})
  ON CREATE SET i.prefLabel = ['No kids, want someday@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:children'})
MERGE (i:Item {uri: 'dating:children:no-open'})
  ON CREATE SET i.prefLabel = ['No kids, open to it@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:children'})
MERGE (i:Item {uri: 'dating:children:yes-want-more'})
  ON CREATE SET i.prefLabel = ['Have kids, want more@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:children'})
MERGE (i:Item {uri: 'dating:children:yes-no-more'})
  ON CREATE SET i.prefLabel = ['Have kids, don\'t want more@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:children'})
MERGE (i:Item {uri: 'dating:children:yes-open'})
  ON CREATE SET i.prefLabel = ['Have kids, open to more@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// RELIGION
// ============================================================
MATCH (c:Category {uri: 'dating:category:religion'})
FOREACH (label IN ['Christian', 'Catholic', 'Protestant', 'Orthodox Christian', 'Muslim', 'Jewish', 'Buddhist', 'Hindu', 'Sikh', 'Mormon/LDS', 'Spiritual', 'Agnostic', 'Atheist', 'Other'] |
  MERGE (i:Item {uri: 'dating:religion:' + replace(replace(toLower(label), ' ', '-'), '/', '-')})
    ON CREATE SET i.prefLabel = [label + '@en']
  MERGE (i)-[:P31]->(c)
);

// ============================================================
// ZODIAC SIGN (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:zodiac'})
FOREACH (label IN ['Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo', 'Virgo', 'Libra', 'Scorpio', 'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces'] |
  MERGE (i:Item {uri: 'dating:zodiac:' + toLower(label)})
    ON CREATE SET i.prefLabel = [label + '@en']
  MERGE (i)-[:P31]->(c)
);

// ============================================================
// HOUSEHOLD PREFERENCES (custom items)
// ============================================================

// Temperature
MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:temp-cold'})
  ON CREATE SET i.prefLabel = ['Keep it cold (below 68°F/20°C)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:temp-moderate'})
  ON CREATE SET i.prefLabel = ['Moderate temperature (68-72°F/20-22°C)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:temp-warm'})
  ON CREATE SET i.prefLabel = ['Keep it warm (above 72°F/22°C)@en']
MERGE (i)-[:P31]->(c);

// Cleanliness
MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:very-tidy'})
  ON CREATE SET i.prefLabel = ['Very tidy - everything in its place@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:mostly-tidy'})
  ON CREATE SET i.prefLabel = ['Mostly tidy - clean but lived-in@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:relaxed-mess'})
  ON CREATE SET i.prefLabel = ['Relaxed about mess@en']
MERGE (i)-[:P31]->(c);

// Dishes
MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:dishes-immediately'})
  ON CREATE SET i.prefLabel = ['Dishes done immediately@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:dishes-same-day'})
  ON CREATE SET i.prefLabel = ['Dishes done same day@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:dishes-when-needed'})
  ON CREATE SET i.prefLabel = ['Dishes done when needed@en']
MERGE (i)-[:P31]->(c);

// Noise level
MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:quiet-home'})
  ON CREATE SET i.prefLabel = ['Prefer a quiet home@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:background-noise'})
  ON CREATE SET i.prefLabel = ['Like background music/TV@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:lively-home'})
  ON CREATE SET i.prefLabel = ['Like a lively, active home@en']
MERGE (i)-[:P31]->(c);

// Guests
MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:love-hosting'})
  ON CREATE SET i.prefLabel = ['Love hosting guests@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:occasional-guests'})
  ON CREATE SET i.prefLabel = ['Occasional guests are fine@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:prefer-privacy'})
  ON CREATE SET i.prefLabel = ['Prefer privacy, few guests@en']
MERGE (i)-[:P31]->(c);

// Cooking
MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:cook-daily'})
  ON CREATE SET i.prefLabel = ['Cook most meals at home@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:cook-sometimes'})
  ON CREATE SET i.prefLabel = ['Cook sometimes, eat out sometimes@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:mostly-takeout'})
  ON CREATE SET i.prefLabel = ['Mostly takeout/delivery@en']
MERGE (i)-[:P31]->(c);

// Decorating style
MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:minimalist'})
  ON CREATE SET i.prefLabel = ['Minimalist style@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:cozy'})
  ON CREATE SET i.prefLabel = ['Cozy and comfortable@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:eclectic'})
  ON CREATE SET i.prefLabel = ['Eclectic/collected style@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:modern'})
  ON CREATE SET i.prefLabel = ['Modern/contemporary@en']
MERGE (i)-[:P31]->(c);

// Work from home
MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:wfh-always'})
  ON CREATE SET i.prefLabel = ['Work from home full-time@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:wfh-hybrid'})
  ON CREATE SET i.prefLabel = ['Hybrid - some days at home@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:household'})
MERGE (i:Item {uri: 'dating:household:wfh-never'})
  ON CREATE SET i.prefLabel = ['Work outside the home@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// SLEEP SCHEDULE (custom items)
// ============================================================

MATCH (c:Category {uri: 'dating:category:sleep'})
MERGE (i:Item {uri: 'dating:sleep:early-bird'})
  ON CREATE SET i.prefLabel = ['Early bird (up before 7am)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:sleep'})
MERGE (i:Item {uri: 'dating:sleep:moderate'})
  ON CREATE SET i.prefLabel = ['Moderate (7am-9am)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:sleep'})
MERGE (i:Item {uri: 'dating:sleep:night-owl'})
  ON CREATE SET i.prefLabel = ['Night owl (up late, sleep in)@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:sleep'})
MERGE (i:Item {uri: 'dating:sleep:flexible'})
  ON CREATE SET i.prefLabel = ['Flexible schedule@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:sleep'})
MERGE (i:Item {uri: 'dating:sleep:needs-quiet'})
  ON CREATE SET i.prefLabel = ['Light sleeper - need quiet@en']
MERGE (i)-[:P31]->(c);

MATCH (c:Category {uri: 'dating:category:sleep'})
MERGE (i:Item {uri: 'dating:sleep:sleep-anywhere'})
  ON CREATE SET i.prefLabel = ['Can sleep through anything@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// Update item counts for custom categories
// ============================================================
MATCH (c:Category)
WHERE c.uri STARTS WITH 'dating:'
OPTIONAL MATCH (i:Item)-[:P31]->(c)
WITH c, count(i) as cnt
SET c.itemCount = cnt;
