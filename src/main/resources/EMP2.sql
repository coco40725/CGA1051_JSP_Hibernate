-- 育伶的部分 --

-- 建立資料庫 --
create schema IPETDB;
use IPETDB;
-- drop schema IPETDB;

-- 建立員工表格 --
create table IPETDB.STAFF (
                              ID	  	int				Not Null primary key auto_increment,
                              `NAME`	varchar	(10)	Not Null,
                              UID	    varchar	(10)	Not Null,
                              BTH	    datetime		Not Null,
                              SEX	    char(1),
                              EMAIL		varchar	(50)	Not Null,
                              PHONE		varchar	(10)	Not Null,
                              TEL	    varchar	(10),
                              `ADD`	    varchar	(100)	Not Null,
                              AC	    varchar	(30)	Not Null,
                              PW	    varchar	(30)	Not Null,
                              `STATUS`	int		         default 0,
                              POSI	varchar	(10)	Not Null
);
-- drop table IPETDB.STAFF ;

-- 建立員工資料 --
insert into IPETDB.staff
(`NAME`,UID, BTH, SEX, EMAIL,PHONE,
`ADD`,AC,PW,POSI)
values
    ('王曉明','A123456789',STR_TO_DATE('1981-11-17','%Y-%m-%d'),'男','xxxyyy@gmail.com',
     '0912345678','台北市天龍國','abc1117','0000','美容師'),
    ('王小美','A223496789',STR_TO_DATE('1997-01-07','%Y-%m-%d'),'女','aaabbb@gmail.com',
     '0912345678','桃園市中壢國','qazwsx0107','0000','美容師'),
    ('陳大壯','A123456789',STR_TO_DATE('1996-08-08','%Y-%m-%d'),'男','hihihi@gmail.com',
     '0912345678','苗栗國','abc0808','0000','美容助理'),
    ('張小菁','A123456789',STR_TO_DATE('1993-09-09','%Y-%m-%d'),'女','yoyoyo@gmail.com',
     '0912345678','台北市大安區','abc0909','0000','美容助理'),
    ('關小婷','A123456789',STR_TO_DATE('1997-06-06','%Y-%m-%d'),'女','goodproject@gmail.com',
     '0912345678','新北市林口區','abc0606','0000','美容助理'),
    ('蕭小豪','A123456789',STR_TO_DATE('1990-05-30','%Y-%m-%d'),'男','havemanymoney@gmail.com',
     '0912345678','台北市天龍國','abc0530','0000','美容助理'),
    ('吳小宏','A123456789',STR_TO_DATE('1975-01-01','%Y-%m-%d'),'男','wearegood@gmail.com',
     '0912345678','台北市天龍國','abc0101','0000','美容助理');

-- 建立員工權限功能--
create table IPETDB.STAFF_ADMIN_PER_FUNC (
                                             ID		int				Not Null primary key auto_increment,
                                             `NAME`	varchar	(20)	Not Null
);
-- drop table IPETDB.STAFF_ADMIN_PER_FUNC;

insert into IPETDB.STAFF_ADMIN_PER_FUNC (`NAME`)values('商城管理員'),('美容管理員'),('住宿管理員');

-- 建立員工權限--
create table IPETDB.STAFF_ADMIN_PER(
                                       ADMIN_PER_ID   	int		Not Null,
                                       STAFF_ID	   		int		Not Null,
                                       constraint fk_from_func_admin foreign key (ADMIN_PER_ID )
										references STAFF_ADMIN_PER_FUNC(ID),

                                       constraint fk_from_func_staff foreign key (STAFF_ID)
										references STAFF(ID),

                                       primary key(ADMIN_PER_ID ,STAFF_ID)
);
--  drop table IPETDB.STAFF_ADMIN_PER;

insert into IPETDB.STAFF_ADMIN_PER(ADMIN_PER_ID ,STAFF_ID)values(1,1);

-- 最新消息 --
create table IPETDB.NEWS(
                            ID	    int			 	Not Null primary key auto_increment,
                            TITLE  varchar(100)	Not Null,
                            `TEXT`	varchar	(1000)	Not Null,
                            `TIME`	datetime default current_timestamp on update current_timestamp
);
--  drop table IPETDB.NEWS;

insert into IPETDB.NEWS(TITLE,`TEXT`)values('第一篇文章','安安大家你好鴨');
update IPETDB.NEWS set TITLE = '第零篇文章' where ID = '1';

-- 佳豪的部分 --

-- 建立會員表格 --
create table IPETDB.MEMBER (
                               MEM_ID	    int				Not Null primary key auto_increment,
                               MEM_NAME	varchar	(10)	Not Null,
                               MEM_UID	    varchar	(10)	Not Null,
                               MEM_BTH	    datetime		Not Null,
                               MEM_SEX	    char(1),
                               MEM_EMAIL	varchar	(50)	Not Null,
                               MEM_PHONE	varchar	(10)	Not Null,
                               MEM_TEL	    varchar	(10),
                               MEM_ADD	    varchar	(100)	Not Null,
                               MEM_AC	    varchar	(30)	Not Null,
                               MEM_PW	    varchar	(30)	Not Null,
                               MEM_STATUS	int		        default 0
);
-- drop table IPETDB.MEMBER ;



-- 建立會員資料 --
insert into IPETDB.MEMBER
(MEM_NAME, MEM_UID, MEM_BTH, MEM_SEX, MEM_EMAIL, MEM_PHONE,
 MEM_ADD,MEM_AC,MEM_PW)
