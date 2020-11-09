SET NAMES UTF8;
DROP DATABASE IF EXISTS dangao;
CREATE DATABASE dangao CHARSET=UTF8;
use dangao;
-- 轮播图数据表
CREATE TABLE lunbo(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    pic varchar(128) default NULL,
    title VARCHAR(128) DEFAULT NULL,
    sub_title VARCHAR(128) DEFAULT NULL
)ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
INSERT INTO lunbo VALUES ('1', 'lun1.jpg','<p class="main_title">官宣！诺心×喜茶联名上线</p><p class="sub_title">灵感甜品 心生欢喜</p>',NULL);
INSERT INTO lunbo VALUES ('2', 'lun2.jpg','<p class="main_title">诺心限定「奶茶铺」 开业啦</p><p class="sub_title">多款人气蛋糕 活力来袭</p>',NULL);
INSERT INTO lunbo VALUES ('3', 'lun3.jpg','<p class="main_title brown">惊喜生日趴 嗨Fun好时光</p><p class="sub_title brown">人气蛋糕 甜蜜来袭</p>',NULL);
INSERT INTO lunbo VALUES ('4', 'lun4.jpg','<p class="main_title pink">买大送小 畅意轻享</p><p class="sub_title pink">购0轻享大蛋糕 赠盒子蛋糕2个</p>',NULL);
INSERT INTO lunbo VALUES ('5', 'lun5.jpg','至臻醇享  经典之作','国际金奖加冕  口碑 TOP');
INSERT INTO lunbo VALUES ('6', 'lun6.jpg','先领券 后下单','有优惠 更美味');
INSERT INTO lunbo VALUES ('7', 'lun7.jpg','想吃就要即时满足','囤进冰箱 甜点随心享');

