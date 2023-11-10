DROP SCHEMA IF EXISTS "worldcup_P3";
CREATE SCHEMA IF NOT EXISTS "worldcup_P3";

CREATE TABLE IF NOT EXISTS "worldcup_P3"."TEAMS" (
  "TeamID"  integer (serial)   NOT NULL,
  "Name"    text     NOT NULL,
  "Record"  text     NOT NULL,
  "GamesLeft" integer,
  "Country"   text   NOT NULL,
  "CoachLastName"   text     NOT NULL,
  "LastWorldCupWon" integer

  PRIMARY KEY ("TeamID","Name"),
  FOREIGN KEY ("Record") REFERENCES "worldcup_P3"."RECORD" ("OverallRecord"),
  FOREIGN KEY ("GamesLeft") REFERENCES "worldcup_P3"."TEAM_SCHEDULE" ("GamesLeft"),
  FOREIGN KEY ("Country") REFERENCES "worldcup_P3"."PLAYERS" ("Country")
);

INSERT INTO "worldcup_P3"."TEAMS" VALUES
  (, 'US Men's National Team', '1-0-2', 0, 'US', 'Berhalter', NULL)
  (, 'Argentina Men's National Team', '3-1-0', 0, 'AR', 'Scaloni', 1986)
  (, 'France Men's National Team', 4-0-0, 0, 'FR', 'Deschamps', 2018)
);

CREATE TABLE IF NOT EXISTS "worldcup_P3"."TEAM_SCHEDULE" (
  "GamesLeft"  integer   PRIMARY KEY,
  "NextGameAgainst"    text,
  "PreviousGameAgainst"  text

  FOREIGN KEY ("NextGameAgainst") REFERENCES "worldcup_P3"."TICKETS" ("Game"),
);

INSERT INTO "worldcup_P3"."TEAM_SCHEDULE" VALUES (

);

CREATE TABLE IF NOT EXISTS "worldcup_P3"."TICKETS" (
  "Game"  text   PRIMARY KEY,
  "Date"    date    NOT NULL,
  "Price"  float   NOT NULL,
  "TicketsSold" integer   NOT NULL,
  "TicketsLeft" integer   NOT NULL
);

INSERT INTO "worldcup_P3"."TICKETS" VALUES (

);

CREATE TABLE IF NOT EXISTS "worldcup_P3"."RECORD" (
  "OverallRecord"  integer   PRIMARY KEY,
  "WinStreak"    integer    NOT NULL,
  "LossStreak"  integer   NOT NULL,
  "DrawStreak" integer   NOT NULL
);

INSERT INTO "worldcup_P3"."RECORD" VALUES (

);


CREATE TABLE IF NOT EXISTS "worldcup_P3"."PLAYERS" (
  "Country"  text   NOT NULL,
  "FirstName"    text    NOT NULL,
  "LastName"  text  NOT NULL,
  "JerseyNumber" integer   NOT NULL,
  "Age"   integer   NOT NULL,
  "DebutDate" date  NOT NULL

  PRIMARY KEY ("Country", "FirstName", "LastName"),
  FOREIGN KEY ("JerseyNumber")  REFERENCES "worldcup_P3"."MERCH" ("JerseyNumber")
);

INSERT INTO "worldcup_P3"."PLAYERS" VALUES (

);


CREATE TABLE IF NOT EXISTS "worldcup_P3"."PLAYER_STATS" (
  "LastName"  integer   PRIMARY KEY,
  "Goals"    float    NOT NULL,
  "Assists"  float   NOT NULL,
  "GamesPlayed" integer   NOT NULL
);

INSERT INTO "worldcup_P3"."PLAYER_STATS" VALUES (

);

CREATE TABLE IF NOT EXISTS "worldcup_P3"."MERCH" (
  "JerseyNumber"  integer   PRIMARY KEY,
  "Price"  float   NOT NULL,
  "TypeOfClothing"  text  NOT NULL,
);

INSERT INTO "worldcup_P3"."MERCH" VALUES (

);