values
    ('連大戰','A123443212',STR_TO_DATE('1988-03-19','%Y-%m-%d'),'男','ggyy6969@gmail.com',
     '0923432125','台北市天龍國','ggyy6969','Password1'),
    ('陳大扁','A123344556',STR_TO_DATE('1999-06-09','%Y-%m-%d'),'男','7788ccgg@gmail.com',
     '0912334455','桃園市中壢國','7788ccgg','Password2'),
    ('馬小九','A126786688',STR_TO_DATE('1977-07-08','%Y-%m-%d'),'男','abc8877@gmail.com',
     '0912678668','苗栗國','abc8877','Password'),
    ('蔡筱英','A226699778',STR_TO_DATE('1993-08-07','%Y-%m-%d'),'女','hahaha3838@gmail.com',
     '0922669977','台北市大安區','hahaha3838','Password3'),
    ('連小文','A125556969',STR_TO_DATE('1995-07-11','%Y-%m-%d'),'男','lak14swang@gmail.com',
     '0912555696','新北市林口區','lak14swang','Password4'),
    ('高小安','A123321123',STR_TO_DATE('1994-09-21','%Y-%m-%d'),'女','thank9527@gmail.com',
     '0912332112','台北市天龍國','thank9527','Password5'),
    ('高小瑜','A125566778',STR_TO_DATE('1979-10-18','%Y-%m-%d'),'女','toyzdog@gmail.com',
     '0912556677','台北市天龍國','toyzdog','Password6');

-- 建立寵物表格 --
create table IPETDB.PET (
                            PET_ID   	    int	(10)		Not Null primary key auto_increment,
                            MEM_ID  	    int	(10)	    Not Null,
                            PET_NAME	    varchar	(30)	Not Null,
                            PET_VAR_ID	    varchar (20),
                            PET_SIZE	    varchar (10)    Not Null,
                            PET_GEN	        varchar	(1)	    Not Null,
                            PET_BIRTH	    datetime,
                            PET_STATUS	    varchar	(1)     Not Null,
                            constraint FK_PET_MEMBER
                                foreign key(MEM_ID) references MEMBER(MEM_ID)
);
-- drop table IPETDB.PET ;

-- 建立寵物資料 --
insert into IPETDB.PET
(MEM_ID, PET_NAME, PET_VAR_ID, PET_SIZE, PET_GEN, PET_BIRTH,
 PET_STATUS)
values
    ('1','Micky','米克斯','小型犬','公','2017-01-07','1'),
    ('1','Minnie','吉娃娃','小型犬','母','2019-05-05','1'),
    ('2','Luka','米克斯','大型犬','公','2015-07-07','1'),
    ('3','LuLu','貴賓狗','小型犬','母','2019-08-18','1'),
    ('4','King','柴犬','小型犬','公','2019-05-05','1'),
    ('5','Pinky','法鬥','小型犬','母','2018-06-05','1'),
    ('5','JoJo','黃金獵犬','大型犬','母','2021-03-08','1');

-- 常見問題 --
create table IPETDB.QUES(
                            QUES_ID	    int	(250)	 	Not Null primary key auto_increment,
                            QUES_TITLE  varchar(100)	Not Null,
                            QUES_TEXT	varchar	(1000)	Not Null,
                            QUES_TIME	datetime default current_timestamp on update current_timestamp
);
--  drop table IPETDB.QUES;

insert into IPETDB.QUES(QUES_TITLE,QUES_TEXT)values('常見問題一','回答回答回答');
update IPETDB.QUES set QUES_TITLE = '常見問題零' where QUES_ID = '1';


-- 關婷的部分 --

-- 建立 美容服務類別 表格 --
create table IPETDB.SALON_SERVICE_CATEGORY (
                                               SVC_CATEGORY_ID		int (10)		Not Null primary key auto_increment,
                                               SVC_CATEGORY_NAME	varchar (40)	Not Null,
                                               SVC_CATEGORY_IMG	mediumblob,
                                               SVC_CATEGORY_STATUS	int (1)			Not Null default 1
);
-- drop table IPETDB.SALON_SERVICE_CATEGORY;

-- 建立 美容服務類別 資料 --
insert into IPETDB.SALON_SERVICE_CATEGORY
(SVC_CATEGORY_NAME)
values
    ('基礎美容'),
    ('造型美容'),
    ('頂級SPA'),
    ('深層護理');

-- 建立 美容服務寵物類別 表格 --
create table IPETDB.SALON_SERVICE_PET_TYPE (
                                               TYPE_ID		int (10)		Not Null primary key auto_increment,
                                               TYPE_NAME	varchar (40)	Not Null unique,
                                               PET_SIZE	varchar (10)	Not Null
);
-- drop table IPETDB.SALON_SERVICE_PET_TYPE;

-- 建立 美容服務寵物類別 資料 --
insert into IPETDB.SALON_SERVICE_PET_TYPE
(TYPE_NAME, PET_SIZE)
values
    -- 1-10
    ('短毛米克斯(<10kg)', '小型犬'),
    ('長毛米克斯(<10kg)', '小型犬'),
    ('短毛米克斯(10~20kg)', '中型犬'),
    ('長毛米克斯(10~20kg)', '中型犬'),
    ('短毛米克斯(>20kg)', '大型犬'),
    ('長毛米克斯(>20kg)', '大型犬'),
    ('吉娃娃', '小型犬'),
    ('貴賓狗', '小型犬'),
    ('短毛臘腸', '小型犬'),
    ('長毛臘腸', '小型犬'),
    -- 11-20
    ('瑪爾濟斯', '小型犬'),
    ('博美', '小型犬'),
    ('巴哥', '小型犬'),
    ('牛頭梗', '中型犬'),
    ('柴犬', '中型犬'),
    ('柯基', '中型犬'),
    ('米格魯', '中型犬'),
    ('法鬥', '中型犬'),
    ('拉不拉多', '大型犬'),
    ('邊境牧羊犬', '大型犬'),
    -- 21
    ('黃金獵犬', '大型犬'),
    ('鬆獅犬', '大型犬'),
    ('哈士奇', '大型犬');

-- 建立 美容服務 表格 --
create table IPETDB.SALON_SERVICE (
                                      SVC_ID			int (10)		Not Null primary key auto_increment,
                                      SVC_NAME		varchar (40)	Not Null,
                                      SVC_CONTENT		varchar (500),
                                      SVC_IMG			mediumblob,
                                      SVC_CATEGORY_ID	int (10)		Not Null,
                                      TYPE_ID			int (10)		Not Null,
                                      SVC_PRICE		int (10)		unsigned Not Null,
                                      SVC_STATUS		int (1)			Not Null default 1,
                                      constraint	FK_SALON_SERVICE_TO_CATEGORY foreign key (SVC_CATEGORY_ID)	references SALON_SERVICE_CATEGORY(SVC_CATEGORY_ID),
                                      constraint	FK_SALON_SERVICE_TO_PET_TYPE foreign key (TYPE_ID)			references SALON_SERVICE_PET_TYPE(TYPE_ID)
);
-- drop table IPETDB.SALON_SERVICE;

