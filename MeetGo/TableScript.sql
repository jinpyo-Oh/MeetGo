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
    USER_NAME        VARCHAR2(30)                                NOT NULL,                                 -- 이름
    USER_ID          VARCHAR2(30) UNIQUE                         NOT NULL,                                 -- 아이디
    USER_PWD         VARCHAR2(1000)                              NOT NULL,                                 -- 비밀번호
    USER_NICKNAME    VARCHAR2(30) UNIQUE                         NOT NULL,                                 -- 닉네임
    USER_GENDER      CHAR(1) CHECK ( USER_GENDER IN ('M', 'F') ) NOT NULL,                                 -- 성별 (M:남, F:여)
    USER_EMAIL       VARCHAR2(30) UNIQUE                         NOT NULL,                                 -- 이메일 (인증 필요)
    USER_PHONE       VARCHAR2(20)                                NOT NULL,                                 -- 번호
    USER_PROFILE     VARCHAR2(1000) default 'https://heurm-tutorial.vlpt.us/images/default_thumbnail.png', -- 프로필 이미지
    ADDRESS          VARCHAR2(100)                               NULL,                                     -- 주소
    CREATE_DATE      DATE           DEFAULT SYSDATE,                                                       -- 생성일자
    LAST_ACCESS_DATE DATE           DEFAULT SYSDATE,                                                       -- 최근 접속일
    USER_STATUS      NUMBER default 1 CHECK (USER_STATUS IN (1, 2))  NULL,                                 -- 1: 일반사용자,  2: 고수,  3: ADMIN
    ENROLL_STATUS    NUMBER default 1 CHECK (ENROLL_STATUS IN (1, 2, 3, 4) )                               -- 1: 일반사용자(고수등록),  2: 고수(고수 비활성화),  3: 고수 비활성화(고수 활성화) 4: 회원 탈퇴(회원 비활성화)
);
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;

CREATE TABLE REPORT
(
    REPORT_NO       NUMBER PRIMARY KEY,                          -- 신고 번호
    REPORTED_USER   NUMBER        NOT NULL,                      -- 신고 받은 사람 번호
    REPORT_CATEGORY VARCHAR2(200) NOT NULL,                      -- 신고 카테고리
    REPORT_CONTENT  VARCHAR2(300) NOT NULL,                      -- 신고 내용
    REPORT_STATUS   NUMBER CHECK ( REPORT_STATUS IN (0, 1, 2) ), -- 신고 상태 0:미확인, 1:처리대기, 2:처리완료
    REPORT_USER     NUMBER,                                      -- 신고자 번호
    FOREIGN KEY (REPORT_USER) REFERENCES MEMBER (USER_NO)
);
CREATE SEQUENCE SEQ_REPORT_NO NOCACHE;

-- 고수 테이블
CREATE TABLE GOSU
(
    "GOSU_NO"         NUMBER PRIMARY KEY,                            -- 고수 번호
    "INTRODUCTION"    VARCHAR2(255)  NOT NULL,                       -- 소개
    "EMPLOYEES"       NUMBER         NOT NULL,                       -- 직원 수
    "BUSINESS_STATUS" NUMBER CHECK ( BUSINESS_STATUS IN (1, 2, 3) ), -- 일반, 개인, 법인
    "EDUCATION"       VARCHAR2(100)  NOT NULL,                       -- 학력
    "CAREER"          VARCHAR2(1000) NOT NULL,                       -- 경력
    "ELABORATE"       VARCHAR2(255)  NOT NULL,                       -- 서비스 상세 설명
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


-- 찜 목록 테이블
CREATE TABLE "WISH-LIST"
(
    "USER_NO" NUMBER, -- 사용자 번호
    "GOSU_NO" NUMBER, -- 고수 번호
    FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO),
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO)
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
    "POFOL_TITLE"       VARCHAR2(50)   NOT NULL,                          -- 포폴 제목
    "POFOL_INTRO"       VARCHAR2(1000) NOT NULL,                          -- 포폴 소개
    "POFOL_PRICE"       VARCHAR2(100)  NOT NULL,                          -- 가격
    "POFOL_CONTENT"     VARCHAR2(1000) NOT NULL,                          -- 포폴 내용
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
    "CHATROOM_NO" NUMBER PRIMARY KEY,   -- 채팅방 번호
    "CREATE_AT"   DATE DEFAULT SYSDATE, -- 생성일
    "USER_NO"     NUMBER NOT NULL,      -- 사용자 번호
    "GOSU_NO"     NUMBER NOT NULL,      -- 고수 번호
    FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO),
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO)
);
CREATE SEQUENCE SEQ_CHATROOM_NO NOCACHE;


