-- ============================================
-- 智能餐饮服务系统 - 完整数据库配置SQL文件
-- ============================================
-- 创建时间: 2024
-- 数据库版本: MySQL 8.0+
-- 字符集: utf8mb4
-- ============================================

-- 1. 创建数据库
DROP DATABASE IF EXISTS `orderfoodapp`;
CREATE DATABASE `orderfoodapp` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `orderfoodapp`;

-- ============================================
-- 2. 用户相关表
-- ============================================

-- 2.1 用户表
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` VARCHAR(50) DEFAULT NULL COMMENT '用户名',
  `nick_name` VARCHAR(50) DEFAULT NULL COMMENT '昵称',
  `phone_number` VARCHAR(20) DEFAULT NULL COMMENT '手机号',
  `wx_number` VARCHAR(100) DEFAULT NULL COMMENT '微信号',
  `status` INT DEFAULT 0 COMMENT '状态 0-正常 1-禁用',
  `avatar` VARCHAR(500) DEFAULT NULL COMMENT '头像',
  `sex` INT DEFAULT NULL COMMENT '性别 0-未知 1-男 2-女',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `ip` VARCHAR(50) DEFAULT NULL COMMENT 'IP地址',
  `ip_source` VARCHAR(200) DEFAULT NULL COMMENT 'IP来源',
  `last_time` DATETIME DEFAULT NULL COMMENT '最后登录时间',
  `email` VARCHAR(100) DEFAULT NULL COMMENT '邮箱',
  `password` VARCHAR(255) DEFAULT NULL COMMENT '密码',
  `last_ip` VARCHAR(50) DEFAULT NULL COMMENT '最后登录IP',
  `login_type` INT DEFAULT 0 COMMENT '登录方式 0-账号密码 1-微信',
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`),
  KEY `idx_phone` (`phone_number`),
  KEY `idx_wx_number` (`wx_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 2.2 角色表
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` VARCHAR(50) DEFAULT NULL COMMENT '角色名称',
  `role_key` VARCHAR(100) DEFAULT NULL COMMENT '角色权限字符串',
  `status` TINYINT(1) DEFAULT 1 COMMENT '角色状态 0-停用 1-正常',
  `del_flag` INT DEFAULT 0 COMMENT '删除标志 0-未删除 1-已删除',
  `create_by` BIGINT DEFAULT NULL COMMENT '创建者',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` BIGINT DEFAULT NULL COMMENT '更新者',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` VARCHAR(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_role_key` (`role_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- 2.3 用户角色关联表
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` BIGINT NOT NULL COMMENT '用户ID',
  `role_id` BIGINT NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';

-- 2.4 菜单表
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` VARCHAR(50) DEFAULT NULL COMMENT '菜单名称',
  `path` VARCHAR(200) DEFAULT NULL COMMENT '路由地址',
  `component` VARCHAR(255) DEFAULT NULL COMMENT '组件路径',
  `visible` INT DEFAULT 0 COMMENT '菜单状态 0-显示 1-隐藏',
  `status` INT DEFAULT 0 COMMENT '菜单状态 0-正常 1-停用',
  `perms` VARCHAR(100) DEFAULT NULL COMMENT '权限标识',
  `icon` VARCHAR(100) DEFAULT NULL COMMENT '菜单图标',
  `create_by` BIGINT DEFAULT NULL COMMENT '创建者',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` BIGINT DEFAULT NULL COMMENT '更新者',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` INT DEFAULT 0 COMMENT '删除标志 0-未删除 1-已删除',
  `remark` VARCHAR(500) DEFAULT NULL COMMENT '备注',
  `parent_id` BIGINT DEFAULT 0 COMMENT '父菜单ID',
  `order_num` INT DEFAULT 0 COMMENT '排序',
  `menu_type` CHAR(1) DEFAULT NULL COMMENT '类型 M-目录 C-菜单 F-按钮',
  `is_frame` TINYINT(1) DEFAULT 0 COMMENT '是否为外链 0-是 1-否',
  `router_name` VARCHAR(100) DEFAULT NULL COMMENT '路由名称',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';

-- 2.5 角色菜单关联表
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` BIGINT NOT NULL COMMENT '角色ID',
  `menu_id` BIGINT NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`),
  KEY `idx_menu_id` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色菜单关联表';

-- ============================================
-- 3. 菜品相关表
-- ============================================

-- 3.1 菜品分类表
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` VARCHAR(50) DEFAULT NULL COMMENT '分类名称',
  `sort` INT DEFAULT 0 COMMENT '排序',
  `icon` VARCHAR(200) DEFAULT NULL COMMENT '图标',
  `status` INT DEFAULT 0 COMMENT '状态 0-启用 1-禁用',
  PRIMARY KEY (`id`),
  KEY `idx_sort` (`sort`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜品分类表';

-- 3.2 菜品表
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '菜品ID',
  `name` VARCHAR(100) NOT NULL COMMENT '菜品名称',
  `price` DOUBLE DEFAULT 0.00 COMMENT '价格',
  `pricutre` VARCHAR(500) DEFAULT NULL COMMENT '主图片',
  `remarks` VARCHAR(500) DEFAULT NULL COMMENT '简介',
  `status` INT DEFAULT 0 COMMENT '状态 0-正常 1-下架',
  `inventory` INT DEFAULT 0 COMMENT '库存数量',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sell_id` BIGINT DEFAULT NULL COMMENT '统计表ID',
  `type_id` BIGINT DEFAULT NULL COMMENT '分类ID',
  `packaging_fee` DOUBLE DEFAULT 0.00 COMMENT '包装费',
  `sort` INT DEFAULT 0 COMMENT '排序',
  `unit` VARCHAR(20) DEFAULT '份' COMMENT '单位',
  `use_property` TINYINT(1) DEFAULT 0 COMMENT '是否使用标签',
  `min_buy_num` INT DEFAULT 1 COMMENT '最小购买数量',
  PRIMARY KEY (`id`),
  KEY `idx_type_id` (`type_id`),
  KEY `idx_status` (`status`),
  KEY `idx_sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜品表';

-- 3.3 标签表
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `name` VARCHAR(50) DEFAULT NULL COMMENT '标签名称',
  `parent_id` BIGINT DEFAULT 0 COMMENT '父标签ID',
  `sort` BIGINT DEFAULT 0 COMMENT '排序',
  `status` INT DEFAULT 0 COMMENT '状态 0-启用 1-禁用',
  `price` DOUBLE DEFAULT 0.00 COMMENT '附加价格',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

-- 3.4 菜品标签关联表
DROP TABLE IF EXISTS `food_tag`;
CREATE TABLE `food_tag` (
  `food_id` BIGINT NOT NULL COMMENT '菜品ID',
  `tag_id` BIGINT NOT NULL COMMENT '标签ID',
  `is_default` INT DEFAULT 0 COMMENT '是否默认选中',
  `is_open_checkbox` TINYINT(1) DEFAULT 0 COMMENT '是否多选',
  `desc` VARCHAR(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`food_id`, `tag_id`),
  KEY `idx_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜品标签关联表';

-- 3.5 菜品图片表
DROP TABLE IF EXISTS `food_pricutre`;
CREATE TABLE `food_pricutre` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `food_id` BIGINT DEFAULT NULL COMMENT '菜品ID',
  `url` VARCHAR(500) DEFAULT NULL COMMENT '图片URL',
  `ordernum` INT DEFAULT 0 COMMENT '排序',
  `name` VARCHAR(100) DEFAULT NULL COMMENT '图片名称',
  PRIMARY KEY (`id`),
  KEY `idx_food_id` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜品图片表';

-- 3.6 菜品配料关联表
DROP TABLE IF EXISTS `food_food`;
CREATE TABLE `food_food` (
  `food_id` BIGINT NOT NULL COMMENT '菜品ID',
  `mix_id` BIGINT NOT NULL COMMENT '配料ID',
  PRIMARY KEY (`food_id`, `mix_id`),
  KEY `idx_mix_id` (`mix_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜品配料关联表';

-- 3.7 菜品热度统计表（智能功能）
DROP TABLE IF EXISTS `food_popularity`;
CREATE TABLE `food_popularity` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `food_id` BIGINT NOT NULL COMMENT '菜品ID',
  `sales_count` INT DEFAULT 0 COMMENT '销量',
  `view_count` INT DEFAULT 0 COMMENT '浏览量',
  `favorite_count` INT DEFAULT 0 COMMENT '收藏量',
  `rating` DOUBLE DEFAULT 0.00 COMMENT '评分',
  `rating_count` INT DEFAULT 0 COMMENT '评分人数',
  `popularity_score` DOUBLE DEFAULT 0.00 COMMENT '热度值',
  `stat_date` DATE DEFAULT NULL COMMENT '统计日期',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_food_date` (`food_id`, `stat_date`),
  KEY `idx_popularity_score` (`popularity_score`),
  KEY `idx_stat_date` (`stat_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜品热度统计表';

-- ============================================
-- 4. 订单相关表
-- ============================================

-- 4.1 订单表
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` VARCHAR(50) NOT NULL COMMENT '订单号',
  `user_id` BIGINT DEFAULT NULL COMMENT '下单用户ID',
  `handler_id` BIGINT DEFAULT NULL COMMENT '接单用户ID',
  `total` DOUBLE DEFAULT 0.00 COMMENT '总价钱',
  `status` VARCHAR(20) DEFAULT 'pending' COMMENT '订单状态 pending-待处理 processing-制作中 completed-已完成 cancelled-已取消',
  `remarks` VARCHAR(500) DEFAULT NULL COMMENT '备注',
  `take_food_code` VARCHAR(20) DEFAULT NULL COMMENT '取餐码',
  `seat_id` BIGINT DEFAULT NULL COMMENT '座位ID',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `achievement_time` DATETIME DEFAULT NULL COMMENT '完成时间',
  `edc` DATETIME DEFAULT NULL COMMENT '预计完成时间',
  `pay_status` VARCHAR(20) DEFAULT 'unpaid' COMMENT '支付状态 unpaid-未支付 paid-已支付 refunded-已退款',
  `pay_name` VARCHAR(50) DEFAULT NULL COMMENT '支付方式',
  `pay_code` VARCHAR(100) DEFAULT NULL COMMENT '支付code',
  `pay_time` DATETIME DEFAULT NULL COMMENT '支付时间',
  `property_text` VARCHAR(500) DEFAULT NULL COMMENT '扩展类型',
  `mobile` VARCHAR(20) DEFAULT NULL COMMENT '手机号码',
  `num` INT DEFAULT 0 COMMENT '商品总数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_status` (`status`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_seat_id` (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- 4.2 订单详情表
DROP TABLE IF EXISTS `t_order_details`;
CREATE TABLE `t_order_details` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '详情ID',
  `order_id` BIGINT NOT NULL COMMENT '订单ID',
  `food_id` BIGINT NOT NULL COMMENT '菜品ID',
  `food_parent_id` BIGINT DEFAULT NULL COMMENT '食物的父亲ID',
  `num` INT DEFAULT 1 COMMENT '数量',
  `price` DOUBLE DEFAULT 0.00 COMMENT '单价',
  `property_text` VARCHAR(500) DEFAULT NULL COMMENT '扩展描述',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_food_id` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单详情表';

-- ============================================
-- 5. 座位表
-- ============================================

DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '座位ID',
  `num` INT DEFAULT NULL COMMENT '座位号',
  `max_capacity` INT DEFAULT 4 COMMENT '最大容量',
  `remark` VARCHAR(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_num` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='座位表';

-- ============================================
-- 6. 评价表
-- ============================================

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `user_id` BIGINT DEFAULT NULL COMMENT '用户ID',
  `content` TEXT COMMENT '评论内容',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `food_id` BIGINT DEFAULT NULL COMMENT '评论的食品ID',
  `parent_id` BIGINT DEFAULT 0 COMMENT '父评论ID',
  `reply_uid` BIGINT DEFAULT NULL COMMENT '回答的用户ID',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_food_id` (`food_id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评价表';

-- ============================================
-- 7. 智能功能相关表
-- ============================================

-- 7.1 会员等级表
DROP TABLE IF EXISTS `member_level`;
CREATE TABLE `member_level` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '等级ID',
  `level_name` VARCHAR(50) NOT NULL COMMENT '等级名称',
  `level` INT NOT NULL COMMENT '等级编号',
  `required_points` INT DEFAULT 0 COMMENT '所需积分',
  `discount` DOUBLE DEFAULT 100.00 COMMENT '折扣率（0-100）',
  `benefits` VARCHAR(500) DEFAULT NULL COMMENT '权益描述',
  `status` INT DEFAULT 0 COMMENT '状态 0-启用 1-禁用',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_level` (`level`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员等级表';

-- 7.2 会员信息表
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '会员ID',
  `user_id` BIGINT NOT NULL COMMENT '用户ID',
  `level_id` BIGINT DEFAULT NULL COMMENT '会员等级ID',
  `points` INT DEFAULT 0 COMMENT '积分',
  `total_consumption` DOUBLE DEFAULT 0.00 COMMENT '累计消费金额',
  `consumption_count` INT DEFAULT 0 COMMENT '累计消费次数',
  `register_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`user_id`),
  KEY `idx_level_id` (`level_id`),
  KEY `idx_points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员信息表';

-- 7.3 优惠券表
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '优惠券ID',
  `name` VARCHAR(100) NOT NULL COMMENT '优惠券名称',
  `type` INT NOT NULL COMMENT '类型 1-满减 2-折扣 3-代金券',
  `value` DOUBLE NOT NULL COMMENT '优惠金额/折扣率',
  `threshold` DOUBLE DEFAULT 0.00 COMMENT '使用门槛（满多少可用）',
  `start_time` DATETIME NOT NULL COMMENT '有效期开始时间',
  `end_time` DATETIME NOT NULL COMMENT '有效期结束时间',
  `total_count` INT DEFAULT 0 COMMENT '发放总数',
  `used_count` INT DEFAULT 0 COMMENT '已发放数量',
  `limit_per_user` INT DEFAULT 1 COMMENT '每人限领数量',
  `status` INT DEFAULT 0 COMMENT '状态 0-启用 1-禁用',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `idx_time` (`start_time`, `end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券表';

-- 7.4 用户优惠券表
DROP TABLE IF EXISTS `user_coupon`;
CREATE TABLE `user_coupon` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` BIGINT NOT NULL COMMENT '用户ID',
  `coupon_id` BIGINT NOT NULL COMMENT '优惠券ID',
  `status` INT DEFAULT 0 COMMENT '状态 0-未使用 1-已使用 2-已过期',
  `use_time` DATETIME DEFAULT NULL COMMENT '使用时间',
  `order_id` BIGINT DEFAULT NULL COMMENT '订单ID（使用该优惠券的订单）',
  `receive_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '获取时间',
  `expire_time` DATETIME NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_coupon_id` (`coupon_id`),
  KEY `idx_status` (`status`),
  KEY `idx_expire_time` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户优惠券表';

-- 7.5 排号表
DROP TABLE IF EXISTS `queue_number`;
CREATE TABLE `queue_number` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '排号ID',
  `queue_no` VARCHAR(50) NOT NULL COMMENT '排号',
  `user_id` BIGINT DEFAULT NULL COMMENT '用户ID',
  `mobile` VARCHAR(20) DEFAULT NULL COMMENT '手机号',
  `people_count` INT DEFAULT 1 COMMENT '人数',
  `status` INT DEFAULT 0 COMMENT '状态 0-等待中 1-已叫号 2-已过期 3-已取消',
  `estimated_wait_time` INT DEFAULT NULL COMMENT '预计等待时间（分钟）',
  `queue_position` INT DEFAULT NULL COMMENT '当前排队位置',
  `call_time` DATETIME DEFAULT NULL COMMENT '叫号时间',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_queue_no` (`queue_no`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_status` (`status`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='排号表';

-- ============================================
-- 8. 初始化数据
-- ============================================

-- 8.1 初始化管理员角色
INSERT INTO `sys_role` (`id`, `name`, `role_key`, `status`, `del_flag`, `remark`) VALUES
(1, '超级管理员', 'admin', 1, 0, '超级管理员'),
(2, '普通管理员', 'manager', 1, 0, '普通管理员'),
(3, '普通用户', 'user', 1, 0, '普通用户');

-- 8.2 初始化管理员用户（密码: 123456，BCrypt加密）
-- BCrypt加密后的密码（123456）: $2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iwK8pXHy
INSERT INTO `sys_user` (`id`, `user_name`, `nick_name`, `password`, `status`, `create_time`) VALUES
(1, 'admin', '管理员', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iwK8pXHy', 0, NOW());

-- 8.3 初始化用户角色关联
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
(1, 1);

-- 8.4 初始化会员等级
INSERT INTO `member_level` (`id`, `level_name`, `level`, `required_points`, `discount`, `benefits`, `status`) VALUES
(1, '普通会员', 1, 0, 100.00, '享受基础服务', 0),
(2, '银卡会员', 2, 100, 95.00, '享受9.5折优惠', 0),
(3, '金卡会员', 3, 500, 90.00, '享受9折优惠', 0),
(4, '钻石会员', 4, 2000, 85.00, '享受8.5折优惠，优先服务', 0);

-- 8.5 初始化菜品分类
INSERT INTO `type` (`id`, `name`, `sort`, `icon`, `status`) VALUES
(1, '热销推荐', 1, 'hot', 0),
(2, '主食', 2, 'rice', 0),
(3, '小吃', 3, 'snack', 0),
(4, '饮品', 4, 'drink', 0),
(5, '甜品', 5, 'dessert', 0);

-- 8.6 初始化座位（示例）
INSERT INTO `seat` (`id`, `num`, `max_capacity`, `remark`) VALUES
(1, 1, 4, '1号桌'),
(2, 2, 4, '2号桌'),
(3, 3, 6, '3号桌（大桌）'),
(4, 4, 2, '4号桌（小桌）'),
(5, 5, 4, '5号桌');

-- ============================================
-- 9. 创建视图（可选）
-- ============================================

-- 9.1 菜品统计视图
CREATE OR REPLACE VIEW `v_food_statistics` AS
SELECT 
    f.id,
    f.name,
    f.price,
    f.type_id,
    t.name AS type_name,
    COALESCE(SUM(od.num), 0) AS total_sales,
    COALESCE(SUM(od.num * od.price), 0) AS total_revenue,
    COALESCE(AVG(fp.rating), 0) AS avg_rating,
    COALESCE(fp.popularity_score, 0) AS popularity_score
FROM food f
LEFT JOIN type t ON f.type_id = t.id
LEFT JOIN t_order_details od ON f.id = od.food_id
LEFT JOIN t_order o ON od.order_id = o.id AND o.status = 'completed'
LEFT JOIN food_popularity fp ON f.id = fp.food_id
WHERE f.status = 0
GROUP BY f.id, f.name, f.price, f.type_id, t.name, fp.popularity_score;

-- ============================================
-- 10. 存储过程（可选）
-- ============================================

-- 10.1 更新菜品热度存储过程
DELIMITER $$
CREATE PROCEDURE `sp_update_food_popularity`(IN p_food_id BIGINT)
BEGIN
    DECLARE v_sales_count INT DEFAULT 0;
    DECLARE v_rating DOUBLE DEFAULT 0;
    DECLARE v_rating_count INT DEFAULT 0;
    
    -- 计算销量
    SELECT COALESCE(SUM(od.num), 0) INTO v_sales_count
    FROM t_order_details od
    INNER JOIN t_order o ON od.order_id = o.id
    WHERE od.food_id = p_food_id AND o.status = 'completed';
    
    -- 计算评分（如果有评价表）
    -- SELECT COALESCE(AVG(rating), 0), COUNT(*) INTO v_rating, v_rating_count
    -- FROM comment WHERE food_id = p_food_id;
    
    -- 更新或插入热度记录
    INSERT INTO food_popularity (food_id, sales_count, rating, rating_count, popularity_score, stat_date)
    VALUES (p_food_id, v_sales_count, v_rating, v_rating_count, 
            v_sales_count * 0.6 + v_rating * v_rating_count * 0.4, CURDATE())
    ON DUPLICATE KEY UPDATE
        sales_count = v_sales_count,
        rating = v_rating,
        rating_count = v_rating_count,
        popularity_score = v_sales_count * 0.6 + v_rating * v_rating_count * 0.4,
        update_time = NOW();
END$$
DELIMITER ;

-- ============================================
-- 数据库配置完成
-- ============================================
-- 提示：
-- 1. 请根据实际情况修改初始数据
-- 2. 管理员密码需要根据实际加密方式修改
-- 3. 建议定期备份数据库
-- 4. 生产环境请删除示例数据
-- ============================================