-- 建立 美容服務 資料 --
insert into IPETDB.SALON_SERVICE
(SVC_NAME, SVC_CONTENT, SVC_CATEGORY_ID, TYPE_ID, SVC_PRICE)
values
    -- id: 1-10
    ('經典洗澡護理', '基礎洗澡+簡單護理，含：剪指甲、清耳朵、小修頭型、小修足緣、剃腳底毛、剃肛門毛擠肛門腺）', '1', '1', '1000'),
    ('經典洗澡護理', '基礎洗澡+簡單護理，含：剪指甲、清耳朵、小修頭型、小修足緣、剃腳底毛、剃肛門毛擠肛門腺）', '1', '2', '1200'),
    ('經典洗澡護理', '基礎洗澡+簡單護理，含：剪指甲、清耳朵、小修頭型、小修足緣、剃腳底毛、剃肛門毛擠肛門腺）', '1', '3', '1600'),
    ('經典洗澡護理', '基礎洗澡+簡單護理，含：剪指甲、清耳朵、小修頭型、小修足緣、剃腳底毛、剃肛門毛擠肛門腺）', '1', '4', '1900'),
    ('經典洗澡護理', '基礎洗澡+簡單護理，含：剪指甲、清耳朵、小修頭型、小修足緣、剃腳底毛、剃肛門毛擠肛門腺）', '1', '5', '2400'),
    ('經典洗澡護理', '基礎洗澡+簡單護理，含：剪指甲、清耳朵、小修頭型、小修足緣、剃腳底毛、剃肛門毛擠肛門腺）', '1', '6', '2800'),
    ('經典洗澡護理', '基礎洗澡+簡單護理，含：剪指甲、清耳朵、小修頭型、小修足緣、剃腳底毛、剃肛門毛擠肛門腺）', '1', '7', '1000'),
    ('經典洗澡護理', '基礎洗澡+簡單護理，含：剪指甲、清耳朵、小修頭型、小修足緣、剃腳底毛、剃肛門毛擠肛門腺）', '1', '8', '1000'),
    ('經典洗澡護理', '基礎洗澡+簡單護理，含：剪指甲、清耳朵、小修頭型、小修足緣、剃腳底毛、剃肛門毛擠肛門腺）', '1', '9', '1000'),
    ('經典洗澡護理', '基礎洗澡+簡單護理，含：剪指甲、清耳朵、小修頭型、小修足緣、剃腳底毛、剃肛門毛擠肛門腺）', '1', '10', '1200'),
    -- id: 11-20
    ('全身造型剪剃', '手剪頭型/電剪剃身體，含快速洗澡服務', '2', '8', '2000'),
    ('全身造型剪剃', '手剪頭型/電剪剃身體，含快速洗澡服務', '2', '9', '2000'),
    ('全身造型剪剃', '手剪頭型/電剪剃身體，含快速洗澡服務', '2', '10', '2200'),
    ('全身造型剪剃', '手剪頭型/電剪剃身體，含快速洗澡服務', '2', '11', '2200'),
    ('全身造型剪剃', '手剪頭型/電剪剃身體，含快速洗澡服務', '2', '14', '2600'),
    ('全身造型剪剃', '手剪頭型/電剪剃身體，含快速洗澡服務', '2', '15', '2800'),
    ('全身造型剪剃', '手剪頭型/電剪剃身體，含快速洗澡服務', '2', '16', '2700'),
    ('全身造型剪剃', '手剪頭型/電剪剃身體，含快速洗澡服務', '2', '21', '4000'),
    ('全身造型剪剃', '手剪頭型/電剪剃身體，含快速洗澡服務', '2', '22', '4500'),
    ('全身造型剪剃', '手剪頭型/電剪剃身體，含快速洗澡服務', '2', '23', '4300'),
    -- id: 21-30
    ('膠原蛋白酵素SPA', '洗澡護理+膠原蛋白酵素SPA 油脂平衡，去角質保濕', '3', '1', '1200'),
    ('膠原蛋白酵素SPA', '洗澡護理+膠原蛋白酵素SPA 油脂平衡，去角質保濕', '3', '2', '1400'),
    ('膠原蛋白酵素SPA', '洗澡護理+膠原蛋白酵素SPA 油脂平衡，去角質保濕', '3', '3', '1800'),
    ('膠原蛋白酵素SPA', '洗澡護理+膠原蛋白酵素SPA 油脂平衡，去角質保濕', '3', '7', '1800'),
    ('膠原蛋白酵素SPA', '洗澡護理+膠原蛋白酵素SPA 油脂平衡，去角質保濕', '3', '17', '1800'),
    ('膠原蛋白酵素SPA', '洗澡護理+膠原蛋白酵素SPA 油脂平衡，去角質保濕', '3', '18', '2000'),
    ('膠原蛋白酵素SPA', '洗澡護理+膠原蛋白酵素SPA 油脂平衡，去角質保濕', '3', '20', '3200'),
    ('膠原蛋白酵素SPA', '洗澡護理+膠原蛋白酵素SPA 油脂平衡，去角質保濕', '3', '23', '3000'),
    ('膠原蛋白酵素SPA', '洗澡護理+法國玫瑰活膚泥SPA 緩敏去濕，皮毛保護', '3', '1', '1100'),
    ('膠原蛋白酵素SPA', '洗澡護理+法國玫瑰活膚泥SPA 緩敏去濕，皮毛保護', '3', '2', '1300'),
    -- id: 31
    ('法國玫瑰活膚泥SPA', '洗澡護理+法國玫瑰活膚泥SPA 緩敏去濕，皮毛保護', '3', '7', '1500');

