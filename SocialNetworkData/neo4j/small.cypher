//Note all file paths need to be adjusted for your personal machine. The paths should be path_to_repository/SocialNetworkData/...

//Create Notes

// Create Genders
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/enums/gender.csv" AS row
CREATE (: Gender {ID: row.id,
					Abreviation: row.abv,
					Name: row.name} );

// Create Topics
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/enums/topic.csv" AS row
CREATE (:Topic {ID: row.id,
				Name: row.name} );

// Create Content
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/enums/content.csv" AS row
CREATE (:Content {ID: row.id,
				Name: row.name} );

// Create States
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/enums/state.csv" AS row
CREATE (:State {ID: row.id,
				Name: row.name,
				Abreviation: row.abv} );

// Create People
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/people.csv" AS row
CREATE (:Person {ID: row.id,
					FirstName: row.first_name,
					LastName: row.last_name,
					Birthday: row.birthday,
					Age: row.age,
					AcctCreatedDate: row.acct_created_date} );

// Create Groups
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/groups.csv" AS row
CREATE (:Group {ID: row.id,
				CreatedOn: row.created_on} );

// Create Posts
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/posts.csv" AS row
CREATE (:Post {ID: row.id,
				CreatedOn: row.created_on} );

CREATE CONSTRAINT ON (o:Person) ASSERT o.ID IS UNIQUE;
CREATE CONSTRAINT ON (o:Group) ASSERT o.ID IS UNIQUE;
CREATE CONSTRAINT ON (o:Post) ASSERT o.ID IS UNIQUE;

schema await

// Create relationships

// FriendsWith
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/friends.csv" AS row
MATCH (person1:Person {ID : row.id1})
MATCH (person2:Person {ID : row.id2})
MERGE (person1)-[:FriendsWith {FriendedOn : row.friended_on}]->(person2);

// MemberOf
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/members.csv" AS row
MATCH (person:Person {ID : row.person_id})
MATCH (group:Group {ID : row.group_id})
MERGE (person)-[:MemberOf]->(group);

// Wrote
// HasContent
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/posts.csv" AS row
MATCH (person:Person {ID : row.creator_id})
MATCH (post:Post {ID : row.id})
MATCH (content:Content {ID : row.content_id})
MERGE (person)-[:Wrote]->(post)
MERGE (post)-[:HasContent]->(content);

// Likes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/likes.csv" AS row
MATCH (person:Person {ID : row.person_id})
MATCH (post:Post {ID : row.post_id})
MERGE (person)-[:Likes]->(post);

// LivesIn
// IsOfGender
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/people.csv" AS row
MATCH (person:Person {ID : row.id})
MATCH (state:State {ID : row.state_id})
MATCH (gender:Gender {ID : row.gender_id})
MERGE (person)-[:LivesIn]->(state)
MERGE (person)-[:IsOfGender]->(gender);

// CreatedGroup
// OfTopic
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///C:/Users/zaharacw/Documents/DBProject/DBBenchmark/SocialNetworkData/small/groups.csv" AS row
MATCH (person:Person {ID : row.creator_id})
MATCH (group:Group {ID : row.id})
MATCH (topic:Topic {ID : row.topic_id})
MERGE (person)-[:CreatedGroup]->(group)
MERGE (group)-[:OfTopic]->(topic);
