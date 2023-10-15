# 음악 스트리밍 웹사이트 제작 절차

1. 구축 목적을 정의한다.
2. DB, 웹사이트 구축에 필요한 요구사항 명세서를 적는다.
3. 요구사항 명세서를 기반으로, DB 개념적 설계를 한다.
+   Entity-Relation 다이아그램을 나타낸다
4. DBMS 제품을 이용하여 구축한다.


## 음원 저장 웹사이트 명세서 작성

### 소개

제목 : 음악 스트리밍 서비스 DB
사용자와 사용자의 음악 재생목록에 관한 정보를 보관하는 서비스 기능을 고려

### 기능

유튜브 url을 입력하면 자신이 원하는 음악 목록을 저장 할 수 있다.
pc, 모바일, 등 웹사이트 접속이 가능한 기종이라면 서비스를 이용가능하다.
한 컴퓨터에 저장된 음악은 다른 기기에서 보기 힘들다는 단점을 극복하고,
언제 어디에서든지 음악을 저장 가능하다.

유저 이름과 비밀번호를 입력하고
유튜브 url 주소를 입력하면 해당 영상을 mp3 형식으로 컴퓨터에 저장이 된다.
영상 제작자와 엘범 카드도 저장이 된다.

저장된 음악이 웹사이트 상에 리스트 형태로 출력이 된다.
해당 리스트를 제거하거나 추가하는 것도 가능하다.





# 메모
---
## 들어가야 될 코드

select
update
insert

```sql
CREATE TABLE UserTable (
  UserName VARCHAR2(100) NOt NULL,
  Password VARCHAR2(100) NOt NULL
);

CREATE TABLE PlaylistTable (
  PlaylistID NUMBER NOT NULL,
  PlaylistName VARCHAR2(100) NOT NULL,
  RelatedTopic VARCHAR2(100),
  PlaylistDescripions VARCHAR2(200),
  UserName VARCHAR2(100) NOT NULL,
  SavedDate DATE,
  isMostLikePlaylist BOOLEAN
);

CREATE TABLE SongTable (
  SongID NUMBER NOt NULL,
  SongName VARCHAR2(100) NOt NULL,
  ArtistName VARCHAR2(100),
  SongURL VARCHAR2(200),
  PlaylistName VARCHAR2(100) NOt NULL,
  ReleaseDate DATE
);

CREATE TABLE UserPlaylistTable (
  UserID NUMBER,
  PlaylistID NUMBER
);

CREATE TABLE SongPlaylistTable (
  SongID NUMBER,
  PlaylistID NUMBER
);

CREATE SEQUENCE songid_seq;
CREATE SEQUENCE songlistid_seq;

INSERT SongTable(songid_seq, SongName, ArtistName, SongURL, PlaylistName, ReleaseDate)
VALUES(
    songid_seq.NEXTVAL,
    "RE Aoharu",
    "MO2",
    "https://www.youtube.com/watch?v=lgq0OdRIEao",
    "blueArchieve_music_list",
    CURRENT_TIMESTAMP
)

```

<게임 음악 목록 웹사이트>

-   재생 목록
    재생목록1
    재생목록2
    재생목록3

1. 앨범 아트 이름 만들어진 날짜
2. 앨범 아트 이름
3. 앨범 아트 이름
4. 앨범 아트 이름

5. 이름
6. 이름
7. 이름
8. 이름

제거
버튼을 눌러서 제거와 업데이트 가능
앨범 아트도 저장됨

음악 목록 테이블
음악명, 아티스트명, 저장된 날짜, 관련 주제, 게임사

전체 음악 목록

0. 사용자 테이블
   사용자명: 고낙연
   비밀번호: 2018
   저장된 재생목록 0,2, 3, 4, 5

1. 전체 재생 목록
   음악명, 아티스트명, 목록에 저장된 날짜, 관련 주제, 게임사 및 제작사, 사용자명

2. 잘 때 듣는 음악 목록
   음악명, 아티스트명, 목록에 저장된 날짜, 관련 주제, 게임사 및 제작사, 사용자명

3. 공부 할 떄 듣는 음악 목록
   음악명, 아티스트명, 목록에 저장된 날짜, 관련 주제, 게임사 및 제작사, 사용자명

4. mihoyo게임사 음악 목록
   음악명, 아티스트명, 목록에 저장된 날짜, 관련 주제, 게임사 및 제작사, 사용자명

5. blue archieve 게임 음악 목록
   음악명, 아티스트명, 목록에 저장된 날짜, 관련 주제, 게임사 및 제작사, 사용자명

6. 운동 할 때 듣는 음악 목록
   음악명, 아티스트명, 목록에 저장된 날짜, 관련 주제, 게임사 및 제작사, 사용자명

7. 팟캐스트 및 라디오 등 저장 목록
   음악명, 아티스트명, 목록에 저장된 날짜, 관련 주제, 게임사 및 제작사, 사용자명