-- 建立 美容優惠方案 表格 --
create table IPETDB.SALON_SALE (
                                   SALE_ID			int (10)		Not Null primary key auto_increment,
                                   SALE_NAME		varchar (40)	Not Null,
                                   SALE_CONTENT	varchar (500),
                                   START_TIME		datetime		Not Null,
                                   END_TIME		datetime		Not Null
);
-- drop table IPETDB.SALON_SALE;

-- 建立 美容優惠方案 資料 --
insert into IPETDB.SALON_SALE
(SALE_NAME, SALE_CONTENT, START_TIME, END_TIME)
values
    ('歡慶新年，頂級SPA全面95折', '即日起至1/31日預約頂級SPA享95折優惠', '2022-12-25 00:00:00', '2023-01-31 23:59:59'),
    ('歡慶開幕s，多項服務享150元折扣', '即日起至3/31日預約經典洗澡護理、全身造型剪剃折扣150元', '2022-12-25 00:00:00', '2023-03-31 23:59:59'),
    ('3/23小型犬享323元折扣', '歡慶3/23國際小狗日，當日上線預約小型犬全服務享323元折扣', '2022-03-23 00:00:00', '2023-03-23 23:59:59');

-- 建立 美容優惠服務細項 表格 --
create table IPETDB.SALON_SALE_DETAIL (
                                          SALE_ID		int (10)	Not Null,
                                          SVC_ID		int (10)	Not Null,
                                          SALE_PRICE	int (10)	unsigned Not Null,
                                          primary key	(SALE_ID, SVC_ID),
                                          constraint	FK_SALON_SALE_DETAIL_TO_SALE	foreign key (SALE_ID)	references SALON_SALE(SALE_ID),
                                          constraint	FK_SALON_SALE_DETAIL_TO_SERVICE	foreign key (SVC_ID)	references SALON_SERVICE(SVC_ID)
);
-- drop table IPETDB.SALON_SALE_DETAIL;

-- 建立 美容優惠服務細項 資料 --
insert into IPETDB.SALON_SALE_DETAIL
(SALE_ID, SVC_ID, SALE_PRICE)
values
    -- 頂級SPA優惠
    ('1', '21', '1140'),
    ('1', '22', '1330'),
    ('1', '23', '1710'),
    ('1', '24', '1710'),
    ('1', '25', '1710'),
    ('1', '26', '1900'),
    ('1', '27', '3040'),
    ('1', '28', '2850'),
    ('1', '31', '1425'),
    -- 經典洗澡護理優惠、全身造型剪剃
    ('2', '1', '850'),
    ('2', '2', '1050'),
    ('2', '3', '1450'),
    ('2', '4', '1750'),
    ('2', '5', '2250'),
    ('2', '6', '2650'),
    ('2', '7', '850'),
    ('2', '8', '850'),
    ('2', '9', '850'),
    ('2', '10', '1050'),
    ('2', '11', '1850'),
    ('2', '12', '1850'),
    ('2', '13', '2050'),
    ('2', '14', '2050'),
    ('2', '15', '2450'),
    ('2', '16', '2650'),
    ('2', '17', '2550'),
    ('2', '18', '3850'),
    ('2', '19', '4350'),
    ('2', '20', '4150'),
    -- 3/23小型犬享323元折扣
    ('3', '1', '677'),
    ('3', '2', '877'),
    ('3', '7', '677'),
    ('3', '8', '677'),
    ('3', '9', '677'),
    ('3', '10', '877'),
    ('3', '11', '1677'),
    ('3', '12', '1677'),
    ('3', '13', '1877'),
    ('3', '14', '1877'),
    ('3', '21', '877'),
    ('3', '22', '1077');

-- 育菁的部分 --
-- 建立 美容員工班表 表格 --
CREATE TABLE IF NOT EXISTS IPETDB.SALON_SCHEDULE(
                                                    SCH_ID		INT (10)  NOT NULL  AUTO_INCREMENT,
                                                    SCH_DATE    DATE NOT NULL,
                                                    SCH_PERIOD  VARCHAR(10) NOT NULL,
                                                    GROOMER_ID  INT (10)  NOT NULL,
                                                    ASST_ID_1   INT (10)  NOT NULL,
                                                    ASST_ID_2   INT (10)  NOT NULL,
                                                    EMPLOYEE_NOTE  VARCHAR(500),
                                                    CONSTRAINT pk_SCH_ID PRIMARY KEY (SCH_ID),
                                                    CONSTRAINT fk_GROOMER_ID FOREIGN KEY (GROOMER_ID) REFERENCES IPETDB.STAFF(ID),
                                                    CONSTRAINT fk_ASST_ID_1 FOREIGN KEY (ASST_ID_1) REFERENCES IPETDB.STAFF(ID),
                                                    CONSTRAINT fk_ASST_ID_2 FOREIGN KEY (ASST_ID_2) REFERENCES IPETDB.STAFF(ID)
);
-- drop table IPETDB.SALON_SCHEDULE;