-- 1대1 채팅 테이블
CREATE TABLE "CHAT"
(
    "CHAT_NO"     NUMBER PRIMARY KEY,                        -- 1대1 채팅 번호
    "CONTENT"     VARCHAR2(1000) NOT NULL,                   -- 내용
    "SENDER"      NUMBER         NOT NULL,                   -- 발신자
    "READ"        NUMBER CHECK ( READ IN (0, 1) ),           -- 수신 여부
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
    "REV_CONTENT" VARCHAR2(300) NOT NULL,                     -- 리뷰 내용
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
    "BOARD_NO"          NUMBER PRIMARY KEY,                                  -- 게시글 번호
    "BOARD_TITLE"       VARCHAR2(100)  NOT NULL,                             -- 제목
    "BOARD_CONTENT"     VARCHAR2(1000) NOT NULL,                             -- 내용
    "BOARD_CREATE_DATE" DATE   DEFAULT SYSDATE,                              -- 생성일
    "BOARD_UPDATE_DATE" DATE   DEFAULT SYSDATE,                              -- 수정일
    "BOARD_COUNT"       NUMBER DEFAULT 0,                                    -- 조회수
    "BOARD_TYPE"        VARCHAR2(1) CHECK ( BOARD_TYPE IN ('1', '2', '3') ), -- 1:자유, 2:팁, 3:공지
    "USER_NO"           NUMBER         NOT NULL,                             -- 사용자 번호
    FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO)
);
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;

-- 게시글 파일 테이블
CREATE TABLE "BOARD_FILE"
(
    "BFILE_NO"          NUMBER PRIMARY KEY,                           -- 게시글 파일 번호
    "BFILE_URL"         varchar2(1000) NOT NULL ,                     -- 게시글 파일 URL
    "BFILE_STATUS"      VARCHAR2(1) CHECK ( BFILE_STATUS IN (1, 2) ), -- 1:정상 2:비활성화(삭제)
    "BOARD_NO"          NUMBER         NOT NULL                       -- 게시글 번호
);
CREATE SEQUENCE SEQ_BOARD_FILE_NO NOCACHE;

-- 댓글 테이블
CREATE TABLE "REPLY"
(
    "REPLY_NO"      NUMBER                                  NOT NULL, -- 댓글 번호
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

INSERT INTO MEETGO.MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE,
                           USER_PROFILE, ADDRESS, CREATE_DATE, LAST_ACCESS_DATE)
VALUES (1001, '윤아', 'user01', '$2a$10$/Y9I7rISMRvUDWigufjhq.f0qeML9zbM/PLGTTO5hFU6sdjp8g6NG', 'USER01', 'M',
        'dltkdgus1850@gmail.com', '01035483929',
        'https://mblogthumb-phinf.pstatic.net/MjAyMTA2MjJfMjk2/MDAxNjI0MzM1MjAxODcz.Rts7NekerZ35zKgVJtX5n3ZBtQq0n8jSi1Aq6JcU0WEg.7Z3yCyxY9PnCZfBazkvwTLB3BmtHghYBZcEAlt7pEmMg.JPEG.hwoarangx2/img_(3).jpg?type=w800',
        '서울시 영등포구', TIMESTAMP '2023-12-06 14:21:56', TIMESTAMP '2023-12-06 14:21:56');
INSERT INTO MEETGO.MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE,
                           USER_PROFILE, ADDRESS, CREATE_DATE, LAST_ACCESS_DATE)
VALUES (1002, '수지', 'user02', '$2a$10$/Y9I7rISMRvUDWigufjhq.f0qeML9zbM/PLGTTO5hFU6sdjp8g6NG', 'USER02', 'M',
        'dltkdgus1851@gmail.com', '01035483929',
        'https://i.pinimg.com/originals/d0/55/34/d05534b4a66c74ae771a4924d2013567.jpg', '안산시 상록구',
        TIMESTAMP '2023-12-06 14:21:56', TIMESTAMP '2023-12-06 14:21:56');
INSERT INTO MEETGO.MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE,
                           USER_PROFILE, ADDRESS, CREATE_DATE, LAST_ACCESS_DATE)
