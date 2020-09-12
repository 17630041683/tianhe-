SET NAMES UTF8;
DROP DATABASE IF EXISTS jewelry;
CREATE DATABASE jewelry CHARSET=UTF8;
USE jewelry;

-- 创建表格
-- 轮播图
CREATE TABLE jewelry_slideshow(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  image VARCHAR(50) DEFAULT NULL,
  title VARCHAR(64),  #标题文字
  aid INT
);

-- 插入轮播图数据
INSERT INTO jewelry_slideshow VALUES(null,"../../public/img/index/lunbo1.png","商品概述",1);
INSERT INTO jewelry_slideshow VALUES(null,"../../public/img/index/lunbo2.png","商品概述",2);
INSERT INTO jewelry_slideshow VALUES(null,"../../public/img/index/lunbo3.png","商品概述",3);


-- 1、首页五张图片
CREATE TABLE jewelry_fiveimage(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname CHAR(5) DEFAULT NULL,
  image VARCHAR(50) DEFAULT NULL,
  aid INT
);

-- 插入首页五张图片数据
INSERT INTO jewelry_fiveimage VALUES(null,"手镯","five1.png",1);
INSERT INTO jewelry_fiveimage VALUES(null,"耳坠","five2.png",2);
INSERT INTO jewelry_fiveimage VALUES(null,"项链","five3.png",3);
INSERT INTO jewelry_fiveimage VALUES(null,"吊坠","five4.png",4);
INSERT INTO jewelry_fiveimage VALUES(null,"钻戒","five5.png",5);


-- 2、首页四张图片
CREATE TABLE jewelry_fourimage(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  fname CHAR(5) DEFAULT NULL,
  image VARCHAR(50) DEFAULT NULL,
  aid INT
);

-- 插入首页四张图片数据
INSERT INTO jewelry_fourimage VALUES(null,"项链","four1.jpg",3);
INSERT INTO jewelry_fourimage VALUES(null,"戒指","four2.jpg",5);
INSERT INTO jewelry_fourimage VALUES(null,"花式戒指","four3.jpg",4);
INSERT INTO jewelry_fourimage VALUES(null,"花式集","four4.jpg",1);


-- 3、首页三张大图片
CREATE TABLE jewelry_bthreeimage(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname CHAR(5) DEFAULT NULL,
  title VARCHAR(64),
  image VARCHAR(50) DEFAULT NULL,
  aid INT
);

-- 插入首页三张大图片数据
INSERT INTO jewelry_bthreeimage VALUES(null,"Paraiba碧玺","这是一个理想的外观或任何场合的礼物","diamond3.jpg",6);
INSERT INTO jewelry_bthreeimage VALUES(null,"塞特吊坠","这是一个理想的外观或任何场合的礼物","diamond1.jpg",4);
INSERT INTO jewelry_bthreeimage VALUES(null,"Akoya珍珠钻石","这是一个理想的外观或任何场合的礼物","gem1.jpg",5);


-- 4、首页三张小图片
CREATE TABLE jewelry_sthreeimage(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  wname CHAR(5) DEFAULT NULL,
  fname CHAR(5) DEFAULT NULL,
  title VARCHAR(64),
  subtitle VARCHAR(64),
  image VARCHAR(50) DEFAULT NULL,
  aid INT,
  jewelry_id smallint(5) NOT NULL
);

-- 插入首页三张小图片数据
INSERT INTO jewelry_sthreeimage VALUES(null,"乌诺","钻戒","H3063","Diamants Légers","diamond2.jpg",5,"18");
INSERT INTO jewelry_sthreeimage VALUES(null,"乌诺","钻戒","H3063","Cartier d'Amour","diamond4.jpg",5,"20");
INSERT INTO jewelry_sthreeimage VALUES(null,"乌诺","钻戒","H3063","Ballerine","diamond5.jpg",5,"21");