-- 建立 美容員工班表 資料 --
INSERT INTO  IPETDB.SALON_SCHEDULE (SCH_DATE, SCH_PERIOD, GROOMER_ID, ASST_ID_1, ASST_ID_2, EMPLOYEE_NOTE)
VALUES ('2022-12-26', '上午', 1, 3, 4, '王曉明負責開門，記得早點到!'),
       ('2022-12-26', '晚上', 1, 3, 4, '陳大壯負責關門'),
       ('2022-12-26', '晚上', 2, 6, 7, ''),

       ('2022-12-27', '上午', 2, 5, 7, '吳小宏負責開門，王小美要先處理垃圾'),
       ('2022-12-27', '上午', 1, 3, 6, ''),
       ('2022-12-27', '下午', 2, 5, 7, ''),
       ('2022-12-27', '下午', 1, 3, 6, ''),
       ('2022-12-27', '晚上', 2, 5, 7, ''),
       ('2022-12-27', '晚上', 1, 3, 4, '王曉明負責關門'),

       ('2022-12-29', '上午', 1, 3, 5, '陳大壯負責開門'),
       ('2022-12-29', '上午', 2, 4, 7, '蕭小豪請假，張小菁代班'),
       ('2022-12-29', '下午', 2, 4, 7, '蕭小豪請假，張小菁代班'),
       ('2022-12-29', '下午', 1, 5, 6, '關小婷負責關門'),

       ('2023-01-02', '上午', 1, 4, 7, '王曉明負責開門'),
       ('2022-01-02', '上午', 2, 3, 5, ''),
       ('2023-01-02', '下午', 1, 4, 7, ''),
       ('2022-01-02', '下午', 2, 3, 5, ''),
       ('2023-01-02', '晚上', 1, 4, 7, ''),
       ('2022-01-02', '晚上', 2, 3, 5, '王曉明負責關門'),

       ('2023-01-03', '上午', 1, 4, 7, '王曉明負責開門'),
       ('2022-01-03', '上午', 2, 3, 5, ''),
       ('2023-01-03', '下午', 1, 4, 7, ''),
       ('2022-01-03', '下午', 2, 3, 5, ''),
       ('2023-01-03', '晚上', 1, 4, 7, ''),
       ('2022-01-03', '晚上', 2, 3, 5, '王曉明負責關門'),

       ('2023-01-04', '上午', 1, 6, 5, '王曉明負責開門'),
       ('2022-01-04', '上午', 2, 4, 7, ''),
       ('2023-01-04', '下午', 1, 3, 5, ''),
       ('2022-01-04', '下午', 2, 4, 7, '蕭小豪請假，張小菁代班'),
       ('2023-01-04', '晚上', 1, 6, 3, ''),

       ('2023-01-05', '上午', 1, 4, 7, '王曉明負責開門'),
       ('2022-01-05', '上午', 2, 3, 5, ''),
       ('2023-01-05', '下午', 1, 4, 7, ''),
       ('2022-01-05', '下午', 2, 5, 6, '王小美負責關門'),


       ('2023-01-09', '上午', 1, 6, 5, '王曉明負責開門'),
       ('2022-01-09', '上午', 2, 4, 7, ''),
       ('2023-01-09', '下午', 1, 3, 5, ''),
       ('2022-01-09', '下午', 2, 4, 7, '蕭小豪請假，張小菁代班'),
       ('2023-01-09', '晚上', 1, 6, 3, ''),
       ('2022-01-09', '晚上', 2, 4, 7, '張小菁負責關門')
;



-- 建立 美容預約單 表格 --
CREATE TABLE IF NOT EXISTS IPETDB.SALON_APPOINTMENT (
                                                        APM_ID		INT (10)  NOT NULL  AUTO_INCREMENT,
                                                        APM_STATUS	INT (1)	 NOT NULL,
                                                        MEM_ID INT(10) NOT NULL,
                                                        PET_ID INT(10) NOT NULL,
                                                        SCH_ID INT(10) NOT NULL,
                                                        APM_BUILD_TIME TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                                        CUSTOMER_NOTE VARCHAR(400),
                                                        TOTAL_PRICE INT(10) Not Null,
                                                        CONSTRAINT pk_APM_ID PRIMARY KEY (APM_ID),
                                                        CONSTRAINT fk_MEM_ID FOREIGN KEY (MEM_ID) REFERENCES IPETDB.MEMBER(MEM_ID),
                                                        CONSTRAINT fk_PET_ID FOREIGN KEY (PET_ID) REFERENCES IPETDB.PET(PET_ID),
                                                        CONSTRAINT fk_SCH_ID FOREIGN KEY (SCH_ID) REFERENCES IPETDB.SALON_SCHEDULE(SCH_ID)


);
-- drop table IPETDB.SALON_APPOINTMENT;

-- 建立 美容預約單 資料 --
INSERT INTO IPETDB.SALON_APPOINTMENT (APM_STATUS, MEM_ID, PET_ID, SCH_ID, APM_BUILD_TIME, CUSTOMER_NOTE, TOTAL_PRICE)
VALUES
    -- 2022-12-26
    ('1', 1, 1, 1, '2022-11-20 14:12:10', 'Micky 比較過動，需要用零食吸引注意力', 850),
    ('2', 2, 3, 2, '2022-11-11 16:23:47', 'Luka怕生', 2650),
    ('1', 5, 6, 3, '2022-12-13 08:50:09', 'Pinky會咬人喔!', 1900),

    -- 2022-12-27
    ('1', 5, 7, 4, '2022-12-13 07:12:56', 'JoJo KoNoDioDa', 3850),
    ('1', 3, 4, 5, '2022-11-29 19:56:24', 'LuLu!', 1850),
    ('3', 5, 6, 8, '2022-12-20 13:25:41', '', 1900),
    ('1', 4, 5, 9, '2022-12-01 02:14:05', 'King!', 2650),

    -- 2022-12-29
    ('0', 1, 1, 10, '2022-12-12 09:08:04', '', 850),
    ('0', 3, 4, 11, '2022-12-26 12:04:03', 'LuLu', 1850),
    ('0', 1, 2, 12, '2022-12-09 15:16:32', 'Minnie!', 3135),

    -- 2023-01-03
    ('0', 2, 3, 20, '2022-12-28 11:14:12', '', 2650);



-- 建立 美容預約單明細 表格 --
CREATE TABLE IF NOT EXISTS IPETDB.SALON_APPOINTMENT_DETAIL(
                                                              APM_ID		INT (10)  NOT NULL,
                                                              SVC_ID        INT (10)  NOT NULL,
                                                              SALE_ID       INT (10),
                                                              SVC_PRICE     INT (10)  UNSIGNED NOT NULL,
                                                              SALE_PRICE    INT (10)  UNSIGNED NOT NULL,
                                                              CONSTRAINT pk_APM_ID_SVC_ID PRIMARY KEY (APM_ID, SVC_ID),
                                                              CONSTRAINT fk_SALE_ID FOREIGN KEY (SALE_ID) REFERENCES IPETDB.SALON_SALE(SALE_ID),
                                                              CONSTRAINT fk_APM_ID FOREIGN KEY (APM_ID) REFERENCES IPETDB.SALON_APPOINTMENT(APM_ID),
                                                              CONSTRAINT fk_SVC_ID FOREIGN KEY (SVC_ID) REFERENCES IPETDB.SALON_SERVICE(SVC_ID)
);
-- drop table IPETDB.SALON_APPOINTMENT_DETAIL;


