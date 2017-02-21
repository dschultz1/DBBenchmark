LOAD DATA INFILE 'social_network_data/large/enums/gender.csv' IGNORE 
INTO TABLE social_network_large.GENDER 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/large/enums/state.csv' IGNORE 
INTO TABLE social_network_large.STATES 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/large/enums/topic.csv' IGNORE 
INTO TABLE social_network_large.TOPICS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/large/enums/content.csv' IGNORE 
INTO TABLE social_network_large.CONTENT 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/large/people.csv' IGNORE 
INTO TABLE social_network_large.PEOPLE 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/large/friends.csv' IGNORE 
INTO TABLE social_network_large.FRIENDS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/large/groups.csv' IGNORE 
INTO TABLE social_network_large.GROUPS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/large/members.csv' IGNORE 
INTO TABLE social_network_large.MEMBERS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/large/posts.csv' IGNORE 
INTO TABLE social_network_large.POSTS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/large/likes.csv' IGNORE 
INTO TABLE social_network_large.LIKES 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
