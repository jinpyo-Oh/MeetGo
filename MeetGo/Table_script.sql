-- 회원 테이블
CREATE TABLE MEMBER (
                        USER_NO          NUMBER PRIMARY KEY,                               -- 유저 번호
                        USER_NAME        VARCHAR2(30)                            NOT NULL, -- 이름
                        USER_ID          VARCHAR2(30) UNIQUE                     NOT NULL, -- 아이디
                        USER_PWD         VARCHAR2(30)                            NOT NULL, -- 비밀번호
                        USER_NICKNAME    VARCHAR2(30) UNIQUE                     NOT NULL, -- 닉네임
                        USER_GENDER      CHAR(1) CHECK ( USER_GENDER IN ('M', 'F') ) NOT NULL, -- 성별 (M:남, F:여)
                        USER_EMAIL       VARCHAR2(30) UNIQUE                     NOT NULL, -- 이메일 (인증 필요)
                        USER_PHONE       VARCHAR2(20)                            NOT NULL, -- 번호
                        USER_PROFILE     VARCHAR2(1000)                         NULL, -- 프로필 이미지
                        CREATE_DATE      DATE DEFAULT SYSDATE,                             -- 생성일자
                        LAST_ACCESS_DATE DATE DEFAULT SYSDATE,                             -- 최근 접속일
                        USER_STATUS      NUMBER CHECK (USER_STATUS IN (1, 2, 3)) NULL      -- 1: 일반사용자,  2: 고수,  3: 비활성화(탈퇴)
);
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;

-- 고수 테이블
CREATE TABLE GOSU
(
    "GOSU_NO"       NUMBER PRIMARY KEY ,                 -- 고수 번호
    "INTRODUCTION"  VARCHAR2(255) NOT NULL, -- 소개
    "EDUCATION"     VARCHAR2(100) NULL,     -- 학력
    "CAREER"        VARCHAR2(50)  NOT NULL, -- 경력
    "ELABORATE"     VARCHAR2(255) NOT NULL, -- 상세 설명
    "REGION"        VARCHAR2(100) NOT NULL, -- 지역
    "MOVE_DISTANCE" VARCHAR2(150) NULL,     -- 이동 가능 거리
    "USER_NO" NUMBER NOT NULL ,
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
    "GOSU_IMG_NO" NUMBER PRIMARY KEY,                -- 고수 이미지 번호
    "ORIGIN_NAME" VARCHAR2(255) NOT NULL,            -- 원본 이름
    "CHANGE_NAME" VARCHAR2(255) NOT NULL,            -- 수정 이름
    "FILE_PATH"   VARCHAR2(255) NOT NULL,            -- 파일 경로
    "STATUS"      NUMBER CHECK ( STATUS IN (1, 2) ), -- 1 : 정상, 2 : 삭제
    "GOSU_NO"     NUMBER NOT NULL ,                            -- 고수 번호
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

-- 서비스 카테고리 소분류 테이블
CREATE TABLE "SERVICE_CATEGORY_SMALL"
(
    "CATEGORY_SMALL_NO"   NUMBER PRIMARY KEY, -- 소분류 번호
    "CATEGORY_SMALL_NAME" VARCHAR2(50) NULL,  -- 소분류 이름
    "CATEGORY_BIG_NO"     NUMBER NOT NULL ,             -- 대분류 번호
    FOREIGN KEY (CATEGORY_BIG_NO) REFERENCES SERVICE_CATEGORY_BIG (CATEGORY_BIG_NO)
);
CREATE SEQUENCE SEQ_SERVICE_SMALL NOCACHE;

-- 고수-서비스 연관 테이블
CREATE TABLE "GOSU-SERVICE"
(
    "GOSU_NO"           NUMBER NOT NULL , -- 고수 번호
    "CATEGORY_SMALL_NO" NUMBER NOT NULL , -- 카테고리 번호
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO),
    FOREIGN KEY (CATEGORY_SMALL_NO) REFERENCES SERVICE_CATEGORY_SMALL (CATEGORY_SMALL_NO)
);

