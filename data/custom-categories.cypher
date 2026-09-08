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

// Sports & Fitness
MERGE (c:Item:Category {uri: 'dating:category:sports'})
ON CREATE SET c.prefLabel = ['Sports & Fitness@en'],
              c.description = ['Sports you play and how you stay active@en'],
              c.enabled = true,
              c.itemCount = 0
ON MATCH SET c.prefLabel = ['Sports & Fitness@en'],
             c.description = ['Sports you play and how you stay active@en'];

// Music
MERGE (c:Item:Category {uri: 'dating:category:music'})
ON CREATE SET c.prefLabel = ['Music@en'],
              c.description = ['Music you listen to or play@en'],
              c.enabled = true,
              c.itemCount = 0;

// Favorite Cuisines
MERGE (c:Item:Category {uri: 'dating:category:food-drink'})
ON CREATE SET c.prefLabel = ['Favorite Cuisines@en'],
              c.description = ['Types of food you enjoy@en'],
              c.enabled = true,
              c.itemCount = 0
ON MATCH SET c.prefLabel = ['Favorite Cuisines@en'],
             c.description = ['Types of food you enjoy@en'];

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

// Personality
MERGE (c:Item:Category {uri: 'dating:category:personality'})
ON CREATE SET c.prefLabel = ['Personality@en'],
              c.description = ['Your personality type@en'],
              c.enabled = true,
              c.itemCount = 0;

// Myers-Briggs
MERGE (c:Item:Category {uri: 'dating:category:myers-briggs'})
ON CREATE SET c.prefLabel = ['Myers-Briggs@en'],
              c.description = ['Your MBTI personality type@en'],
              c.enabled = true,
              c.itemCount = 0;

// Comfort Temperature
MERGE (c:Item:Category {uri: 'dating:category:comfort-temp'})
ON CREATE SET c.prefLabel = ['Comfort Temperature@en'],
              c.description = ['Your preferred indoor temperature@en'],
              c.enabled = true,
              c.itemCount = 0;

// What I Value
MERGE (c:Item:Category {uri: 'dating:category:what-i-value'})
ON CREATE SET c.prefLabel = ['What I Value@en'],
              c.description = ['What matters most to you@en'],
              c.enabled = true,
              c.itemCount = 0;

// Diet
MERGE (c:Item:Category {uri: 'dating:category:diet'})
ON CREATE SET c.prefLabel = ['Diet@en'],
              c.description = ['Your dietary preferences@en'],
              c.enabled = true,
              c.itemCount = 0;

// Cannabis
MERGE (c:Item:Category {uri: 'dating:category:cannabis'})
ON CREATE SET c.prefLabel = ['Cannabis@en'],
              c.description = ['Your cannabis/marijuana use@en'],
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

// Education Level
MERGE (c:Item:Category {uri: 'dating:category:education-level'})
ON CREATE SET c.prefLabel = ['Education Level@en'],
              c.description = ['Your highest degree or current enrollment@en'],
              c.enabled = true,
              c.itemCount = 0;

// Education Background
MERGE (c:Item:Category {uri: 'dating:category:field-of-study'})
ON CREATE SET c.prefLabel = ['Education Background@en'],
              c.description = ['What you studied or are studying@en'],
              c.enabled = true,
              c.itemCount = 0
ON MATCH SET c.prefLabel = ['Education Background@en'];

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

// ============================================================
// Set default relations for categories where it's implicit
// If defaultRelation is set, skip the relation dialog
// ============================================================

// Demographics - always HAS
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:hair-color',
  'dating:category:eye-color',
  'dating:category:body-type',
  'dating:category:ethnicity',
  'dating:category:height',
  'dating:category:weight',
  'dating:category:gender',
  'dating:category:orientation',
  'dating:category:smoking',
  'dating:category:drinking',
  'dating:category:religion',
  'dating:category:zodiac',
  'dating:category:relationship-status',
  'dating:category:sleep',
  'dating:category:career',
  'dating:category:education-level'
]
SET c.defaultRelation = 'HAS';

// ============================================================
// Set maxItems for categories (1 = single select, null = unlimited)
// ============================================================