-- 建立 美容預約單明細 資料 --
INSERT INTO IPETDB.SALON_APPOINTMENT_DETAIL(APM_ID, SVC_ID, SALE_ID, SVC_PRICE, SALE_PRICE)
VALUES (1, 1, 2, 1000, 850),
       (2, 6, 2, 2800, 2650),
       (3, 26, 1, 2000, 1900),
       (4, 18, 2, 4000, 3850),
       (5, 11, 2, 2000, 1850),
       (6, 26, 1, 2000, 1900),
       (7, 16, 2, 2800, 2650),
       (8, 1, 2, 1000, 850),
       (9, 11, 2, 2000, 1850),
       (10, 24, 1, 1800, 1710),
       (10, 31, 1, 1500, 1425),
       (11, 6, 2, 2800, 2650);

-- 建立寵物房型表格 --
create table IPETDB.ROOM_TYPE (
ROOM_TYPE_ID   	  		int	(10)				Not Null primary key auto_increment,
ROOM_AMOUNT  	 		int	(10)	  			Not Null,
ROOM_TYPE_NAME	    	varchar	(10)			Not Null,
ROOM_TYPE_CONTENT	    varchar (1000) 			Not Null,
ROOM_TPYE_PRICE			int(10)					Not Null,
ROOM_TYPE_STATUS	    int(1)  				Not Null		default 0
);
-- drop table IPETDB.PET_ROOM_TYPE ;

-- 建立寵物房型資料 --  
insert into IPETDB.ROOM_TYPE 
(ROOM_AMOUNT, ROOM_TYPE_NAME, ROOM_TYPE_CONTENT,ROOM_TPYE_PRICE)
values
(10,'小型犬房','10公斤以下的狗狗',1050),
(15,'中型犬房','10~30公斤的狗狗',1350),
(10,'大型犬房','30公斤以上的狗狗',1750),
(20,'貓咪房','0',800);

-- 建立房型圖片表格 --
create table IPETDB.ROOM_TYPE_PHOTO (
ROOM_TYPE_PHOTO_ID   	  	int	(10)				Not Null primary key auto_increment,
ROOM_TYPE_ID  	 			int	(10)	  			Not Null,
ROOM_TYPE_PHOTO	    		blob,
constraint	FK_ROOM_TYPE_PHOTO_TO_ROOM_TYPE	foreign key (ROOM_TYPE_ID)	references ROOM_TYPE(ROOM_TYPE_ID)
);
-- drop table IPETDB.ROOM_TYPE_PHOTO ;

-- 建立房型圖片資料 --  
insert into IPETDB.ROOM_TYPE_PHOTO 
(ROOM_TYPE_ID)
values
(1),
(1),
(2),
(2),
(3),
(4),
(4),
(4);

-- 建立房型預定表表格 --
create table IPETDB.ROOM_TYPE_SCHEDULE (
ROOM_TYPE_SCHEDULE_ID   	  	int	(10)				Not Null primary key auto_increment,
ROOM_TYPE_ID  	 				int	(10)	  			Not Null,
ROOM_TYPE_SCHEDULE_DATE	    	date					Not Null,
ROOM_AMOUNT	 					int	(10)				Not Null,
ROOM_BOOKED_AMOUNT	 			int	(10)  				Not Null		default 0,
constraint	FK_ROOM_TYPE_SCHEDULE_TO_ROOM_TYPE	foreign key (ROOM_TYPE_ID)	references ROOM_TYPE(ROOM_TYPE_ID)
);
-- drop table IPETDB.ROOM_TYPE_SCHEDULE ;

-- 建立房型預定表資料 --  
insert into IPETDB.ROOM_TYPE_SCHEDULE
(ROOM_TYPE_ID,ROOM_TYPE_SCHEDULE_DATE,ROOM_AMOUNT)
values
(1,'2022-12-25',10),
(1,'2022-12-26',10),
(2,'2022-12-25',15),
(2,'2022-12-26',15),
(3,'2022-12-25',10),
(3,'2022-12-26',10),
(4,'2022-12-25',20),
(4,'2022-12-26',20);

-- 建立寵物房間表格 --
create table IPETDB.ROOM (
ROOM_ID   	  			int	(10)		Not Null primary key auto_increment,
ROOM_TYPE_ID  	 		int	(10)		Not Null,
PET_ID	    			int	(10),
MEM_ID	 				int	(10),
ROOM_CHECK_STATUS		int	(1)  		Not Null		default 0,
ROOM_SALE_STATUS		int	(1)			Not Null		default 0,
constraint	FK_ROOM_TO_ROOM_TYPE foreign key (ROOM_TYPE_ID)	references ROOM_TYPE(ROOM_TYPE_ID),
constraint	FK_ROOM_TO_PET foreign key (PET_ID) references PET(PET_ID),
constraint	FK_ROOM_TO_MEMBER foreign key (MEM_ID)	references MEMBER(MEM_ID)
);
-- drop table IPETDB.ROOM;

-- 建立寵物房間資料 --  
insert into IPETDB.ROOM
(ROOM_TYPE_ID,PET_ID,MEM_ID,ROOM_CHECK_STATUS)
values
(1,3,2,1),
(1,1,1,1),
(2,6,5,2),
(4,7,5,1);
insert into IPETDB.ROOM
(ROOM_TYPE_ID)
values
(2),
(3),
(3),
(4);

-- 建立住宿優惠方案表格 --
create table IPETDB.ROOM_DISCOUNT (
DISCOUNT_ID   	  		int	(10)			Not Null primary key auto_increment,
DISCOUNT_NAME  	 		varchar	(40)		Not Null,
DISCOUNT_CONTENT		varchar	(1000)		Not Null,
START_TIME	 			date				Not Null,
END_TIME				date  				Not Null
);
-- drop table IPETDB.ROOM_DISCOUNT;

