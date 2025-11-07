-- ============================================
-- 智能餐饮服务系统 - 完整菜单数据初始化SQL
-- ============================================
-- 创建时间: 2024
-- 说明: 初始化所有管理员菜单项
-- ============================================

USE `orderfoodapp`;

-- 清空现有菜单数据（保留ID自增）
DELETE FROM `sys_menu` WHERE id > 0;
ALTER TABLE `sys_menu` AUTO_INCREMENT = 1;

-- ============================================
-- 1. 仪表盘（首页）
-- ============================================
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('首页', 'dashboard', 'dashboard/index', 0, 0, NULL, 'dashboard', 0, 1, 'C', 0, 'Dashboard');

-- ============================================
-- 2. 菜单管理模块
-- ============================================
-- 2.1 菜单管理主目录
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('菜单管理', 'menu-management', NULL, 0, 0, NULL, 'menu', 0, 2, 'M', 0, NULL);

SET @menu_mgmt_id = LAST_INSERT_ID();

-- 2.2 菜品分类管理
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('菜品分类', 'type', 'type/index', 0, 0, 'system:type:list', 'guide', @menu_mgmt_id, 1, 'C', 0, 'Type');

-- 2.3 菜品管理
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('菜品管理', 'food', 'food/index', 0, 0, 'system:food:list', 'component', @menu_mgmt_id, 2, 'C', 0, 'Food');

-- 2.4 标签管理
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('标签管理', 'tag', 'tag/index', 0, 0, 'system:tag:list', 'price-tag', @menu_mgmt_id, 3, 'C', 0, 'Tag');

-- ============================================
-- 3. 订单管理模块
-- ============================================
-- 3.1 订单管理主目录
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('订单管理', 'order-management', NULL, 0, 0, NULL, 'shopping', 0, 3, 'M', 0, NULL);

SET @order_mgmt_id = LAST_INSERT_ID();

-- 3.2 所有订单
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('所有订单', 'order', 'order/index', 0, 0, 'system:order:list', 'list', @order_mgmt_id, 1, 'C', 0, 'Order');

-- 3.3 实时订单
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('实时订单', 'order/realtime', 'order/realtime/index', 0, 0, 'system:order:realtime', 'time', @order_mgmt_id, 2, 'C', 0, 'OrderRealtime');

-- ============================================
-- 4. 用户管理模块
-- ============================================
-- 4.1 用户管理主目录
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('用户管理', 'user-management', NULL, 0, 0, NULL, 'user', 0, 4, 'M', 0, NULL);

SET @user_mgmt_id = LAST_INSERT_ID();

-- 4.2 用户信息管理
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('用户信息', 'user', 'user/index', 0, 0, 'system:user:list', 'peoples', @user_mgmt_id, 1, 'C', 0, 'User');

-- 4.3 会员等级管理
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('会员等级', 'user/member-level', 'user/member-level/index', 0, 0, 'system:member:level', 'star', @user_mgmt_id, 2, 'C', 0, 'MemberLevel');

-- 4.4 用户行为分析
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('行为分析', 'user/behavior', 'user/behavior/index', 0, 0, 'system:user:behavior', 'chart', @user_mgmt_id, 3, 'C', 0, 'UserBehavior');

-- ============================================
-- 5. 座位管理模块
-- ============================================
-- 5.1 座位管理主目录
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('座位管理', 'seat-management', NULL, 0, 0, NULL, 'table', 0, 5, 'M', 0, NULL);

SET @seat_mgmt_id = LAST_INSERT_ID();

-- 5.2 座位布局
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('座位布局', 'seat', 'seat/index', 0, 0, 'system:seat:list', 'grid', @seat_mgmt_id, 1, 'C', 0, 'Seat');

-- 5.3 包间管理
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('包间管理', 'seat/private-room', 'seat/private-room/index', 0, 0, 'system:seat:private', 'office-building', @seat_mgmt_id, 2, 'C', 0, 'PrivateRoom');

-- ============================================
-- 6. 后厨管理模块
-- ============================================
-- 6.1 后厨管理主目录
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('后厨管理', 'kitchen-management', NULL, 0, 0, NULL, 'food', 0, 6, 'M', 0, NULL);

