// Custom dating profile categories
// Run this to create categories that make sense for dating profiles
// Uses MERGE for idempotency - safe to run multiple times

// Pets
MERGE (c:Item:Category {uri: 'dating:category:pets'})
ON CREATE SET c.prefLabel = ['Pets@en'],
              c.description = ['Animals you have or love@en'],
              c.enabled = true,
              c.itemCount = 0;

// Outdoor Activities
MERGE (c:Item:Category {uri: 'dating:category:outdoor-activities'})
ON CREATE SET c.prefLabel = ['Outdoor Activities@en'],
              c.description = ['Things you enjoy doing outside@en'],
              c.enabled = true,
              c.itemCount = 0;

// Indoor Activities
MERGE (c:Item:Category {uri: 'dating:category:indoor-activities'})
ON CREATE SET c.prefLabel = ['Indoor Activities@en'],
              c.description = ['Things you enjoy doing at home@en'],
              c.enabled = true,
              c.itemCount = 0;

// Sports
MERGE (c:Item:Category {uri: 'dating:category:sports'})
ON CREATE SET c.prefLabel = ['Sports@en'],
              c.description = ['Sports you play or follow@en'],
              c.enabled = true,
              c.itemCount = 0;

// Fitness
MERGE (c:Item:Category {uri: 'dating:category:fitness'})
ON CREATE SET c.prefLabel = ['Fitness@en'],
              c.description = ['How you stay active@en'],
              c.enabled = true,
              c.itemCount = 0;

// Music
MERGE (c:Item:Category {uri: 'dating:category:music'})
ON CREATE SET c.prefLabel = ['Music@en'],
              c.description = ['Music you listen to or play@en'],
              c.enabled = true,
              c.itemCount = 0;

// Food & Drink
MERGE (c:Item:Category {uri: 'dating:category:food-drink'})
ON CREATE SET c.prefLabel = ['Food & Drink@en'],
              c.description = ['Cuisines and beverages you enjoy@en'],
              c.enabled = true,
              c.itemCount = 0;

// Entertainment
MERGE (c:Item:Category {uri: 'dating:category:entertainment'})
ON CREATE SET c.prefLabel = ['Entertainment@en'],
              c.description = ['Movies, TV, games, podcasts@en'],
              c.enabled = true,
              c.itemCount = 0;

// Creative
MERGE (c:Item:Category {uri: 'dating:category:creative'})
ON CREATE SET c.prefLabel = ['Creative@en'],
              c.description = ['Art, music, writing, crafts@en'],
              c.enabled = true,
              c.itemCount = 0;

// Travel
MERGE (c:Item:Category {uri: 'dating:category:travel'})
ON CREATE SET c.prefLabel = ['Travel@en'],
              c.description = ['How and where you like to travel@en'],
              c.enabled = true,
              c.itemCount = 0;

// Social Style
MERGE (c:Item:Category {uri: 'dating:category:social'})
ON CREATE SET c.prefLabel = ['Social Style@en'],
              c.description = ['How you prefer to socialize@en'],
              c.enabled = true,
              c.itemCount = 0;

// Values
MERGE (c:Item:Category {uri: 'dating:category:values'})
ON CREATE SET c.prefLabel = ['Values@en'],
              c.description = ['What matters to you@en'],
              c.enabled = true,
              c.itemCount = 0;

// Lifestyle
MERGE (c:Item:Category {uri: 'dating:category:lifestyle'})
ON CREATE SET c.prefLabel = ['Lifestyle@en'],
              c.description = ['How you live your life@en'],
              c.enabled = true,
              c.itemCount = 0;

// Languages
MERGE (c:Item:Category {uri: 'dating:category:languages'})
ON CREATE SET c.prefLabel = ['Languages@en'],
              c.description = ['Languages you speak@en'],
              c.enabled = true,
              c.itemCount = 0;

// Career
MERGE (c:Item:Category {uri: 'dating:category:career'})
ON CREATE SET c.prefLabel = ['Career@en'],
              c.description = ['Your profession or field@en'],
              c.enabled = true,
              c.itemCount = 0;

// Education
MERGE (c:Item:Category {uri: 'dating:category:education'})
ON CREATE SET c.prefLabel = ['Education@en'],
              c.description = ['What you studied or study@en'],
              c.enabled = true,
              c.itemCount = 0;