-- 建立住宿優惠方案資料 --  
insert into IPETDB.ROOM_DISCOUNT
(DISCOUNT_NAME,DISCOUNT_CONTENT,START_TIME,END_TIME)
values
('歡慶哆啦A夢生日，貓咪房大大大優惠','為了慶祝哆啦A夢9/3的生日，在9/3當天入住貓咪房全面打八折！！','2021-09-03','2021-09-03'),
('老闆威力彩中頭獎，優惠特價大放送','老闆中頭獎財富自由了，錢什麼的都不重要了，為了分享快樂給各個愛貓愛狗人士，整個十月份寵物入住一晚只要一元，快來沾沾老闆的好運吧！','2022-10-01','2022-10-01'),
('迎接狗年，狗狗房破盤大特價','12年一度的狗年又要到了，迎接屬於狗的年份真開心，在接下來的一年狗狗房全面九五折！！','2018-01-01','2018-12-31');

-- 建立住宿訂單表格 --
create table IPETDB.ROOM_ORDER (
ROOM_ORDER_ID   	  			int	(10)		Not Null primary key auto_increment,
MEM_ID  	 					int	(10)		Not Null,
PET_ID							int	(10)		Not Null,
ROOM_TYPE_ID	 				int	(10)		Not Null,
ROOM_ID							int	(10)  		Not Null,
DISCOUNT_ID						int	(10),
ORDER_TIME						datetime		default current_timestamp,
EXPECTED_CHECK_IN_DATE			datetime		Not Null,
EXPECTED_CHECK_OUT_DATE			datetime		Not Null,
EXPECTED_DAYS_OF_STAY			int	(10)		Not Null,
ACTUAL_CHECK_IN_DATE			datetime,
ACTUAL_CHECK_OUT_DATE			datetime,
ACTUAL_DAYS_OF_STAY				int	(10),
ROOM_ORDER_STATUS				int	(1)			default 0,
TOTAL_PRICE						int	(10)		Not Null,
constraint	FK_ROOM_ORDER_TO_MEMBER foreign key (MEM_ID) references MEMBER(MEM_ID),
constraint	FK_ROOM_ORDER_TO_PET foreign key (PET_ID) references PET(PET_ID),
constraint	FK_ROOM_ORDER_TO_ROOM_TYPE foreign key (ROOM_TYPE_ID) references ROOM_TYPE(ROOM_TYPE_ID),
constraint	FK_ROOM_ORDER_TO_ROOM foreign key (ROOM_ID) references ROOM(ROOM_ID),
constraint	FK_ROOM_ORDER_TO_ROOM_DISCOUNT foreign key (DISCOUNT_ID) references ROOM_DISCOUNT(DISCOUNT_ID)
);
-- drop table IPETDB.ROOM_ORDER;

-- 建立住宿訂單資料 --  
insert into IPETDB.ROOM_ORDER
(MEM_ID,PET_ID,ROOM_TYPE_ID,ROOM_ID,DISCOUNT_ID,EXPECTED_CHECK_IN_DATE,EXPECTED_CHECK_OUT_DATE,EXPECTED_DAYS_OF_STAY,TOTAL_PRICE)
values
(2,3,1,1,3,'2018-03-26 20:00:00','2018-03-27 11:00:00',1,998),
(5,7,4,4,1,'2020-09-03 21:00:00','2020-09-03 10:00:00',1,640),
(5,6,2,3,2,'2022-10-03 20:30:00','2022-10-06 09:00:00',3,3);

-- 宏熹的部分 --
-- 建立商品類型表格 -- 
create table IPETDB.PRODUCT_TYPE(
TYPE_ID   int         Not Null primary key auto_increment,
TYPE_NAME varchar(10) Not Null unique
);
-- drop table IPETDB.PRODUCT_TYPE;

insert into IPETDB.PRODUCT_TYPE (TYPE_NAME) values ("貓咪飼料");
insert into IPETDB.PRODUCT_TYPE (TYPE_NAME) values ("狗狗飼料");
insert into IPETDB.PRODUCT_TYPE (TYPE_NAME) values ("貓咪用品");
insert into IPETDB.PRODUCT_TYPE (TYPE_NAME) values ("狗狗用品");
-- select * from IPETDB.PRODUCT_TYPE;

-- 建立商品表格 -- 
create table IPETDB.PRODUCT(
PROD_ID          int            Not Null primary key auto_increment,
PROD_NAME        varchar(10)    Not Null,
PROD_PRICE       int  unsigned  Not Null,
ADDED_TIME       datetime default current_timestamp on update current_timestamp,
PROD_DESCRIPTION varchar(225),
PROD_STATUS      int unsigned default 0,
TYPE_ID          int            Not Null,
constraint product_product_type foreign key (TYPE_ID) references product_type(TYPE_ID)
);
-- drop table IPETDB.PRODUCT;

insert into IPETDB.PRODUCT (PROD_NAME,PROD_PRICE,PROD_DESCRIPTION,TYPE_ID)
values("無榖配方貓飼料",300,"90%優質動物肉含量",1);
insert into IPETDB.PRODUCT (PROD_NAME,PROD_PRICE,PROD_DESCRIPTION,TYPE_ID)
values("低卡保健配方",100,"全天然雞肉蛋白質",2);
insert into IPETDB.PRODUCT (PROD_NAME,PROD_PRICE,PROD_DESCRIPTION,TYPE_ID)
values("光點逗貓神器",499,"三種逗寵模式",3);
-- select * from IPETDB.PRODUCT;

-- 建立收藏清單表格 -- 
create table IPETDB.WISH_LIST(
MEM_ID  int Not Null,
PROD_ID int Not Null,
primary key(MEM_ID,PROD_ID),
constraint WISH_LIST_MEMBER foreign key (MEM_ID)  references MEMBER (MEM_ID),
constraint WISH_LIST_PRODUCT foreign key (PROD_ID)  references PRODUCT (PROD_ID)
);
-- drop table IPETDB.WISH_LIST;

insert into IPETDB.WISH_LIST (MEM_ID,PROD_ID) values (1,1);
insert into IPETDB.WISH_LIST (MEM_ID,PROD_ID) values (2,2);
-- select * from IPETDB.WISH_LIST;

