// Link custom dating items to Wikidata equivalents for taxonomy/correlation
// Uses P460 (said to be the same as) relationship
// Run after custom-category-mappings.cypher

// ============================================================
// MYERS-BRIGGS TYPES
// ============================================================
MATCH (c:Item {uri: 'dating:mbti:intj'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1069495'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:intp'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1079556'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:entj'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1069554'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:entp'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1069555'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:infj'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1069489'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:infp'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1069494'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:enfj'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1069552'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:enfp'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1069553'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:istj'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1079560'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:isfj'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1079557'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:estj'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1069556'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:esfj'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q613531'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:istp'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1079561'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:isfp'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1079558'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:estp'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1069557'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:mbti:esfp'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q609251'})
MERGE (c)-[:P460]->(w);

// ============================================================
// RELIGIONS
// ============================================================
MATCH (c:Item {uri: 'dating:religion:christian'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q5043'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:religion:catholic'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1841'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:religion:protestant'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q23540'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:religion:orthodox-christian'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q33203'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:religion:muslim'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q432'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:religion:jewish'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q9268'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:religion:buddhist'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q748'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:religion:hindu'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q9089'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:religion:sikh'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q12047'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:religion:mormon-lds'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q42516'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:religion:agnostic'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q106039'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:religion:atheist'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q7066'})
MERGE (c)-[:P460]->(w);

// ============================================================
// ZODIAC SIGNS
// ============================================================
MATCH (c:Item {uri: 'dating:zodiac:aries'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37930'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:zodiac:taurus'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37933'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:zodiac:gemini'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37936'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:zodiac:cancer'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37939'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:zodiac:leo'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37942'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:zodiac:virgo'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37945'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:zodiac:libra'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37948'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:zodiac:scorpio'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37951'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:zodiac:sagittarius'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37954'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:zodiac:capricorn'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37957'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:zodiac:aquarius'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37960'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:zodiac:pisces'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37963'})
MERGE (c)-[:P460]->(w);

// ============================================================
// DIET
// ============================================================
MATCH (c:Item {uri: 'dating:diet:vegetarian'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q83364'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:diet:vegan'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q181138'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:diet:pescatarian'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1135104'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:diet:keto'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q623416'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:diet:halal'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q165950'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:diet:kosher'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q207952'})
MERGE (c)-[:P460]->(w);

// ============================================================
// PERSONALITY
// ============================================================
MATCH (c:Item {uri: 'dating:personality:introvert'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q41104'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:personality:extrovert'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q41105'})
MERGE (c)-[:P460]->(w);

// ============================================================
// SPORTS (selected popular ones)
// ============================================================
MATCH (c:Item {uri: 'dating:sport:soccer'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q2736'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:basketball'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q5372'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:tennis'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q847'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:golf'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q5375'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:swimming'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q31920'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:baseball'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q5369'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:american-football'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q41323'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:volleyball'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1734'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:ice-hockey'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q41466'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:cricket'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q5375'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:rugby'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q5849'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:boxing'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q32112'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:mma'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q114466'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:judo'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q11420'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:karate'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q11421'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:skiing'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q11639'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:snowboarding'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q178131'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:surfing'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q159992'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:sport:cycling'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q53121'})
MERGE (c)-[:P460]->(w);

// ============================================================
// FITNESS
// ============================================================
MATCH (c:Item {uri: 'dating:fitness:yoga'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q83371'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:fitness:pilates'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q179970'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:fitness:crossfit'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1142682'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:fitness:weightlifting'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q104812'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:fitness:running'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q105674'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:fitness:hiking'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q104863'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:fitness:dancing'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q11639'})
MERGE (c)-[:P460]->(w);

// ============================================================
// CUISINES
// ============================================================
MATCH (c:Item {uri: 'dating:cuisine:italian'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q11246'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:cuisine:mexican'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q207965'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:cuisine:japanese'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q184275'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:cuisine:chinese'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q193015'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:cuisine:indian'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q192908'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:cuisine:thai'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q192781'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:cuisine:french'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q6661'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:cuisine:korean'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q200540'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:cuisine:greek'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q181674'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:cuisine:mediterranean'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q728564'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:cuisine:vietnamese'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q192935'})
MERGE (c)-[:P460]->(w);

// ============================================================
// CREATIVE
// ============================================================
MATCH (c:Item {uri: 'dating:creative:painting'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q11629'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:creative:photography'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q11633'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:creative:writing'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q37260'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:creative:music'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q638'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:creative:drawing'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q93184'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:creative:pottery'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q11642'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:creative:knitting'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q5283'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:creative:woodworking'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q11463'})
MERGE (c)-[:P460]->(w);

// ============================================================
// ENTERTAINMENT
// ============================================================
MATCH (c:Item {uri: 'dating:entertainment:action-films'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q188473'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:comedy-films'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q157443'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:drama'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q130232'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:horror-films'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q200092'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:science-fiction'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q188473'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:anime'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1107'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:tv-series'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q5398426'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:video-games'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q7889'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:podcasts'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q200092'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:stand-up-comedy'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q51424'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:theater'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q7569'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:opera'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q1344'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:concerts'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q9730'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:audiobooks'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q17143321'})
MERGE (c)-[:P460]->(w);

MATCH (c:Item {uri: 'dating:entertainment:musicals'})
MATCH (w:Item {uri: 'http://www.wikidata.org/entity/Q131272'})
MERGE (c)-[:P460]->(w);

// Note: Many custom items (body types, heights, relationship statuses, etc.)
// don't have direct Wikidata equivalents as they're dating-app specific concepts
