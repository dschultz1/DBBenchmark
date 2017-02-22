#DROP DATABASE IF EXISTS social_small;
CREATE DATABASE IF NOT EXISTS social_small;
USE social_small;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS friends,
                     members,
                     groups,
                     likes,
                     posts,
                     people,
                     content,
					 topics,
                     gender,
                     states;


CREATE TABLE IF NOT EXISTS content (
	id		TINYINT 	NOT NULL,
	name 	VARCHAR(10) 	NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS topics (
	id 		TINYINT 	NOT NULL,
	name 	VARCHAR(15) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS gender (
	id 		TINYINT 	NOT NULL,
	abv 	CHAR(1) 	NOT NULL,
	name 	VARCHAR(10) 	NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS states (
	id 		TINYINT 	NOT NULL,
	name 	VARCHAR(15) NOT NULL,
	abv 	CHAR(2) 	NOT NULL, 
	PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS people (
	id 					INT 		NOT NULL,
	first_name 			VARCHAR(15) NOT NULL,
	last_name 			VARCHAR(15) NOT NULL,
	state_id 			TINYINT 	NOT NULL,
	birthday 			DATE 		NOT NULL,
	age 				TINYINT 	NOT NULL,
	gender_id 			TINYINT 	NOT NULL,
	acct_created_date 	DATE 		NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (state_id) REFERENCES STATES(id),
	FOREIGN KEY (gender_id) REFERENCES GENDER(id)
);

CREATE TABLE IF NOT EXISTS friends (
	id1 			INT 	NOT NULL,
	id2 			INT 	NOT NULL, 
	friended_on 	DATE 	NOT NULL,
	PRIMARY KEY (id1, id2),
	FOREIGN KEY (id1) REFERENCES PEOPLE(id),
	FOREIGN KEY (id2) REFERENCES PEOPLE(id)
);


CREATE TABLE IF NOT EXISTS groups (
	id 			INT 	NOT NULL,
	created_on 	DATE 	NOT NULL,
	creator_id 	INT 	NOT NULL,
	topic_id 	TINYINT NOT NULL, 
	PRIMARY KEY (id),
	FOREIGN KEY (creator_id) REFERENCES PEOPLE(id),
	FOREIGN KEY (topic_id) REFERENCES TOPICS(id)
);

CREATE TABLE IF NOT EXISTS posts (
	id 			INT 	NOT NULL,
	created_on 	DATE	NOT NULL,
	creator_id 	INT 	NOT NULL,
	content_id 	TINYINT NOT NULL, 
	PRIMARY KEY (id),
	FOREIGN KEY (creator_id) REFERENCES PEOPLE(id),
	FOREIGN KEY (content_id) REFERENCES CONTENT(id)
);

CREATE TABLE IF NOT EXISTS members (
	person_id 	INT 	NOT NULL,
	group_id 	INT 	NOT NULL,
	PRIMARY KEY (person_id, group_id),
	FOREIGN KEY (person_id) REFERENCES PEOPLE(id),
	FOREIGN KEY (group_id) REFERENCES GROUPS(id)
);

CREATE TABLE IF NOT EXISTS likes (
	person_id 	INT 	NOT NULL,
	post_id 	INT 	NOT NULL,
	PRIMARY KEY (person_id, post_id),
	FOREIGN KEY (person_id) REFERENCES PEOPLE(id),
	FOREIGN KEY (post_id) REFERENCES POSTS(id)
);

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/enums/gender.csv'
INTO TABLE gender 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/enums/state.csv'
INTO TABLE states 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/enums/topic.csv'
INTO TABLE topics 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/enums/content.csv'
INTO TABLE content 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/people.csv'
INTO TABLE people 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/friends.csv'
INTO TABLE friends 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/groups.csv'
INTO TABLE groups 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/members.csv'
INTO TABLE members 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/posts.csv'
INTO TABLE posts 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/likes.csv'
INTO TABLE likes 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
