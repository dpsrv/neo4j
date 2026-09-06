// Verify URIs by searching for items by name
// Run this to find correct Wikidata URIs for mapping

// SPORTS & FITNESS
UNWIND ['judo', 'karate', 'taekwondo', 'brazilian jiu-jitsu', 'boxing', 'MMA', 'wrestling',
        'basketball', 'football', 'soccer', 'tennis', 'volleyball', 'baseball', 'golf',
        'swimming', 'cycling', 'running', 'hockey', 'badminton', 'table tennis', 'cricket',
        'rugby', 'skiing', 'snowboarding', 'surfing', 'skateboarding', 'yoga', 'pilates',
        'crossfit', 'weightlifting', 'gymnastics', 'rock climbing', 'hiking', 'fishing'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'SPORTS' AS category, term, best.uri AS uri, best.label AS label;

// MUSIC GENRES
UNWIND ['rock music', 'pop music', 'jazz', 'hip hop', 'country music', 'electronic music',
        'classical music', 'R&B', 'reggae', 'folk music', 'indie', 'metal', 'punk', 'blues',
        'soul music', 'K-pop', 'latin music'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'MUSIC' AS category, term, best.uri AS uri, best.label AS label;

// MUSICAL INSTRUMENTS
UNWIND ['guitar', 'piano', 'violin', 'drums', 'bass guitar', 'saxophone', 'flute', 'ukulele'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'INSTRUMENTS' AS category, term, best.uri AS uri, best.label AS label;

// PETS
UNWIND ['dog', 'cat', 'rabbit', 'hamster', 'guinea pig', 'ferret', 'horse', 'bird', 'parrot',
        'fish', 'goldfish', 'turtle', 'tortoise', 'snake', 'ball python', 'gecko', 'iguana',
        'frog', 'hedgehog', 'chinchilla', 'rat'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'PETS' AS category, term, best.uri AS uri, best.label AS label;

// FOOD & CUISINES
UNWIND ['Italian cuisine', 'Mexican cuisine', 'Japanese cuisine', 'Chinese cuisine',
        'Indian cuisine', 'Thai cuisine', 'French cuisine', 'Korean cuisine', 'Greek cuisine',
        'Mediterranean cuisine', 'Vietnamese cuisine', 'American cuisine', 'vegan', 'vegetarian',
        'coffee', 'tea', 'beer', 'wine', 'cocktail', 'whiskey'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'FOOD' AS category, term, best.uri AS uri, best.label AS label;

// LANGUAGES
UNWIND ['English', 'Spanish', 'French', 'German', 'Italian', 'Portuguese', 'Chinese', 'Japanese',
        'Korean', 'Russian', 'Arabic', 'Hebrew', 'Hindi', 'Greek', 'Dutch', 'Swedish', 'Polish',
        'Turkish', 'Thai'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term + ' language') YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'LANGUAGES' AS category, term, best.uri AS uri, best.label AS label;

// ZODIAC SIGNS
UNWIND ['Aries', 'Taurus', 'Gemini', 'Cancer zodiac', 'Leo zodiac', 'Virgo', 'Libra', 'Scorpio',
        'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'ZODIAC' AS category, term, best.uri AS uri, best.label AS label;

// RELIGIONS
UNWIND ['Christianity', 'Catholicism', 'Protestantism', 'Islam', 'Judaism', 'Buddhism', 'Hinduism',
        'Sikhism', 'agnosticism', 'atheism', 'Mormonism', 'Orthodox Christianity'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'RELIGION' AS category, term, best.uri AS uri, best.label AS label;

// GENDER & ORIENTATION
UNWIND ['male', 'female', 'non-binary', 'transgender woman', 'transgender man', 'genderfluid',
        'heterosexual', 'homosexual', 'bisexual', 'pansexual', 'asexual', 'gay', 'lesbian'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'GENDER_ORIENTATION' AS category, term, best.uri AS uri, best.label AS label;

// HAIR & EYE COLORS
UNWIND ['blond hair', 'brown hair', 'black hair', 'red hair', 'gray hair', 'auburn hair', 'bald',
        'brown eyes', 'blue eyes', 'green eyes', 'hazel eyes', 'gray eyes'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'APPEARANCE' AS category, term, best.uri AS uri, best.label AS label;

// RELATIONSHIP
UNWIND ['single', 'divorced', 'separated', 'widowed', 'married', 'engaged', 'dating',
        'friendship', 'marriage'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'RELATIONSHIP' AS category, term, best.uri AS uri, best.label AS label;

// VALUES & PERSONALITY
UNWIND ['introvert', 'extrovert', 'family', 'honesty', 'loyalty', 'kindness', 'ambition',
        'creativity', 'humor', 'independence', 'adventure', 'spirituality', 'feminism'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'VALUES' AS category, term, best.uri AS uri, best.label AS label;

// OUTDOOR ACTIVITIES
UNWIND ['hiking', 'camping', 'mountaineering', 'rock climbing', 'fishing', 'cycling',
        'mountain biking', 'kayaking', 'canoeing', 'paddleboarding', 'surfing', 'sailing',
        'snorkeling', 'scuba diving', 'skiing', 'snowboarding', 'gardening', 'hunting',
        'birdwatching', 'backpacking'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'OUTDOOR' AS category, term, best.uri AS uri, best.label AS label;

// INDOOR ACTIVITIES
UNWIND ['reading', 'cooking', 'baking', 'video games', 'board games', 'card games', 'puzzles',
        'chess', 'poker', 'meditation', 'knitting', 'sewing', 'origami', 'calligraphy',
        'writing', 'photography'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'INDOOR' AS category, term, best.uri AS uri, best.label AS label;

// ENTERTAINMENT
UNWIND ['action film', 'comedy film', 'drama film', 'horror film', 'science fiction', 'thriller',
        'romantic comedy', 'documentary', 'anime', 'TV series', 'reality TV', 'podcast',
        'stand-up comedy', 'theater', 'opera', 'musical'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'ENTERTAINMENT' AS category, term, best.uri AS uri, best.label AS label;

// CREATIVE
UNWIND ['painting', 'sculpture', 'photography', 'drawing', 'writing', 'poetry', 'music',
        'singing', 'dancing', 'acting', 'filmmaking', 'graphic design', 'illustration',
        'fashion design', 'woodworking', 'pottery', 'jewelry making'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'CREATIVE' AS category, term, best.uri AS uri, best.label AS label;

// EDUCATION FIELDS
UNWIND ['computer science', 'economics', 'engineering', 'physics', 'biology', 'chemistry',
        'mathematics', 'psychology', 'philosophy', 'history', 'literature', 'law', 'medicine',
        'sociology', 'political science', 'art', 'architecture', 'journalism'] AS term
CALL db.index.fulltext.queryNodes('trait_search', term) YIELD node, score
WITH term, node, score
ORDER BY term, score DESC
WITH term, collect({uri: node.uri, label: [lbl IN node.prefLabel WHERE lbl ENDS WITH '@en'][0], score: score})[0] AS best
RETURN 'EDUCATION' AS category, term, best.uri AS uri, best.label AS label;
