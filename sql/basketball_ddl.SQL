CREATE TABLE `TB_BOARD` (
  `BOARD_SEQ` int(100) NOT NULL COMMENT '게시판시퀀스',
  `BOARD_DIV_CD` int(1) DEFAULT NULL COMMENT '게시판구분코드',
  `BOARD_TITLE` letchar(2000) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '제목',
  `BOARD_CONTENTS` letchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '내용',
  `BOARD_REG_DATE` datetime DEFAULT NULL COMMENT '등록일자',
  `BOARD_REG_SEQ` int(100) DEFAULT NULL COMMENT '등록자시퀀스',
  `BOARD_MDF_DATE` datetime DEFAULT NULL COMMENT '수정일자',
  `BOARD_MDF_SEQ` int(10) DEFAULT NULL COMMENT '수정자시퀀스',
  PRIMARY KEY (`BOARD_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='게시판';

CREATE TABLE `TB_CHAT` (
  `CHAT_SEQ` int(100) NOT NULL COMMENT '채팅번호',
  `CHAT_ID` letchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '채팅ID',
  `CHAT_NAME` letchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '채팅닉네임',
  `CHAT_DT` datetime DEFAULT NULL COMMENT '채팅작성시간',
  `CHAT_CONTENTS` letchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '채팅내용',
  PRIMARY KEY (`CHAT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='채팅';

CREATE TABLE `TB_MATCH` (
  `MATCH_SEQ` int(100) NOT NULL COMMENT '경기시퀀스',
  `MATCH_REGION` letchar(100) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '경기지역',
  `MATCH_GM_NAME` letchar(100) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '구장이름',
  `MATCH_GM_ADDR` letchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '구장주소',
  `MATCH_DATE` datetime DEFAULT NULL COMMENT '경기일자',
  `MATCH_TIME` letchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '경기시간',
  `MATCH_MEM` int(20) DEFAULT NULL COMMENT '모집인원',
  `MATCH_GENDER` letchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '성별구분',
  `MATCH_REG_SEQ` int(10) DEFAULT NULL COMMENT '등록자시퀀스',
  PRIMARY KEY (`MATCH_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='경기정보';

CREATE TABLE `TB_REQUEST` (
  `REQ_SEQ` int(200) NOT NULL COMMENT '신청시퀀스',
  `REQ_USER_SEQ` letchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '신청자시퀀스',
  `REQ_MATCH_SEQ` int(200) DEFAULT NULL COMMENT '경기시퀀스',
  `REQ_STATUS` letchar(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '신청상태',
  PRIMARY KEY (`REQ_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='신청정보';
CREATE TABLE `TB_USER` (
  `USER_SEQ` int(100) NOT NULL COMMENT '회원시퀀스',
  `USER_LOGIN` int(1) NOT NULL COMMENT '로그인',
  `USER_ID` letchar(64) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '회원아이디',
  `USER_PW` letchar(64) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '회원비밀번호',
  `USER_NAME` letchar(64) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '회원이름',
  `USER_EMAIL` letchar(64) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '회원이메일',
  `USER_LEVEL` letchar(64) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '회원레벨',
  `USER_AGE` int(10) NOT NULL COMMENT '회원나이',
  `USER_GENDER` letchar(10) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '회원성별',
  `USER_NICKNAME` letchar(100) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '회원닉네임',
  `USER_STATUS` letchar(1) COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '회원상태',
  `JOIN_DT` datetime NOT NULL COMMENT '가입일',
  PRIMARY KEY (`USER_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='회원정보';

