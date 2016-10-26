/**
 * Database creation script
 */

/* Foreign key constraints need to be explicitly enabled in SQLite */
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS user;

CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    created_at VARCHAR NOT NULL,
    is_enabled BOOLEAN NOT NULL DEFAULT true
);

/* This will become user = 1. I'm creating this just to satisfy constraints here.
   The password will be properly hashed in the installer */
INSERT INTO
    user
    (
        username, password, created_at, is_enabled
    )
    VALUES
    (
        "admin", "unhashed-password", datetime('now', '-3 months'), 0
    )
;

DROP TABLE IF EXISTS post;

CREATE TABLE post (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title VARCHAR NOT NULL,
    body VARCHAR NOT NULL,
    user_id INTEGER NOT NULL,
    created_at VARCHAR NOT NULL,
    updated_at VARCHAR,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO
    post
    (
        title, body, user_id, created_at
    )
    VALUES(
        "Here's our first post",
        "Skate ipsum dolor sit amet, crailtap steps 360 drop in. Downhill 180 goofy footed nose. Cab flip pogo death box tailslide. Hard flip
         pressure flip tailslide rail. 50-50 grab indy grab Andy Howell rock and roll. Ho-ho poseur bluntslide Tracker. Durometer bank frontside
          John Cardiel melancholy. Bigspin transition 270 disaster. Nose slide wax regular footed aerial. Poseur Stacy Peralta powerslide pressure flip baseplate.",
        1,
        datetime('now', '-2 months', '-45 minutes', '+10 seconds')
    )
;

INSERT INTO
    post
    (
        title, body, user_id, created_at
    )
    VALUES(
        "Now for a second article",
        "Kingpin alley oop Spike Jonze acid drop transition 1080 900. Stoked boardslide drop in 720 axle set The Faction shoveit. Powerslide 720 pressure flip baseplate nosegrind boned out. Natas Kaupas mute-air indy grab stalefish fastplant late hip. Gator griptape street slob air fast plant coffin lipslide. Skate key kickturn vert flail chicken wing nose. Skate or die tic-tac fakie manual durometer hang-up Jimmy'Z. Slappy street nose grab transfer stalefish pressure flip. Nosepicker 720 durometer Saran Wrap regular footed launch ramp. Stoked heel flip kickturn Streetstyle in Tempe pool masonite face plant. Feeble frontside air front foot impossible hang ten pool bigspin. Sponsored hospital flip transfer coffin hip bluntslide. Airwalk camel back quarter pipe rocket air bigspin hard flip.",
        1,
        datetime('now', '-40 days', '+815 minutes', '+37 seconds')
    )
;

INSERT INTO
    post
    (
        title, body, user_id, created_at
    )
    VALUES(
        "Here's a third post",
        "This is the body of the third post.
This is split into paragraphs.",
        1,
        datetime('now', '-13 days', '+198 minutes', '+51 seconds')
    )
;

DROP TABLE IF EXISTS comment;

CREATE TABLE comment (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    post_id INTEGER NOT NULL,
    created_at VARCHAR NOT NULL,
    name VARCHAR NOT NULL,
    website VARCHAR,
    text VARCHAR NOT NULL,
    FOREIGN KEY (post_id) REFERENCES post(id)
);

INSERT INTO
    comment
    (
        post_id, created_at, name, website, text
    )
    VALUES(
        1,
        datetime('now', '-10 days', '+231 minutes', '+7 seconds'),
        'Jimmy',
        'http://example.com/',
        "This is Jimmy's contribution"
    )
;

INSERT INTO
    comment
    (
        post_id, created_at, name, website, text
    )
    VALUES(
        1,
        datetime('now', '-8 days', '+549 minutes', '+32 seconds'),
        'Jonny',
        'http://anotherexample.com/',
        "This is a comment from Jonny"
    )
;