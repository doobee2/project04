CREATE DATABASE haebeop;

USE haebeop;

-- 핵심 기능 : 공지사항, 자료실, 회원, 자유게시판, 강의별 댓글, 교재와 시범강의
-- 부가 기능 : 파일업로드, 채팅 및 쪽지, 타계정 또는 SNS로 로그인, 수강평, 달력, 가입시 축하 이메일 보내기, 비밀번호 변경시 이메일 보내기, 온라인 평가, 진도관리, 학습 스케줄러, 나의 강의실 등

-- 회원(아이디, 비밀번호, 이름, 이메일, 전화번호, 주소1, 주소2, 우편번호, 가입일, 생년월일, 회원포인트, 방문횟수)
CREATE TABLE user(
	id VARCHAR(20) PRIMARY KEY,
	pw VARCHAR(350) NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	tel VARCHAR(20),
	addr1 VARCHAR(200),
	addr2 VARCHAR(200),
	postcode VARCHAR(20),
	regdate DATETIME DEFAULT CURRENT_TIME,
	birth DATE DEFAULT CURRENT_TIME,
	pt INT DEFAULT 0,
	visited INT DEFAULT 0
);

-- 공지사항(순번, 제목, 내용, 작성일, 읽은 횟수)
CREATE TABLE notice(
	seq INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(2000) NOT NULL,
	regdate DATETIME DEFAULT CURRENT_TIME,
	cnt INT DEFAULT 0
);

-- 자료실(순번, 제목, 내용, 자료파일1, 자료파일2, 자료파일3, 작성일, 작성자, 읽은 횟수)
CREATE TABLE databoard(
	dno INT PRIMARY KEY AUTO_INCREMENT,   					-- (게시글 번호) 자동 발생
	title VARCHAR(200) NOT NULL,   							-- (게시글 제목)
	content VARCHAR(1000),   									-- (게시글 내용)
	filename1 varchar(500),										-- (자료파일1)
	filename2 varchar(500),										-- (자료파일2)
	filename3 varchar(500),										-- (자료파일3)
	regdate DATETIME NOT NULL DEFAULT CURRENT_TIME,   	-- (작성일)
	author VARCHAR(16) NOT NULL,   							-- (작성자)
	cnt INT DEFAULT 0   											-- (조회수)
);

-- 과목(과목코드, 과목명, 과목단가)
CREATE TABLE SUBJECT(
	sno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	price INT NOT null
);

-- 강의(강의코드, 강의명, 강의파일, 과목코드, 교재코드, 강사코드, 수강인원)
CREATE TABLE lecture(
	lno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	filename1 varchar(500),
	sno INT NOT NULL,
	bno INT,
	tno INT NOT NULL,
	cnt INT NOT null
);

-- 수강(수강코드, 강의코드, 학생아이디, 수강총시간, 수강완료여부)
CREATE TABLE study(
	sno INT PRIMARY KEY AUTO_INCREMENT,
	lno INT NOT NULL,
	id VARCHAR(20) NOT NULL,
	totaltime INT NOT NULL,
	isfinish BOOLEAN DEFAULT FALSE
);

-- 강사(강사코드, 강사명, 연락처, 이메일)
CREATE TABLE teacher(
	tno INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(50) NOT NULL,
	tel VARCHAR(20) NOT NULL,
	email VARCHAR(150) NOT NULL
);

-- 교재(교재코드, 교재명, 교재목차, 출판사, 출판일, 저자, 가격, 기타메모)
CREATE TABLE book(
	bno INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(100) NOT NULL,
	blist VARCHAR(1000),
	publisher VARCHAR(200),
	regdate DATETIME,
	author VARCHAR(100),
	price INT,
	memo VARCHAR(1000)
);