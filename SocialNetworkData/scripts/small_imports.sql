LOAD DATA INFILE 'social_network_data/small/enums/gender.csv' IGNORE 
INTO TABLE social_network_small.GENDER 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/small/enums/state.csv' IGNORE 
INTO TABLE social_network_small.STATES 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/small/enums/topic.csv' IGNORE 
INTO TABLE social_network_small.TOPICS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/small/enums/content.csv' IGNORE 
INTO TABLE social_network_small.CONTENT 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/small/people.csv' IGNORE 
INTO TABLE social_network_small.PEOPLE 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/small/friends.csv' IGNORE 
INTO TABLE social_network_small.FRIENDS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/small/groups.csv' IGNORE 
INTO TABLE social_network_small.GROUPS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/small/members.csv' IGNORE 
INTO TABLE social_network_small.MEMBERS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/small/posts.csv' IGNORE 
INTO TABLE social_network_small.POSTS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/small/likes.csv' IGNORE 
INTO TABLE social_network_small.LIKES 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
