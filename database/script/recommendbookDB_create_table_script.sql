use recommendbook;

-- -----------------------------------------------------
-- Table `recommendbook`.`commentinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recommendbook`.`commentinfo` (
  `num` INT(11) NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NULL DEFAULT NULL COMMENT '댓글 작성자',
  `pw` VARCHAR(45) NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL COMMENT '댓글 내용',
  `postNum` INT(11) NULL,
  PRIMARY KEY (`num`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
AUTO_INCREMENT = 1
COMMENT = '댓글 정보';


-- -----------------------------------------------------
-- Table `recommendbook`.`postinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recommendbook`.`postinfo` (
  `num` INT(11) NOT NULL AUTO_INCREMENT,
  `bookName` VARCHAR(40) NOT NULL,
  `writer` VARCHAR(20) NOT NULL COMMENT '작가',
  `title` VARCHAR(20) NOT NULL COMMENT '도서명',
  `content` TEXT NOT NULL,
  `bookType` VARCHAR(30) NULL DEFAULT NULL COMMENT '도서유형',
  `favorite` VARCHAR(20) NULL DEFAULT NULL COMMENT '취향',
  `bookLevel` CHAR(2) NULL DEFAULT NULL COMMENT '도서 난이도',
  `score` INT(1) NULL DEFAULT NULL COMMENT '추천 점수',
  PRIMARY KEY (`num`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
AUTO_INCREMENT = 1
COMMENT = '게시글 정보';


-- -----------------------------------------------------
-- Table `recommendbook`.`recommendinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recommendbook`.`recommendinfo` (
  `bookName` VARCHAR(45) NULL DEFAULT NULL COMMENT '도서명',
  `averageScore` INT(11) NULL DEFAULT NULL COMMENT '추천 평균점수',
  `counter` INT(11) NULL DEFAULT NULL COMMENT '추천 수')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '도서 추천 정보';


-- -----------------------------------------------------
-- Table `recommendbook`.`userinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recommendbook`.`userinfo` (
  `id` VARCHAR(10) NOT NULL,
  `pw` VARCHAR(45) NULL DEFAULT NULL,
  `userName` VARCHAR(20) NOT NULL COMMENT '사용자명',
  `birthday` DATE NULL DEFAULT NULL COMMENT '생년월일',
  `email01` VARCHAR(20) NULL DEFAULT NULL,
  `email02` VARCHAR(20) NULL DEFAULT NULL,
  `postCode` INT(11) NULL DEFAULT NULL COMMENT '우편번호',
  `roadAddress` VARCHAR(45) NULL DEFAULT NULL COMMENT '도로명 주소',
  `jibunAddress` VARCHAR(45) NULL DEFAULT NULL COMMENT '지번 주소',
  `detailAddress` VARCHAR(45) NULL DEFAULT NULL COMMENT '세부주소',
  `extraAddress` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '사용자 정보';