-- 蛋糕详情表
CREATE TABLE cake(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    bigpic VARCHAR(128) DEFAULT NULL,/*大图片*/
    smallpic VARCHAR(128) DEFAULT NULL,/*小图片*/
    listpic VARCHAR(128) DEFAULT NULL,/*详情图片*/
    title VARCHAR(32) DEFAULT null,/*标题*/
    price VARCHAR(32) DEFAULT NULL,/*价格*/
    category_name VARCHAR(12) DEFAULT NULL,/*蛋糕分类*/
    introduce VARCHAR(64) DEFAULT NULL,/*蛋糕介绍*/
    discount VARCHAR(64) DEFAULT NULL,/*优惠介绍*/
    slogan VARCHAR(128) DEFAULT NULL,/*结尾宣传语*/
    category_id VARCHAR(12) DEFAULT'1',/*蛋糕分类*/
    flavor VARCHAR(32) DEFAULT NULL/*口味*/
)ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--雪域牛乳芝士
INSERT INTO cake VALUES('1',"home_10800.jpg","list_10800.jpg",'list1.jpg',"雪域牛乳芝士","218","牛乳芝士蛋糕","经典之作 热销多年","周末庆生专享 赠盒子蛋糕"
,"<p>阿尔卑斯山的雪</p><p>简单但有种永恒的美</p><p>特浓牛乳和新西兰上等芝士用独特的工艺</p><p>令芝士的香气完全散发出来</p><p>蛋糕的口感也更加浓郁香滑、入口即溶</p><p>上等食材的精心配比，让这款蛋糕回味无穷</p>",
'2','雪域口味');
--茶草京都
INSERT INTO cake VALUES(null,"home_20105.jpg","list_20105.jpg",'list2.jpg',"茶草京都","218","慕斯蛋糕","抹茶控京都寻味 草色茶香自悠然","限时立减30元"
,"<p>京都的颜色</p><p>是茶草清新的绿</p><p>闭上眼 细细感受其中的韵味</p><p>抹茶香气馥郁悠长 百转千回</p><p>品一抹绿意 忆往日京都</p><p>带来全新味蕾体验</p>",
'2','慕斯口味');
--海盐乳酪芝士
INSERT INTO cake VALUES(null,"home_10782.jpg","list_10782.jpg",'list3.jpg',"海盐乳酪芝士","218","牛乳芝士蛋糕","芝士控绕不开的难忘滋味","限时75折"
,"<p>地中海的别样风情让人沉醉</p><p>清凉的风夹杂着丝丝的微咸轻抚脸庞</p><p>使得我产生了研发这款蛋糕的初衷</p><p>用海盐和新西兰上等芝士经过精心调配</p><p>让芝士的天然味道瞬间迸发出来</p><p>给味蕾出奇的惊艳。</p>",
'2','芝士口味');
--花花世界
INSERT INTO cake VALUES(null,"home_22934.jpg","list_22934.jpg",'list4.jpg',"花花世界","336","慕斯蛋糕","绽放柔情的花花世界","限时75折"
,"<p>把浓浓爱意融进甜蜜花礼之中</p><p>每一口甜蜜都让人倍感宠爱</p><p>爱是永不凋零的花</p><p>愿美丽芳华永远将她围绕</p>",
'2','慕斯口味');
--玫瑰雪域芝士
INSERT INTO cake VALUES(null,"home_12244.jpg","list_12244.jpg",'list5.jpg',"玫瑰雪域芝士","218","牛乳芝士蛋糕","懂得营造浪漫氛围的蛋糕","限时75折"
,"<p>把浓浓爱意融进甜蜜花礼之中</p><p>每一口甜蜜都让人倍感宠爱</p><p>爱是永不凋零的花</p><p>愿美丽芳华永远将她围绕</p>",
'2','芝士口味');
--锦鲤送福
INSERT INTO cake VALUES(null,"home_22850.jpg","list_22850.jpg",'list6.jpg',"锦鲤送福","298","牛乳芝士蛋糕","经典雪域迎 “锦鲤” 口口浓醇好运","限时75折"
,"<p>把浓浓爱意融进甜蜜花礼之中</p><p>每一口甜蜜都让人倍感宠爱</p><p>爱是永不凋零的花</p><p>愿美丽芳华永远将她围绕</p>",'2','巧克力口味');
--壁咚！阿华田
INSERT INTO cake VALUES(null,"home_22642.jpg","list_22642.jpg",'list7.jpg',"壁咚！阿华田","258","巧克力蛋糕","浓郁麦芽可可 绵软与甜脆的碰撞","限时立减50元"
,"<p>把浓浓爱意融进甜蜜花礼之中</p><p>每一口甜蜜都让人倍感宠爱</p><p>爱是永不凋零的花</p><p>愿美丽芳华永远将她围绕</p>",'2','巧克力口味');
--闲蛋皇
INSERT INTO cake VALUES(null,"home_19660.jpg","list_19660.jpg",'list8.jpg',"闲蛋皇","258","牛乳芝士蛋糕","热度持续飙升 人气咸蛋黄蛋糕","限时立减50元"
,"<p>把浓浓爱意融进甜蜜花礼之中</p><p>每一口甜蜜都让人倍感宠爱</p><p>爱是永不凋零的花</p><p>愿美丽芳华永远将她围绕</p>",'2','芝士口味');
--小梅子
INSERT INTO cake VALUES(null,"home_22850.jpg","list_23421.jpg",'list9.jpg',"小梅子","298","牛乳芝士蛋糕","22层！活力 轻享千层小莓好","赠盒子蛋糕2个"
,"<p>把浓浓爱意融进甜蜜花礼之中</p><p>每一口甜蜜都让人倍感宠爱</p><p>爱是永不凋零的花</p><p>愿美丽芳华永远将她围绕</p>",'3','芝士口味');
--提拉米苏.轻享
INSERT INTO cake VALUES(null,"home_22642.jpg","list_23370.jpg",'list10.jpg',"提拉米苏.轻享","298","巧克力蛋糕","80%的雪域老友也爱这一款","赠盒子蛋糕2个"
,"<p>把浓浓爱意融进甜蜜花礼之中</p><p>每一口甜蜜都让人倍感宠爱</p><p>爱是永不凋零的花</p><p>愿美丽芳华永远将她围绕</p>",'3','巧克力口味');
--巧克力松露.轻享受
INSERT INTO cake VALUES(null,"home_19660.jpg","list_23364.jpg",'list11.jpg',"巧克力松露.轻享受","298","牛乳芝士蛋糕","熠彩斑斓  轻享浓滑","赠盒子蛋糕2个"
,"<p>把浓浓爱意融进甜蜜花礼之中</p><p>每一口甜蜜都让人倍感宠爱</p><p>爱是永不凋零的花</p><p>愿美丽芳华永远将她围绕</p>",'3','芝士口味');