// Hair Color
MERGE (c:Item:Category {uri: 'dating:category:hair-color'})
ON CREATE SET c.prefLabel = ['Hair Color@en'],
              c.description = ['Your hair color@en'],
              c.enabled = true,
              c.itemCount = 0;

// Eye Color
MERGE (c:Item:Category {uri: 'dating:category:eye-color'})
ON CREATE SET c.prefLabel = ['Eye Color@en'],
              c.description = ['Your eye color@en'],
              c.enabled = true,
              c.itemCount = 0;

// Body Type
MERGE (c:Item:Category {uri: 'dating:category:body-type'})
ON CREATE SET c.prefLabel = ['Body Type@en'],
              c.description = ['Your body type or build@en'],
              c.enabled = true,
              c.itemCount = 0;

// Ethnicity
MERGE (c:Item:Category {uri: 'dating:category:ethnicity'})
ON CREATE SET c.prefLabel = ['Ethnicity@en'],
              c.description = ['Your ethnic background@en'],
              c.enabled = true,
              c.itemCount = 0;

// Relationship Status
MERGE (c:Item:Category {uri: 'dating:category:relationship-status'})
ON CREATE SET c.prefLabel = ['Relationship Status@en'],
              c.description = ['Your current relationship status@en'],
              c.enabled = true,
              c.itemCount = 0;

// Looking For
MERGE (c:Item:Category {uri: 'dating:category:looking-for'})
ON CREATE SET c.prefLabel = ['Looking For@en'],
              c.description = ['What type of relationship you seek@en'],
              c.enabled = true,
              c.itemCount = 0;

// Height
MERGE (c:Item:Category {uri: 'dating:category:height'})
ON CREATE SET c.prefLabel = ['Height@en'],
              c.description = ['Your height@en'],
              c.enabled = true,
              c.itemCount = 0;

// Weight
MERGE (c:Item:Category {uri: 'dating:category:weight'})
ON CREATE SET c.prefLabel = ['Weight@en'],
              c.description = ['Your body weight@en'],
              c.enabled = true,
              c.itemCount = 0;

// Gender
MERGE (c:Item:Category {uri: 'dating:category:gender'})
ON CREATE SET c.prefLabel = ['Gender@en'],
              c.description = ['Your gender identity@en'],
              c.enabled = true,
              c.itemCount = 0;

// Sexual Orientation
MERGE (c:Item:Category {uri: 'dating:category:orientation'})
ON CREATE SET c.prefLabel = ['Orientation@en'],
              c.description = ['Your sexual orientation@en'],
              c.enabled = true,
              c.itemCount = 0;

// Smoking
MERGE (c:Item:Category {uri: 'dating:category:smoking'})
ON CREATE SET c.prefLabel = ['Smoking@en'],
              c.description = ['Your smoking habits@en'],
              c.enabled = true,
              c.itemCount = 0;

// Drinking
MERGE (c:Item:Category {uri: 'dating:category:drinking'})
ON CREATE SET c.prefLabel = ['Drinking@en'],
              c.description = ['Your drinking habits@en'],
              c.enabled = true,
              c.itemCount = 0;

// Children
MERGE (c:Item:Category {uri: 'dating:category:children'})
ON CREATE SET c.prefLabel = ['Children@en'],
              c.description = ['Do you have or want children@en'],
              c.enabled = true,
              c.itemCount = 0;

// Religion
MERGE (c:Item:Category {uri: 'dating:category:religion'})
ON CREATE SET c.prefLabel = ['Religion@en'],
              c.description = ['Your religious beliefs@en'],
              c.enabled = true,
              c.itemCount = 0;

// Zodiac Sign
MERGE (c:Item:Category {uri: 'dating:category:zodiac'})
ON CREATE SET c.prefLabel = ['Zodiac Sign@en'],
              c.description = ['Your astrological sign@en'],
              c.enabled = true,
              c.itemCount = 0;

// Household Preferences
MERGE (c:Item:Category {uri: 'dating:category:household'})
ON CREATE SET c.prefLabel = ['Household@en'],
              c.description = ['Your living preferences and habits@en'],
              c.enabled = true,
              c.itemCount = 0;

// Sleep Schedule
MERGE (c:Item:Category {uri: 'dating:category:sleep'})
ON CREATE SET c.prefLabel = ['Sleep Schedule@en'],
              c.description = ['When you sleep and wake@en'],
              c.enabled = true,
              c.itemCount = 0;