// Single selection only
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:body-type',
  'dating:category:height',
  'dating:category:weight',
  'dating:category:gender',
  'dating:category:orientation',
  'dating:category:smoking',
  'dating:category:drinking',
  'dating:category:zodiac',
  'dating:category:relationship-status',
  'dating:category:sleep',
  'dating:category:education-level',
  'dating:category:looking-for',
  'dating:category:career'
]
SET c.maxItems = 1;

// Allow a few selections
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:ethnicity',
  'dating:category:hair-color',
  'dating:category:eye-color',
  'dating:category:religion'
]
SET c.maxItems = 3;

// Field of study - STUDIES
MATCH (c:Category {uri: 'dating:category:field-of-study'})
SET c.defaultRelation = 'STUDIES';

// Looking for - always WANTS
MATCH (c:Category {uri: 'dating:category:looking-for'})
SET c.defaultRelation = 'WANTS';

// Languages - always SPEAKS
MATCH (c:Category {uri: 'dating:category:languages'})
SET c.defaultRelation = 'SPEAKS';

// Sports - typically PLAYS
MATCH (c:Category {uri: 'dating:category:sports'})
SET c.defaultRelation = 'PLAYS';

// Music genres - typically LIKES
MATCH (c:Category {uri: 'dating:category:music'})
SET c.defaultRelation = 'LIKES';

// Food - typically LIKES (but could be ALLERGIC, so maybe no default?)
// Leaving food without default for now

// Entertainment - typically LIKES
MATCH (c:Category {uri: 'dating:category:entertainment'})
SET c.defaultRelation = 'LIKES';

// What I Value - always HAS
MATCH (c:Category {uri: 'dating:category:what-i-value'})
SET c.defaultRelation = 'HAS';

// Personality - always HAS
MATCH (c:Category {uri: 'dating:category:personality'})
SET c.defaultRelation = 'HAS';

// Diet - always HAS
MATCH (c:Category {uri: 'dating:category:diet'})
SET c.defaultRelation = 'HAS';

// Cannabis - always HAS
MATCH (c:Category {uri: 'dating:category:cannabis'})
SET c.defaultRelation = 'HAS';

// Single select for new categories
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:personality',
  'dating:category:myers-briggs',
  'dating:category:diet',
  'dating:category:cannabis',
  'dating:category:comfort-temp'
]
SET c.maxItems = 1;

// Myers-Briggs and Comfort Temp - HAS relation
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:myers-briggs',
  'dating:category:comfort-temp'
]
SET c.defaultRelation = 'HAS';

// ============================================================
// Category groups for organizing in UI
// ============================================================

// Physical Appearance
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:body-type',
  'dating:category:height',
  'dating:category:weight',
  'dating:category:hair-color',
  'dating:category:eye-color'
]
SET c.categoryGroup = 'Physical Appearance', c.groupOrder = 1;

// Background
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:ethnicity',
  'dating:category:religion',
  'dating:category:zodiac'
]
SET c.categoryGroup = 'Background', c.groupOrder = 2;

// Identity
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:gender',
  'dating:category:orientation',
  'dating:category:relationship-status',
  'dating:category:looking-for'
]
SET c.categoryGroup = 'Identity & Dating', c.groupOrder = 3;

// Lifestyle & Habits
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:smoking',
  'dating:category:drinking',
  'dating:category:cannabis',
  'dating:category:diet',
  'dating:category:sleep',
  'dating:category:comfort-temp'
]
SET c.categoryGroup = 'Lifestyle & Habits', c.groupOrder = 4;

// Work & Education
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:career',
  'dating:category:education-level',
  'dating:category:field-of-study',
  'dating:category:languages'
]
SET c.categoryGroup = 'Work & Education', c.groupOrder = 5;

// Personality & Values
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:myers-briggs',
  'dating:category:what-i-value'
]
SET c.categoryGroup = 'Personality & Values', c.groupOrder = 6;

// Interests & Hobbies
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:sports',
  'dating:category:outdoor-activities',
  'dating:category:indoor-activities',
  'dating:category:creative',
  'dating:category:music',
  'dating:category:entertainment',
  'dating:category:food-drink',
  'dating:category:travel',
  'dating:category:pets'
]
SET c.categoryGroup = 'Interests & Hobbies', c.groupOrder = 7;

// Home Life
MATCH (c:Category) WHERE c.uri IN [
  'dating:category:children',
  'dating:category:household'
]
SET c.categoryGroup = 'Home Life', c.groupOrder = 8;
