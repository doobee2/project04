CREATE DATABASE haebeop;

USE haebeop;

CREATE TABLE member(
	mno INT AUTO_INCREMENT PRIMARY KEY,					-- 회원 번호 : 자동 발생
	id VARCHAR(20) UNIQUE KEY,								-- 회원 아이디
	pw VARCHAR(500) NOT NULL,								-- 회원 비밀번호
	nm VARCHAR(50) NOT NULL,								-- 회원 이름
	email VARCHAR(50) NOT NULL,							-- 회원 이메일
	tel VARCHAR(20) NOT NULL,								-- 회원 전화번호
	addr1 VARCHAR(200),										-- 회원 주소
	addr2 VARCHAR(100),										-- 회원 상세 주소
	postcode VARCHAR(10),									-- 회원 우편 번호
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP(),	-- 회원 등록일
	birth DATE,													-- 회원 생일
	pt INT DEFAULT 0,											-- 회원 포인트
	visited INT DEFAULT 0,									-- 회원 방문수
	useYn BOOLEAN DEFAULT TRUE,							-- 회원 사용 여부
	grade INT DEFAULT 2										-- 회원 등급 [ 0 : 관리자, 1 : 선생님, 2 : 일반사용자]
);

CREATE TABLE memberMgn(
	mmNo INT AUTO_INCREMENT PRIMARY KEY,				-- 회원 등급 요청 번호 : 자동 발생
	author VARCHAR(20) NOT NULL,							-- 회원 아이디
	approveYn BOOLEAN DEFAULT FALSE,						-- 회원 등급 승인 여부
	mStatus INT DEFAULT 0,									-- 회원 상태 [0 : 미신청, 1 : 승인 대기, 2 : 승인 취소, 3 : 승인 완료, 4 : 재 신청]
	content VARCHAR(2000)									-- 등급 승인 거절 사유
);

CREATE VIEW memberMgnList AS (SELECT mm.mmNo AS mmNo, mm.author AS author,  mm.approveYn AS approveYn, mm.mStatus AS mStatus, mm.content AS content, m.nm AS nm FROM memberMgn mm, member m WHERE mm.author = m.id order BY mm.mmNo ASC);

CREATE TABLE comment(
   cno INT PRIMARY KEY AUTO_INCREMENT,   							-- 댓글번호: 자동발생
	author VARCHAR(20) NOT NULL,   									-- 댓글 작성자
	content VARCHAR(1000) NOT NULL,   								-- 댓글 내용
	resDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   	-- 댓글 등록일
	par INT NOT NULL   													-- 해당 게시글 번호
);

CREATE VIEW commentList AS (SELECT c.cno AS cno, c.author AS author, c.content AS content, c.resDate AS resDate, c.par AS par, m.nm AS nm FROM comment c, member m WHERE c.author = m.id order BY c.cno ASC);


-- 강의
CREATE TABLE lecture(
	lno INT AUTO_INCREMENT PRIMARY KEY,			-- 강의 번호 : 자동증가
	title VARCHAR(150) NOT NULL,					-- 강의 제목
	subTitle VARCHAR(500) NOT NULL,				-- 강의 소제목
	content VARCHAR(4000) NOT NULL,				-- 강의 내용
	lectureType INT NOT NULL,						-- 강의 타입 [ 온라인 : 0, 오프라인 : 1 ]
	studentCnt INT NOT NULL, 						-- 강의 수강 인원
	startDate TIMESTAMP,								-- 강의 시작 기간 - 오프라인 사용
	endDate TIMESTAMP,								-- 강의 종료 기간 - 오프라인 사용
	daily VARCHAR(200),								-- 강의 하루 일정 - 오프라인 사용
	teacherId VARCHAR(20) NOT NULL,				-- 강의 담당 선생 아이디
	teacherNm VARCHAR(20),
	thumbnail VARCHAR(100),                	-- 강의 썸네일
       lvideo VARCHAR(100)  ,    						-- 샘플영상
       sno INT NOT NULL, 								-- 과목
       cost INT NOT NULL, 								-- 강의가격
       bookname VARCHAR(150),							-- 교재명
       bthumbnail VARCHAR(100)    					-- 교재 썸네일
);

CREATE TABLE subject(
   sno INT PRIMARY KEY AUTO_INCREMENT,	-- 과목번호
   title VARCHAR(200) NOT NULL			-- 과목명
);

CREATE TABLE curri(
	cno INT PRIMARY KEY AUTO_INCREMENT,	-- 목차번호
	lno INT NOT NULL, 						-- 강의 번호
	content VARCHAR(100) NOT NULL   		-- 목차제목
);

CREATE TABLE review(
	rno INT PRIMARY KEY AUTO_INCREMENT, 						-- 후기 번호
	lno INT NOT NULL, 												-- 강의 번호
	memId VARCHAR(16) NOT NULL, 									-- 회원 아이디
	content VARCHAR(1000), 											-- 후기 내용
	star INT DEFAULT 5, 												-- 별점
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP	-- 후기 작성일
);

