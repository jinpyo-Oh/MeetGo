SET DEFINE OFF;
drop table "WISH-LIST" cascade constraints purge;
drop table "GOSU-IMG" cascade constraints purge;
drop table "GOSU-SERVICE" cascade constraints purge;
drop table SERVICE_CATEGORY_SMALL cascade constraints purge;
drop table SERVICE_CATEGORY_BIG cascade constraints purge;
drop table GOSU_LIKE cascade constraints purge;
drop table POFOL cascade constraints purge;
drop table CHAT_IMAGE cascade constraints purge;
drop table ESTIMATE cascade constraints purge;
drop table CHAT cascade constraints purge;
drop table CHATROOM cascade constraints purge;
drop table REVIEW_IMG cascade constraints purge;
drop table REVIEW cascade constraints purge;
drop table GOSU cascade constraints purge;
drop table BOARD_FILE cascade constraints purge;
drop table REPLY cascade constraints purge;
drop table BOARD cascade constraints purge;
drop table MEMBER cascade constraints purge;
drop table EMAIL_AUTHENTICATION cascade constraints purge;

drop sequence SEQ_MEMBER_NO;
drop sequence SEQ_GOSU_IMG;
drop sequence SEQ_SERVICE_BIG;
drop sequence SEQ_SERVICE_SMALL;
drop sequence SEQ_POFOL_NO;
drop sequence SEQ_CHATROOM_NO;
drop sequence SEQ_CHAT_NO;
drop sequence SEQ_CHAT_IMAGE_NO;
drop sequence SEQ_ESTIMATE_NO;
drop sequence SEQ_REV_NO;
drop sequence SEQ_REV_IMG_NO;
drop sequence SEQ_BOARD_NO;
drop sequence SEQ_BOARD_FILE_NO;
drop sequence SEQ_REPLY_NO;
drop sequence SEQ_EMAIL_NO;

-- 회원 테이블

CREATE TABLE MEMBER
(
    USER_NO          NUMBER PRIMARY KEY,                                                                   -- 유저 번호
    USER_NAME        VARCHAR2(30)                                           NOT NULL,                      -- 이름
    USER_ID          VARCHAR2(30) UNIQUE                                    NOT NULL,                      -- 아이디
    USER_PWD         VARCHAR2(1000)                                         NOT NULL,                      -- 비밀번호
    USER_NICKNAME    VARCHAR2(30) UNIQUE                                    NOT NULL,                      -- 닉네임
    USER_GENDER      CHAR(1) CHECK ( USER_GENDER IN ('M', 'F') )            NOT NULL,                      -- 성별 (M:남, F:여)
    USER_EMAIL       VARCHAR2(30) UNIQUE                                    NOT NULL,                      -- 이메일 (인증 필요)
    USER_PHONE       VARCHAR2(20)                                           NOT NULL,                      -- 번호
    USER_PROFILE     VARCHAR2(1000) default 'https://heurm-tutorial.vlpt.us/images/default_thumbnail.png', -- 프로필 이미지
    ADDRESS          VARCHAR2(100)                                          NULL,                          -- 주소
    CREATE_DATE      DATE           DEFAULT SYSDATE,                                                       -- 생성일자
    LAST_ACCESS_DATE DATE           DEFAULT SYSDATE,                                                       -- 최근 접속일
    USER_STATUS      NUMBER         default 1 CHECK (USER_STATUS IN (1, 2 )) NULL,                          -- 1: 일반사용자,  2: 고수,  3: ADMIN
    ENROLL_STATUS    NUMBER         default 1 CHECK (ENROLL_STATUS IN (1, 2, 3, 4, 5) )                       -- 1: 일반사용자(고수등록),  2: 고수(고수 비활성화),  3: 고수 비활성화(고수 활성화) 4: 회원 탈퇴(회원 비활성화) 5: 관리자
);
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;
INSERT INTO MEETGO.MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE, USER_PROFILE, ADDRESS, CREATE_DATE, LAST_ACCESS_DATE, USER_STATUS, ENROLL_STATUS) VALUES (-1, 'admin', 'admin', '$2a$10$NeWRZi7TdCDp6qKGOWNW/OfFyRNDus/gJ1ti5lgWLD911nu0IWNzy', 'admin', 'M', 'admin@meetgo.com', '123132132', 'https://heurm-tutorial.vlpt.us/images/default_thumbnail.png', '서울 강동구 암사11길 5 123', TIMESTAMP '2023-12-20 02:52:57', TIMESTAMP '2023-12-20 02:52:57', 1, 5);

CREATE TABLE REPORT
(
    REPORT_NO       NUMBER PRIMARY KEY,                          -- 신고 번호
    REPORTED_USER   NUMBER        NOT NULL,                      -- 신고 받은 사람 번호
    REPORT_CATEGORY VARCHAR2(200) NOT NULL,                      -- 신고 카테고리
    REPORT_CONTENT  VARCHAR2(500) NULL,                      -- 신고 내용
    REPORT_STATUS   NUMBER CHECK ( REPORT_STATUS IN (0, 1, 2) ), -- 신고 상태 0:미확인, 1:처리대기, 2:처리완료
    REPORT_USER     NUMBER,                                      -- 신고자 번호
    FOREIGN KEY (REPORT_USER) REFERENCES MEMBER (USER_NO)
);
CREATE SEQUENCE SEQ_REPORT_NO NOCACHE;

