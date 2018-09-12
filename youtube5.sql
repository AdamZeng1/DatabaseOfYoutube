-- ("High Distinction"),Spr 2018 Weihan Zeng Weihan.Zeng@student.uts.edu.au
-- I am inspried by youtube to modeling the ERD and building this database.
-- It is a simplified version of youtube website which contains
-- users table,videos table,comments table,subscribers table and so on.
-- The URL of website is www.youtube.com

ALTER TABLE "videos" DROP CONSTRAINT "userNo";
ALTER TABLE "comments" DROP CONSTRAINT "userNo";
ALTER TABLE "comments" DROP CONSTRAINT "videoNo";
ALTER TABLE "subscriber" DROP CONSTRAINT "subscribed";
ALTER TABLE "subscriber" DROP CONSTRAINT "subscriber";
ALTER TABLE "collection" DROP CONSTRAINT "userNo";
ALTER TABLE "collection" DROP CONSTRAINT "videoNo";
ALTER TABLE "recommendation" DROP CONSTRAINT "recommender";
ALTER TABLE "recommendation" DROP CONSTRAINT "recommended";
ALTER TABLE "history" DROP CONSTRAINT "fk_history";
ALTER TABLE "history" DROP CONSTRAINT "fk_history_1";
ALTER TABLE "videos" DROP CONSTRAINT "trendingNo";

DROP TABLE "users";
DROP TABLE "videos";
DROP TABLE "table_1";
DROP TABLE "comments";
DROP TABLE "subscriber";
DROP TABLE "collection";
DROP TABLE "recommendation";
DROP TABLE "trending";
DROP TABLE "history";

CREATE TABLE "users" (
"userNo" int4 NOT NULL,
"userName" text NOT NULL,
"avatarPath" text NOT NULL,
CHECK ("userNo" > 0),
PRIMARY KEY ("userNo") 
)
WITHOUT OIDS;
CREATE TABLE "videos" (
"videoNo" int4 NOT NULL,
"videoPath" text,
"videoName" text,
"userNo" int4 NOT NULL,
"yearOfUpload" int4 NOT NULL,
"monthOfUpload" int4 NOT NULL,
"dayOfUpload" int4,
"trendingNo" int4,
CHECK ("videoNo" >0),
CHECK ("yearOfUpload"<2019),
PRIMARY KEY ("videoNo") 
)
WITHOUT OIDS;
CREATE TABLE "table_1" (
)
WITHOUT OIDS;
CREATE TABLE "comments" (
"videoNo" int4 NOT NULL,
"userNo" int4 NOT NULL,
"commentNo" int4 NOT NULL,
"content" text NOT NULL,
CHECK ("commentNo" >0),
PRIMARY KEY ("commentNo") 
)
WITHOUT OIDS;
CREATE TABLE "subscriber" (
"subscriber" int4 NOT NULL,
"subscribed" int4 NOT NULL,
PRIMARY KEY ("subscriber", "subscribed") 
)
WITHOUT OIDS;
CREATE TABLE "collection" (
"userNo" int4 NOT NULL,
"videoNo" int4 NOT NULL,
PRIMARY KEY ("userNo", "videoNo") 
)
WITHOUT OIDS;
CREATE TABLE "recommendation" (
"recommender" int4 NOT NULL,
"recommended" int4 NOT NULL,
PRIMARY KEY ("recommended", "recommender") 
)
WITHOUT OIDS;
CREATE TABLE "trending" (
"trendingNo" int4 NOT NULL,
"rankingNo" int4,
CHECK("trendingNo" >0),
PRIMARY KEY ("trendingNo") 
)
WITHOUT OIDS;
CREATE TABLE "history" (
"userNo" int4 NOT NULL,
"videoNo" int4 NOT NULL,
PRIMARY KEY ("userNo", "videoNo") 
)
WITHOUT OIDS;