VALUES (1003, '예인', 'user03', '$2a$10$/Y9I7rISMRvUDWigufjhq.f0qeML9zbM/PLGTTO5hFU6sdjp8g6NG', 'USER03', 'M',
        'dltkdgus1852@gmail.com', '01035483929',
        'https://images.chosun.com/resizer/Gv1OSCS21WKiHrz9S32T_9OJE5s=/464x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/KWWWC6BHCE26YVUNF3HDGWMCNU.jpg',
        '대전 오정동', TIMESTAMP '2023-12-06 14:21:56', TIMESTAMP '2023-12-06 14:21:56');
INSERT INTO MEETGO.MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE,
                           USER_PROFILE, ADDRESS, CREATE_DATE, LAST_ACCESS_DATE)
VALUES (1004, '예은', 'user04', '$2a$10$/Y9I7rISMRvUDWigufjhq.f0qeML9zbM/PLGTTO5hFU6sdjp8g6NG', 'USER04', 'M',
        'dltkdgus1853@gmail.com', '01035483929',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUAZ1bNfqiTna5ztoL_d_0auPA2ffL79VEw&usqp=CAU', '대전 은행동',
        TIMESTAMP '2023-12-06 14:21:56', TIMESTAMP '2023-12-06 14:21:56');
INSERT INTO MEETGO.MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE,
                           USER_PROFILE, ADDRESS, CREATE_DATE, LAST_ACCESS_DATE)
VALUES (1005, '강형욱', 'user05', '$2a$10$/Y9I7rISMRvUDWigufjhq.f0qeML9zbM/PLGTTO5hFU6sdjp8g6NG', '강형욱 닉네임', 'M',
        'dltkdgus1854@gmail.com', '01035483929',
        'https://i.namu.wiki/i/XTZnBt8HC2JTiBDx9NydLAKPS9NiyTI7yPxMjVKkYFNuvkoBVfgRoggMVJ1pkkb7utpNKES0yOYdJj5VJSS-lvqyUwq5Q6_EEieX32UeEGwLlULu-y0th8woJtzMA9PXQNdz8NCH73Xaoav1XevU0Q.webp',
        '안산시 상록구', TIMESTAMP '2023-12-06 17:26:57', TIMESTAMP '2023-12-06 17:26:57');

INSERT INTO MEETGO.GOSU (GOSU_NO, INTRODUCTION, EMPLOYEES, BUSINESS_STATUS, EDUCATION, CAREER, ELABORATE, REGION, MOVE_DISTANCE, AVAILABLE_TIME, USER_NO) VALUES (1004, '고수 소개 입니다.', 2, 1, '대졸', '총 경력 12년', '서비스 상세 설명 내용 입니다.', '대전 대덕구 오정동', '이동 가능 거리 입니다.', '상시 이용 가능', 1004);
INSERT INTO MEETGO.GOSU (GOSU_NO, INTRODUCTION, EMPLOYEES, BUSINESS_STATUS, EDUCATION, CAREER, ELABORATE, REGION, MOVE_DISTANCE, AVAILABLE_TIME, USER_NO) VALUES (1001, '고수 소개 입니다.2', 3, 1, '대졸', '총 경력 2년', '서비스 상세 설명 내용 입니다.2', '대전 대덕구 오정동', '이동 가능 거리 입니다.', '상시 이용 가능', 1001);
INSERT INTO MEETGO.GOSU (GOSU_NO, INTRODUCTION, EMPLOYEES, BUSINESS_STATUS, EDUCATION, CAREER, ELABORATE, REGION, MOVE_DISTANCE, AVAILABLE_TIME, USER_NO) VALUES (1002, '고수 소개 입니다.3', 4, 1, '대졸', '총 경력 3년', '서비스 상세 설명 내용 입니다.2', '대전 대덕구 오정동', '이동 가능 거리 입니다.', '상시 이용 가능', 1002);
INSERT INTO MEETGO.GOSU (GOSU_NO, INTRODUCTION, EMPLOYEES, BUSINESS_STATUS, EDUCATION, CAREER, ELABORATE, REGION, MOVE_DISTANCE, AVAILABLE_TIME, USER_NO) VALUES (1003, '고수 소개 입니다.4', 5, 1, '대졸', '총 경력 3년', '서비스 상세 설명 내용 입니다.4', '대전 대덕구 오정동', '이동 가능 거리 입니다.', '상시 이용 가능', 1003);
INSERT INTO MEETGO.GOSU (GOSU_NO, INTRODUCTION, EMPLOYEES, BUSINESS_STATUS, EDUCATION, CAREER, ELABORATE, REGION, MOVE_DISTANCE, AVAILABLE_TIME, USER_NO) VALUES (1005, '고수 소개 입니다.5', 30, 1, '대졸', '총 경력 10년', '서비스 상세 설명 내용 입니다.4', '대전 대덕구 오정동', '이동 가능 거리 입니다.', '상시 이용 가능', 1005);

INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1001, 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbDFPiU%2Fbtq3l4mrZ3W%2FeQLiyy6LgxvtMskWjWebQ0%2Fimg.png', 1, 1001);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1002, 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FmMLME%2Fbtq3lTk2Zre%2F2YJxcU7D3kzVQzCfeXxKfK%2Fimg.png', 1, 1001);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1003, 'https://blog.kakaocdn.net/dn/brrmR8/btq3mOwy8N4/PFK2KSxXDuVmmJfkLj49a1/img.gif', 1, 1001);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1004, 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F5dktJ%2Fbtq3nDadVUw%2F899KJS8hSZD4kArtYPpyYk%2Fimg.png', 1, 1001);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1005, 'https://image.ytn.co.kr/general/jpg/2017/1214/201712141100066324_d.jpg', 1, 1005);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1006, 'https://image.ytn.co.kr/general/jpg/2017/1107/201711071050061704_d.jpg', 1, 1005);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1007, 'https://image.cine21.com/resize/cine21/article/2016/0908/10_10_26__57d0ba822d0ac[W578-].jpg', 1, 1005);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1008, 'https://thumb.mt.co.kr/06/2021/06/2021060412382435678_1.jpg/dims/optimize/', 1, 1005);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1009, 'https://www.newstap.co.kr/news/photo/202306/196638_315386_479.jpg', 1, 1002);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1010, 'https://file.mk.co.kr/meet/neds/2023/09/image_readtop_2023_676485_16939644025613848.jpg', 1, 1002);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1011, 'https://spnimage.edaily.co.kr/images/photo/files/NP/S/2023/10/PS23101800067.jpg', 1, 1002);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1012, 'https://mblogthumb-phinf.pstatic.net/MjAyMjAxMThfMjk2/MDAxNjQyNTAzNTgzNDkw.c3DbzQrTBPz-3jv2xTy1DATLEyKcqczUJrTL7bGavWwg.OyCcxen_bScrOvqyK2vIXGdiaWjpbCjdzqM709AFzGkg.JPEG.luck1995/1641868505.jpg?type=w800', 1, 1003);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1013, 'https://post-phinf.pstatic.net/MjAxNzEyMTFfMjYg/MDAxNTEyOTc1MjM1Njgz.BcYjbCLZSJ7w71sTE9S-k81t72J5e04o4buJXjU20Igg.dsvhdJVdcVEa4XLDBqOfsFjjFSqjGJyq9RUGL3YxE5kg.JPEG/%EC%97%91%EC%8A%A4%ED%8F%AC%EC%B8%A0%EB%89%B4%EC%8A%A4_%EB%AE%A4%EC%A7%81%EB%B1%85%ED%81%AC_%EC%B6%9C%EA%B7%BC%EA%B8%B8_%EB%9F%AC%EB%B8%94%EB%A6%AC%EC%A6%88_%EC%A0%95%EC%98%88%EC%9D%B82.jpg?type=w800_q75', 1, 1003);
INSERT INTO MEETGO."GOSU-IMG" (GOSU_IMG_NO, GOSU_IMG_URL, STATUS, GOSU_NO) VALUES (1014, 'https://mblogthumb-phinf.pstatic.net/MjAyMTAyMTFfMjQ4/MDAxNjEzMDQ1OTkwOTYz.xqbjfoMuBAPXSPL23HqHgpDB1O0E6S64s4zXfrA6IUog.ZKWQyx7KMz-EauPFkoYXsxvCUAYGuz9tSfqFe8oZ8J4g.JPEG.yetall_0522/1613045987446.jpg?type=w800', 1, 1003);