-- 고수 테이블
CREATE TABLE GOSU
(
    "GOSU_NO"         NUMBER PRIMARY KEY,                            -- 고수 번호
    "INTRODUCTION"    VARCHAR2(2000)  NOT NULL,                       -- 소개
    "EMPLOYEES"       NUMBER         NOT NULL,                       -- 직원 수
    "BUSINESS_STATUS" NUMBER CHECK ( BUSINESS_STATUS IN (1, 2, 3) ), -- 일반, 개인, 법인
    "EDUCATION"       VARCHAR2(100)  NOT NULL,                       -- 학력
    "CAREER"          VARCHAR2(1000) NOT NULL,                       -- 경력
    "ELABORATE"       VARCHAR2(2000)  NOT NULL,                       -- 서비스 상세 설명
    "REGION"          VARCHAR2(100)  NOT NULL,                       -- 지역
    "MOVE_DISTANCE"   VARCHAR2(150)  NULL,                           -- 이동 가능 거리
    "AVAILABLE_TIME"  VARCHAR2(200)  NULL,                           -- 이용 가능 시간
    "USER_NO"         NUMBER         NOT NULL,
    FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO)
);


-- 고수 좋아요 테이블
CREATE TABLE "GOSU_LIKE"
(
    "GOSU_NO" NUMBER NOT NULL, -- 포폴 번호
    "USER_NO" NUMBER NOT NULL, -- 사용자 번호
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO),
    FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO)
);

-- 고수 소개 이미지
CREATE TABLE "GOSU-IMG"
(
    "GOSU_IMG_NO"  NUMBER PRIMARY KEY,                -- 고수 이미지 번호
    "GOSU_IMG_URL" VARCHAR2(500) NOT NULL,            -- URL
    "STATUS"       NUMBER CHECK ( STATUS IN (1, 2) ), -- 1 : 정상, 2 : 삭제
    "GOSU_NO"      NUMBER        NOT NULL,            -- 고수 번호
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO)
);
CREATE SEQUENCE SEQ_GOSU_IMG NOCACHE;

-- 서비스 카테고리 대분류 테이블
CREATE TABLE "SERVICE_CATEGORY_BIG"
(
    "CATEGORY_BIG_NO"   NUMBER PRIMARY KEY,   -- 대분류 번호
    "CATEGORY_BIG_NAME" VARCHAR2(50) NOT NULL -- 대분류 이름
);
CREATE SEQUENCE SEQ_SERVICE_BIG NOCACHE;
INSERT INTO SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO, CATEGORY_BIG_NAME)
VALUES (0, '전체');
INSERT INTO SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO, CATEGORY_BIG_NAME)
VALUES (1, '홈/리빙');
INSERT INTO SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO, CATEGORY_BIG_NAME)
VALUES (2, '취미/교육');
INSERT INTO SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO, CATEGORY_BIG_NAME)
VALUES (3, '건강/미용');
INSERT INTO SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO, CATEGORY_BIG_NAME)
VALUES (4, '디자인');
INSERT INTO SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO, CATEGORY_BIG_NAME)
VALUES (5, '이벤트');
INSERT INTO SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO, CATEGORY_BIG_NAME)
VALUES (6, 'IT/개발');
INSERT INTO SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO, CATEGORY_BIG_NAME)
VALUES (7, '비즈니스');
INSERT INTO SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO, CATEGORY_BIG_NAME)
VALUES (8, '법률/행정');
INSERT INTO SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO, CATEGORY_BIG_NAME)
VALUES (9, '기타');


-- 서비스 카테고리 소분류 테이블
CREATE TABLE "SERVICE_CATEGORY_SMALL"
(
    "CATEGORY_SMALL_NO"   NUMBER PRIMARY KEY,    -- 소분류 번호
    "CATEGORY_SMALL_NAME" VARCHAR2(50) NULL,     -- 소분류 이름
    "CATEGORY_BIG_NO"     NUMBER       NOT NULL, -- 대분류 번호
    FOREIGN KEY (CATEGORY_BIG_NO) REFERENCES SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO)
);
CREATE SEQUENCE SEQ_SERVICE_SMALL NOCACHE;
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (101, '청소', 1);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (102, '인테리어', 1);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (103, '이사', 1);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (104, '수리', 1);

INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (201, '음악', 2);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (202, '요리', 2);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (203, '외국어', 2);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (204, '미술', 2);

INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (301, '메이크업', 3);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (302, '헤어', 3);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (303, '피부 관리', 3);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (304, '헬스', 3);

INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (401, '영상 편집', 4);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (402, '사진 편집', 4);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (403, '일러스트/공예', 4);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (404, '3D/애니메이션', 4);

INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (501, '사진촬영', 5);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (502, '기획/장식', 5);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (503, '공연', 5);

INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (601, '웹 개발', 6);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (602, '소프트웨어 개발', 6);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (603, '앱 개발', 6);

INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (701, '마케팅', 7);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (702, '통역/변역', 7);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (703, '컨설팅', 7);

INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (801, '세무/회계', 8);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (802, '법무', 8);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (803, '노무', 8);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (804, '법률', 8);

INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (901, '알바', 9);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (902, 'PPT 제작', 9);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (903, '반려동물', 9);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (904, '대여/대관', 9);


-- 고수-서비스 연관 테이블
CREATE TABLE "GOSU-SERVICE"
(
    "GOSU_NO"           NUMBER NOT NULL, -- 고수 번호
    "CATEGORY_SMALL_NO" NUMBER NOT NULL, -- 카테고리 번호
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO),
    FOREIGN KEY (CATEGORY_SMALL_NO) REFERENCES SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO)
);

