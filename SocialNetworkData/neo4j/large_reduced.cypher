//Note all file paths need to be adjusted for your personal machine. The paths should be path_to_repository/SocialNetworkData/...

//Create Nodes

// Create People
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/large/people_reduced.csv" AS row
CREATE (:Person {ID: row.id,
					FirstName: row.first_name,
					LastName: row.last_name,
					State: row.state,
					Birthday: row.birthday,
					Age: row.age,
					Gender: row.gender,
					AcctCreatedDate: row.acct_created_date} );

// Create Groups
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/large/groups_reduced.csv" AS row
CREATE (:Group {ID: row.id,
				CreatedOn: row.created_on,
				Topic: row.topic} );

// Create Posts
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/large/posts_reduced.csv" AS row
CREATE (:Post {ID: row.id,
				CreatedOn: row.created_on,
				Content: row.content} );

CREATE CONSTRAINT ON (o:Person) ASSERT o.ID IS UNIQUE;
CREATE CONSTRAINT ON (o:Group) ASSERT o.ID IS UNIQUE;
CREATE CONSTRAINT ON (o:Post) ASSERT o.ID IS UNIQUE;

schema await

// Create relationships

// FriendsWith
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/large/friends.csv" AS row
MATCH (person1:Person {ID : row.id1})
MATCH (person2:Person {ID : row.id2})
MERGE (person1)-[:FriendsWith {FriendedOn : row.friended_on}]->(person2);

// MemberOf
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/large/members.csv" AS row
MATCH (person:Person {ID : row.person_id})
MATCH (group:Group {ID : row.group_id})
MERGE (person)-[:MemberOf]->(group);

// Wrote
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/large/posts.csv" AS row
MATCH (person:Person {ID : row.creator_id})
MATCH (post:Post {ID : row.id})
MERGE (person)-[:Wrote]->(post);

// Likes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/large/likes.csv" AS row
MATCH (person:Person {ID : row.person_id})
MATCH (post:Post {ID : row.post_id})
MERGE (person)-[:Likes]->(post);

// CreatedGroup
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/large/groups.csv" AS row
MATCH (person:Person {ID : row.creator_id})
MATCH (group:Group {ID : row.id})
MERGE (person)-[:CreatedGroup]->(group);