-- 珠宝列表
CREATE TABLE IF NOT EXISTS jewelry_name (
    did int not null auto_increment PRIMARY KEY,
    dname VARCHAR(50) not null COMMENT '珠宝名称'
)ENGINE=INNODB DEFAULT charset utf8;
-- 插入珠宝数据
INSERT INTO `jewelry_name` VALUES ('1', '手镯');
INSERT INTO `jewelry_name` VALUES ('2', '耳坠');
INSERT INTO `jewelry_name` VALUES ('3', '项链');
INSERT INTO `jewelry_name` VALUES ('4', '吊坠');
INSERT INTO `jewelry_name` VALUES ('5', '钻戒');


-- 商品列表description--描述subject--主题
CREATE TABLE jewelry_list(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  family_id smallint(5) NOT NULL,
  subject VARCHAR(32),
  description VARCHAR(32),
  image VARCHAR(30),
  jewelry_id smallint(5) NOT NULL
);

-- 插入商品列表数据
-- 手镯
INSERT INTO jewelry_list VALUES(null,1,"Akoya钻石","种质细腻通透，颜色鲜阳纯正","gem1.jpg",1);
INSERT INTO jewelry_list VALUES(null,1,"QUATTRO","佩戴翡翠的女子，让人揣想，让人惦念","diamond1.jpg",2);

-- 耳坠
INSERT INTO jewelry_list VALUES(null,2,"金累丝灯笼耳坠","你喜欢耳环一黑一白","necklace2.jpg",3);
INSERT INTO jewelry_list VALUES(null,2,"金玉寿字耳坠","而我喜欢你","necklace1.jpg",4);

-- 珍珠项链
INSERT INTO jewelry_list VALUES(null,3,"珍珠米粒项链","原本都是一粒沙","pearl1.jpg",5);
INSERT INTO jewelry_list VALUES(null,3,"纯天然玛瑙项链","被人宠爱","pearl2.jpg",6);
INSERT INTO jewelry_list VALUES(null,3,"兰格格珍珠项链","所以才变得珍贵","pearl3.jpg",7);
INSERT INTO jewelry_list VALUES(null,3,"近正圆珍珠项链","岁月打磨","pearl4.jpg",8);
INSERT INTO jewelry_list VALUES(null,3,"佧瑞麒珍珠项链","终成珍珠","pearl5.jpg",9);
INSERT INTO jewelry_list VALUES(null,3,"巴洛克珍珠项链","我爱你","pearl6.jpg",10);

-- 吊坠
INSERT INTO jewelry_list VALUES(null,4,"海豚湾之恋","听弦断","necklace1.jpg",11);
INSERT INTO jewelry_list VALUES(null,4,"遇见幸福","断那三千痴缠","necklace2.jpg",12);
INSERT INTO jewelry_list VALUES(null,4,"沁心之恋","坠花湮","necklace3.jpg",13);
INSERT INTO jewelry_list VALUES(null,4,"真爱玫瑰","湮没一朝风涟","necklace4.jpg",14);
INSERT INTO jewelry_list VALUES(null,4,"爱的记忆","花若怜","necklace5.jpg",15);
INSERT INTO jewelry_list VALUES(null,4,"皇冠项链","落在谁的指尖","necklace6.jpg",16);

-- 钻戒
INSERT INTO jewelry_list VALUES(null,5,"Cartier d'Amour","恋人絮语","diamond1.jpg",17);
INSERT INTO jewelry_list VALUES(null,5,"Diamants Légers","简单爱","diamond2.jpg",18);
INSERT INTO jewelry_list VALUES(null,5,"Cartier d'Amour","玫瑰情","diamond3.jpg",19);
INSERT INTO jewelry_list VALUES(null,5,"Cartier d'Amour","坚贞","diamond4.jpg",20);
INSERT INTO jewelry_list VALUES(null,5,"Ballerine","真挚","diamond5.jpg",21);
INSERT INTO jewelry_list VALUES(null,5,"Logo de Cartier","爱情","diamond6.jpg",22);
INSERT INTO jewelry_list VALUES(null,5,"Logo de Chfghfg","璀璨","diamond7.jpg",23);