-- 포트폴리오 테이블
CREATE TABLE "POFOL"
(
    "POFOL_NO"          NUMBER PRIMARY KEY,                               -- 포폴 번호
    "POFOL_SERVICE"     NUMBER         NOT NULL,                          -- 포폴 서비스
    "POFOL_TITLE"       VARCHAR2(100)  NOT NULL,                          -- 포폴 제목
    "POFOL_INTRO"       VARCHAR2(1000) NOT NULL,                          -- 포폴 소개
    "POFOL_PRICE"       VARCHAR2(100)  NOT NULL,                          -- 가격
    "POFOL_CONTENT"     VARCHAR2(2000) NOT NULL,                          -- 포폴 내용
    "POFOL_VISITED"     NUMBER DEFAULT 0,                                 -- 포폴 조회수
    "POFOL_CREATE_DATE" DATE   DEFAULT SYSDATE,                           -- 포폴 작성일
    "POFOL_STATUS"      NUMBER DEFAULT 1 CHECK (POFOL_STATUS IN (1, 2) ), -- 1 : 정상 2 : 삭제
    "GOSU_NO"           NUMBER         NOT NULL,                          -- 고수 번호
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO)
);
CREATE SEQUENCE SEQ_POFOL_NO NOCACHE;

-- 포트폴리오 이미지 테이블
CREATE TABLE "POFOL_IMG"
(
    "POFOL_IMG_NO"  NUMBER PRIMARY KEY,     -- 포폴 이미지 번호
    "POFOL_IMG_URL" VARCHAR2(500) NOT NULL, -- 포폴 URL 주소
    "POFOL_NO"      NUMBER        NOT NULL, -- 포폴 번호
    FOREIGN KEY (POFOL_NO) REFERENCES POFOL (POFOL_NO)
);
CREATE SEQUENCE SEQ_POFOL_IMG_NO NOCACHE;


-- 채팅방 리스트 테이블
CREATE TABLE "CHATROOM"
(
    "CHATROOM_NO"     NUMBER PRIMARY KEY,                           -- 채팅방 번호
    "CREATE_AT"       DATE DEFAULT SYSDATE,                         -- 생성일
    "USER_NO"         NUMBER NOT NULL,                              -- 사용자 번호
    "GOSU_NO"         NUMBER NOT NULL,                              -- 고수 번호
    "CHATROOM_STATUS" NUMBER CHECK ( CHATROOM_STATUS IN (1, 2, 3) ) -- 1:활성 2:종료, 3:정지
);
CREATE SEQUENCE SEQ_CHATROOM_NO NOCACHE;


-- 1대1 채팅 테이블
CREATE TABLE "CHAT"
(
    "CHAT_NO"     NUMBER PRIMARY KEY,                        -- 1대1 채팅 번호
    "CONTENT"     VARCHAR2(1000) NOT NULL,                   -- 내용
    "SENDER"      NUMBER         NOT NULL,                   -- 발신자
    "CHAT_READ"        NUMBER CHECK ( CHAT_READ IN (0, 1) ),           -- 수신 여부
    "TYPE"        CHAR(1) CHECK ( TYPE IN ('P', 'M', 'E') ), -- P:사진 , M:메세지, E:견적서
    "CREATE_AT"   DATE DEFAULT SYSDATE,                      -- 작성시간
    "CHATROOM_NO" NUMBER         NOT NULL,                   -- 채팅방 번호
    FOREIGN KEY (CHATROOM_NO) REFERENCES CHATROOM (CHATROOM_NO)
);
CREATE SEQUENCE SEQ_CHAT_NO NOCACHE;

-- 견적서 테이블
CREATE TABLE ESTIMATE
(
    "EST_NO"            NUMBER PRIMARY KEY,                                       -- 견적서 번호
    "EST_TITLE"         VARCHAR2(90)   NOT NULL,                                  -- 견적서 제목
    "EST_CONTENT"       VARCHAR2(1500) NOT NULL,                                  -- 견적서 내용
    "EST_ADDRESS"       VARCHAR2(300)  NOT NULL,                                  -- 견적서 주소
    "EST_SERVICE"       VARCHAR2(100)  NOT NULL,                                  -- 서비스 종류
    "START_DATE"        DATE           NOT NULL,                                  -- 서비스 시작일
    "END_DATE"          VARCHAR2(200) DEFAULT SYSDATE,                            -- 서비스 종료일 ex) 계약일로부터 x일
    "CONFIRMATION_DATE" DATE           NULL,                                      -- 결제일
    "EST_PRICE"         VARCHAR2(200)  NOT NULL,                                  -- 견적 가격
    "STATUS"            VARCHAR2(1) CHECK ( STATUS IN ('1', '2', '3', '4', '5')), -- 1:취소, 2:대기, 3:확정(결제 대기), 4:결제 완료, 5:완료
    "TID"               VARCHAR2(30)   NULL,                                      -- 결제 고유 번호
    "GOSU_NO"           NUMBER         NOT NULL,                                  -- 고수 번호
    "USER_NO"           NUMBER         NOT NULL,                                  -- 사용자 번호
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO),
    FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO)
);
CREATE SEQUENCE SEQ_ESTIMATE_NO NOCACHE;