-- 蛋糕详情页介绍
CREATE TABLE introduce(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    onepic VARCHAR(128) DEFAULT NULL,/*第一张图片*/
    twopic VARCHAR(128) DEFAULT NULL,/*第二张图片*/
    leftpic VARCHAR(128) DEFAULT NULL,/*左图片*/
    rightpic VARCHAR(128) DEFAULT NULL,/*右图片*/
    topintr VARCHAR(128) DEFAULT NULL,/*第一段介绍*/
    rightintr VARCHAR(128) DEFAULT NULL,/*右二段介绍*/
    leftintr VARCHAR(128) DEFAULT NULL,/*左三段介绍*/
    flavor VARCHAR(32) DEFAULT NULL,/*口味*/
    tips VARCHAR(128) DEFAULT NULL/*温馨提示*/
)ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
-- 雪域牛乳芝士
INSERT INTO introduce VALUES("1","1one.jpg","1two.jpg","1left.jpg","1right.jpg",
"超人气的雪域牛乳芝士蛋糕，细腻绵长，口感丰富，犹如纯洁精灵的化身，毫不吝啬地将所有美好呈现在眼前。",
"<p>用心打发而成的美味奶油</p><p>口感绵密，精致细腻</p><p>这份雪白</p><p>让你有如获至宝的幸福感</p>",
"<p>选用进口白巧克力</p><p>精湛工艺将白巧克力擦出</p><p>如初雪般的轻柔</p><p>触碰舌尖即化甜蜜动人</p>","芝士口味",
"温馨提示：蛋糕中出现的细小黑色颗粒为香草籽，此为香草荚未碾磨均匀带入的颗粒，可放心食用，此产品实物因尺寸规格而异，本页面商品展示图为5-8人食。");
-- 茶草金都
INSERT INTO introduce VALUES(null,"2one.jpg","2two.jpg","2left.jpg","1right.jpg",
"清新抹茶唤醒京都遐想,香甜白巧融入柔滑芝士,丰富口感的交织,给味蕾一场奇妙体验,仿佛置身抹茶的国度",
"<p>抹茶的色香味皆美</p><p>浓浓的新绿中</p><p>细腻清新 茶韵悠然</p>",
"<p>用心打发而成的美味奶油</p><p>口感绵密，精致细腻</p><p>这份雪白</p><p>让你有如获至宝的幸福感</p>","慕斯口味",
"温馨提示：*此产品实物因尺寸规格而异，本页面商品展示图为5-8人食。");
--海盐乳酪芝士
INSERT INTO introduce VALUES(null,"3one.jpg","3two.jpg","3left.jpg","1right.jpg",
"充满回忆的味道，总令人难以忘怀。那是西西里岛的风味，充满渔夫自然不造作的热情， 与素未谋面的我，分享渔获，分享喜悦。",
"<p>选用上等芝士</p><p>激发本真风味</p><p>浓郁香滑</p><p>入口即化</p>",
"<p>用心打发而成的美味奶油</p><p>口感绵密，精致细腻</p><p>这份雪白</p><p>让你有如获至宝的幸福感</p>","芝士口味",
"温馨提示：*此产品实物因尺寸规格而异，本页面商品展示图为5-8人食。");
--花花世界
INSERT INTO introduce VALUES(null,"4one.jpg","4two.jpg","1left.jpg","1right.jpg",
"充满回忆的味道，总令人难以忘怀。那是西西里岛的风味，充满渔夫自然不造作的热情， 与素未谋面的我，分享渔获，分享喜悦。",
"<p>选用上等芝士</p><p>激发本真风味</p><p>浓郁香滑</p><p>入口即化</p>",
"<p>用心打发而成的美味奶油</p><p>口感绵密，精致细腻</p><p>这份雪白</p><p>让你有如获至宝的幸福感</p>","慕斯口味",
"温馨提示：蛋糕中出现的细小黑色颗粒为香草籽，此为香草荚未碾磨均匀带入的颗粒，可放心食用。");
--玫瑰雪域芝士
INSERT INTO introduce VALUES(null,"5one.jpg","5two.jpg","3left.jpg","1right.jpg",
"一片玫瑰的海洋，映衬着少男少女那纯净的心境。这么多朵玫瑰花，总像有数不清的芬芳思念，诉不尽的感恩眷恋，所有声音都在轻声呢喃着誓约长久。",
"<p>选用上等芝士</p><p>激发本真风味</p><p>浓郁香滑</p><p>入口即化</p>",
"<p>用心打发而成的美味奶油</p><p>口感绵密，精致细腻</p><p>这份雪白</p><p>让你有如获至宝的幸福感</p>","慕斯口味",
"温馨提示：蛋糕中出现的细小黑色颗粒为香草籽，此为香草荚未碾磨均匀带入的颗粒，可放心食用，此产品实物因尺寸规格而异，本页面商品展示图为5-8人食。");
--锦鲤送福
INSERT INTO introduce VALUES(null,"6one.jpg","6two.png","3left.jpg","1right.jpg",
"一片玫瑰的海洋，映衬着少男少女那纯净的心境。这么多朵玫瑰花，总像有数不清的芬芳思念，诉不尽的感恩眷恋，所有声音都在轻声呢喃着誓约长久。",
"<p>选用上等芝士</p><p>激发本真风味</p><p>浓郁香滑</p><p>入口即化</p>",
"<p>用心打发而成的美味奶油</p><p>口感绵密，精致细腻</p><p>这份雪白</p><p>让你有如获至宝的幸福感</p>","慕斯口味",
"温馨提示：蛋糕中出现的细小黑色颗粒为香草籽，此为香草荚未碾磨均匀带入的颗粒，可放心食用，此产品实物因尺寸规格而异，本页面商品展示图为5-8人食。");
--壁咚！阿华田
INSERT INTO introduce VALUES(null,"7one.jpg","7two.jpg","3left.jpg","1right.jpg",
"一起来壁咚阿华田,浓郁的麦芽可可滋味,与曼妙的慕斯跳起舌尖华尔兹,阿华田酷脆“噼啪”咀嚼,在口中绽放一场场奇妙烟花",
"<p>选用上等芝士</p><p>激发本真风味</p><p>浓郁香滑</p><p>入口即化</p>",
"<p>用心打发而成的美味奶油</p><p>口感绵密，精致细腻</p><p>这份雪白</p><p>让你有如获至宝的幸福感</p>","巧克力口味",
"温馨提示：蛋糕中出现的细小黑色颗粒为香草籽，此为香草荚未碾磨均匀带入的颗粒，可放心食用。");
--闲蛋皇
INSERT INTO introduce VALUES(null,"8one.jpg","8two.jpg","8left.jpg","1right.jpg",
"当咸蛋黄遇上蛋糕,浓醇牛奶与柔滑芝士慕斯融合,嚼得到的沙绵蛋黄粒,软绵细腻，浓滑咸香,带来不一样的美妙口感",
"<p>浓厚咸蛋黄酱</p><p>带着流沙的质感</p><p>细致绵密，浓郁咸香</p>",
"<p>选用上等芝士</p><p>激发本真风味</p><p>浓郁香滑</p><p>入口即化</p>","奶油口味",
"温馨提示：本产品使用了配制酒进行调味，此产品实物因尺寸规格而异，本页面商品展示图为5-8人食");
--小梅子
INSERT INTO introduce VALUES(null,"6one.jpg","6two.png","3left.jpg","1right.jpg",
"一片玫瑰的海洋，映衬着少男少女那纯净的心境。这么多朵玫瑰花，总像有数不清的芬芳思念，诉不尽的感恩眷恋，所有声音都在轻声呢喃着誓约长久。",
"<p>选用上等芝士</p><p>激发本真风味</p><p>浓郁香滑</p><p>入口即化</p>",
"<p>用心打发而成的美味奶油</p><p>口感绵密，精致细腻</p><p>这份雪白</p><p>让你有如获至宝的幸福感</p>","慕斯口味",
"温馨提示：蛋糕中出现的细小黑色颗粒为香草籽，此为香草荚未碾磨均匀带入的颗粒，可放心食用，此产品实物因尺寸规格而异，本页面商品展示图为5-8人食。");
--提拉米苏.轻享
INSERT INTO introduce VALUES(null,"7one.jpg","7two.jpg","3left.jpg","1right.jpg",
"一起来壁咚阿华田,浓郁的麦芽可可滋味,与曼妙的慕斯跳起舌尖华尔兹,阿华田酷脆“噼啪”咀嚼,在口中绽放一场场奇妙烟花",
"<p>选用上等芝士</p><p>激发本真风味</p><p>浓郁香滑</p><p>入口即化</p>",
"<p>用心打发而成的美味奶油</p><p>口感绵密，精致细腻</p><p>这份雪白</p><p>让你有如获至宝的幸福感</p>","巧克力口味",
"温馨提示：蛋糕中出现的细小黑色颗粒为香草籽，此为香草荚未碾磨均匀带入的颗粒，可放心食用。");
--巧克力松露.轻享受
INSERT INTO introduce VALUES(null,"8one.jpg","8two.jpg","8left.jpg","1right.jpg",
"当咸蛋黄遇上蛋糕,浓醇牛奶与柔滑芝士慕斯融合,嚼得到的沙绵蛋黄粒,软绵细腻，浓滑咸香,带来不一样的美妙口感",
"<p>浓厚咸蛋黄酱</p><p>带着流沙的质感</p><p>细致绵密，浓郁咸香</p>",
"<p>选用上等芝士</p><p>激发本真风味</p><p>浓郁香滑</p><p>入口即化</p>","奶油口味",
"温馨提示：本产品使用了配制酒进行调味，此产品实物因尺寸规格而异，本页面商品展示图为5-8人食");

