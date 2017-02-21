LOAD DATA INFILE 'social_network_data/med/enums/gender.csv' IGNORE 
INTO TABLE social_network_medium.GENDER 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/med/enums/state.csv' IGNORE 
INTO TABLE social_network_medium.STATES 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/med/enums/topic.csv' IGNORE 
INTO TABLE social_network_medium.TOPICS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/med/enums/content.csv' IGNORE 
INTO TABLE social_network_medium.CONTENT 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/med/people.csv' IGNORE 
INTO TABLE social_network_medium.PEOPLE 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/med/friends.csv' IGNORE 
INTO TABLE social_network_medium.FRIENDS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/med/groups.csv' IGNORE 
INTO TABLE social_network_medium.GROUPS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/med/members.csv' IGNORE 
INTO TABLE social_network_medium.MEMBERS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/med/posts.csv' IGNORE 
INTO TABLE social_network_medium.POSTS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/med/likes.csv' IGNORE 
INTO TABLE social_network_medium.LIKES 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
