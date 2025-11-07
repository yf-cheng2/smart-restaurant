-- 更新数据库，新增菜品和库存量
USE orderfoodapp;

-- 1. 先查看现有的菜品分类
SELECT * FROM type;

-- 2. 如果分类表为空，先插入一些基础分类
INSERT INTO type (id, name, sort, status) VALUES
(1, '热菜', 1, 0),
(2, '凉菜', 2, 0),
(3, '汤品', 3, 0),
(4, '主食', 4, 0),
(5, '饮品', 5, 0),
(6, '甜品', 6, 0)
ON DUPLICATE KEY UPDATE name=VALUES(name), sort=VALUES(sort);

-- 3. 新增菜品数据（包含库存量）
-- 热菜类
INSERT INTO food (id, name, price, remarks, pricutre, type_id, inventory, create_time, update_time, status) VALUES
(1, '宫保鸡丁', 28.00, '经典川菜，鸡肉鲜嫩，配以花生米和辣椒，口感麻辣鲜香', '/static/images/menu/food1.jpg', 1, 100, NOW(), NOW(), 0),
(2, '鱼香肉丝', 25.00, '川菜代表，酸甜可口，肉丝嫩滑，配菜丰富', '/static/images/menu/food2.jpg', 1, 120, NOW(), NOW(), 0),
(3, '麻婆豆腐', 18.00, '四川名菜，麻辣鲜香，豆腐嫩滑，配米饭绝佳', '/static/images/menu/food3.jpg', 1, 150, NOW(), NOW(), 0),
(4, '糖醋里脊', 32.00, '酸甜可口，外酥里嫩，色泽金黄，老少皆宜', '/static/images/menu/food4.jpg', 1, 80, NOW(), NOW(), 0),
(5, '红烧肉', 35.00, '经典本帮菜，肥而不腻，入口即化，配菜丰富', '/static/images/menu/food5.jpg', 1, 90, NOW(), NOW(), 0),
(6, '清蒸鲈鱼', 45.00, '粤菜经典，鱼肉鲜嫩，原汁原味，营养丰富', '/static/images/menu/food6.jpg', 1, 60, NOW(), NOW(), 0),
(7, '回锅肉', 30.00, '川菜经典，肥瘦相间，配以蒜苗，香辣下饭', '/static/images/menu/food7.jpg', 1, 100, NOW(), NOW(), 0),
(8, '水煮鱼', 48.00, '川菜名菜，麻辣鲜香，鱼肉嫩滑，配菜丰富', '/static/images/menu/food8.jpg', 1, 70, NOW(), NOW(), 0),
(9, '蒜蓉西兰花', 22.00, '清爽素菜，营养丰富，蒜香浓郁', '/static/images/menu/food9.jpg', 1, 130, NOW(), NOW(), 0),
(10, '干煸豆角', 24.00, '川菜特色，豆角干香，配以肉末，下饭神器', '/static/images/menu/food10.jpg', 1, 110, NOW(), NOW(), 0)
ON DUPLICATE KEY UPDATE name=VALUES(name), price=VALUES(price), remarks=VALUES(remarks), inventory=VALUES(inventory);

-- 凉菜类
INSERT INTO food (id, name, price, remarks, pricutre, type_id, inventory, create_time, update_time, status) VALUES
(11, '凉拌黄瓜', 12.00, '清爽开胃，酸甜可口，解腻神器', '/static/images/menu/food11.jpg', 2, 200, NOW(), NOW(), 0),
(12, '凉拌木耳', 15.00, '营养丰富，口感爽脆，健康美味', '/static/images/menu/food12.jpg', 2, 180, NOW(), NOW(), 0),
(13, '口水鸡', 28.00, '川菜凉菜，麻辣鲜香，鸡肉嫩滑', '/static/images/menu/food13.jpg', 2, 100, NOW(), NOW(), 0),
(14, '凉拌海带丝', 10.00, '清爽开胃，营养丰富，价格实惠', '/static/images/menu/food14.jpg', 2, 220, NOW(), NOW(), 0),
(15, '凉拌豆皮', 12.00, '口感爽滑，配以香菜和花生，香辣开胃', '/static/images/menu/food15.jpg', 2, 190, NOW(), NOW(), 0)
ON DUPLICATE KEY UPDATE name=VALUES(name), price=VALUES(price), remarks=VALUES(remarks), inventory=VALUES(inventory);

