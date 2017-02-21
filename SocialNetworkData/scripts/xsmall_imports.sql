LOAD DATA INFILE 'social_network_data/xsmall/enums/gender.csv' IGNORE 
INTO TABLE social_network_xsmall.GENDER 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/xsmall/enums/state.csv' IGNORE 
INTO TABLE social_network_xsmall.STATES 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/xsmall/enums/topic.csv' IGNORE 
INTO TABLE social_network_xsmall.TOPICS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/xsmall/enums/content.csv' IGNORE 
INTO TABLE social_network_xsmall.CONTENT 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/xsmall/people.csv' IGNORE 
INTO TABLE social_network_xsmall.PEOPLE 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/xsmall/friends.csv' IGNORE 
INTO TABLE social_network_xsmall.FRIENDS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/xsmall/groups.csv' IGNORE 
INTO TABLE social_network_xsmall.GROUPS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/xsmall/members.csv' IGNORE 
INTO TABLE social_network_xsmall.MEMBERS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/xsmall/posts.csv' IGNORE 
INTO TABLE social_network_xsmall.POSTS 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'social_network_data/xsmall/likes.csv' IGNORE 
INTO TABLE social_network_xsmall.LIKES 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