-- 宝石
INSERT INTO jewelry_list VALUES(null,6,"蓝宝石","你是我温暖的手套","gem2.jpg",24);
INSERT INTO jewelry_list VALUES(null,6,"红宝石","冰冷的啤酒","gem3.jpg",25);
INSERT INTO jewelry_list VALUES(null,6,"绿宝石","带着阳光味道的衬衫","gem4.jpg",26);
INSERT INTO jewelry_list VALUES(null,6,"海洋之心","日复一日的梦想","gem5.jpg",27);
INSERT INTO jewelry_list VALUES(null,6,"太阳之心","我爱你","gem6.jpg",28);





-- 商品详细数据
CREATE TABLE jewelry_detail(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128), #主标题
  subtitle VARCHAR(128),#副标题
  price DECIMAL(10,2),
  image VARCHAR(30),
  jewelry_id smallint(5) NOT NULL
);

-- 插入商品详细数据
INSERT INTO jewelry_detail VALUES
(null,"H031","Akoya钻石",15987.00,"gem1.jpg",1),
(null,"H032","QUATTRO",18527.00,"diamond1.jpg",2),
(null,"H033","金累丝灯笼耳坠",17567.00,"necklace2.jpg",3),
(null,"H034","金玉寿字耳坠",17896.00,"necklace1.jpg",4),
(null,"H035","珍珠米粒项链",19652.00,"pearl1.jpg",5),
(null,"H036","纯天然玛瑙项链",85112.00,"pearl2.jpg",6),
(null,"H037","兰格格珍珠项链",18562.00,"pearl3.jpg",7),
(null,"H038","近正圆珍珠项链",25862.00,"pearl4.jpg",8),
(null,"H039","佧瑞麒珍珠项链",36512.00,"pearl5.jpg",9),
(null,"H040","巴洛克珍珠项链",85462.00,"pearl6.jpg",10),
(null,"H041","海豚湾之恋",95462.00,"necklace1.jpg",11),
(null,"H042","遇见幸福",75426.00,"necklace2.jpg",12),
(null,"H043","沁心之恋",54458.00,"necklace3.jpg",13),
(null,"H044","真爱玫瑰",89745.00,"necklace4.jpg",14),
(null,"H045","爱的记忆",84563.00,"necklace5.jpg",15),
(null,"H046","皇冠项链",87545.00,"necklace6.jpg",16),
(null,"H047","Cartier d'Amour",75462.00,"diamond1.jpg",17),
(null,"H048","Diamants Légers",95462.00,"diamond2.jpg",18),
(null,"H049","Cartier d'Amour",32145.00,"diamond3.jpg",19),
(null,"H050","Cartier d'Amour",45987.00,"diamond4.jpg",20),
(null,"H051","Ballerine",63254.00,"diamond5.jpg",21),
(null,"H052","Logo de Cartier",45896.00,"diamond6.jpg",22),
(null,"H053","Logo de Chfghfg",54567.00,"diamond7.jpg",23),
(null,"H057","蓝宝石",24569.00,"gem2.jpg",24),
(null,"H054","红宝石",17896.00,"gem3.jpg",25),
(null,"H055","绿宝石",17512.00,"gem4.jpg",26),
(null,"H056","海洋之心",56954.00,"gem5.jpg",27),
(null,"H057","太阳之心",24569.00,"gem6.jpg",28);


-- 商品详情数据的图片
CREATE TABLE jewelry_detail_image(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  picture VARCHAR(30),
  photo VARCHAR(30),
  image VARCHAR(30),
  img VARCHAR(30),
  jewelry_id smallint(5) NOT NULL
);