-- 汤品类
INSERT INTO food (id, name, price, remarks, pricutre, type_id, inventory, create_time, update_time, status) VALUES
(16, '西红柿鸡蛋汤', 15.00, '经典家常汤，酸甜可口，营养丰富', '/static/images/menu/food16.jpg', 3, 150, NOW(), NOW(), 0),
(17, '冬瓜排骨汤', 28.00, '滋补汤品，清淡鲜美，营养丰富', '/static/images/menu/food17.jpg', 3, 80, NOW(), NOW(), 0),
(18, '紫菜蛋花汤', 12.00, '清淡鲜美，口感顺滑，价格实惠', '/static/images/menu/food18.jpg', 3, 200, NOW(), NOW(), 0),
(19, '酸辣汤', 18.00, '酸辣开胃，配菜丰富，解腻神器', '/static/images/menu/food19.jpg', 3, 120, NOW(), NOW(), 0),
(20, '银耳莲子汤', 22.00, '甜品汤品，滋润养颜，口感清甜', '/static/images/menu/food20.jpg', 3, 100, NOW(), NOW(), 0)
ON DUPLICATE KEY UPDATE name=VALUES(name), price=VALUES(price), remarks=VALUES(remarks), inventory=VALUES(inventory);

-- 主食类
INSERT INTO food (id, name, price, remarks, pricutre, type_id, inventory, create_time, update_time, status) VALUES
(21, '蛋炒饭', 15.00, '经典主食，米饭粒粒分明，配以鸡蛋和葱花', '/static/images/menu/food21.jpg', 4, 200, NOW(), NOW(), 0),
(22, '扬州炒饭', 18.00, '特色炒饭，配菜丰富，口感层次分明', '/static/images/menu/food22.jpg', 4, 180, NOW(), NOW(), 0),
(23, '牛肉面', 25.00, '经典面食，牛肉软烂，汤鲜味美', '/static/images/menu/food23.jpg', 4, 150, NOW(), NOW(), 0),
(24, '炸酱面', 20.00, '北方特色，酱香浓郁，配菜丰富', '/static/images/menu/food24.jpg', 4, 160, NOW(), NOW(), 0),
(25, '水饺', 22.00, '手工水饺，皮薄馅大，配以蘸料', '/static/images/menu/food25.jpg', 4, 140, NOW(), NOW(), 0),
(26, '小笼包', 25.00, '上海特色，皮薄汁多，鲜美可口', '/static/images/menu/food26.jpg', 4, 120, NOW(), NOW(), 0)
ON DUPLICATE KEY UPDATE name=VALUES(name), price=VALUES(price), remarks=VALUES(remarks), inventory=VALUES(inventory);

-- 饮品类
INSERT INTO food (id, name, price, remarks, pricutre, type_id, inventory, create_time, update_time, status) VALUES
(27, '鲜榨橙汁', 18.00, '新鲜橙子现榨，营养丰富，酸甜可口', '/static/images/menu/food27.jpg', 5, 300, NOW(), NOW(), 0),
(28, '柠檬蜂蜜水', 15.00, '清爽解腻，酸甜可口，美容养颜', '/static/images/menu/food28.jpg', 5, 280, NOW(), NOW(), 0),
(29, '酸梅汤', 12.00, '传统饮品，酸甜开胃，解腻神器', '/static/images/menu/food29.jpg', 5, 320, NOW(), NOW(), 0),
(30, '可乐', 8.00, '经典碳酸饮料，冰爽可口', '/static/images/menu/food30.jpg', 5, 500, NOW(), NOW(), 0),
(31, '雪碧', 8.00, '清爽碳酸饮料，柠檬味', '/static/images/menu/food31.jpg', 5, 500, NOW(), NOW(), 0),
(32, '矿泉水', 5.00, '纯净水，健康饮品', '/static/images/menu/food32.jpg', 5, 1000, NOW(), NOW(), 0)
ON DUPLICATE KEY UPDATE name=VALUES(name), price=VALUES(price), remarks=VALUES(remarks), inventory=VALUES(inventory);

-- 甜品类
INSERT INTO food (id, name, price, remarks, pricutre, type_id, inventory, create_time, update_time, status) VALUES
(33, '红豆沙', 15.00, '传统甜品，香甜软糯，口感细腻', '/static/images/menu/food33.jpg', 6, 150, NOW(), NOW(), 0),
(34, '双皮奶', 18.00, '广式甜品，奶香浓郁，口感滑嫩', '/static/images/menu/food34.jpg', 6, 120, NOW(), NOW(), 0),
(35, '杨枝甘露', 22.00, '港式甜品，芒果香甜，口感丰富', '/static/images/menu/food35.jpg', 6, 100, NOW(), NOW(), 0),
(36, '芒果布丁', 16.00, 'Q弹爽滑，芒果味浓郁，甜而不腻', '/static/images/menu/food36.jpg', 6, 130, NOW(), NOW(), 0),
(37, '提拉米苏', 28.00, '意式甜品，层次丰富，口感浓郁', '/static/images/menu/food37.jpg', 6, 80, NOW(), NOW(), 0)
ON DUPLICATE KEY UPDATE name=VALUES(name), price=VALUES(price), remarks=VALUES(remarks), inventory=VALUES(inventory);