-- 포트폴리오 테이블
CREATE TABLE "POFOL"
(
    "POFOL_NO"      NUMBER PRIMARY KEY,      -- 포폴 번호
    "POFOL_TITLE"   VARCHAR2(50)   NOT NULL, -- 포폴 제목
    "POFOL_CONTENT" VARCHAR2(1000) NOT NULL, -- 포폴 내용
    "GOSU_NO"       NUMBER NOT NULL ,                  -- 고수 번호
    FOREIGN KEY (GOSU_NO) REFERENCES GOSU (GOSU_NO)
);
CREATE SEQUENCE SEQ_POFOL_NO NOCACHE;

-- 포트폴리오 좋아요 테이블
CREATE TABLE "POFOL_LIKE"
(
    "POFOL_NO" NUMBER NOT NULL , -- 포폴 번호
    "USER_NO"  NUMBER NOT NULL , -- 사용자 번호
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

-- 1대1 채팅 테이블
CREATE TABLE "CHAT"
(
    "CHAT_NO"     NUMBER PRIMARY KEY,                        -- 1대1 채팅 번호
    "CONTENT"     VARCHAR2(100) NOT NULL,                    -- 내용
    "RECEIVER"    NUMBER        NOT NULL,                    -- 수신자
    "TYPE"        CHAR(1) CHECK ( TYPE IN ('P', 'M', 'E') ), -- P:사진 , M:메세지, E:견적서
    "CHATROOM_NO" NUMBER NOT NULL ,                                    -- 채팅방 번호
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
    "CHAT_NO"     NUMBER NOT NULL ,                  -- 1대1 채팅 번호
    FOREIGN KEY (CHAT_NO) REFERENCES CHAT (CHAT_NO)
);
CREATE SEQUENCE SEQ_CHAT_IMAGE_NO NOCACHE;

-- 견적서 테이블
CREATE TABLE ESTIMATE
(
    "EST_NO"            NUMBER PRIMARY KEY,                                  -- 견적서 번호
    "EST_TITLE"         VARCHAR2(90)   NOT NULL,                             -- 견적서 제목
    "EST_CONTENT"       VARCHAR2(1500) NOT NULL,                             -- 견적서 내용
    "EST_ADDRESS"       VARCHAR2(300)  NOT NULL,                             -- 견적서 주소
    "START_DATE"        DATE           NOT NULL,                             -- 서비스 시작일
    "END_DATE"          DATE DEFAULT SYSDATE,                                -- 서비스 종료일
    "CONFIRMATION_DATE" DATE           NULL,                                 -- 견적 확정일
    "EST_PRICE"         NUMBER         NOT NULL,                             -- 견적 가격
    "STATUS"            VARCHAR2(1) CHECK ( STATUS IN ('1', '2', '3', '4', '5')), -- 1:대기, 2:취소, 3:확정, 4:결제 완료, 5:완료
    "tid"               VARCHAR2(30)   NULL,                                 -- 결제 고유 번호
    "GOSU_NO"           NUMBER         NOT NULL,                             -- 고수 번호
    "USER_NO"           NUMBER         NOT NULL,                             -- 사용자 번호
    "CHAT_NO"           NUMBER         NOT NULL,                             -- 채팅 번호
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
    "CHANGE_NAME" VARCHAR2(300) NOT NULL, -- 수정 이름
    "IMG_PATH"    VARCHAR2(300) NOT NULL, -- 파일 경로
    "REV_NO"      NUMBER NOT NULL ,                 -- 리뷰 번호
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
    "USER_NO"           NUMBER NOT NULL ,                                              -- 사용자 번호
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
    "BOARD_NO"      NUMBER NOT NULL ,                                           -- 게시글 번호
    "USER_NO"       NUMBER NOT NULL ,                                           -- 사용자 번호
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