SET @kitchen_mgmt_id = LAST_INSERT_ID();

-- 6.2 订单处理
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('订单处理', 'kitchen/order', 'kitchen/order/index', 0, 0, 'system:kitchen:order', 'list', @kitchen_mgmt_id, 1, 'C', 0, 'KitchenOrder');

-- 6.3 库存预警
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('库存预警', 'kitchen/inventory', 'kitchen/inventory/index', 0, 0, 'system:kitchen:inventory', 'warning', @kitchen_mgmt_id, 2, 'C', 0, 'KitchenInventory');

-- 6.4 任务分配
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('任务分配', 'kitchen/task', 'kitchen/task/index', 0, 0, 'system:kitchen:task', 'document', @kitchen_mgmt_id, 3, 'C', 0, 'KitchenTask');

-- ============================================
-- 7. 客服管理模块
-- ============================================
-- 7.1 客服管理主目录
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('客服管理', 'customer-service', NULL, 0, 0, NULL, 'service', 0, 7, 'M', 0, NULL);

SET @service_mgmt_id = LAST_INSERT_ID();

-- 7.2 用户反馈
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('用户反馈', 'service/feedback', 'service/feedback/index', 0, 0, 'system:service:feedback', 'message', @service_mgmt_id, 1, 'C', 0, 'ServiceFeedback');

-- 7.3 客服工单
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('客服工单', 'service/ticket', 'service/ticket/index', 0, 0, 'system:service:ticket', 'ticket', @service_mgmt_id, 2, 'C', 0, 'ServiceTicket');

-- 7.4 情绪分析
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('情绪分析', 'service/sentiment', 'service/sentiment/index', 0, 0, 'system:service:sentiment', 'data-analysis', @service_mgmt_id, 3, 'C', 0, 'ServiceSentiment');

-- 7.5 服务评价
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('服务评价', 'service/evaluation', 'service/evaluation/index', 0, 0, 'system:service:evaluation', 'star', @service_mgmt_id, 4, 'C', 0, 'ServiceEvaluation');

-- 7.6 评论管理
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('评论管理', 'comment', 'comment/index', 0, 0, 'system:comment:list', 'edit', @service_mgmt_id, 5, 'C', 0, 'Comment');

-- ============================================
-- 8. 系统管理模块
-- ============================================
-- 8.1 系统管理主目录
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('系统管理', 'system-management', NULL, 0, 0, NULL, 'system', 0, 8, 'M', 0, NULL);

SET @system_mgmt_id = LAST_INSERT_ID();

-- 8.2 员工管理
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('员工管理', 'system/staff', 'system/staff/index', 0, 0, 'system:staff:list', 'people', @system_mgmt_id, 1, 'C', 0, 'SystemStaff');

-- 8.3 角色管理
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('角色管理', 'role', 'role/index', 0, 0, 'system:role:list', 'user-solid', @system_mgmt_id, 2, 'C', 0, 'Role');

-- 8.4 菜单管理（系统菜单）
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('菜单管理', 'menu', 'menu/index', 0, 0, 'system:menu:list', 'tree-table', @system_mgmt_id, 3, 'C', 0, 'Menu');

-- 8.5 系统参数
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('系统参数', 'system/config', 'system/config/index', 0, 0, 'system:config:list', 'setting', @system_mgmt_id, 4, 'C', 0, 'SystemConfig');

-- 8.6 操作日志
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('操作日志', 'system/log', 'system/log/index', 0, 0, 'system:log:list', 'documentation', @system_mgmt_id, 5, 'C', 0, 'SystemLog');

-- ============================================
-- 9. 数据分析模块
-- ============================================
-- 9.1 数据分析主目录
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('数据分析', 'analytics', NULL, 0, 0, NULL, 'chart', 0, 9, 'M', 0, NULL);

SET @analytics_id = LAST_INSERT_ID();

-- 9.2 数据统计
INSERT INTO `sys_menu` (`menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) VALUES
('数据统计', 'analytics/index', 'analytics/index', 0, 0, 'system:analytics:list', 'data-line', @analytics_id, 1, 'C', 0, 'Analytics');

-- ============================================
-- 完成菜单初始化
-- ============================================
SELECT '菜单数据初始化完成！' AS message;

