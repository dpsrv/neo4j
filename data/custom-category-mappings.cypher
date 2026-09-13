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
// SPORTS & FITNESS (merged)
// ============================================================
MATCH (c:Category {uri: 'dating:category:sports'})
UNWIND ['Soccer', 'Basketball', 'Tennis', 'Volleyball', 'Baseball', 'American Football', 'Ice Hockey', 'Golf', 'Badminton', 'Table Tennis', 'Cycling', 'Swimming', 'Track & Field', 'Boxing', 'MMA', 'Judo', 'Taekwondo', 'Karate', 'Brazilian Jiu-Jitsu', 'Wrestling', 'Cricket', 'Rugby', 'Lacrosse', 'Softball', 'Squash', 'Racquetball', 'Pickleball', 'Bowling', 'Darts', 'Archery', 'Skiing', 'Snowboarding', 'Surfing', 'Skateboarding', 'Rock Climbing', 'Fencing', 'Rowing', 'Water Polo', 'Handball', 'Field Hockey', 'Weightlifting', 'CrossFit', 'Yoga', 'Pilates', 'Running', 'Jogging', 'Aerobics', 'Spinning', 'HIIT', 'Calisthenics', 'Barre', 'Hiking', 'Walking', 'Dancing', 'Gymnastics'] AS label
MERGE (i:Item {uri: 'dating:sport:' + replace(replace(toLower(label), ' ', '-'), '&', 'and')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// FITNESS - DEPRECATED (merged into Sports & Fitness)
// ============================================================
// Items kept for backwards compatibility, mapped to sports category
MATCH (c:Category {uri: 'dating:category:sports'})
UNWIND ['Weightlifting', 'CrossFit', 'Yoga', 'Pilates', 'Running', 'Jogging', 'Aerobics', 'Spinning', 'HIIT', 'Calisthenics', 'Barre', 'Hiking', 'Walking', 'Dancing', 'Gymnastics'] AS label
MERGE (i:Item {uri: 'dating:fitness:' + replace(toLower(label), ' ', '-')})
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
// FOOD & DRINK
// ============================================================
// ============================================================
// FAVORITE CUISINES (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:food-drink'})
UNWIND ['Italian', 'Mexican', 'Japanese', 'Chinese', 'Indian', 'Thai', 'French', 'Korean', 'Greek', 'Mediterranean', 'Vietnamese', 'American', 'Middle Eastern', 'Spanish', 'Ethiopian', 'Brazilian', 'Caribbean', 'Southern/Soul Food', 'Sushi', 'BBQ', 'Seafood', 'Pizza', 'Tacos', 'Ramen', 'Dim Sum', 'Brunch', 'Fine Dining', 'Street Food', 'Home Cooking'] AS label
MERGE (i:Item {uri: 'dating:cuisine:' + replace(replace(toLower(label), ' ', '-'), '/', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// ENTERTAINMENT (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:entertainment'})
UNWIND ['Action Films', 'Comedy Films', 'Drama', 'Horror Films', 'Science Fiction', 'Thriller', 'Romantic Comedy', 'Documentaries', 'Anime', 'TV Series', 'Reality TV', 'Video Games', 'Podcasts', 'Stand-Up Comedy', 'Theater', 'Opera', 'Concerts', 'True Crime', 'Audiobooks', 'Musicals'] AS label
MERGE (i:Item {uri: 'dating:entertainment:' + replace(toLower(label), ' ', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// CREATIVE (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:creative'})
UNWIND ['Painting', 'Drawing', 'Sculpture', 'Photography', 'Writing', 'Poetry', 'Calligraphy', 'Music', 'Singing', 'Dancing', 'Acting', 'Filmmaking', 'Graphic Design', 'Illustration', 'Fashion Design', 'Sewing', 'Knitting', 'Crocheting', 'Woodworking', 'Pottery', 'Jewelry Making', 'Cooking', 'Baking', 'Gardening'] AS label
MERGE (i:Item {uri: 'dating:creative:' + replace(toLower(label), ' ', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// TRAVEL (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:travel'})
UNWIND ['Beach Vacations', 'Mountain Trips', 'Backpacking', 'Road Trips', 'Camping', 'Cruises', 'Adventure Travel', 'City Breaks', 'Solo Travel', 'Luxury Travel', 'Budget Travel', 'Cultural Tourism', 'Food Tourism', 'Wildlife/Safari', 'Staycations', 'International Travel', 'Domestic Travel'] AS label
MERGE (i:Item {uri: 'dating:travel:' + replace(replace(toLower(label), ' ', '-'), '/', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// PERSONALITY (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:personality'})
UNWIND ['Introvert', 'Extrovert', 'Ambivert'] AS label
MERGE (i:Item {uri: 'dating:personality:' + toLower(label)})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// MYERS-BRIGGS (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:myers-briggs'})
UNWIND ['INTJ', 'INTP', 'ENTJ', 'ENTP', 'INFJ', 'INFP', 'ENFJ', 'ENFP', 'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ', 'ISTP', 'ISFP', 'ESTP', 'ESFP'] AS label
MERGE (i:Item {uri: 'dating:mbti:' + toLower(label)})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// ATTACHMENT STYLE (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:attachment-style'})
UNWIND [
  'Secure',
  'Anxious',
  'Avoidant',
  'Fearful-Avoidant'
] AS label
MERGE (i:Item {uri: 'dating:attachment:' + replace(toLower(label), '-', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
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
// WHAT I VALUE (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:what-i-value'})
UNWIND ['Family', 'Honesty', 'Loyalty', 'Kindness', 'Humor', 'Ambition', 'Creativity', 'Independence', 'Adventure', 'Stability', 'Growth', 'Spirituality', 'Health & Wellness', 'Career Success', 'Work-Life Balance', 'Community', 'Learning', 'Travel'] AS label
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
// CANNABIS (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:cannabis'})
UNWIND ['Never', 'Occasionally', 'Regularly', 'Medically', 'Friendly (dont use but okay with it)', 'Prefer not to say'] AS label
MERGE (i:Item {uri: 'dating:cannabis:' + replace(replace(toLower(label), ' ', '-'), '(', '')})
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
// RELATIONSHIP STATUS (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:relationship-status'})
UNWIND ['Single', 'Divorced', 'Separated', 'Widowed', 'In a Relationship', 'Its Complicated', 'Open Relationship'] AS label
MERGE (i:Item {uri: 'dating:relationship:' + replace(toLower(label), ' ', '-')})
  ON CREATE SET i.prefLabel = [label + '@en']
MERGE (i)-[:P31]->(c);

// ============================================================
// LOOKING FOR (custom items)
// ============================================================
MATCH (c:Category {uri: 'dating:category:looking-for'})
UNWIND ['Friendship', 'Dating', 'Long-term Relationship', 'Marriage', 'Casual', 'Networking', 'Not Sure Yet'] AS label
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