-- 插入商品详情数据的图片
INSERT INTO jewelry_detail_image VALUES
(null,null,"gem3.jpg","gem4.jpg","gem5.jpg",1),
(null,"diamond2.jpg","diamond3.jpg","diamond4.jpg","diamond5.jpg",2),
(null,"necklace1.jpg","necklace5.jpg","necklace6.jpg",null,3),
(null,"necklace2.jpg",null,"necklace4.jpg","necklace3.jpg",4),
(null,"pearl5.jpg","pearl6.jpg","pearl2.jpg","pearl3.jpg",5),
(null,"pearl1.jpg","pearl3.jpg","pearl4.jpg",null,6),
(null,"pearl6.jpg","pearl5.jpg","pearl4.jpg","pearl2.jpg",7),
(null,"pearl3.jpg",null,"pearl5.jpg","pearl2.jpg",8),
(null,"gem1.jpg","gem2.jpg","gem4.jpg","gem3.jpg",9),
(null,"gem2.jpg","gem3.jpg","gem5.jpg",null,10),
(null,"necklace2.jpg","necklace3.jpg","necklace4.jpg",null,11),
(null,null,"necklace3.jpg","necklace4.jpg",null,12),
(null,"necklace2.jpg",null,"necklace5.jpg","necklace4.jpg",13),
(null,"necklace2.jpg","necklace3.jpg",null,"necklace6.jpg",14),
(null,null,null,null,"necklace4.jpg",15),
(null,"necklace2.jpg","necklace3.jpg","necklace4.jpg",null,16),
(null,"diamond2.jpg","diamond3.jpg","diamond4.jpg","diamond5.jpg",17),
(null,"diamond1.jpg",null,"diamond4.jpg","diamond5.jpg",18),
(null,"diamond2.jpg",null,null,"diamond5.jpg",19),
(null,"diamond2.jpg","diamond3.jpg","diamond7.jpg","diamond5.jpg",20),
(null,"diamond2.jpg",null,null,null,21),
(null,"diamond2.jpg",null,"diamond4.jpg","diamond7.jpg",22),
(null,"diamond2.jpg","diamond3.jpg","diamond4.jpg","diamond5.jpg",23),
(null,"gem3.jpg","gem4.jpg","gem5.jpg","gem6.jpg",24),
(null,"gem4.jpg",null,"gem5.jpg","gem1.jpg",25),
(null,"gem6.jpg",null,null,"gem5.jpg",26),
(null,"gem6.jpg","gem4.jpg","gem3.jpg","gem1.jpg",27),
(null,null,null,"gem1.jpg",null,28);


-- 关于我们的四条栏目
CREATE TABLE jewelry_about(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128), #主标题
  four_id smallint(5) NOT NULL
);

-- 插入关于我们的四条栏目数据
INSERT INTO jewelry_about VALUES(null,"关于我们",1),(null,"产品理念",2),(null,"合作伙伴",3),(null,"关于我们",4);

-- 关于我们数据
CREATE TABLE jewelry_guanyu(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128), #主标题
  subtitle VARCHAR(128),#副标题
  four_id smallint(5) NOT NULL
);

-- 插入关于我们数据
INSERT INTO jewelry_guanyu VALUES
(null,null,"我们相信好的设计是人们之间的情感链接。 更完美 更庄严 基于情感化设计理念，和对环境、人们生活方式与产品之间关系的理解，融合数字生活与传统生活方式，从简约、功能性、美学和可持续性出发，设计简单、美好、可持续的产品。",1),(null,"设计","好的设计源自美好生活感受。基于情感化设计理念，融合生活感受，追求设计创新，期待和人们分享简单、标志性、情感化的产品，传递美好感受。",1),(null,"素材","高品质产品是我们的追求，而素材是优质产品的基础。时尚首饰从世界各地开发和选取合适的素材，并善用各种素材的特性。",1),(null,"功能","美感和功能实用性是产品的根本。时尚首饰 从使用者角度出发，注重产品功能的合理性和使用的持久性，提升设计以满足使用者的期待，分享更好的使用感受。",1),(null,"技术","时尚首饰 开发智能与传统生活产品，不断提升传统工艺，在产品发展及生产中，持续改良、引进和开发创新科技， 期待与人们分享更好的产品、服务和感受。",1),(null,"实验室","高品质产品是 时尚首饰 一直以来的坚持。我们设立了完善的实验室系统，从设计生产到新品上市，在产品的设计、素材、功能、技术及安全性等多维度考量，确保产品符合中国及国际市场的标准，带来更美好的产品感受。",1);


