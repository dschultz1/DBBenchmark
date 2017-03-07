#DROP DATABASE IF EXISTS reduced_social_tiny;
CREATE DATABASE IF NOT EXISTS reduced_social_tiny;
USE reduced_social_tiny;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS friends,
                     members,
                     groups,
                     likes,
                     posts,
                     people;

CREATE TABLE IF NOT EXISTS people (
	id 					INT 			NOT NULL,
	first_name 			VARCHAR(15) 	NOT NULL,
	last_name 			VARCHAR(15) 	NOT NULL,
	state  				CHAR(2) 		NOT NULL,
	birthday 			DATE 			NOT NULL,
	age 				TINYINT			NOT NULL,
    gender				ENUM('M','F') 	NOT NULL,
	acct_created_date 	DATE 			NOT NULL,
	PRIMARY KEY (id)
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
	id 			INT 		NOT NULL,
	created_on 	DATE 		NOT NULL,
	creator_id 	INT 		NOT NULL,
	topic 		VARCHAR(15) NOT NULL, 
	PRIMARY KEY (id),
	FOREIGN KEY (creator_id) REFERENCES PEOPLE(id)
);

CREATE TABLE IF NOT EXISTS posts (
	id 			INT 		NOT NULL,
	created_on 	DATE		NOT NULL,
	creator_id 	INT 		NOT NULL,
	content 	VARCHAR(10) NOT NULL, 
	PRIMARY KEY (id),
	FOREIGN KEY (creator_id) REFERENCES PEOPLE(id)
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

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/tiny/people_reduced.csv'
INTO TABLE people 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/tiny/friends.csv'
INTO TABLE friends 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/tiny/groups_reduced.csv'
INTO TABLE groups 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/tiny/members.csv'
INTO TABLE members 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/tiny/posts_reduced.csv'
INTO TABLE posts 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/tiny/likes.csv'
INTO TABLE likes 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