-- 4. 创建或更新库存预警表（如果不存在）
CREATE TABLE IF NOT EXISTS inventory_alert (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    food_id BIGINT NOT NULL COMMENT '菜品ID',
    food_name VARCHAR(100) NOT NULL COMMENT '菜品名称',
    current_stock INT NOT NULL COMMENT '当前库存',
    min_stock INT NOT NULL DEFAULT 20 COMMENT '最小库存预警值',
    alert_level INT NOT NULL DEFAULT 1 COMMENT '预警级别：1-低库存，2-缺货',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_food_id (food_id),
    INDEX idx_alert_level (alert_level)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库存预警表';

-- 5. 创建促销活动表（如果不存在）
CREATE TABLE IF NOT EXISTS promotion (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL COMMENT '活动标题',
    description TEXT COMMENT '活动描述',
    image VARCHAR(255) COMMENT '活动图片',
    start_time DATETIME NOT NULL COMMENT '开始时间',
    end_time DATETIME NOT NULL COMMENT '结束时间',
    discount_type INT NOT NULL DEFAULT 1 COMMENT '折扣类型：1-折扣，2-满减，3-优惠券',
    discount_value DECIMAL(10,2) COMMENT '折扣值',
    status INT NOT NULL DEFAULT 0 COMMENT '状态：0-启用，1-禁用',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_status (status),
    INDEX idx_time (start_time, end_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='促销活动表';

-- 6. 插入促销活动数据
INSERT INTO promotion (title, description, image, start_time, end_time, discount_type, discount_value, status) VALUES
('午餐优惠', '11:00-14:00点餐享8折优惠', '/static/images/index/promo1.jpg', NOW(), DATE_ADD(NOW(), INTERVAL 365 DAY), 1, 0.8, 0),
('新品尝鲜', '新菜品首单优惠5元', '/static/images/index/promo2.jpg', NOW(), DATE_ADD(NOW(), INTERVAL 365 DAY), 2, 5.00, 0),
('会员专享', '会员积分兑换菜品', '/static/images/index/promo3.jpg', NOW(), DATE_ADD(NOW(), INTERVAL 365 DAY), 3, 0, 0),
('周末特惠', '周末消费满100减20', '/static/images/index/promo4.jpg', NOW(), DATE_ADD(NOW(), INTERVAL 365 DAY), 2, 20.00, 0)
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description);

-- 7. 创建餐厅信息表（如果不存在）
CREATE TABLE IF NOT EXISTS restaurant_info (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL COMMENT '餐厅名称',
    description TEXT COMMENT '餐厅描述',
    logo VARCHAR(255) COMMENT '餐厅Logo',
    background_image VARCHAR(255) COMMENT '背景图片',
    business_hours VARCHAR(100) COMMENT '营业时间',
    address VARCHAR(255) COMMENT '地址',
    phone VARCHAR(20) COMMENT '联系电话',
    status INT NOT NULL DEFAULT 0 COMMENT '营业状态：0-营业中，1-休息中',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='餐厅信息表';

-- 8. 插入餐厅信息
INSERT INTO restaurant_info (name, description, logo, background_image, business_hours, address, phone, status) VALUES
('智能餐饮服务系统', '提供优质的餐饮服务体验，采用智能点餐系统，让用餐更便捷', '/static/images/logo.png', '/static/images/index/restaurant-bg.jpg', '10:00-22:00', '北京市朝阳区xxx街道xxx号', '010-12345678', 0)
ON DUPLICATE KEY UPDATE name=VALUES(name), description=VALUES(description), business_hours=VALUES(business_hours);

-- 9. 创建公告表（如果不存在）
CREATE TABLE IF NOT EXISTS notice (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL COMMENT '公告内容',
    type INT NOT NULL DEFAULT 1 COMMENT '公告类型：1-普通，2-重要',
    status INT NOT NULL DEFAULT 0 COMMENT '状态：0-启用，1-禁用',
    sort INT NOT NULL DEFAULT 0 COMMENT '排序',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_status (status),
    INDEX idx_sort (sort)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公告表';

-- 10. 插入公告数据
INSERT INTO notice (content, type, status, sort) VALUES
('欢迎使用智能餐饮服务系统，提供便捷的点餐体验', 1, 0, 1),
('餐厅营业时间：10:00-22:00，欢迎光临', 1, 0, 2),
('新品上市：特色川菜系列，敬请品尝', 2, 0, 3),
('会员充值优惠活动进行中，充值赠送积分', 2, 0, 4)
ON DUPLICATE KEY UPDATE content=VALUES(content);

-- 11. 查看更新结果
SELECT '菜品总数' as info, COUNT(*) as count FROM food WHERE status = 0
UNION ALL
SELECT '分类总数', COUNT(*) FROM type WHERE status = 0
UNION ALL
SELECT '促销活动数', COUNT(*) FROM promotion WHERE status = 0
UNION ALL
SELECT '公告数', COUNT(*) FROM notice WHERE status = 0;

-- 12. 查看库存预警（库存少于50的菜品）
SELECT f.id, f.name, f.inventory as current_stock, t.name as type_name
FROM food f
LEFT JOIN type t ON f.type_id = t.id
WHERE f.inventory < 50 AND f.status = 0
ORDER BY f.inventory ASC;