--蛋糕分类
CREATE TABLE category(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    category_id VARCHAR(12) DEFAULT'1',
    category_name VARCHAR(12) DEFAULT"综合"
)ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
INSERT INTO category VALUES(1,"1","综合");
INSERT INTO category VALUES(2,"2","销量");
INSERT INTO category VALUES(3,"3","0轻享");


--评论表
CREATE TABLE comment(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(128) DEFAULT'list_12152.jpg',
    phone VARCHAR(32) DEFAULT NULL,
    people VARCHAR(12) DEFAULT'2-4人食',
    time VARCHAR(128) DEFAULT'2020-10-24 19:40:42',
    com VARCHAR(128) DEFAULT NULL
)ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO comment VALUES('1',default,'15620110532',default,default,'好吃，不愧是招牌，不甜不腻，还送到家门口，下单也方便，看上去小，吃好晚饭，六个人还剩余一大半，下次还会这里买！');
INSERT INTO comment VALUES(null,default,'15620110532',default,default,'非常好吃');
INSERT INTO comment VALUES(null,default,'15620110532',default,default,'满意');
INSERT INTO comment VALUES(null,default,'15620110532',default,default,'一如既往的好吃');
INSERT INTO comment VALUES(null,default,'15620110532',default,default,'外婆很喜欢，快递小哥特别叮嘱收货的时候看一下蛋糕是否完整，好贴心。');
INSERT INTO comment VALUES(null,default,'15620110532',default,default,'包装精美，蛋糕口感好，浓浓的芝士+大白兔+巧克力奥利奥混合的味道，好吃，就是不能多吃。');
INSERT INTO comment VALUES(null,default,'15620110532',default,default,'外婆很喜欢，快递小哥特别叮嘱收货的时候看一下蛋糕是否完整，好贴心。');
INSERT INTO comment VALUES(null,default,'15620110532',default,default,'口感醇厚，很好吃！忘拍照了');
INSERT INTO comment VALUES(null,default,'15620110532',default,default,'太好吃了，另外小哥坚持等到我回家，说是芝士不可以放在外面太久，会影响口感，真的很感动。');
INSERT INTO comment VALUES(null,default,'15620110532',default,default,'口感醇厚，很好吃！忘拍照了');
INSERT INTO comment VALUES(null,default,'15620110532',default,default,'包装精美，蛋糕口感好，浓浓的芝士+大白兔+巧克力奥利奥混合的味道，好吃，就是不能多吃。');
INSERT INTO comment VALUES(null,default,'15620110532',default,default,'口感细腻，不是很甜。老公很满意！');

-- 用户数据表
CREATE TABLE user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    phone varchar(32) default NULL,/*手机，账号*/
    username VARCHAR(32) DEFAULT NULL,/*昵称*/
    password VARCHAR(32) DEFAULT NULL,/*密码*/
    sex VARCHAR(12) DEFAULT NULL,/*性别*/
    headimg mediumtext,/*头像*/
    birthday VARCHAR(64) DEFAULT NULL,/*生日*/
    vip VARCHAR(12) DEFAULT'普通会员',/*是否为会员*/
    level VARCHAR(12) DEFAULT'1',/*等级*/
    address VARCHAR(64) DEFAULT NULL,/*地址*/
    orde VARCHAR(64) DEFAULT NULL,/*订单*/
    isaha VARCHAR(12) DEFAULT'0',/*是否有aha返利*/
    isjuan VARCHAR(12) DEFAULT'0'/*是否有优惠券*/
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