INSERT INTO MEETGO.POFOL (POFOL_NO, POFOL_TITLE, POFOL_PRICE, POFOL_CONTENT, POFOL_VISITED, POFOL_CREATE_DATE, POFOL_STATUS, GOSU_NO, POFOL_SERVICE, POFOL_INTRO) VALUES (1001, '포폴 제목', '100000', '포폴 내용이 들어가는 자리입니다 시작


포폴 내용이 들어가는 자리입니다 끝', 1549, TIMESTAMP '2023-12-06 17:10:38', 1, 1001, 503,'포폴 소개 입니다.');
INSERT INTO MEETGO.POFOL (POFOL_NO, POFOL_TITLE, POFOL_PRICE, POFOL_CONTENT, POFOL_VISITED, POFOL_CREATE_DATE, POFOL_STATUS, GOSU_NO, POFOL_SERVICE, POFOL_INTRO) VALUES (1002, '포폴 제목', '200000', '포폴 내용이 들어가는 자리입니다 시작


포폴 내용이 들어가는 자리입니다 끝', 517, TIMESTAMP '2023-12-06 17:19:48', 1, 1002, 601,'포폴 소개 입니다.');
INSERT INTO MEETGO.POFOL (POFOL_NO, POFOL_TITLE, POFOL_PRICE, POFOL_CONTENT, POFOL_VISITED, POFOL_CREATE_DATE, POFOL_STATUS, GOSU_NO, POFOL_SERVICE, POFOL_INTRO) VALUES (1003, '포폴 제목', '300000', '포폴 내용이 들어가는 자리입니다 시작


포폴 내용이 들어가는 자리입니다 끝', 18196, TIMESTAMP '2023-12-06 17:20:12', 1, 1003, 301,'포폴 소개 입니다.');
INSERT INTO MEETGO.POFOL (POFOL_NO, POFOL_TITLE, POFOL_PRICE, POFOL_CONTENT, POFOL_VISITED, POFOL_CREATE_DATE, POFOL_STATUS, GOSU_NO, POFOL_SERVICE, POFOL_INTRO) VALUES (1004, '포폴 제목', '400000', '포폴 내용이 들어가는 자리입니다 시작


포폴 내용이 들어가는 자리입니다 끝', 14196, TIMESTAMP '2023-12-06 17:20:29', 1, 1004, 208,'포폴 소개 입니다.');
INSERT INTO MEETGO.POFOL (POFOL_NO, POFOL_TITLE, POFOL_PRICE, POFOL_CONTENT, POFOL_VISITED, POFOL_CREATE_DATE, POFOL_STATUS, GOSU_NO, POFOL_SERVICE, POFOL_INTRO) VALUES (1005, '애견 훈련 애견 훈련 애견 훈련', '500000', '포폴 내용이 들어가는 자리입니다 시작


포폴 내용이 들어가는 자리입니다 끝', 888453, TIMESTAMP '2023-12-07 09:37:43', 1, 1005, 903,'포폴 소개 입니다.');

INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1001, 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcBhplU%2Fbtq3mdjiuOO%2FktXGCDpVuxWHXTkEcvRoX1%2Fimg.png', 1001);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1002, 'https://blog.kakaocdn.net/dn/Y0hDr/btq3oTKh2Qp/Rdu1fyfcGWYkLQ9nOHXOH0/img.gif', 1001);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1003, 'https://blog.kakaocdn.net/dn/qK39X/btq3qffoE5D/iDvORGEfKpbwfsqaaWQWo1/img.gif', 1001);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1004, 'https://cdn.sisaweek.com/news/photo/202212/201322_201374_5222.jpg', 1002);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1005, 'https://i.namu.wiki/i/lMp2Nma6E26uLPOtwfbFpapq-ywhL6nW2_M6oMHLNRffe4ExiR0hdDXzrYaVp0ccJZMBekkHpWNTX34Q1qnf23wjC4Ov8kNthIceEqwdANoJoUtxj7RUiels0PBe7QWZ1AuHAarYyAOF318x72j5yA.webp', 1002);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1006, 'https://i.namu.wiki/i/19WEfovKTZUZQkOXyv7_yUh1MMByWY2jK6yyBMNphWJFHJ0IcQj-OLcEbq3-8e93DJv-bOADGPzJaSqxfTuLmrm1WMwSsoq6F6ywGsKZ469r2RZtGSSFIYmpWpxw6zgwOPj7xYLKNwbO_H2xbhK3vQ.webp', 1002);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1007, 'https://i.namu.wiki/i/38yxNKHZ3nWKrb1pxM4sDgmiYN6TlfGfiCYM0xfprgHRCG297C-Wi8xm1B-qesPvExJyMGxkxkOV21nN70Nec9m5GLdv37oisrt8apeBPVklVUfaspbNvBpQIz1uyepQdIPLpY2tK0zmSokKR7V8Xg.webp', 1003);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1008, 'https://i.namu.wiki/i/O4v4FG1b6mjpwFu-PYQ9M8UHWyk3624LLJLO_kYIHDlQNLUROEYlBaVmPDruBT3ika-3F_qiRsrcoSidMlR2J7Z_evseiI5ISJLNnTuDp3JhuPpejhuMOq8QV1jf5mTpPptJcC30NTRSUNjDEByElA.webp', 1003);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1009, 'https://i.namu.wiki/i/c2tkhRc14Eokb5jl89naN4LRs7i1pXTfZy44E5cSv55EjYbAM25uBxhR4Fk12-Pg-h4YsWGDUG1VF_JAWCgeNh_LSGbB3Ah6UIbJbJZHtWokZTndeXnY3LKac1L4qxDW8zh_1g_xY4u7VXA_drYzFQ.webp', 1003);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1010, 'https://i.namu.wiki/i/BeOJpo46wpbxWO5WI2N3mgQ1s_yNkYt1N2QPu6oyfQf-Qnx6Bcuw0rvx1Uo4__XshbTsVoYNpbFWssiVluuqDv9Z430_kBi7ZZH7V8Ykb2KuwBe_IMoEDRt048qseEpsrbqa_m5bUCFVVoTqagz7JQ.webp', 1004);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1011, 'https://i.namu.wiki/i/BeOJpo46wpbxWO5WI2N3mgQ1s_yNkYt1N2QPu6oyfQf-Qnx6Bcuw0rvx1Uo4__XshbTsVoYNpbFWssiVluuqDv9Z430_kBi7ZZH7V8Ykb2KuwBe_IMoEDRt048qseEpsrbqa_m5bUCFVVoTqagz7JQ.webp', 1004);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1012, 'https://i.namu.wiki/i/BeOJpo46wpbxWO5WI2N3mgQ1s_yNkYt1N2QPu6oyfQf-Qnx6Bcuw0rvx1Uo4__XshbTsVoYNpbFWssiVluuqDv9Z430_kBi7ZZH7V8Ykb2KuwBe_IMoEDRt048qseEpsrbqa_m5bUCFVVoTqagz7JQ.webp', 1004);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1013, 'https://i3.ruliweb.com/img/22/06/25/181986ea237544783.jpeg', 1005);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1014, 'https://img.animalplanet.co.kr/news/2021/03/17/700/qwsj32n45p38j2kzs496.jpg', 1005);
INSERT INTO MEETGO.POFOL_IMG (POFOL_IMG_NO, POFOL_IMG_URL, POFOL_NO) VALUES (1015, 'https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202203/24/xportsnews/20220324003039598dwsu.jpg', 1005);

INSERT INTO MEETGO.REVIEW (REV_NO, REV_CONTENT, REV_POINT, REV_DATE, REV_STATUS, EST_NO, USER_NO, GOSU_NO) VALUES (1001, '리뷰 내용이 들어가는 자리입니다.', 3, TIMESTAMP '2023-12-06 19:14:21', '1', 1, 1002, 1001);
INSERT INTO MEETGO.REVIEW (REV_NO, REV_CONTENT, REV_POINT, REV_DATE, REV_STATUS, EST_NO, USER_NO, GOSU_NO) VALUES (1002, '리뷰 내용이 들어가는 자리입니다.', 4, TIMESTAMP '2023-12-06 19:15:28', '1', 2, 1003, 1001);
INSERT INTO MEETGO.REVIEW (REV_NO, REV_CONTENT, REV_POINT, REV_DATE, REV_STATUS, EST_NO, USER_NO, GOSU_NO) VALUES (1003, '리뷰 내용이 들어가는 자리입니다.', 4, TIMESTAMP '2023-12-06 19:15:29', '1', 3, 1004, 1001);
INSERT INTO MEETGO.REVIEW (REV_NO, REV_CONTENT, REV_POINT, REV_DATE, REV_STATUS, EST_NO, USER_NO, GOSU_NO) VALUES (1004, '리뷰 내용이 들어가는 자리입니다.', 5, TIMESTAMP '2023-12-06 19:15:29', '1', 4, 1005, 1001);

INSERT INTO MEETGO.REVIEW_IMG (IMG_NO, REV_IMG_URL, REV_NO)
VALUES (1002,
        'https://mblogthumb-phinf.pstatic.net/MjAyMjAxMDdfNTEg/MDAxNjQxNTQxMTQ0Mjg2.mb0NUwj0A8qEjE-2ULfbY1cX0lSmJXD3NWlhlsH58U0g.oKbkr49vDJoBaAF2YCeX0n5Kc0Hq70gvwsbOt1YKPo0g.JPEG.41minit/1641534121049.jpg?type=w800',
        1001);
INSERT INTO MEETGO.REVIEW_IMG (IMG_NO, REV_IMG_URL, REV_NO)
VALUES (1003,
        'https://mblogthumb-phinf.pstatic.net/MjAyMTEyMTJfMjc5/MDAxNjM5MjQ5ODI1MTYz.-NtkV4Ael9s6Cnq_trhv2ATQJqF2qUq50jq_dtEL-8Ug.w-P4I5pY0EtGHEWcmS8_UKkTF6LNBeQrwypfM2mhtekg.JPEG.41minit/1639154079953%EF%BC%8D0.jpg?type=w800',
        1001);
INSERT INTO MEETGO.REVIEW_IMG (IMG_NO, REV_IMG_URL, REV_NO)
VALUES (1004,
        'https://mblogthumb-phinf.pstatic.net/MjAyMTEyMTJfMjg2/MDAxNjM5MjQ5ODI1NTU3.bEgs_j_ZaQgWAgAnjJ2daUIQlUzKuAud4l6KRXgqiw0g.qt0LjkvDb9WRPR1j_WEOjwZS642aXaI36iWDxvsqW2Ug.JPEG.41minit/1639153272211%EF%BC%8D4.jpg?type=w800',
        1002);
INSERT INTO MEETGO.REVIEW_IMG (IMG_NO, REV_IMG_URL, REV_NO)
VALUES (1005,
        'https://mblogthumb-phinf.pstatic.net/MjAyMjAxMTBfMjg3/MDAxNjQxNzk3NjA1NTM1.CpZEacZh4RGuux3OqlK4FsiaU9uSABJXz-I39fFKhqwg.f6_dcOrxcjB6qQiEpVlQRLEg41Z52Ede9s3YIhGxehwg.JPEG.41minit/1641769858708.jpg?type=w800',
        1002);
INSERT INTO MEETGO.REVIEW_IMG (IMG_NO, REV_IMG_URL, REV_NO)
VALUES (1006,
        'https://mblogthumb-phinf.pstatic.net/MjAyMTEyMTJfMjAy/MDAxNjM5MjQ5ODI2MTU1.iPx-ZkSbFWhd4XPRwNbkePRKQn8r4ynm86zpqRNQNtUg.VnCCLmcPkMVZepUITvxiGfEX3q742ZCOJHjzDnqW3PQg.JPEG.41minit/1639153272211%EF%BC%8D5.jpg?type=w800',
        1002);
INSERT INTO MEETGO.REVIEW_IMG (IMG_NO, REV_IMG_URL, REV_NO)
VALUES (1007,
        'https://mblogthumb-phinf.pstatic.net/MjAyMTEyMTJfMjUz/MDAxNjM5MjQ5ODI3NjI4.k7C9kpZ61NjKzsOA5gpQL0yVLNqDFffJg8Nzq9csy2Ig.ZVD1oKVmoinvwpHxHw5qYU_GytxmYho-aITP7P9mrn0g.JPEG.41minit/1639153272211%EF%BC%8D6.jpg?type=w800',
        1003);
INSERT INTO MEETGO.REVIEW_IMG (IMG_NO, REV_IMG_URL, REV_NO)
VALUES (1008,
        'https://mblogthumb-phinf.pstatic.net/MjAyMjAxMTBfMzYg/MDAxNjQxNzk3NjA2NjA5.ch2knv1PXnZ2aEY1Km2yuTGM5Qa2BbhQYKcXBieFaiUg.YFmYJPHHuanrPjbasVR3fJdlaF8RUGADAtcbpENkDD4g.JPEG.41minit/1641631265233.jpg?type=w800',
        1003);
INSERT INTO MEETGO.REVIEW_IMG (IMG_NO, REV_IMG_URL, REV_NO)
VALUES (1009,
        'https://mblogthumb-phinf.pstatic.net/MjAyMTEyMTJfODcg/MDAxNjM5MjQ5ODI4MDUz.RK_Ci32uWkgzv4sTTrlLowPU0bLil6qVMF1jTLKJHEAg.ra83ge0ifH7-tyv7mwa-3WOJL8sgOcSk3qQ80YUMvC0g.JPEG.41minit/1639153272211%EF%BC%8D7.jpg?type=w800',
        1003);
INSERT INTO MEETGO.REVIEW_IMG (IMG_NO, REV_IMG_URL, REV_NO)
VALUES (1010,
        'https://mblogthumb-phinf.pstatic.net/MjAyMjAxMDdfMjUg/MDAxNjQxNTQxMTU0NjQ5.wJF87eSDcrEaj-Q1qFAn6EXBYDn5Ky-96vd8JkcQjw4g.P09T_flYvkP8ornyd1eZgT2w938smesRrZBdwKTPc-cg.JPEG.41minit/1641533871473.jpg?type=w800',
        1004);
INSERT INTO MEETGO.REVIEW_IMG (IMG_NO, REV_IMG_URL, REV_NO)
VALUES (1011,
        'https://mblogthumb-phinf.pstatic.net/MjAyMjAxMDdfMTYw/MDAxNjQxNTQxMTU1MTAy.XzVv9cOH5LIW2fVyEZxoEp8Um7YVKoJ6HHXoA2ZPR6Yg._xtZz8IuT8DelOa_sgSZnDAUquZPQS9xdN09BHYMBpkg.JPEG.41minit/1641533869444.jpg?type=w800',
        1004);
INSERT INTO MEETGO.REVIEW_IMG (IMG_NO, REV_IMG_URL, REV_NO)
VALUES (1012,
        'https://mblogthumb-phinf.pstatic.net/MjAyMTEyMjJfMTUx/MDAxNjQwMTUwOTUzMTQ1.gIoNSEUcIMFK_LReraNVAHnjPsU7RijJrNEY40Wbydkg.eB-NsX78rHgJaNdujL1ve8jGexnFCtuf-NeQqb99v4Ug.JPEG.41minit/1640148409666.jpg?type=w800',
        1004);
INSERT INTO MEETGO.CHATROOM (CHATROOM_NO, CREATE_AT, USER_NO, GOSU_NO) VALUES (1001, TIMESTAMP '2023-12-06 17:49:51', 1002, 1001);
INSERT INTO MEETGO.CHATROOM (CHATROOM_NO, CREATE_AT, USER_NO, GOSU_NO) VALUES (1002, TIMESTAMP '2023-12-06 17:50:07', 1003, 1001);
INSERT INTO MEETGO.CHATROOM (CHATROOM_NO, CREATE_AT, USER_NO, GOSU_NO) VALUES (1003, TIMESTAMP '2023-12-06 17:50:26', 1004, 1001);
INSERT INTO MEETGO.CHATROOM (CHATROOM_NO, CREATE_AT, USER_NO, GOSU_NO) VALUES (1004, TIMESTAMP '2023-12-06 17:50:37', 1005, 1001);
INSERT INTO MEETGO.CHATROOM (CHATROOM_NO, CREATE_AT, USER_NO, GOSU_NO) VALUES (1005, TIMESTAMP '2023-12-06 17:54:47', 1001, 1002);
INSERT INTO MEETGO.CHATROOM (CHATROOM_NO, CREATE_AT, USER_NO, GOSU_NO) VALUES (1006, TIMESTAMP '2023-12-06 17:54:48', 1001, 1004);
INSERT INTO MEETGO.CHATROOM (CHATROOM_NO, CREATE_AT, USER_NO, GOSU_NO) VALUES (1007, TIMESTAMP '2023-12-06 17:54:48', 1001, 1003);
INSERT INTO MEETGO.CHATROOM (CHATROOM_NO, CREATE_AT, USER_NO, GOSU_NO) VALUES (1008, TIMESTAMP '2023-12-07 17:16:36', 1001, 1005);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1001, 201);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1001, 503);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1001, 303);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1001, 304);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1002, 201);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1002, 503);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1002, 303);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1002, 304);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1002, 601);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1005, 903);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1005, 602);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1005, 403);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1005, 404);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1005, 902);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1004, 301);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1004, 302);
INSERT INTO MEETGO."GOSU-SERVICE" (GOSU_NO, CATEGORY_SMALL_NO) VALUES (1004, 303);

commit ;