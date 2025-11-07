-- ============================================
-- 智能餐饮服务系统 - 完整菜单和权限初始化SQL
-- ============================================
-- 创建时间: 2024
-- 说明: 初始化所有管理员菜单项和权限关联
-- ============================================

USE `orderfoodapp`;

-- ============================================
-- 步骤1: 确保管理员角色存在
-- ============================================
INSERT INTO `sys_role` (`id`, `name`, `role_key`, `status`, `del_flag`, `remark`) 
VALUES (1, '管理员', 'admin', 1, 0, '系统管理员角色')
ON DUPLICATE KEY UPDATE `name`='管理员', `role_key`='admin', `status`=1, `del_flag`=0;

-- ============================================
-- 步骤2: 清空现有菜单数据（可选，如果需要重新初始化）
-- ============================================
-- DELETE FROM `sys_role_menu` WHERE role_id = 1;
-- DELETE FROM `sys_menu` WHERE id > 0;
-- ALTER TABLE `sys_menu` AUTO_INCREMENT = 1;

-- ============================================
-- 步骤3: 插入菜单数据（使用固定ID避免依赖LAST_INSERT_ID）
-- ============================================

-- 1. 首页（ID: 100）
INSERT INTO `sys_menu` (`id`, `menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) 
VALUES (100, '首页', 'dashboard', 'dashboard/index', 0, 0, NULL, 'dashboard', 0, 1, 'C', 0, 'Dashboard')
ON DUPLICATE KEY UPDATE 
  `menu_name`='首页', `path`='dashboard', `component`='dashboard/index', 
  `visible`=0, `status`=0, `icon`='dashboard', `parent_id`=0, `order_num`=1;

-- 2. 菜单管理模块
INSERT INTO `sys_menu` (`id`, `menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) 
VALUES 
(200, '菜单管理', 'menu-management', NULL, 0, 0, NULL, 'menu', 0, 2, 'M', 0, NULL),
(201, '菜品分类', 'type', 'type/index', 0, 0, 'system:type:list', 'guide', 200, 1, 'C', 0, 'Type'),
(202, '菜品管理', 'food', 'food/index', 0, 0, 'system:food:list', 'component', 200, 2, 'C', 0, 'Food'),
(203, '标签管理', 'tag', 'tag/index', 0, 0, 'system:tag:list', 'price-tag', 200, 3, 'C', 0, 'Tag')
ON DUPLICATE KEY UPDATE 
  `menu_name`=VALUES(`menu_name`), `path`=VALUES(`path`), `component`=VALUES(`component`),
  `visible`=VALUES(`visible`), `status`=VALUES(`status`), `icon`=VALUES(`icon`),
  `parent_id`=VALUES(`parent_id`), `order_num`=VALUES(`order_num`);

-- 3. 订单管理模块
INSERT INTO `sys_menu` (`id`, `menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) 
VALUES 
(300, '订单管理', 'order-management', NULL, 0, 0, NULL, 'shopping', 0, 3, 'M', 0, NULL),
(301, '所有订单', 'order', 'order/index', 0, 0, 'system:order:list', 'list', 300, 1, 'C', 0, 'Order'),
(302, '实时订单', 'order/realtime', 'order/realtime/index', 0, 0, 'system:order:realtime', 'time', 300, 2, 'C', 0, 'OrderRealtime')
ON DUPLICATE KEY UPDATE 
  `menu_name`=VALUES(`menu_name`), `path`=VALUES(`path`), `component`=VALUES(`component`),
  `visible`=VALUES(`visible`), `status`=VALUES(`status`), `icon`=VALUES(`icon`),
  `parent_id`=VALUES(`parent_id`), `order_num`=VALUES(`order_num`);

-- 4. 用户管理模块
INSERT INTO `sys_menu` (`id`, `menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) 
VALUES 
(400, '用户管理', 'user-management', NULL, 0, 0, NULL, 'user', 0, 4, 'M', 0, NULL),
(401, '用户信息', 'user', 'user/index', 0, 0, 'system:user:list', 'peoples', 400, 1, 'C', 0, 'User'),
(402, '会员等级', 'user/member-level', 'user/member-level/index', 0, 0, 'system:member:level', 'star', 400, 2, 'C', 0, 'MemberLevel'),
(403, '行为分析', 'user/behavior', 'user/behavior/index', 0, 0, 'system:user:behavior', 'chart', 400, 3, 'C', 0, 'UserBehavior')
ON DUPLICATE KEY UPDATE 
  `menu_name`=VALUES(`menu_name`), `path`=VALUES(`path`), `component`=VALUES(`component`),
  `visible`=VALUES(`visible`), `status`=VALUES(`status`), `icon`=VALUES(`icon`),
  `parent_id`=VALUES(`parent_id`), `order_num`=VALUES(`order_num`);

