USE social_tiny;

# New People Table
(SELECT 'id','first_name','last_name','state','birthday','age','gender',
	'acct_created_date')
UNION
(SELECT people.id, people.first_name, people.last_name, states.abv, people.birthday,
	people.age, gender.abv, people.acct_created_date
FROM people
INNER JOIN states
ON people.state_id = states.id
INNER JOIN gender
ON people.gender_id = gender.id
INTO OUTFILE 'C:/Users/Public/db/tiny/people_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');

# New Groups Table
(SELECT 'id','created_on','creator_id','topic')
UNION
(SELECT groups.id, groups.created_on, groups.creator_id, topics.name
FROM groups
INNER JOIN topics
ON groups.topic_id = topics.id
INTO OUTFILE 'C:/Users/Public/db/tiny/groups_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');

# New Posts Table
(SELECT 'id','created_on','creator_id','content')
UNION
(SELECT posts.id, posts.created_on, posts.creator_id, content.name
FROM posts
INNER JOIN content
ON posts.content_id = content.id
INTO OUTFILE 'C:/Users/Public/db/tiny/posts_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');

USE social_small;

# New People Table
(SELECT 'id','first_name','last_name','state','birthday','age','gender',
	'acct_created_date')
UNION
(SELECT people.id, people.first_name, people.last_name, states.abv, people.birthday,
	people.age, gender.abv, people.acct_created_date
FROM people
INNER JOIN states
ON people.state_id = states.id
INNER JOIN gender
ON people.gender_id = gender.id
INTO OUTFILE 'C:/Users/Public/db/small/people_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');

# New Groups Table
(SELECT 'id','created_on','creator_id','topic')
UNION
(SELECT groups.id, groups.created_on, groups.creator_id, topics.name
FROM groups
INNER JOIN topics
ON groups.topic_id = topics.id
INTO OUTFILE 'C:/Users/Public/db/small/groups_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');

# New Posts Table
(SELECT 'id','created_on','creator_id','content')
UNION
(SELECT posts.id, posts.created_on, posts.creator_id, content.name
FROM posts
INNER JOIN content
ON posts.content_id = content.id
INTO OUTFILE 'C:/Users/Public/db/small/posts_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');

USE social_med;

# New People Table
(SELECT 'id','first_name','last_name','state','birthday','age','gender',
	'acct_created_date')
UNION
(SELECT people.id, people.first_name, people.last_name, states.abv, people.birthday,
	people.age, gender.abv, people.acct_created_date
FROM people
INNER JOIN states
ON people.state_id = states.id
INNER JOIN gender
ON people.gender_id = gender.id
INTO OUTFILE 'C:/Users/Public/db/med/people_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');

# New Groups Table
(SELECT 'id','created_on','creator_id','topic')
UNION
(SELECT groups.id, groups.created_on, groups.creator_id, topics.name
FROM groups
INNER JOIN topics
ON groups.topic_id = topics.id
INTO OUTFILE 'C:/Users/Public/db/med/groups_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');

# New Posts Table
(SELECT 'id','created_on','creator_id','content')
UNION
(SELECT posts.id, posts.created_on, posts.creator_id, content.name
FROM posts
INNER JOIN content
ON posts.content_id = content.id
INTO OUTFILE 'C:/Users/Public/db/med/posts_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');

USE social_large;

# New People Table
(SELECT 'id','first_name','last_name','state','birthday','age','gender',
	'acct_created_date')
UNION
(SELECT people.id, people.first_name, people.last_name, states.abv, people.birthday,
	people.age, gender.abv, people.acct_created_date
FROM people
INNER JOIN states
ON people.state_id = states.id
INNER JOIN gender
ON people.gender_id = gender.id
INTO OUTFILE 'C:/Users/Public/db/large/people_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');

# New Groups Table
(SELECT 'id','created_on','creator_id','topic')
UNION
(SELECT groups.id, groups.created_on, groups.creator_id, topics.name
FROM groups
INNER JOIN topics
ON groups.topic_id = topics.id
INTO OUTFILE 'C:/Users/Public/db/large/groups_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');

# New Posts Table
(SELECT 'id','created_on','creator_id','content')
UNION
(SELECT posts.id, posts.created_on, posts.creator_id, content.name
FROM posts
INNER JOIN content
ON posts.content_id = content.id
INTO OUTFILE 'C:/Users/Public/db/large/posts_reduced.csv'
FIELDS ENCLOSED BY '' 
TERMINATED BY ',' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n');