-- 产品理念数据
CREATE TABLE jewelry_chanpin(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  image VARCHAR(128),
  title VARCHAR(128), #主标题
  subtitle VARCHAR(128),#副标题
  four_id smallint(5) NOT NULL
);

-- 插入产品理念数据
INSERT INTO jewelry_chanpin VALUES
(null,"about1.jpg","简单 美好 可持续的生活方式","时尚首饰 相信美好的事物是无国界的，好的设计是人们之间的情感链接，融合数字生活与传统生活，以情感化设计理念，分享简单、美好、可持续的生活方式。",2);


-- 合作伙伴数据
CREATE TABLE jewelry_hezuo(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  subtitle VARCHAR(128), #主标题
  image VARCHAR(428),
  four_id smallint(5) NOT NULL
);

-- 插入合作伙伴数据
INSERT INTO jewelry_hezuo VALUES
(null,"时尚首饰一直关注环境保护和社会资源的可持续使用，关注人们对产品的健康、环保、天然方面的需求，避免对资源的浪费。","about2.jpg",3),(null,"IFF 国际香料公司是全球专业研发多种香水产品与独特香气的创造公司。AGH 是IFF位于法国东南部的专业香水实验室，专注于优化和恢复自然平衡的有机农业领域，以生产天然成分提出物制成优质香薰精油。时尚首饰与IFF合作，采用其专业天然精油实验室IFF-LMR提供的天然香料，调制一系列天然香薰精油， 创造全新舒适、愉悦的香薰生活。","about1.jpg",3);


-- 加入我们数据
CREATE TABLE jewelry_jiaru(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128), #主标题
  subtitle VARCHAR(128),#副标题
  four_id smallint(5) NOT NULL
);

-- 插入加入我们数据
INSERT INTO jewelry_jiaru VALUES
(null,"玫瑰情事款式","Ave Medical建立在更好的护理模式之上 - 一个围绕患者需求设计，提供更高水平的质量和服务，价格合理。我们通过创新的设计，卓越的客户服务和高效的技术使用来实现这一目标。",4),(null,"Ave Children's Medical是否提供流感疫苗？","Ave Medical建立在更好的护理模式之上 - 一个围绕患者需求设计，提供更高水平的质量和服务，价格合理。我们通过创新的设计，卓越的客户服务和高效的技术使用来实现这一目标。",4),(null,"获得实验室测试结果需要多长时间？","Ave Medical建立在更好的护理模式之上 - 一个围绕患者需求设计，提供更高水平的质量和服务，价格合理。我们通过创新的设计，卓越的客户服务和高效的技术使用来实现这一目标。",4);



-- 用户信息
CREATE TABLE jewelry_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(20)
);

INSERT INTO jewelry_user VALUES(null,"zswlw",md5("123456"),"1458484834@qq.com","15993576621");
INSERT INTO jewelry_user VALUES(null,"zswlw",md5("123456"),"1458484834@qq.com","15993576621");
INSERT INTO jewelry_user VALUES(null,"sgj",md5("123456"),"1458484835@qq.com","15993576622");
INSERT INTO jewelry_user VALUES(null,"sgjj",md5("123456"),"1458484835@qq.com","15993576622");


-- 购物车
CREATE TABLE jewelry_carts(
  id INT PRIMARY KEY AUTO_INCREMENT,
  sid INT,        #商品编号
  price DECIMAL(10,2),
  pname VARCHAR(32),      #详情列表中的title
  details VARCHAR(128),          #详情列表中的subtitle
  pic VARCHAR(64),
  count SMALLINT,         #商品数量
  uid TINYINT             #用户编号 
)