-- 建立購物車表格 -- 
create table IPETDB.CART_LIST(
MEM_ID  int Not Null,
PROD_ID int Not Null,
primary key(MEM_ID,PROD_ID),
constraint CART_LIST_MEMBER foreign key (MEM_ID)  references MEMBER (MEM_ID),
constraint CART_LIST_PRODUCT foreign key (PROD_ID)  references PRODUCT (PROD_ID)
);
-- drop table IPETDB.CART_LIST; 

insert into IPETDB.CART_LIST (MEM_ID,PROD_ID) values (3,2);
insert into IPETDB.CART_LIST (MEM_ID,PROD_ID) values (4,3);
-- select * from IPETDB.CART_LIST;

-- 承憲的部分 --
-- 建立 商品圖片 表格 --
create table IPETDB.PRODUCT_IMG(
								IMG_ID		int	 Not Null  primary key  auto_increment,
                                IMG_FILE	longblob,
								PROD_ID		int,
                                constraint FK_PRODUCTIMG_PRODUCT foreign key (PROD_ID) references IPETDB.PRODUCT(PROD_ID)
);
-- drop table IPETDB.PRODUCT_IMG;

-- 建立 商品圖片 資料 --
insert into IPETDB.PRODUCT_IMG (PROD_ID)
values	(1),
		(2),
        (3)
	-- 商品圖片資料建立完成後，請先至 IMG_FILE 欄位按右鍵，選擇 Load Value From File 隨意新增照片，此欄位目前預設可以 null--
        ;

-- 建立 商品訂單 表格 --
create table IPETDB.ORDER_MASTER(
								ORDER_ID			int  Not Null  primary key  auto_increment,
								MEM_ID				int  Not Null,
                                ORDER_SUM			int  Not Null,
                                ORDER_DATE			datetime  default current_timestamp,
                                ORDER_STATUS		int  Not Null  default 0,
                                ORDER_REC_NAME		varchar(10)  Not Null,
                                ORDER_REC_PHONE		varchar(10)  Not Null,
                                ORDER_REC_ADDRESS	varchar(100)  Not Null,
                                constraint FK_ORDERMASTER_MEMBER foreign key (MEM_ID) references IPETDB.MEMBER(MEM_ID)
);
-- drop table IPETDB.ORDER_MASTER;

-- 建立 商品訂單 資料 --
insert into IPETDB.ORDER_MASTER (MEM_ID, ORDER_SUM, ORDER_STATUS, ORDER_REC_NAME, ORDER_REC_PHONE, ORDER_REC_ADDRESS)
values	(1, 100, 0, '連大戰', '0923432125', '台北市天龍國'),
		(2, 200, 2, '陳大扁', '0912334455', '桃園市中壢國'),
        (7, 300, 0, '高小瑜', '0912556677', '台北市天龍國'),
        (5, 599, 2, '連小文', '0912555696', '新北市林口區'),
        (6, 799, 0, '高小安', '0912332112', '台北市天龍國'),
	
    -- 購買人 != 收件人 --
        (2, 9000, 2, '吾叔真', '0987878787', '台北市信義區'),
        (2, 6000, 2, '吾叔真', '0987878787', '台北市信義區'),
        (2, 6000, 2, '吾叔真', '0987878787', '台北市信義區'),
        (2, 3000, 2, '吾叔真', '0987878787', '台北市信義區'),
        (2, 4000, 2, '吾叔真', '0987878787', '台北市信義區');

-- 建立 商品訂單明細 表格 --
create table IPETDB.ORDER_DETAIL(
								ORDER_ID		int  Not Null,
                                PROD_ID			int  Not Null,
                                DETAIL_QUANTITY	int  Not Null,
                                DETAIL_PRICE	int  Not Null,
                                constraint PK_ORDERID_PRODID primary key (ORDER_ID, PROD_ID),
                                constraint FK_ORDERDETAIL_ORDERMASTER foreign key (ORDER_ID) references ORDER_MASTER(ORDER_ID),
                                constraint FK_ORDERDETAIL_PRODUCT foreign key (PROD_ID) references PRODUCT(PROD_ID)
);
-- drop table IPETDB.ORDER_DETAIL;

-- 建立 商品訂單明細 資料 --
insert into IPETDB.ORDER_DETAIL (ORDER_ID, PROD_ID, DETAIL_QUANTITY, DETAIL_PRICE)
values	(1, 2, 1, 100),
		(2, 2, 2, 100),
        (3, 2, 3, 100),
        (4, 2, 1, 100),
        (4, 3, 1, 499),
        (5, 2, 3, 100),
        (5, 3, 1, 499),
        (6, 1, 30, 300),
        (7, 1, 20, 300),
        (8, 1, 10, 300),
        (8, 2, 30, 100),
        (9, 1, 10, 300),
        (10, 1, 10, 300),
        (10, 2, 10, 100);        

-- 建立 退貨訂單 表格 --
create table IPETDB.ORDER_RETURN(
								RETURN_ID			int  Not Null  primary key  auto_increment,
                                ORDER_ID			int  Not Null,
                                RETURN_APPLY_DATE	datetime  default current_timestamp,
                                RETURN_STATUS		int  Not Null  default 0,
                                constraint FK_ORDERRETURN_ORDERMASTER foreign key (ORDER_ID) references ORDER_MASTER(ORDER_ID)
);
-- drop table IPETDB.ORDER_RETURN;

-- 建立 退貨訂單 資料 --
insert into IPETDB.ORDER_RETURN (ORDER_ID)
	-- 陳大扁申請退貨商品 (ORDER_ID = 2) --
values	(2),
	-- 連小文申請退貨商品 (ORDER_ID = 4) --
		(4);
        
-- 陳大扁退貨審核成功 (ORDER_ID = 2)，修改 ORDER_RETURN & ORDER_MASTER 表格的 STATUS 欄位 --
update IPETDB.ORDER_RETURN set RETURN_STATUS = 1 where ORDER_ID = 2;
update IPETDB.ORDER_MASTER set ORDER_STATUS = 3 where ORDER_ID = 2;