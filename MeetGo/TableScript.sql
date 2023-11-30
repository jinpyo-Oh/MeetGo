drop table "WISH-LIST" cascade constraints purge;
drop table "GOSU-IMG" cascade constraints purge;
drop table "GOSU-SERVICE" cascade constraints purge;
drop table SERVICE_CATEGORY_SMALL cascade constraints purge;
drop table SERVICE_CATEGORY_BIG cascade constraints purge;
drop table POFOL_LIKE cascade constraints purge;
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
    USER_NO          NUMBER PRIMARY KEY,                                   -- 유저 번호
    USER_NAME        VARCHAR2(30)                                NOT NULL, -- 이름
    USER_ID          VARCHAR2(30) UNIQUE                         NOT NULL, -- 아이디
    USER_PWD         VARCHAR2(1000)                              NOT NULL, -- 비밀번호
    USER_NICKNAME    VARCHAR2(30) UNIQUE                         NOT NULL, -- 닉네임
    USER_GENDER      CHAR(1) CHECK ( USER_GENDER IN ('M', 'F') ) NOT NULL, -- 성별 (M:남, F:여)
    USER_EMAIL       VARCHAR2(30) UNIQUE                         NOT NULL, -- 이메일 (인증 필요)
    USER_PHONE       VARCHAR2(20)                                NOT NULL, -- 번호
    USER_PROFILE     VARCHAR2(1000)                              NULL,     -- 프로필 이미지
    ADDRESS          VARCHAR2(100)                               NOT NULL, -- 주소
    CREATE_DATE      DATE DEFAULT SYSDATE,                                 -- 생성일자
    LAST_ACCESS_DATE DATE DEFAULT SYSDATE,                                 -- 최근 접속일
    USER_STATUS      NUMBER CHECK (USER_STATUS IN (1, 2, 3, 4))  NULL      -- 1: 일반사용자,  2: 고수,  3: 고수 비활성화 4: 회원 탈퇴(비활성화)
);

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

CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;
INSERT INTO MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE,
                    USER_PROFILE, USER_STATUS)
VALUES (1001, 'USER01', 'USER01', 'USER01', 'USER01', 'M', 'dltkdgus1850@gmail.com', '01035483929',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUAZ1bNfqiTna5ztoL_d_0auPA2ffL79VEw&usqp=CAU', 1);
INSERT INTO MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE,
                    USER_PROFILE, USER_STATUS)
VALUES (1002, 'USER02', 'USER02', 'USER02', 'USER02', 'M', 'dltkdgus1851@gmail.com', '01035483929',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUAZ1bNfqiTna5ztoL_d_0auPA2ffL79VEw&usqp=CAU', 1);
INSERT INTO MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE,
                    USER_PROFILE, USER_STATUS)
VALUES (1003, 'USER03', 'USER03', 'USER03', 'USER03', 'M', 'dltkdgus1852@gmail.com', '01035483929',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUAZ1bNfqiTna5ztoL_d_0auPA2ffL79VEw&usqp=CAU', 1);
INSERT INTO MEMBER (USER_NO, USER_NAME, USER_ID, USER_PWD, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_PHONE,
                    USER_PROFILE, USER_STATUS)
VALUES (1004, 'USER04', 'USER04', 'USER04', 'USER04', 'M', 'dltkdgus1853@gmail.com', '01035483929',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUAZ1bNfqiTna5ztoL_d_0auPA2ffL79VEw&usqp=CAU', 1);

-- 고수 테이블
CREATE TABLE GOSU
(
    "GOSU_NO"         NUMBER PRIMARY KEY,                            -- 고수 번호
    "INTRODUCTION"    VARCHAR2(255) NOT NULL,                        -- 소개
    "EMPLOYEES"       NUMBER        NOT NULL,                        -- 직원 수
    "BUSINESS_STATUS" NUMBER CHECK ( BUSINESS_STATUS IN (1, 2, 3) ), -- 일반, 개인, 법인
    "EDUCATION"       VARCHAR2(100) NOT NULL,                        -- 학력
    "CAREER"          VARCHAR2(50)  NOT NULL,                        -- 경력
    "ELABORATE"       VARCHAR2(255) NOT NULL,                        -- 서비스 상세 설명
    "REGION"          VARCHAR2(100) NOT NULL,                        -- 지역
    "MOVE_DISTANCE"   VARCHAR2(150) NULL,                            -- 이동 가능 거리
    "AVAILABLE_TIME"  VARCHAR2(200) NULL,                            -- 이용 가능 시간
    "USER_NO"         NUMBER        NOT NULL,
    FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO)
);
INSERT INTO GOSU (GOSU_NO, ADDRESS, INTRODUCTION,EMPLOYEES,BUSINESS_STATUS, EDUCATION, CAREER, ELABORATE, REGION, MOVE_DISTANCE,
                  AVAILABLILTY_TIME, USER_NO)
VALUES (1004, '서울시 어쩌구', '렛미인트로듀스 마이셀프투유', 1,1,'초졸', '1년', '서비스 상세 설명입니다.', '서울 어쩌구', '5km', '오전 9시 ~ 오후 2시', 1002);

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
    "GOSU_IMG_NO" NUMBER PRIMARY KEY,                -- 고수 이미지 번호
    "ORIGIN_NAME" VARCHAR2(255) NOT NULL,            -- 원본 이름
    "CHANGE_NAME" VARCHAR2(255) NOT NULL,            -- 수정 이름
    "FILE_PATH"   VARCHAR2(255) NOT NULL,            -- 파일 경로
    "STATUS"      NUMBER CHECK ( STATUS IN (1, 2) ), -- 1 : 정상, 2 : 삭제
    "GOSU_NO"     NUMBER        NOT NULL,            -- 고수 번호
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
VALUES (205, '음악', 2);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (206, '요리', 2);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (207, '외국어', 2);
INSERT INTO SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO, CATEGORY_SMALL_NAME, CATEGORY_BIG_NO)
VALUES (208, '미술', 2);

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
    "POFOL_NO"      NUMBER PRIMARY KEY,      -- 포폴 번호
    "POFOL_TITLE"   VARCHAR2(50)   NOT NULL, -- 포폴 제목
    "POFOL_CONTENT" VARCHAR2(1000) NOT NULL, -- 포폴 내용
    "GOSU_NO"       NUMBER         NOT NULL, -- 고수 번호
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO)
);
CREATE SEQUENCE SEQ_POFOL_NO NOCACHE;

