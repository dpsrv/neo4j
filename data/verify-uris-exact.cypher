// Find URIs using exact English label matches
// This produces more accurate results than full-text search

// SPORTS
UNWIND [
  'judo', 'karate', 'taekwondo', 'boxing', 'wrestling', 'basketball', 'association football',
  'tennis', 'volleyball', 'baseball', 'golf', 'swimming', 'cycling', 'running', 'ice hockey',
  'badminton', 'table tennis', 'cricket', 'rugby union', 'skiing', 'snowboarding', 'surfing',
  'skateboarding', 'yoga', 'Pilates', 'CrossFit', 'weightlifting', 'gymnastics',
  'rock climbing', 'hiking', 'fishing', 'mixed martial arts', 'Brazilian jiu-jitsu'
] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'SPORTS' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// MUSIC GENRES
UNWIND [
  'rock music', 'pop music', 'jazz', 'hip hop music', 'country music', 'electronic music',
  'classical music', 'rhythm and blues', 'reggae', 'folk music', 'indie rock', 'heavy metal music',
  'punk rock', 'blues', 'soul music', 'K-pop', 'Latin music'
] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'MUSIC' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// INSTRUMENTS
UNWIND ['guitar', 'piano', 'violin', 'drum kit', 'bass guitar', 'saxophone', 'flute', 'ukulele', 'singing'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'INSTRUMENTS' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// PETS
UNWIND ['dog', 'cat', 'rabbit', 'hamster', 'guinea pig', 'ferret', 'horse', 'parrot', 'goldfish',
        'turtle', 'snake', 'gecko', 'iguana', 'frog', 'hedgehog', 'chinchilla', 'rat'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'PETS' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// CUISINES
UNWIND ['Italian cuisine', 'Mexican cuisine', 'Japanese cuisine', 'Chinese cuisine', 'Indian cuisine',
        'Thai cuisine', 'French cuisine', 'Korean cuisine', 'Greek cuisine', 'Mediterranean cuisine',
        'Vietnamese cuisine', 'American cuisine'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'CUISINE' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// DIETARY
UNWIND ['veganism', 'vegetarianism', 'pescetarianism'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'DIETARY' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// BEVERAGES
UNWIND ['coffee', 'tea', 'beer', 'wine', 'cocktail', 'whisky'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'BEVERAGES' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// LANGUAGES
UNWIND ['English', 'Spanish', 'French', 'German', 'Italian', 'Portuguese', 'Mandarin Chinese',
        'Japanese', 'Korean', 'Russian', 'Arabic', 'Hebrew', 'Hindi', 'Modern Greek',
        'Dutch', 'Swedish', 'Polish', 'Turkish', 'Thai'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'LANGUAGES' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// ZODIAC
UNWIND ['Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo', 'Virgo', 'Libra', 'Scorpio',
        'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE substring(lbl, 0, size(lbl)-3) = term AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'ZODIAC' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// RELIGIONS
UNWIND ['Christianity', 'Catholicism', 'Protestantism', 'Islam', 'Judaism', 'Buddhism',
        'Hinduism', 'Sikhism', 'agnosticism', 'atheism'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'RELIGION' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// GENDER
UNWIND ['male', 'female', 'non-binary gender', 'transgender woman', 'transgender man', 'genderfluid'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'GENDER' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// ORIENTATION
UNWIND ['heterosexuality', 'homosexuality', 'bisexuality', 'pansexuality', 'asexuality'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'ORIENTATION' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// HAIR COLOR
UNWIND ['blond', 'brown hair', 'black hair', 'red hair', 'grey hair', 'auburn hair', 'baldness'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'HAIR' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// EYE COLOR
UNWIND ['brown eyes', 'blue eyes', 'green eyes', 'hazel eyes', 'gray eyes', 'amber eyes'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'EYES' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// RELATIONSHIP STATUS
UNWIND ['single person', 'divorce', 'marriage', 'engagement', 'widowhood'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'RELATIONSHIP' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// VALUES
UNWIND ['introversion', 'extraversion', 'family', 'honesty', 'loyalty', 'kindness',
        'ambition', 'creativity', 'humour', 'adventure'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'VALUES' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// OUTDOOR
UNWIND ['hiking', 'camping', 'mountaineering', 'rock climbing', 'fishing', 'cycling',
        'mountain biking', 'kayaking', 'canoeing', 'stand up paddleboarding', 'surfing',
        'sailing', 'snorkeling', 'scuba diving', 'skiing', 'snowboarding', 'gardening',
        'hunting', 'birdwatching', 'backpacking'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'OUTDOOR' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// INDOOR
UNWIND ['reading', 'cooking', 'baking', 'video game', 'board game', 'card game', 'jigsaw puzzle',
        'chess', 'poker', 'meditation', 'knitting', 'sewing', 'origami', 'calligraphy',
        'writing', 'photography'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'INDOOR' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// ENTERTAINMENT
UNWIND ['action film', 'comedy film', 'drama film', 'horror film', 'science fiction film',
        'thriller film', 'romantic comedy film', 'documentary film', 'anime',
        'television series', 'reality television', 'podcast', 'stand-up comedy',
        'theatre', 'opera', 'musical theatre'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'ENTERTAINMENT' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// CREATIVE
UNWIND ['painting', 'sculpture', 'photography', 'drawing', 'creative writing', 'poetry',
        'singing', 'dance', 'acting', 'filmmaking', 'graphic design', 'illustration',
        'fashion design', 'woodworking', 'pottery', 'jewellery'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'CREATIVE' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;

// EDUCATION
UNWIND ['computer science', 'economics', 'engineering', 'physics', 'biology', 'chemistry',
        'mathematics', 'psychology', 'philosophy', 'history', 'literature', 'law',
        'medicine', 'sociology', 'political science', 'fine art', 'architecture',
        'journalism', 'business'] AS term
OPTIONAL MATCH (i:Item)
WHERE any(lbl IN i.prefLabel WHERE toLower(substring(lbl, 0, size(lbl)-3)) = toLower(term) AND lbl ENDS WITH '@en')
WITH term, collect(i)[0] AS item
RETURN 'EDUCATION' AS cat, term, item.uri AS uri,
       [lbl IN item.prefLabel WHERE lbl ENDS WITH '@en'][0] AS label;