CREATE TABLE study(
	sno INT AUTO_INCREMENT PRIMARY KEY,	-- 수강 번호 : 자동증가
	lno INT NOT NULL,							-- 수강 강의 번호
	studentId VARCHAR(20) NOT NULL,		-- 수강생 아이디
	studyYn BOOLEAN DEFAULT FALSE,		-- 수강 진행 여부(수강중:0, 수강완료유저:1)
	canYn BOOLEAN DEFAULT FALSE			-- 수강 가능 여부(미수강:0, 결제완료유저:1)
);

-- 유저 강의 리스트
CREATE VIEW lectview AS (SELECT
                             lecture.lno,
                             lecture.lectureType,
                             lecture.title AS lect_tit,
                             lecture.subTitle AS subTitle,
                             lecture.teacherId AS teacherId,
                             lecture.teacherNm AS teacherNm,
                             lecture.studentCnt AS studentCnt,
                             lecture.thumbnail AS thumbnail,
                             lecture.cost AS cost,
                             subject.sno AS sno,
                             subject.title AS sub_tit
                        FROM lecture INNER JOIN subject
                                                ON lecture.sno = subject.sno);

CREATE TABLE payment(
    payno INT AUTO_INCREMENT PRIMARY KEY,		    -- 결제 번호 : 자동증가
    id VARCHAR(20) NOT NULL,                        -- 회원 아이디
    pno int default 0,                              -- 강의 공유번호
    plec VARCHAR(100) NOT NULL,                     -- 강의 이름
    tecnm VARCHAR(100) NOT NULL,                    -- 선생님 이름
    booknm VARCHAR(100),                            -- 책 교재명
    pmethod VARCHAR(10),                            -- 결제 방법 - [1:신용카드 | 2:체크카드 | 3:계좌이체]
    pcom VARCHAR(100),                              -- 결제 대행사
    pnum VARCHAR(100),                              -- 결제카드(계좌)번호
    price INT DEFAULT 1000,                         -- 결제 금액
    amount INT DEFAULT 1,                           -- 결제 수량
    status INT DEFAULT 0,                           -- 배송상태 - [0:결제완료 | 1:결제완료 | 2:결제취소]
    resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP()   -- 결제 등록일
);

-- 유저 나의 강의실
CREATE VIEW mylect AS (SELECT
                           l.lno AS lno,
                           l.title AS title,
                           l.teacherNm AS teacherNm,
                           l.thumbnail AS thumbnail,
                           p.id AS id
                      FROM lecture l, payment p
                      WHERE l.lno = p.pno);


-- 공지사항
CREATE TABLE notice(
                       no INT PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
                       title VARCHAR(200) NOT NULL,   -- (게시글 제목)
                       content VARCHAR(1000),   -- (게시글 내용)
                       regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (등록일)
                       visited INT DEFAULT 0   -- (조회수)
);

-- 자유게시판
CREATE TABLE free(
                     fno INT PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
                     title VARCHAR(200) NOT NULL,   -- (게시글 제목)
                     content VARCHAR(1000),   -- (게시글 내용)haebeop
                     author VARCHAR(16) NOT NULL,   -- (작성자)
                     regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (등록일)
                     visited INT DEFAULT 0   -- (조회수)
);

-- 댓글
CREATE TABLE comment(
                        cno INT PRIMARY KEY AUTO_INCREMENT,   -- (댓글번호) 자동발생
                        author VARCHAR(16) NOT NULL,   -- (댓글 작성자)
                        content VARCHAR(1000) NOT NULL,   -- (댓글 내용)
                        regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (댓글 등록일)
                        par INT(11) NOT NULL   -- (해당 게시글 번호)
);

SELECT * FROM notice;

-- 자료실
-- 자료실(순번, 제목, 내용, 자료파일1, 자료파일2, 자료파일3, 작성일, 작성자, 읽은 횟수)
CREATE TABLE fileboard(
                          fbno INT PRIMARY KEY AUTO_INCREMENT,   -- 게시글 번호 : 자동 발생
                          title VARCHAR(200) NOT NULL,  -- 게시글 제목
                          content VARCHAR(1000),   	-- 게시글 내용
                          file1	VARCHAR(20),
                          file2	VARCHAR(20),
                          file3	VARCHAR(20),
                          author VARCHAR(20) NOT NULL,   									-- 작성자
                          resDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   	-- 등록일
                          visited INT DEFAULT 0   											-- 조회수
);

DROP TABLE fileboard;

CREATE TABLE databoard(
                          bno INT PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
                          title VARCHAR(200) NOT NULL,   -- (게시글 제목)
                          content VARCHAR(1000),   -- (게시글 내용)
                          author VARCHAR(16) NOT NULL,   -- (작성자)
                          relations VARCHAR(20) DEFAULT 'no', -- dataFile table에 관련 자료가 있는지 여부.
                          regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (등록일)
                          visited INT DEFAULT 0   -- (조회수)
);

CREATE TABLE datafile(
                         dno INT primary KEY AUTO_INCREMENT,
                         fileName VARCHAR(100),
                         saveName VARCHAR(100),
                         fileType VARCHAR(100),
                         relations VARCHAR(20),
                         bno INT,
                         saveFolder VARCHAR(100)
);