-- 5. 座位管理模块
INSERT INTO `sys_menu` (`id`, `menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) 
VALUES 
(500, '座位管理', 'seat-management', NULL, 0, 0, NULL, 'table', 0, 5, 'M', 0, NULL),
(501, '座位布局', 'seat', 'seat/index', 0, 0, 'system:seat:list', 'grid', 500, 1, 'C', 0, 'Seat'),
(502, '包间管理', 'seat/private-room', 'seat/private-room/index', 0, 0, 'system:seat:private', 'office-building', 500, 2, 'C', 0, 'PrivateRoom')
ON DUPLICATE KEY UPDATE 
  `menu_name`=VALUES(`menu_name`), `path`=VALUES(`path`), `component`=VALUES(`component`),
  `visible`=VALUES(`visible`), `status`=VALUES(`status`), `icon`=VALUES(`icon`),
  `parent_id`=VALUES(`parent_id`), `order_num`=VALUES(`order_num`);

-- 6. 后厨管理模块
INSERT INTO `sys_menu` (`id`, `menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) 
VALUES 
(600, '后厨管理', 'kitchen-management', NULL, 0, 0, NULL, 'food', 0, 6, 'M', 0, NULL),
(601, '订单处理', 'kitchen/order', 'kitchen/order/index', 0, 0, 'system:kitchen:order', 'list', 600, 1, 'C', 0, 'KitchenOrder'),
(602, '库存预警', 'kitchen/inventory', 'kitchen/inventory/index', 0, 0, 'system:kitchen:inventory', 'warning', 600, 2, 'C', 0, 'KitchenInventory'),
(603, '任务分配', 'kitchen/task', 'kitchen/task/index', 0, 0, 'system:kitchen:task', 'document', 600, 3, 'C', 0, 'KitchenTask')
ON DUPLICATE KEY UPDATE 
  `menu_name`=VALUES(`menu_name`), `path`=VALUES(`path`), `component`=VALUES(`component`),
  `visible`=VALUES(`visible`), `status`=VALUES(`status`), `icon`=VALUES(`icon`),
  `parent_id`=VALUES(`parent_id`), `order_num`=VALUES(`order_num`);

-- 7. 客服管理模块
INSERT INTO `sys_menu` (`id`, `menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) 
VALUES 
(700, '客服管理', 'customer-service', NULL, 0, 0, NULL, 'service', 0, 7, 'M', 0, NULL),
(701, '用户反馈', 'service/feedback', 'service/feedback/index', 0, 0, 'system:service:feedback', 'message', 700, 1, 'C', 0, 'ServiceFeedback'),
(702, '客服工单', 'service/ticket', 'service/ticket/index', 0, 0, 'system:service:ticket', 'ticket', 700, 2, 'C', 0, 'ServiceTicket'),
(703, '情绪分析', 'service/sentiment', 'service/sentiment/index', 0, 0, 'system:service:sentiment', 'data-analysis', 700, 3, 'C', 0, 'ServiceSentiment'),
(704, '服务评价', 'service/evaluation', 'service/evaluation/index', 0, 0, 'system:service:evaluation', 'star', 700, 4, 'C', 0, 'ServiceEvaluation'),
(705, '评论管理', 'comment', 'comment/index', 0, 0, 'system:comment:list', 'edit', 700, 5, 'C', 0, 'Comment')
ON DUPLICATE KEY UPDATE 
  `menu_name`=VALUES(`menu_name`), `path`=VALUES(`path`), `component`=VALUES(`component`),
  `visible`=VALUES(`visible`), `status`=VALUES(`status`), `icon`=VALUES(`icon`),
  `parent_id`=VALUES(`parent_id`), `order_num`=VALUES(`order_num`);

-- 8. 系统管理模块
INSERT INTO `sys_menu` (`id`, `menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) 
VALUES 
(800, '系统管理', 'system-management', NULL, 0, 0, NULL, 'system', 0, 8, 'M', 0, NULL),
(801, '员工管理', 'system/staff', 'system/staff/index', 0, 0, 'system:staff:list', 'people', 800, 1, 'C', 0, 'SystemStaff'),
(802, '角色管理', 'role', 'role/index', 0, 0, 'system:role:list', 'user-solid', 800, 2, 'C', 0, 'Role'),
(803, '菜单管理', 'menu', 'menu/index', 0, 0, 'system:menu:list', 'tree-table', 800, 3, 'C', 0, 'Menu'),
(804, '系统参数', 'system/config', 'system/config/index', 0, 0, 'system:config:list', 'setting', 800, 4, 'C', 0, 'SystemConfig'),
(805, '操作日志', 'system/log', 'system/log/index', 0, 0, 'system:log:list', 'documentation', 800, 5, 'C', 0, 'SystemLog')
ON DUPLICATE KEY UPDATE 
  `menu_name`=VALUES(`menu_name`), `path`=VALUES(`path`), `component`=VALUES(`component`),
  `visible`=VALUES(`visible`), `status`=VALUES(`status`), `icon`=VALUES(`icon`),
  `parent_id`=VALUES(`parent_id`), `order_num`=VALUES(`order_num`);