-- 포트폴리오 좋아요 테이블
CREATE TABLE "POFOL_LIKE"
(
    "POFOL_NO" NUMBER NOT NULL, -- 포폴 번호
    "USER_NO"  NUMBER NOT NULL, -- 사용자 번호
    FOREIGN KEY (POFOL_NO) REFERENCES POFOL (POFOL_NO),
    FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO)
);


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
INSERT INTO CHATROOM (CHATROOM_NO, CREATE_AT, USER_NO, GOSU_NO)
VALUES (1000, SYSDATE, 1001, 1004);
INSERT INTO CHATROOM (CHATROOM_NO, CREATE_AT, USER_NO, GOSU_NO)
VALUES (1001, SYSDATE, 1002, 1004);
INSERT INTO CHATROOM (CHATROOM_NO, CREATE_AT, USER_NO, GOSU_NO)
VALUES (1002, SYSDATE, 1003, 1004);
-- 1대1 채팅 테이블
CREATE TABLE "CHAT"
(
    "CHAT_NO"     NUMBER PRIMARY KEY,                        -- 1대1 채팅 번호
    "CONTENT"     VARCHAR2(1000) NOT NULL,                   -- 내용
    "SENDER"      NUMBER         NOT NULL,                   -- 발신자
    "TYPE"        CHAR(1) CHECK ( TYPE IN ('P', 'M', 'E') ), -- P:사진 , M:메세지, E:견적서
    "CREATE_AT"   DATE DEFAULT SYSDATE,                      -- 작성시간
    "CHATROOM_NO" NUMBER         NOT NULL,                   -- 채팅방 번호
    FOREIGN KEY (CHATROOM_NO) REFERENCES CHATROOM (CHATROOM_NO)
);
CREATE SEQUENCE SEQ_CHAT_NO NOCACHE;

-- 1대1 채팅 이미지 테이블
CREATE TABLE "CHAT_IMAGE"
(
    "CHAT_IMG_NO" NUMBER PRIMARY KEY,      -- 1대1 채팅 이미지 번호
    "ORIGIN_NAME" VARCHAR2(1000) NOT NULL, -- 원본 이름
    "CHANGE_NAME" VARCHAR2(1000) NOT NULL, -- 수정 이름
    "FILE_PATH"   VARCHAR2(200)  NOT NULL, -- 파일 경로
    "CHAT_NO"     NUMBER         NOT NULL, -- 1대1 채팅 번호
    FOREIGN KEY (CHAT_NO) REFERENCES CHAT (CHAT_NO)
);
CREATE SEQUENCE SEQ_CHAT_IMAGE_NO NOCACHE;

-- 견적서 테이블
CREATE TABLE ESTIMATE
(
    "EST_NO"            NUMBER PRIMARY KEY,                                       -- 견적서 번호
    "EST_TITLE"         VARCHAR2(90)   NOT NULL,                                  -- 견적서 제목
    "EST_CONTENT"       VARCHAR2(1500) NOT NULL,                                  -- 견적서 내용
    "EST_ADDRESS"       VARCHAR2(300)  NOT NULL,                                  -- 견적서 주소
    "START_DATE"        DATE           NOT NULL,                                  -- 서비스 시작일
    "END_DATE"          DATE DEFAULT SYSDATE,                                     -- 서비스 종료일
    "CONFIRMATION_DATE" DATE           NULL,                                      -- 견적 확정일
    "EST_PRICE"         NUMBER         NOT NULL,                                  -- 견적 가격
    "STATUS"            VARCHAR2(1) CHECK ( STATUS IN ('1', '2', '3', '4', '5')), -- 1:대기, 2:취소, 3:확정, 4:결제 완료, 5:완료
    "tid"               VARCHAR2(30)   NULL,                                      -- 결제 고유 번호
    "GOSU_NO"           NUMBER         NOT NULL,                                  -- 고수 번호
    "USER_NO"           NUMBER         NOT NULL,                                  -- 사용자 번호
    "CHAT_NO"           NUMBER         NOT NULL,                                  -- 채팅 번호
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO),
    FOREIGN KEY (CHAT_NO) REFERENCES CHAT (CHAT_NO),
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
    "ORIGIN_NAME" VARCHAR2(300) NOT NULL, -- 원본 이름
    "CHANGE_NAME" VARCHAR2(300) NOT NULL, -- 수정 이름ㅁ
    "IMG_PATH"    VARCHAR2(300) NOT NULL, -- 파일 경로
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
    "BFILE_ORIGIN_NAME" VARCHAR2(1000) NOT NULL,                      -- 원본 이름
    "BFILE_CHANGE_NAME" VARCHAR2(1000) NOT NULL,                      -- 수정 이름
    "BFILE_PATH"        VARCHAR2(1000) NOT NULL,                      -- 파일 경로
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