ALTER TABLE "videos" ADD CONSTRAINT "userNo" FOREIGN KEY ("userNo") REFERENCES "users" ("userNo") ON DELETE CASCADE;
ALTER TABLE "comments" ADD CONSTRAINT "userNo" FOREIGN KEY ("userNo") REFERENCES "users" ("userNo") ON DELETE CASCADE;
ALTER TABLE "comments" ADD CONSTRAINT "videoNo" FOREIGN KEY ("videoNo") REFERENCES "videos" ("videoNo") ON DELETE CASCADE;
ALTER TABLE "subscriber" ADD CONSTRAINT "subscribed" FOREIGN KEY ("subscribed") REFERENCES "users" ("userNo") ON DELETE CASCADE;
ALTER TABLE "subscriber" ADD CONSTRAINT "subscriber" FOREIGN KEY ("subscriber") REFERENCES "users" ("userNo") ON DELETE CASCADE;
ALTER TABLE "collection" ADD CONSTRAINT "userNo" FOREIGN KEY ("userNo") REFERENCES "users" ("userNo") ON DELETE CASCADE;
ALTER TABLE "collection" ADD CONSTRAINT "videoNo" FOREIGN KEY ("videoNo") REFERENCES "videos" ("videoNo") ON DELETE CASCADE;
ALTER TABLE "recommendation" ADD CONSTRAINT "recommender" FOREIGN KEY ("recommender") REFERENCES "users" ("userNo") ON DELETE CASCADE;
ALTER TABLE "recommendation" ADD CONSTRAINT "recommended" FOREIGN KEY ("recommended") REFERENCES "users" ("userNo") ON DELETE CASCADE;
ALTER TABLE "history" ADD CONSTRAINT "fk_history" FOREIGN KEY ("userNo") REFERENCES "users" ("userNo") ON DELETE CASCADE;
ALTER TABLE "history" ADD CONSTRAINT "fk_history_1" FOREIGN KEY ("videoNo") REFERENCES "videos" ("videoNo") ON DELETE CASCADE;
ALTER TABLE "videos" ADD CONSTRAINT "trendingNo" FOREIGN KEY ("trendingNo") REFERENCES "trending" ("trendingNo") ON DELETE CASCADE;


DROP TABLE "table_1";

INSERT INTO users VALUES(1,'Adam','avatarPath1');
INSERT INTO users VALUES(2,'Bob','avatarPath2');
INSERT INTO users VALUES(3,'Keven','avatarPath3');
INSERT INTO users VALUES(4,'John','avatarPath4');
INSERT INTO users VALUES(5,'Jason','avatarPath5');


INSERT INTO subscriber VALUES(1,2);
INSERT INTO subscriber VALUES(3,1);
INSERT INTO subscriber VALUES(2,3);
INSERT INTO subscriber VALUES(3,2);
INSERT INTO subscriber VALUES(4,5);

INSERT INTO "videos" VALUES(1,'videoPath1','flower',1,2016,7,4,1);
INSERT INTO "videos" VALUES(2,'videoPath2','tree',2,2017,6,3,2);
INSERT INTO "videos" VALUES(3,'videoPath3','grass',3,2018,5,2,3);
INSERT INTO "videos" VALUES(4,'videoPath4','people',4,2015,7,4,4);
INSERT INTO "videos" VALUES(5,'videoPath5','city',5,2013,1,1,5);

INSERT INTO "collection" VALUES(1,2);
INSERT INTO "collection" VALUES(1,3);
INSERT INTO "collection" VALUES(2,3);
INSERT INTO "collection" VALUES(3,4);
INSERT INTO "collection" VALUES(4,2);

INSERT INTO "comments" VALUES(1,2,1,'great');
INSERT INTO "comments" VALUES(3,1,2,'nice');
INSERT INTO "comments" VALUES(2,4,3,'awesome');
INSERT INTO "comments" VALUES(1,3,4,'beautiful');
INSERT INTO "comments" VALUES(1,2,5,'better');
INSERT INTO "comments" VALUES(2,1,6,'yes');

INSERT INTO recommendation VALUES(1,3);
INSERT INTO recommendation VALUES(1,4);
INSERT INTO recommendation VALUES(2,1);
INSERT INTO recommendation VALUES(3,5);
INSERT INTO recommendation VALUES(1,2);
INSERT INTO recommendation VALUES(4,2);
INSERT INTO recommendation VALUES(5,2);

INSERT INTO "trending" VALUES(1,3);
INSERT INTO "trending" VALUES(2,5);
INSERT INTO "trending" VALUES(3,4);
INSERT INTO "trending" VALUES(4,2);
INSERT INTO "trending" VALUES(5,1);

INSERT INTO "history" VALUES(1,2);
INSERT INTO "history" VALUES(1,1);
INSERT INTO "history" VALUES(1,4);
INSERT INTO "history" VALUES(2,2);
INSERT INTO "history" VALUES(2,3);
INSERT INTO "history" VALUES(4,1);
INSERT INTO "history" VALUES(5,4);