-- 9. 数据分析模块
INSERT INTO `sys_menu` (`id`, `menu_name`, `path`, `component`, `visible`, `status`, `perms`, `icon`, `parent_id`, `order_num`, `menu_type`, `is_frame`, `router_name`) 
VALUES 
(900, '数据分析', 'analytics', NULL, 0, 0, NULL, 'chart', 0, 9, 'M', 0, NULL),
(901, '数据统计', 'analytics/index', 'analytics/index', 0, 0, 'system:analytics:list', 'data-line', 900, 1, 'C', 0, 'Analytics')
ON DUPLICATE KEY UPDATE 
  `menu_name`=VALUES(`menu_name`), `path`=VALUES(`path`), `component`=VALUES(`component`),
  `visible`=VALUES(`visible`), `status`=VALUES(`status`), `icon`=VALUES(`icon`),
  `parent_id`=VALUES(`parent_id`), `order_num`=VALUES(`order_num`);

-- ============================================
-- 步骤4: 为管理员角色分配所有菜单权限
-- ============================================
-- 清空现有权限（可选）
-- DELETE FROM `sys_role_menu` WHERE role_id = 1;

-- 插入所有菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) 
VALUES 
(1, 100), -- 首页
-- 菜单管理
(1, 200), (1, 201), (1, 202), (1, 203),
-- 订单管理
(1, 300), (1, 301), (1, 302),
-- 用户管理
(1, 400), (1, 401), (1, 402), (1, 403),
-- 座位管理
(1, 500), (1, 501), (1, 502),
-- 后厨管理
(1, 600), (1, 601), (1, 602), (1, 603),
-- 客服管理
(1, 700), (1, 701), (1, 702), (1, 703), (1, 704), (1, 705),
-- 系统管理
(1, 800), (1, 801), (1, 802), (1, 803), (1, 804), (1, 805),
-- 数据分析
(1, 900), (1, 901)
ON DUPLICATE KEY UPDATE `role_id`=VALUES(`role_id`), `menu_id`=VALUES(`menu_id`);

-- ============================================
-- 步骤5: 确保admin用户有管理员角色（如果admin用户ID是1）
-- ============================================
-- 假设admin用户的ID是1，如果不是，请修改下面的user_id
INSERT INTO `sys_user_role` (`user_id`, `role_id`) 
VALUES (1, 1)
ON DUPLICATE KEY UPDATE `user_id`=1, `role_id`=1;

-- ============================================
-- 步骤6: 验证数据
-- ============================================
SELECT '菜单数据初始化完成！' AS message;
SELECT COUNT(*) AS menu_count FROM sys_menu WHERE del_flag = 0 AND status = 0;
SELECT COUNT(*) AS role_menu_count FROM sys_role_menu WHERE role_id = 1;
SELECT COUNT(*) AS user_role_count FROM sys_user_role WHERE role_id = 1;

-- 显示所有菜单
SELECT id, menu_name, path, parent_id, order_num, menu_type, status 
FROM sys_menu 
WHERE del_flag = 0 AND status = 0 
ORDER BY order_num;

