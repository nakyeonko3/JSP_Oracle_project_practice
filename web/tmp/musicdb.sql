CREATE TABLE UserTable (
  UserName VARCHAR2(100) NOT NULL,
  Password VARCHAR2(100) NOT NULL
);

CREATE TABLE PlaylistTable (
  PlaylistID NUMBER NOT NULL,
  PlaylistName VARCHAR2(100) NOT NULL,
  PlaylistDescripions VARCHAR2(200),
  UserName VARCHAR2(100) NOT NULL
);

CREATE TABLE SongTable (
  SongID NUMBER NOT NULL,
  SongName VARCHAR2(100) NOT NULL,
  ArtistName VARCHAR2(100),
  SongURL VARCHAR2(200),
  PlaylistName VARCHAR2(100) NOT NULL,
  UpdatedDate DATE
);

SELECT * FROM SONGTABLE ORDER BY SONGID DESC;
CREATE SEQUENCE songid_seq;
CREATE SEQUENCE songlistid_seq;


INSERT INTO PlaylistTable(PlaylistID, PlaylistName, PlaylistDescripions, UserName)
VALUES(
    songlistid_seq.NEXTVAL,
    'blueArchieve_music_list',
    'exciting blueArchieve music',
    'KO NAKYEON'
);

INSERT INTO PlaylistTable(PlaylistID, PlaylistName, PlaylistDescripions, UserName)
VALUES(
    songlistid_seq.NEXTVAL,
    'exercise music list',
    'exciting music',
    'KO NAKYEON'
);

INSERT INTO PlaylistTable(PlaylistID, PlaylistName, PlaylistDescripions, UserName)
VALUES(
    songlistid_seq.NEXTVAL,
    'calm music list',
    'for sleep music',
    'KO NAKYEON'
);



INSERT INTO SongTable (SongID, SongName, ArtistName, SongURL, PlaylistName, UpdatedDate)
VALUES(
    songid_seq.NEXTVAL,
    'RE Aoharu',
    'MO2',
    'https://www.youtube.com/watch?v=lgq0OdRIEao',
    'blueArchieve_music_list',
    CURRENT_TIMESTAMP
);

INSERT INTO SongTable (SongID, SongName, ArtistName, SongURL, PlaylistName, UpdatedDate)
VALUES(
    songid_seq.NEXTVAL,
    'cannon balls',
    'MO2',
    'https://www.youtube.com/watch?v=lgq0OdRIEao',
    'exercise music list',
    CURRENT_TIMESTAMP
);

INSERT INTO SongTable (SongID, SongName, ArtistName, SongURL, PlaylistName, UpdatedDate)
VALUES(
    songid_seq.NEXTVAL,
    'cannon ballsw2',
    'MO2',
    'https://www.youtube.com/watch?v=lgq0OdRIEao',
    'exercise music list',
    CURRENT_TIMESTAMP
);


INSERT INTO SongTable (SongID, SongName, ArtistName, SongURL, PlaylistName, UpdatedDate)
VALUES(
    songid_seq.NEXTVAL,
    'sleeping buddy',
    'MO2',
    'https://www.youtube.com/watch?v=lgq0OdRIEao',
    'calm music list',
    CURRENT_TIMESTAMP
);



SELECT * FROM PLAYLISTTABLE ORDER BY PLAYLISTID DESC;
SELECT * FROM SONGTABLE ORDER BY SONGID DESC;

SELECT * FROM PLAYLISTTABLE WHERE USERNAME='KO NAKYEON';
SELECT * FROM SongTable WHERE PlaylistName='blueArchieve_music_list';
SELECT * FROM SongTable WHERE PlaylistName='exercise music list';

-- DELETE FROM PLAYLISTTABLE; 
DELETE FROM SongTable WHERE SongID = 8; 


-- DROP TABLE SongTable;
-- DROP TABLE PlaylistTable;
-- DROP TABLE UserTable;

DROP SEQUENCE songid_seq;
DROP SEQUENCE songlistid_seq;


-- CREATE TABLE UserPlaylistTable (
--   UserName VARCHAR2(100) NOt NULL,
--   PlaylistName VARCHAR2(100) NOT NULL
-- );

-- CREATE TABLE SongPlaylistTable (
--   SongName VARCHAR2(100) NOt NULL,
--   PlaylistName VARCHAR2(100) NOT NULL
-- );



INSERT INTO PLAYLISTTABLE(PLAYLISTID, PLAYLISTNAME, PLAYLISTDESCRIPIONS, USERNAME)
VALUES(
SONGLISTID_SEQ.NEXTVAL,
'RE Aoharu',
'exciting blueArchieve music',
'KO NAKYEON'
);

INSERT INTO PLAYLISTTABLE(PLAYLISTID, PLAYLISTNAME, PLAYLISTDESCRIPIONS, USERNAME)
VALUES(
SONGLISTID_SEQ.NEXTVAL,
'운동용',
'exciting blueArchieve music',
'KO NAKYEON'
);



INSERT INTO SONGTABLE (SONGID, SONGNAME, ARTISTNAME, SONGURL, PLAYLISTNAME, UPDATEDDATE)
VALUES(
SONGID_SEQ.NEXTVAL,
'축복',
'요아소비',
'HTTPS://WWW.YOUTUBE.COM/WATCH?V=LGQ0ODRIEAO',
'운동용',
CURRENT_TIMESTAMP
);