-- 리뷰 테이블
CREATE TABLE "REVIEW"
(
    "REV_NO"      NUMBER PRIMARY KEY,                         -- 리뷰 번호
    "REV_CONTENT" VARCHAR2(2000) NOT NULL,                     -- 리뷰 내용
    "REV_POINT"   NUMBER        NOT NULL,                     -- 별점
    "REV_DATE"    DATE DEFAULT SYSDATE,                       -- 작성일
    "REV_STATUS"  VARCHAR2(1) CHECK ( REV_STATUS IN (1, 2) ), -- 1: 정상 2:비활성화(삭제)
    "EST_NO"      NUMBER        NOT NULL,                     -- 견적서 번호
    "USER_NO"     NUMBER        NOT NULL,                     -- 사용자 번호
    "GOSU_NO"     NUMBER        NOT NULL,                     -- 고수 번호
    FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO),
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO)
);
CREATE SEQUENCE SEQ_REV_NO NOCACHE;

-- 리뷰 이미지 테이블
CREATE TABLE "REVIEW_IMG"
(
    "IMG_NO"      NUMBER PRIMARY KEY,     -- 리뷰 이미지 번호
    "REV_IMG_URL" VARCHAR2(300) NOT NULL, -- 리뷰 이미지 URL
    "REV_NO"      NUMBER        NOT NULL, -- 리뷰 번호
    FOREIGN KEY (REV_NO) REFERENCES REVIEW (REV_NO)
);
CREATE SEQUENCE SEQ_REV_IMG_NO NOCACHE;


-- 게시판 테이블
CREATE TABLE "BOARD"
(
    "BOARD_NO"          NUMBER PRIMARY KEY,                                         -- 게시글 번호
    "BOARD_TITLE"       VARCHAR2(100)  NOT NULL,                                    -- 제목
    "BOARD_CONTENT"     VARCHAR2(2000) NOT NULL,                                    -- 내용
    "BOARD_CREATE_DATE" DATE        DEFAULT SYSDATE,                                -- 생성일
    "BOARD_UPDATE_DATE" DATE        DEFAULT SYSDATE,                                -- 수정일
    "BOARD_COUNT"       NUMBER      DEFAULT 0,                                      -- 조회수
    "BOARD_TYPE"        VARCHAR2(1) CHECK ( BOARD_TYPE IN ('1', '2', '3') ),        -- 1:자유, 2:팁, 3:공지
    "BOARD_STATUS"      VARCHAR2(1) default 1 CHECK ( BOARD_STATUS IN ('1', '2') ), -- 1: 활성, 2: 비활성
    "USER_NO"           NUMBER         NOT NULL,                                    -- 사용자 번호
    FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO)
);
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;

-- 게시글 파일 테이블
CREATE TABLE "BOARD_FILE"
(
    "BFILE_NO"     NUMBER PRIMARY KEY,                           -- 게시글 파일 번호
    "BFILE_URL"    varchar2(1000) NOT NULL,                      -- 게시글 파일 URL
    "BFILE_STATUS" VARCHAR2(1) CHECK ( BFILE_STATUS IN (1, 2) ), -- 1:정상 2:비활성화(삭제)
    "BOARD_NO"     NUMBER         NOT NULL                       -- 게시글 번호
);
CREATE SEQUENCE SEQ_BOARD_FILE_NO NOCACHE;

-- 댓글 테이블
CREATE TABLE "REPLY"
(
    "REPLY_NO"      NUMBER PRIMARY KEY,                               -- 댓글 번호
    "REPLY_CONTENT" VARCHAR2(100)                           NULL,     -- 댓글 내용
    "REPLY_DATE"    DATE                                    NULL,     -- 작성일
    "REPLY_STATUS"  NUMBER CHECK ( REPLY_STATUS IN (1, 2) ) NULL,     -- 1:등록 , 2:삭제
    "BOARD_NO"      NUMBER                                  NOT NULL, -- 게시글 번호
    "USER_NO"       NUMBER                                  NOT NULL, -- 사용자 번호
    FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO),
    FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO)
);
CREATE SEQUENCE SEQ_REPLY_NO NOCACHE;

-- 이메일 인증 테이블
CREATE TABLE "EMAIL_AUTHENTICATION"
(
    "EMAIL_NO"    NUMBER PRIMARY KEY,                             -- 이메일 인증 번호
    "EMAIL"       VARCHAR2(100)                         NOT NULL, -- 이메일
    "TIME"        DATE DEFAULT SYSDATE,                           -- 인증시간 (등록시간으로 DEFAULT, 등록 시간으로부터 ~분 지난 상태라면 비활성화(만료))
    "AUTH_NUMBER" NUMBER                                NOT NULL, -- 인증번호
    "STATUS"      VARCHAR2(1) CHECK ( STATUS IN (1, 2)) NOT NULL  -- 1:활성 2:만료
);
CREATE SEQUENCE SEQ_EMAIL_NO NOCACHE;

