/*
Navicat MySQL Data Transfer

Source Server         : 本地服务器
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : yshop

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-06-16 12:04:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ys_access
-- ----------------------------
DROP TABLE IF EXISTS `ys_access`;
CREATE TABLE `ys_access` (
  `role_id` smallint(6) unsigned NOT NULL COMMENT '角色ID',
  `node_id` smallint(6) unsigned NOT NULL COMMENT '节点ID',
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of ys_access
-- ----------------------------
INSERT INTO `ys_access` VALUES ('1', '11');
INSERT INTO `ys_access` VALUES ('1', '10');
INSERT INTO `ys_access` VALUES ('1', '9');
INSERT INTO `ys_access` VALUES ('1', '8');
INSERT INTO `ys_access` VALUES ('1', '7');
INSERT INTO `ys_access` VALUES ('1', '6');
INSERT INTO `ys_access` VALUES ('1', '5');
INSERT INTO `ys_access` VALUES ('1', '4');
INSERT INTO `ys_access` VALUES ('1', '3');
INSERT INTO `ys_access` VALUES ('1', '2');
INSERT INTO `ys_access` VALUES ('1', '1');
INSERT INTO `ys_access` VALUES ('1', '12');
INSERT INTO `ys_access` VALUES ('1', '13');
INSERT INTO `ys_access` VALUES ('1', '14');
INSERT INTO `ys_access` VALUES ('2', '3');
INSERT INTO `ys_access` VALUES ('2', '4');
INSERT INTO `ys_access` VALUES ('2', '6');
INSERT INTO `ys_access` VALUES ('2', '1');
INSERT INTO `ys_access` VALUES ('2', '10');
INSERT INTO `ys_access` VALUES ('2', '11');
INSERT INTO `ys_access` VALUES ('2', '12');
INSERT INTO `ys_access` VALUES ('2', '13');
INSERT INTO `ys_access` VALUES ('2', '14');

-- ----------------------------
-- Table structure for ys_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `ys_admin_users`;
CREATE TABLE `ys_admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID（唯一识别号）',
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `password` char(255) NOT NULL COMMENT '密码',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `create_time` int(15) unsigned DEFAULT '0' COMMENT '创建时间',
  `logintime` int(15) unsigned DEFAULT '0' COMMENT '创建时间',
  `loginip` int(11) unsigned NOT NULL COMMENT '最近登录的IP地址',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '启用状态：0:表示禁用；1:表示启用',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of ys_admin_users
-- ----------------------------
INSERT INTO `ys_admin_users` VALUES ('1', 'admin', '/static/admin/assets/img/admin_1.jpg', '$2y$10$oODyKeML63U4q9aUoACOnOFgqpfFCkY3L1q0JgaUS8j6TvEdeDPPC', '123456@qq.com', '0', '0', '1', '1', ' ');
INSERT INTO `ys_admin_users` VALUES ('2', 'xiaohong', '/static/admin/assets/img/xiaohong_1.jpg', '$2y$10$5OkWCC.GsviGZvcOiMwDJOPkEghp7npBHwQLAphLavwnrCLHNAn..', '666666@qq.com', '0', '0', '2', '0', '');

-- ----------------------------
-- Table structure for ys_customer_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `ys_customer_balance_log`;
CREATE TABLE `ys_customer_balance_log` (
  `balance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '余额日志id',
  `customer_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `source` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '记录来源:1订单,2退货单3,充值',
  `source_sn` int(10) unsigned NOT NULL COMMENT '相关单据ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录生成时间',
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '变动金额',
  PRIMARY KEY (`balance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户余额变动表';

-- ----------------------------
-- Records of ys_customer_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for ys_customer_inf
-- ----------------------------
DROP TABLE IF EXISTS `ys_customer_inf`;
CREATE TABLE `ys_customer_inf` (
  `customer_inf_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'customer_login表的自增ID',
  `customer_name` varchar(20) NOT NULL COMMENT '用户真实姓名',
  `identity_card_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '证件类型：1 身份证,2军官证,3护照',
  `identity_card_no` varchar(20) DEFAULT NULL COMMENT '证件号码',
  `mobile_phone` int(11) unsigned DEFAULT NULL COMMENT '手机号',
  `customer_email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `gender` char(1) DEFAULT NULL COMMENT '性别',
  `user_point` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `birthday` datetime DEFAULT NULL COMMENT '会员生日',
  `customer_level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '会员级别:1普通会员,2青铜会员,3白银会员,4黄金会员,5钻石会员',
  `user_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '用户余额',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`customer_inf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of ys_customer_inf
-- ----------------------------

-- ----------------------------
-- Table structure for ys_customer_login
-- ----------------------------
DROP TABLE IF EXISTS `ys_customer_login`;
CREATE TABLE `ys_customer_login` (
  `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(20) NOT NULL COMMENT '用户登陆名',
  `password` char(255) NOT NULL COMMENT 'md5加密的密码',
  `avatar` char(64) NOT NULL DEFAULT '' COMMENT '会员头像（地址）',
  `user_stats` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登陆表';

-- ----------------------------
-- Records of ys_customer_login
-- ----------------------------

-- ----------------------------
-- Table structure for ys_customer_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ys_customer_login_log`;
CREATE TABLE `ys_customer_login_log` (
  `login_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '登录日志ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT '登录用户ID',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户登录时间',
  `login_ip` int(10) unsigned NOT NULL COMMENT '登录IP',
  `login_type` tinyint(4) NOT NULL COMMENT '登录类型:0未成功 1成功',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录日志表';

-- ----------------------------
-- Records of ys_customer_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for ys_customer_point_log
-- ----------------------------
DROP TABLE IF EXISTS `ys_customer_point_log`;
CREATE TABLE `ys_customer_point_log` (
  `point_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '积分日志ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `source` tinyint(3) unsigned NOT NULL COMMENT '积分来源:0订单,1登录,2活动',
  `refer_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分来源相关编号',
  `change_point` smallint(6) NOT NULL DEFAULT '0' COMMENT '变更积分数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '积分日志生成时间',
  PRIMARY KEY (`point_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分日志表';

-- ----------------------------
-- Records of ys_customer_point_log
-- ----------------------------

-- ----------------------------
-- Table structure for ys_node
-- ----------------------------
DROP TABLE IF EXISTS `ys_node`;
CREATE TABLE `ys_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `name` varchar(50) NOT NULL COMMENT '节点名称',
  `controller` varchar(50) NOT NULL COMMENT '控制器',
  `action` varchar(50) NOT NULL COMMENT '方法',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '节点图标',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` smallint(6) unsigned DEFAULT NULL COMMENT '排序规则',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父节点ID',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='权限节点表';

-- ----------------------------
-- Records of ys_node
-- ----------------------------
INSERT INTO `ys_node` VALUES ('1', '首页', 'index', 'index', 'am-icon-home', '1', ' ', '1', '0');
INSERT INTO `ys_node` VALUES ('2', '商品管理', 'product', 'index', 'am-icon-shopping-bag', '1', ' ', '2', '0');
INSERT INTO `ys_node` VALUES ('3', '订单管理', 'orders', 'index', 'am-icon-cart-plus', '1', ' ', '3', '0');
INSERT INTO `ys_node` VALUES ('4', '会员管理', 'customer', 'index', 'am-icon-user-plus', '1', ' ', '4', '0');
INSERT INTO `ys_node` VALUES ('5', '统计报表', 'statistics', 'index', 'am-icon-line-chart', '1', ' ', '5', '0');
INSERT INTO `ys_node` VALUES ('6', '客服中心', 'customerService', 'index', 'am-icon-qq', '1', ' ', '6', '0');
INSERT INTO `ys_node` VALUES ('7', '系统设置', 'system', 'index', 'am-icon-cog', '1', ' ', '7', '0');
INSERT INTO `ys_node` VALUES ('8', '页面管理', 'page', 'index', 'am-icon-html5', '1', ' ', '8', '0');
INSERT INTO `ys_node` VALUES ('9', '添加订单', 'orders', 'add', '', '1', ' ', '1', '3');
INSERT INTO `ys_node` VALUES ('10', '订单列表', 'orders', 'list', '', '1', ' ', '2', '3');
INSERT INTO `ys_node` VALUES ('11', '订单打印', 'orders', 'printf', '', '1', ' ', '3', '3');
INSERT INTO `ys_node` VALUES ('12', '缺货登记', 'orders', 'lowStock', '', '1', ' ', '4', '3');
INSERT INTO `ys_node` VALUES ('13', '发货单列表', 'orders', 'invoice', '', '1', ' ', '5', '3');
INSERT INTO `ys_node` VALUES ('14', '退货单列表', 'orders', 'productsReturn', '', '1', ' ', '6', '3');
INSERT INTO `ys_node` VALUES ('15', '管理员设置', 'adminManage', 'list', '', '1', null, '1', '7');
INSERT INTO `ys_node` VALUES ('16', '角色管理', 'adminManage', 'role', '', '1', null, '2', '7');
INSERT INTO `ys_node` VALUES ('17', '权限管理', 'adminManage', 'access', '', '1', null, '3', '7');

-- ----------------------------
-- Table structure for ys_order_cart
-- ----------------------------
DROP TABLE IF EXISTS `ys_order_cart`;
CREATE TABLE `ys_order_cart` (
  `cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `product_amount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '加入购物车商品数量',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '商品价格',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入购物车时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of ys_order_cart
-- ----------------------------

-- ----------------------------
-- Table structure for ys_order_customer_addr
-- ----------------------------
DROP TABLE IF EXISTS `ys_order_customer_addr`;
CREATE TABLE `ys_order_customer_addr` (
  `customer_addr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'customer_login表的自增ID',
  `zip` int(11) NOT NULL COMMENT '邮编',
  `province` int(11) NOT NULL COMMENT '地区表中省份的id',
  `city` int(11) NOT NULL COMMENT '地区表中城市的id',
  `district` int(11) NOT NULL COMMENT '地区表中的区id',
  `address` varchar(200) NOT NULL COMMENT '具体的地址门牌号',
  `is_default` tinyint(4) NOT NULL COMMENT '是否默认',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`customer_addr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- ----------------------------
-- Records of ys_order_customer_addr
-- ----------------------------

-- ----------------------------
-- Table structure for ys_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `ys_order_detail`;
CREATE TABLE `ys_order_detail` (
  `order_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键ID,订单详情表ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单表ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '订单商品ID',
  `product_name` varchar(50) NOT NULL COMMENT '商品名称',
  `product_cnt` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '购买商品数量',
  `product_price` decimal(8,2) unsigned NOT NULL COMMENT '购买商品单价',
  `average_cost` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '平均成本价格',
  `weight` float DEFAULT NULL COMMENT '商品重量',
  `fee_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '优惠分摊金额',
  `w_id` int(10) unsigned NOT NULL COMMENT '仓库ID',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29698 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of ys_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for ys_order_master
-- ----------------------------
DROP TABLE IF EXISTS `ys_order_master`;
CREATE TABLE `ys_order_master` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号 yyyymmddnnnnnnnn',
  `customer_id` int(10) unsigned NOT NULL COMMENT '下单人ID',
  `shipping_user` varchar(10) NOT NULL COMMENT '收货人姓名',
  `province` smallint(6) NOT NULL COMMENT '收货人所在省',
  `city` smallint(6) NOT NULL COMMENT '收货人所在市',
  `district` smallint(6) NOT NULL COMMENT '收货人所在区',
  `address` varchar(100) NOT NULL COMMENT '收货人详细地址',
  `payment_method` tinyint(4) NOT NULL COMMENT '支付方式:1现金,2余额,3网银,4支付宝,5微信',
  `order_money` decimal(8,2) unsigned NOT NULL COMMENT '订单金额',
  `district_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `shipping_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '运费金额',
  `payment_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `shipping_comp_name` varchar(10) DEFAULT NULL COMMENT '快递公司名称',
  `shipping_sn` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `shipping_time` datetime DEFAULT NULL COMMENT '发货时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `order_point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单积分',
  `invoice_title` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `ux_ordersn` (`order_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8 COMMENT='订单主表';

-- ----------------------------
-- Records of ys_order_master
-- ----------------------------

-- ----------------------------
-- Table structure for ys_product_brand_info
-- ----------------------------
DROP TABLE IF EXISTS `ys_product_brand_info`;
CREATE TABLE `ys_product_brand_info` (
  `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_name` varchar(50) NOT NULL COMMENT '品牌名称',
  `telephone` varchar(50) NOT NULL COMMENT '联系电话',
  `brand_web` varchar(100) DEFAULT NULL COMMENT '品牌网站',
  `brand_logo` varchar(100) DEFAULT NULL COMMENT '品牌logo URL',
  `brand_desc` varchar(150) DEFAULT NULL COMMENT '品牌描述',
  `brand_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '品牌状态,0禁用,1启用',
  `brand_order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌信息表';

-- ----------------------------
-- Records of ys_product_brand_info
-- ----------------------------

-- ----------------------------
-- Table structure for ys_product_category
-- ----------------------------
DROP TABLE IF EXISTS `ys_product_category`;
CREATE TABLE `ys_product_category` (
  `category_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(10) NOT NULL COMMENT '分类名称',
  `category_code` varchar(10) NOT NULL COMMENT '分类编码',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父分类ID',
  `category_level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '分类层级',
  `category_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '分类状态',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of ys_product_category
-- ----------------------------

-- ----------------------------
-- Table structure for ys_product_comment
-- ----------------------------
DROP TABLE IF EXISTS `ys_product_comment`;
CREATE TABLE `ys_product_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `customer_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `title` varchar(50) NOT NULL COMMENT '评论标题',
  `content` varchar(300) NOT NULL COMMENT '评论内容',
  `audit_status` tinyint(4) NOT NULL COMMENT '审核状态:0未审核1已审核',
  `audit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评论表';

-- ----------------------------
-- Records of ys_product_comment
-- ----------------------------

-- ----------------------------
-- Table structure for ys_product_info
-- ----------------------------
DROP TABLE IF EXISTS `ys_product_info`;
CREATE TABLE `ys_product_info` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `product_code` char(16) NOT NULL COMMENT '商品编码',
  `product_name` varchar(50) NOT NULL COMMENT '商品名称',
  `bar_code` varchar(50) NOT NULL COMMENT '国条码',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌表的ID',
  `one_category_id` smallint(5) unsigned NOT NULL COMMENT '一级分类ID',
  `two_category_id` smallint(5) unsigned NOT NULL COMMENT '二级分类ID',
  `three_category_id` smallint(5) unsigned NOT NULL COMMENT '三级分类ID',
  `supplier_id` int(10) unsigned NOT NULL COMMENT '商品的供应商id',
  `price` decimal(8,2) NOT NULL COMMENT '商品销售价格',
  `average_cost` decimal(18,2) NOT NULL COMMENT '商品加权平均成本',
  `publish_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '上下架状态:0下架1上架',
  `audit_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态:0未审核,1已审核',
  `weight` float DEFAULT NULL COMMENT '商品重量',
  `length` float DEFAULT NULL COMMENT '商品长度',
  `heigh` float DEFAULT NULL COMMENT '商品高度',
  `width` float DEFAULT NULL COMMENT '商品宽度',
  `color_type` enum('红','黄','蓝','黒') DEFAULT NULL,
  `production_date` datetime NOT NULL COMMENT '生产日期',
  `shelf_life` int(11) NOT NULL COMMENT '商品有效期',
  `descript` text NOT NULL COMMENT '商品描述',
  `indate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品录入时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of ys_product_info
-- ----------------------------

-- ----------------------------
-- Table structure for ys_product_pic_info
-- ----------------------------
DROP TABLE IF EXISTS `ys_product_pic_info`;
CREATE TABLE `ys_product_pic_info` (
  `product_pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品图片ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `pic_desc` varchar(50) DEFAULT NULL COMMENT '图片描述',
  `pic_url` varchar(200) NOT NULL COMMENT '图片URL',
  `is_master` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否主图:0.非主图1.主图',
  `pic_order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '图片排序',
  `pic_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '图片是否有效:0无效 1有效',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`product_pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片信息表';

-- ----------------------------
-- Records of ys_product_pic_info
-- ----------------------------

-- ----------------------------
-- Table structure for ys_product_supplier_info
-- ----------------------------
DROP TABLE IF EXISTS `ys_product_supplier_info`;
CREATE TABLE `ys_product_supplier_info` (
  `supplier_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `supplier_code` char(8) NOT NULL COMMENT '供应商编码',
  `supplier_name` char(50) NOT NULL COMMENT '供应商名称',
  `supplier_type` tinyint(4) NOT NULL COMMENT '供应商类型:1.自营,2.平台',
  `link_man` varchar(10) NOT NULL COMMENT '供应商联系人',
  `phone_number` varchar(50) NOT NULL COMMENT '联系电话',
  `bank_name` varchar(50) NOT NULL COMMENT '供应商开户银行名称',
  `bank_account` varchar(50) NOT NULL COMMENT '银行账号',
  `address` varchar(200) NOT NULL COMMENT '供应商地址',
  `supplier_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态:0禁用,1启用',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商信息表';

-- ----------------------------
-- Records of ys_product_supplier_info
-- ----------------------------

-- ----------------------------
-- Table structure for ys_region_info
-- ----------------------------
DROP TABLE IF EXISTS `ys_region_info`;
CREATE TABLE `ys_region_info` (
  `region_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '上级地区id',
  `region_name` varchar(150) NOT NULL COMMENT '城市名称',
  `region_level` tinyint(1) NOT NULL COMMENT '级别',
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17625 DEFAULT CHARSET=utf8 COMMENT='地区信息表';

-- ----------------------------
-- Records of ys_region_info
-- ----------------------------

-- ----------------------------
-- Table structure for ys_role
-- ----------------------------
DROP TABLE IF EXISTS `ys_role`;
CREATE TABLE `ys_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色对应ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '启用状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台角色表';

-- ----------------------------
-- Records of ys_role
-- ----------------------------
INSERT INTO `ys_role` VALUES ('1', '超级管理员', '0', '1', ' ');
INSERT INTO `ys_role` VALUES ('2', '客服主管', '1', '1', ' ');

-- ----------------------------
-- Table structure for ys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `ys_role_user`;
CREATE TABLE `ys_role_user` (
  `role_id` mediumint(9) unsigned NOT NULL COMMENT '角色ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of ys_role_user
-- ----------------------------
INSERT INTO `ys_role_user` VALUES ('1', '1');
INSERT INTO `ys_role_user` VALUES ('2', '2');
INSERT INTO `ys_role_user` VALUES ('2', '1');

-- ----------------------------
-- Table structure for ys_shipping_info
-- ----------------------------
DROP TABLE IF EXISTS `ys_shipping_info`;
CREATE TABLE `ys_shipping_info` (
  `ship_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ship_name` varchar(20) NOT NULL COMMENT '物流公司名称',
  `ship_contact` varchar(20) NOT NULL COMMENT '物流公司联系人',
  `telphone` varchar(20) NOT NULL COMMENT '物流公司联系电话',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '配送价格',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`ship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物流公司信息表';

-- ----------------------------
-- Records of ys_shipping_info
-- ----------------------------

-- ----------------------------
-- Table structure for ys_warehouse_info
-- ----------------------------
DROP TABLE IF EXISTS `ys_warehouse_info`;
CREATE TABLE `ys_warehouse_info` (
  `w_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '仓库ID',
  `warehouse_sn` char(5) NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(10) NOT NULL COMMENT '仓库名称',
  `warehouse_phone` varchar(20) NOT NULL COMMENT '仓库电话',
  `contact` varchar(10) NOT NULL COMMENT '仓库联系人',
  `province` smallint(6) NOT NULL COMMENT '省',
  `city` smallint(6) NOT NULL COMMENT '市',
  `district` smallint(6) NOT NULL COMMENT '区',
  `address` varchar(100) NOT NULL COMMENT '仓库地址',
  `warehouse_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '仓库状态:0禁用,1启用',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='仓库信息表';

-- ----------------------------
-- Records of ys_warehouse_info
-- ----------------------------

-- ----------------------------
-- Table structure for ys_warehouse_proudct
-- ----------------------------
DROP TABLE IF EXISTS `ys_warehouse_proudct`;
CREATE TABLE `ys_warehouse_proudct` (
  `wp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品库存ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `w_id` smallint(5) unsigned NOT NULL COMMENT '仓库ID',
  `currnet_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前商品数量',
  `lock_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前占用数据',
  `in_transit_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '在途数据',
  `average_cost` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '移动加权成本',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`wp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库存表';

-- ----------------------------
-- Records of ys_warehouse_proudct
-- ----------------------------

-- ----------------------------
-- View structure for ys_rbac_u_node_view
-- ----------------------------
DROP VIEW IF EXISTS `ys_rbac_u_node_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ys_rbac_u_node_view` AS select `ys_role_user`.`user_id` AS `user_id`,`ys_admin_users`.`username` AS `username`,`ys_role_user`.`role_id` AS `role_id`,`ys_role`.`name` AS `role_name`,`ys_access`.`node_id` AS `node_id`,`ys_node`.`name` AS `menu_name`,`ys_node`.`controller` AS `controller`,`ys_node`.`action` AS `action`,`ys_node`.`status` AS `status`,`ys_node`.`sort` AS `sort`,`ys_node`.`pid` AS `pid`,`ys_node`.`icon` AS `icon` from ((((`ys_admin_users` left join `ys_role_user` on((`ys_admin_users`.`id` = `ys_role_user`.`user_id`))) left join `ys_role` on((`ys_role_user`.`role_id` = `ys_role`.`id`))) left join `ys_access` on((`ys_role`.`id` = `ys_access`.`role_id`))) left join `ys_node` on((`ys_access`.`node_id` = `ys_node`.`id`))) ;