INSERT INTO MEETGO.MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE, USER_PROFILE, ADDRESS, CREATE_DATE, LAST_ACCESS_DATE, USER_STATUS, ENROLL_STATUS) VALUES (100001, '아이유', 'mem02', '$2a$10$NeWRZi7TdCDp6qKGOWNW/OfFyRNDus/gJ1ti5lgWLD911nu0IWNzy', '아이유', 'F', 'user02@meetgo.com', '1035483930', 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/chat/c1a6add6-05d2-46c1-bc95-44214dbec3beWYIxPKdUjBauftY4bXqEhaWJ0_5Jjj4dH7e0eiyusZX0em1PR45gGQLIIOU7QJ8dtonVPSIlegFlHngTE4C-xPtt744teMSTthpW06ckrX_4EtrXGnbz1OKniYqES6cY0dMTOgwAJxN2xYqbWsrSMA.webp', '서울 강동구 암사11길 5 12', TIMESTAMP '2023-12-20 00:41:00', TIMESTAMP '2023-12-20 00:41:00', 1, 2);
INSERT INTO MEETGO.MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE, USER_PROFILE, ADDRESS, CREATE_DATE, LAST_ACCESS_DATE, USER_STATUS, ENROLL_STATUS) VALUES (100000, '윤아', 'mem01', '$2a$10$NeWRZi7TdCDp6qKGOWNW/OfFyRNDus/gJ1ti5lgWLD911nu0IWNzy', '윤아', 'F', 'user01@meetgo.com', '1035483929', 'https://i.namu.wiki/i/y2lujrSoDEWEszUujZTMXj4XN5XjbG6Wss4HVaKjyvjswNxPvsRIhoo90SmpOQRCFeXJekSX4bHF8OyNPM4vRb27c3emB3AW487e5_wVCK8yjJ8Zv3UYCtFk5mwoBlffslEIIGmmkEWZ-zBa3qGeiA.webp', '서울 강동구 암사11길 5 11', TIMESTAMP '2023-12-20 00:41:00', TIMESTAMP '2023-12-20 00:41:00', 1, 2);
INSERT INTO MEETGO.MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE, USER_PROFILE, ADDRESS, CREATE_DATE, LAST_ACCESS_DATE, USER_STATUS, ENROLL_STATUS) VALUES (100002, '수지', 'mem03', '$2a$10$NeWRZi7TdCDp6qKGOWNW/OfFyRNDus/gJ1ti5lgWLD911nu0IWNzy', '수지', 'F', 'user03@mee1o.com', '1035483931', 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/chat/eba6c97f-d912-4c0d-9b43-9232c7e29671PicsArt_04-06-07.01.16.png', '서울 강동구 암사11길 5 13', TIMESTAMP '2023-12-20 00:41:00', TIMESTAMP '2023-12-20 00:41:00', 1, 2);
INSERT INTO MEETGO.GOSU (GOSU_NO, INTRODUCTION, EMPLOYEES, BUSINESS_STATUS, EDUCATION, CAREER, ELABORATE, REGION, MOVE_DISTANCE, AVAILABLE_TIME, USER_NO) VALUES (100000, '4회 수업으로 고음과 저음의 소리를 내게 해드립니다. (연습실 있음) 쉰목소리,고음 개선을 해부학, 음향학 음성 치료 기반으로 진행합니다.', 1, 2, '대구사이버대학교', '4년차', '✔️ 레슨은 주1회, 월4회 1시간 기준이며, 장소는 홍대입니다.
✔️ 원활한 수업 진행을 위해 정원제로 진행합니다.
(2023년 2월 기준 1자리 가능)
✔️ 최소 4회 수업 안에 저음과 고음역의 소리는 내실 수 있게 만들어드립니다.
✔️ 음성학과 음향학을 토대로 기본적인 이론들에 대한 설명으로 진행합니다.(추상적인 설명의 레슨이 아닙니다.)
✔️ 센터의 연습실은 추가 비용 없이 24시간 이용 가능합니다.', '서울 중구', '협의 가능', '09 ~ 18', 100000);
INSERT INTO MEETGO.GOSU (GOSU_NO, INTRODUCTION, EMPLOYEES, BUSINESS_STATUS, EDUCATION, CAREER, ELABORATE, REGION, MOVE_DISTANCE, AVAILABLE_TIME, USER_NO) VALUES (100001, '4회 수업으로 고음과 저음의 소리를 내게 해드립니다. (연습실 있음) 쉰목소리,고음 개선을 해부학, 음향학 음성 치료 기반으로 진행합니다.', 1, 2, '대구사이버대학교', '4년차', '✔️ 레슨은 주1회, 월4회 1시간 기준이며, 장소는 홍대입니다.
✔️ 원활한 수업 진행을 위해 정원제로 진행합니다.
(2023년 2월 기준 1자리 가능)
✔️ 최소 4회 수업 안에 저음과 고음역의 소리는 내실 수 있게 만들어드립니다.
✔️ 음성학과 음향학을 토대로 기본적인 이론들에 대한 설명으로 진행합니다.(추상적인 설명의 레슨이 아닙니다.)
✔️ 센터의 연습실은 추가 비용 없이 24시간 이용 가능합니다.', '서울 중구', '협의 가능', '09 ~ 18', 100001);
INSERT INTO MEETGO.GOSU (GOSU_NO, INTRODUCTION, EMPLOYEES, BUSINESS_STATUS, EDUCATION, CAREER, ELABORATE, REGION, MOVE_DISTANCE, AVAILABLE_TIME, USER_NO) VALUES (100002, '4회 수업으로 고음과 저음의 소리를 내게 해드립니다. (연습실 있음) 쉰목소리,고음 개선을 해부학, 음향학 음성 치료 기반으로 진행합니다.', 1, 2, '대구사이버대학교', '4년차', '✔️ 레슨은 주1회, 월4회 1시간 기준이며, 장소는 홍대입니다.
✔️ 원활한 수업 진행을 위해 정원제로 진행합니다.
(2023년 2월 기준 1자리 가능)
✔️ 최소 4회 수업 안에 저음과 고음역의 소리는 내실 수 있게 만들어드립니다.
✔️ 음성학과 음향학을 토대로 기본적인 이론들에 대한 설명으로 진행합니다.(추상적인 설명의 레슨이 아닙니다.)
✔️ 센터의 연습실은 추가 비용 없이 24시간 이용 가능합니다.', '서울 중구', '협의 가능', '9 ~ 18', 100002);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (100000, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/02f6f5d2-fcbb-4039-a8fb-2a1ea073c2a6%EC%9D%B4%EB%8B%88%EC%8A%A4%ED%94%84%EB%A6%AC%20%ED%99%94%EB%B3%B4.%20%EC%9C%A4%EC%95%84.%20E%28YUE4045%29%20%281%29_shop1_145934.png', 1, 100000);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (100001, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/757e443c-e89f-48e0-a96b-248f5a590237832822012882.jpg', 1, 100000);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (100002, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/7776e16b-fc0a-4e28-a035-d99cdf1340f0EC9DB4EB8B88EC8AA4ED9484EBA6AC20ED9994EBB3B4.20EC9CA4EC9584.20E28YUE4045292028229.png', 1, 100000);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (100003, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/60d5ca77-3609-4d36-b612-9fea05219bebJvayifmIQMTK3tMN-EwJteH3DwgErjuxdfCH3KFlAFQLaAu5phRW9hogHg82u3dz-w5vu-r6NOCBOjVJ8OLISZirvtaehw-IzlMd8zbXmKf1SdEY9CmCK9niM_bZw7n-HbI9YYXWNrE4NBGzwA5z-Q.webp', 1, 100001);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (100004, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/0b6a84d1-65ae-40b5-ba3c-7791d68f39baVZmeEJZ5d-hbjb3w9fh3uq0fJSNGuqB1h5308djiBTbWCgbQmOqaRqcHs6I_AfrA0sAFkHEJ3yI6T4EsTWsuRQ5rytmfBe2nXwasqyGHZ_POm8ADRtmg6RRzujpgxxQXyWKqjuO9rsdV8SDF7yBYkg.webp', 1, 100001);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (100005, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/551b1aab-89b8-405f-a5ac-89ff1406c0f42qu-5DPgJlXNYukoniDcvO3ngM0a0zrHIvb2ftAPlrY8AopOyD-d7x76bFCJ9mrtmgRCkJLk1WauT3irLYvmP4dzbvebD2PejkJBavmTGKvLr6TFk2ePrBXFxRuPdoG_lNV4HSRoMDQx7aS110rJ3w.webp', 1, 100001);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (100006, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/1b03dccc-0b48-418d-9314-d5490d65524b14749984_976131_4321_org.webp', 1, 100001);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (100007, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/6651c8e3-255f-441c-896d-f47cce69c828dae6a4ac9078292b803bcba03699ee98.jpg', 1, 100002);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (100008, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/00043ce7-0a8b-4934-ae59-7f1dc6068c57f08G1BMdsnYbZcq0qq4Mm024ZoGVn0vEVzApKKN29RjcJScZKHQgpqhnMmb1fpwuubWZ1yVymgwO2cQCOjas7nHKpQ6LUAMojl3AaJqYLcTb8R6A6qMJRhz5jMtNNKJa-ylOesj7Xo5imcmpVhahTQ.webp', 1, 100002);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (100009, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/a297bcc5-9c8f-4784-9f2c-be841c851ebeziEunGC4L8w078EVB83X0rS-TbBno3cuqyW8pkOhH_XTJkb3rXwX4sUgapoI2tZnv3mQQpRoPLJ5sTJaL0AAnseVYMZWYi8DHivbYNeCIJ-7JvnONETMBL3ZQ9_0eKr-T4QgtUPcVUzY_m8lv5Z_CA.webp', 1, 100002);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (100000, 201);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (100001, 201);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (100002, 201);
INSERT INTO MEETGO.POFOL (POFOL_NO, POFOL_SERVICE, POFOL_TITLE, POFOL_INTRO, POFOL_PRICE, POFOL_CONTENT, POFOL_VISITED, POFOL_CREATE_DATE, POFOL_STATUS, GOSU_NO) VALUES (100000, 201, ' 한달안에 바뀌는 프리미엄 보컬레슨', '♡대표제자들
레이디스코드.
에디킴.
한희준(아메리칸아이돌top9진출)
김명기(k pop 스타)
슈퍼스타K ㅡ top11.등등....
다수의 제자들 가수데뷔 및 싱글앨범발매.
뮤지컬배우, 보컬트레이너, 대학교수로 활동중.', '협의 후 결정', '진짜 숨은 보석들 ..반짝반짝 빛나는 다이아몬드로 만들어주겠어요.
보컬트레이너가 레슨받으러오는 보컬트레이너에게 레슨받으세요^^
대학가려면 나에게오라~!!', 13, TIMESTAMP '2023-12-20 01:08:00', 1, 100000);
INSERT INTO MEETGO.POFOL (POFOL_NO, POFOL_SERVICE, POFOL_TITLE, POFOL_INTRO, POFOL_PRICE, POFOL_CONTENT, POFOL_VISITED, POFOL_CREATE_DATE, POFOL_STATUS, GOSU_NO) VALUES (100001, 201, ' 한달안에 바뀌는 프리미엄 보컬레슨', '♡대표제자들
레이디스코드.
에디킴.
한희준(아메리칸아이돌top9진출)
김명기(k pop 스타)
슈퍼스타K ㅡ top11.등등....
다수의 제자들 가수데뷔 및 싱글앨범발매.
뮤지컬배우, 보컬트레이너, 대학교수로 활동중.', '협의 후 결정', '진짜 숨은 보석들 ..반짝반짝 빛나는 다이아몬드로 만들어주겠어요.
보컬트레이너가 레슨받으러오는 보컬트레이너에게 레슨받으세요^^
대학가려면 나에게오라~!!', 29, TIMESTAMP '2023-12-20 01:08:00', 1, 100001);
INSERT INTO MEETGO.POFOL (POFOL_NO, POFOL_SERVICE, POFOL_TITLE, POFOL_INTRO, POFOL_PRICE, POFOL_CONTENT, POFOL_VISITED, POFOL_CREATE_DATE, POFOL_STATUS, GOSU_NO) VALUES (100002, 201, ' 한달안에 바뀌는 프리미엄 보컬레슨', '♡대표제자들
레이디스코드.
에디킴.
한희준(아메리칸아이돌top9진출)
김명기(k pop 스타)
슈퍼스타K ㅡ top11.등등....
다수의 제자들 가수데뷔 및 싱글앨범발매.
뮤지컬배우, 보컬트레이너, 대학교수로 활동중.', '협의 후 결정', '진짜 숨은 보석들 ..반짝반짝 빛나는 다이아몬드로 만들어주겠어요.
보컬트레이너가 레슨받으러오는 보컬트레이너에게 레슨받으세요^^
대학가려면 나에게오라~!!', 15, TIMESTAMP '2023-12-20 01:08:00', 1, 100002);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (100000, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/pofolImg/73880cef-7480-4de5-8387-b888eebde1d1image_readtop_2020_1184994_16057513814436291.jpg', 100000);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (100001, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/pofolImg/9b397322-4803-4bc8-a389-651f1d72d72fimage__2020_1184994_16057513814436295.jpg', 100000);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (100002, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/pofolImg/c418c61c-81a4-4191-8c73-04249714f21c1659669091158897.jpg', 100000);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (100003, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/pofolImg/5896f9a5-a819-4cc3-9bee-0e9b56e4b35dimage_readbot_2020_1184994_16057513814436293.jpg', 100000);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (100004, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/1b03dccc-0b48-418d-9314-d5490d65524b14749984_976131_4321_org.webp', 100001);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (100005, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/34da0efc-402e-42f5-aff2-46133fd6f086DdoJhVFV0AA3wnL.jpg', 100001);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (100006, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/c44166b7-4395-4970-918e-faa1a06a7005LuE2JdQ5fMPQcY4-aAEzi7NBHAavoNO-DQt9kt1hdUs6zRvA1d_v_ZIOwRpQevQkNhxZT41JGiuPESOxdkyTit5Cq3pIl-DRjxfAP3A5mmAY2ocJc4U8hnya6K6GDnqpxnkhAqfV12SG3P6eq4b8kA.webp', 100001);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (100007, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/84c4c368-0b0e-49d5-8d0a-a610b42bbc73img_314633_1.jpg', 100002);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (100008, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/00043ce7-0a8b-4934-ae59-7f1dc6068c57f08G1BMdsnYbZcq0qq4Mm024ZoGVn0vEVzApKKN29RjcJScZKHQgpqhnMmb1fpwuubWZ1yVymgwO2cQCOjas7nHKpQ6LUAMojl3AaJqYLcTb8R6A6qMJRhz5jMtNNKJa-ylOesj7Xo5imcmpVhahTQ.webp', 100002);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (100009, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/a297bcc5-9c8f-4784-9f2c-be841c851ebeziEunGC4L8w078EVB83X0rS-TbBno3cuqyW8pkOhH_XTJkb3rXwX4sUgapoI2tZnv3mQQpRoPLJ5sTJaL0AAnseVYMZWYi8DHivbYNeCIJ-7JvnONETMBL3ZQ9_0eKr-T4QgtUPcVUzY_m8lv5Z_CA.webp', 100002);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (100010, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/9d8c6ebb-3d5a-4642-9745-f749b215fc9020171022183112870.jpg', 100002);
INSERT INTO MEETGO.BOARD (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, BOARD_CREATE_DATE, BOARD_UPDATE_DATE, BOARD_COUNT, BOARD_TYPE, BOARD_STATUS, USER_NO) VALUES (100000, '스키를 재밌고 즐겁게 배우는꿀팁', '1.부츠착용요령
-부츠양쪽으로 벌린후 발앞쪽부터 밀어넣은후 뒷꿈치를맟추면 발이 아프지 않아요
2. 스키복착용 요령
-스노우컷을 바깥쪽으로 착용해주세요
3.스키이동요령
-어깨에 걸치거나 세로로 잡고 이동
4.부츠착용시 이동요령
-부츠착용시 발목이 움직이지 않기 때문에 뒷꿈치로 뒤뚱뒤뚱 걸어야 넘어지지 않아요', TIMESTAMP '2023-12-20 02:24:28', TIMESTAMP '2023-12-20 02:24:28', 0, '2', '1', 100001);
INSERT INTO MEETGO.BOARD (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, BOARD_CREATE_DATE, BOARD_UPDATE_DATE, BOARD_COUNT, BOARD_TYPE, BOARD_STATUS, USER_NO) VALUES (100001, '좋은 보컬트레이너 찾는법', '감각을 말로 알려주려는 트레이너는 피하자. 모든 레슨은 녹화 또는 녹음을 요청하세요

단 한번이라도, 아니 이게 왜 안되지 라는 말을 하는 트레이너는 피해야 합니다.
어떤 감각이던 느낄 수 있도록 설계된 수많은 훈련들이 있습니다. 공부를 하지 않은 트레이너는 이 훈련을 소개해줄 수 없고, 감각만을 설명해줄 수 있습니다.', TIMESTAMP '2023-12-20 02:25:39', TIMESTAMP '2023-12-20 02:25:39', 0, '2', '1', 100001);
INSERT INTO MEETGO.BOARD (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, BOARD_CREATE_DATE, BOARD_UPDATE_DATE, BOARD_COUNT, BOARD_TYPE, BOARD_STATUS, USER_NO) VALUES (100002, '더 나은 삶을 위한 반려견 교육', '“반려견을 가르치려 하지 마라 “
“반려견을 반려견으로써 존중하라 “
“반려견을 우리로부터 자유로울 수 있는 권리를 줘라”
"반려견을 삶 안에 들어올 수 있게 하라"
반려견의 행동을 고치려는 방향보다는 [더 나은 삶]을 목표로 진행하는 것이 보다 효과적입니다.', TIMESTAMP '2023-12-20 02:26:19', TIMESTAMP '2023-12-20 02:26:19', 0, '2', '1', 100001);
INSERT INTO MEETGO.BOARD (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, BOARD_CREATE_DATE, BOARD_UPDATE_DATE, BOARD_COUNT, BOARD_TYPE, BOARD_STATUS, USER_NO) VALUES (100003, '웨딩 스냅사진 예쁘게 찍히는 시간별 꿀팁', '1. 예쁜 미소 장착!
2. 엉덩이는 의자 끝까지 밀기!
3. 턱은 살짝 당겨주기!
4. 허리 펴주고!
5. 손도 예쁘게! ', TIMESTAMP '2023-12-20 02:26:53', TIMESTAMP '2023-12-20 02:26:53', 0, '2', '1', 100001);
INSERT INTO MEETGO.BOARD (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, BOARD_CREATE_DATE, BOARD_UPDATE_DATE, BOARD_COUNT, BOARD_TYPE, BOARD_STATUS, USER_NO) VALUES (100004, '블로그 작성하는 방법', '블로그를 성장시키고 키워드를 잘 잡아서 상위노출을 시킨 다음에 수익화를 만들고 싶죠? 블로그 글에도 원칙이 있습니다. 네이버가 원하는 원칙을 담아줘야 네이버에서는 그 글이 잘 작성되고 전문적이고 정보성이 있는 글이라고 생각해서 상위로 올려주죠. 그 다음 네이버에서 제공하는 서비스를 필요한 곳곳에 담아준다면 더 예쁜 글로 꾸며줄 수 있어 완성도를 높이는 조건이 됩니다.', TIMESTAMP '2023-12-20 02:27:25', TIMESTAMP '2023-12-20 02:27:25', 0, '2', '1', 100001);
INSERT INTO MEETGO.BOARD (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, BOARD_CREATE_DATE, BOARD_UPDATE_DATE, BOARD_COUNT, BOARD_TYPE, BOARD_STATUS, USER_NO) VALUES (100005, '이직 면접 이거 놓치면 불합격!', '1. 경험 정리가 되지 못하고 있다면 핵심 한방을 잡을 수 없습니다!
지금이라도 경험을 정리하자!
경험은 원인-해결책-성과-마인드셋 순으로!
마인드셋은 성과를 만든 내 가치관과 기준!

2. 이직 동기는 잊지 말자!
이직 동기는 애인이 어디가 마음에 드냐는 말과 동급!
네가 돈이 많아서!전 여친과 싸워서!그냥 네가 좋아서!라는 말은사랑하지 않는다는 말!
잊지 말자! 현 여친(이직회사)이 좋은 이유는 전 여친(기존회사)이 마음에 안 들어서가 아니다!

3. 취준감각을 모르겠는가?
자소서를 계속 쓰면서설득 감각을 익혀라!
산업분석, 회사 분석, 꾸준한 지원! 한 우물만 판다면 손해다!', TIMESTAMP '2023-12-20 02:28:07', TIMESTAMP '2023-12-20 02:28:07', 0, '2', '1', 100001);
INSERT INTO MEETGO.BOARD_FILE (BFILE_NO, BFILE_URL, BFILE_STATUS, BOARD_NO) VALUES (100000, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/c3a8b8e2-9e91-46d7-ad85-a82bb18f8b23291fec81-3db3-4635-aa8f-74d6ccd69cd3.webp', '1', 100000);
INSERT INTO MEETGO.BOARD_FILE (BFILE_NO, BFILE_URL, BFILE_STATUS, BOARD_NO) VALUES (100001, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/6d7bae0d-5d5a-4954-9f20-5f47a36114de20171022183112870.jpg', '1', 100001);
INSERT INTO MEETGO.BOARD_FILE (BFILE_NO, BFILE_URL, BFILE_STATUS, BOARD_NO) VALUES (100002, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/910a70a0-efbb-4d7b-ab5b-4dfd45f44a356cfed276-9edd-4121-b06e-df423c0bc922.webp', '1', 100002);
INSERT INTO MEETGO.BOARD_FILE (BFILE_NO, BFILE_URL, BFILE_STATUS, BOARD_NO) VALUES (100003, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/aa7ef23e-c451-4a06-a497-95f68b0585a876cff799-5be2-4714-8360-6ae11c457715.webp', '1', 100003);
INSERT INTO MEETGO.BOARD_FILE (BFILE_NO, BFILE_URL, BFILE_STATUS, BOARD_NO) VALUES (100004, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/08a86012-11e0-4f23-adc9-34c11cc89e69baec3f4b-64a0-43c7-a8a8-8ee2f7deba58.webp', '1', 100004);
INSERT INTO MEETGO.BOARD_FILE (BFILE_NO, BFILE_URL, BFILE_STATUS, BOARD_NO) VALUES (100005, 'https://kh-meetgo.s3.ap-northeast-2.amazonaws.com/gosuImg/5ce4d703-0b39-4a7f-914e-f47107376ba7daa7675e-e26d-4a0e-ac1f-ad53dc98a46a.webp', '1', 100005);


commit;