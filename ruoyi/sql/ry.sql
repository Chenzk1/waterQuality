/*
 Navicat Premium Data Transfer

 Source Server         : wq_vue
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 05/09/2020 12:18:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chla
-- ----------------------------
DROP TABLE IF EXISTS `chla`;
CREATE TABLE `chla`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `rgb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '反演结果路径',
  `para_1` double NULL DEFAULT 5 COMMENT '参数1',
  `para_2` double NULL DEFAULT 5 COMMENT '参数2',
  `para_3` double NULL DEFAULT 5 COMMENT '参数3',
  `min` double NULL DEFAULT 0 COMMENT 'min',
  `max` double NULL DEFAULT 0 COMMENT 'max',
  `mean` double NULL DEFAULT 0 COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'chla' COMMENT '参数flag',
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '叶绿素a表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chla
-- ----------------------------
INSERT INTO `chla` VALUES (1000, '2019-10-30 11:33:00', '/waterData/chla/rgb/1001.jpg', 5, 5, 5, 0, 0, 0, 'chla');
INSERT INTO `chla` VALUES (1001, '2019-10-30 11:33:00', '/waterData/chla/rgb/1002.jpg', 5, 5, 5, 0, 0, 0, 'chla');
INSERT INTO `chla` VALUES (1002, '2019-10-30 11:33:00', '/waterData/chla/rgb/1003.jpg', 5, 5, 5, 0, 0, 0, 'chla');

-- ----------------------------
-- Table structure for cod
-- ----------------------------
DROP TABLE IF EXISTS `cod`;
CREATE TABLE `cod`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `rgb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '反演结果路径',
  `para_1` double NULL DEFAULT 5 COMMENT '参数1',
  `para_2` double NULL DEFAULT 5 COMMENT '参数2',
  `para_3` double NULL DEFAULT 5 COMMENT '参数3',
  `min` double NULL DEFAULT 0 COMMENT 'min',
  `max` double NULL DEFAULT 0 COMMENT 'max',
  `mean` double NULL DEFAULT 0 COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'cod' COMMENT '参数flag',
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'COD表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cod
-- ----------------------------
INSERT INTO `cod` VALUES (1000, '2019-10-30 11:33:00', '/waterData/cod/rgb/1001.jpg', 5, 5, 5, 0, 0, 0, 'cod');
INSERT INTO `cod` VALUES (1001, '2019-10-30 11:33:00', '/waterData/cod/rgb/1002.jpg', 5, 5, 5, 0, 0, 0, 'cod');
INSERT INTO `cod` VALUES (1002, '2019-10-30 11:33:00', '/waterData/cod/rgb/1003.jpg', 5, 5, 5, 0, 0, 0, 'cod');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nh
-- ----------------------------
DROP TABLE IF EXISTS `nh`;
CREATE TABLE `nh`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `rgb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '反演结果路径',
  `para_1` double NULL DEFAULT 5 COMMENT '参数1',
  `para_2` double NULL DEFAULT 5 COMMENT '参数2',
  `para_3` double NULL DEFAULT 5 COMMENT '参数3',
  `min` double NULL DEFAULT 0 COMMENT 'min',
  `max` double NULL DEFAULT 0 COMMENT 'max',
  `mean` double NULL DEFAULT 0 COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'nh' COMMENT '参数flag',
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '氨氮表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nh
-- ----------------------------
INSERT INTO `nh` VALUES (1000, '2019-10-30 11:33:00', '/waterData/nh/rgb/1001.jpg', 5, 5, 5, 3, 2, 4, 'nh');
INSERT INTO `nh` VALUES (1001, '2019-10-30 11:33:00', '/waterData/nh/rgb/1002.jpg', 5, 5, 5, 3, 2, 4, 'nh');
INSERT INTO `nh` VALUES (1002, '2019-10-30 11:33:00', '/waterData/nh/rgb/1003.jpg', 5, 5, 5, 5, 6, 7, 'nh');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '厉小润-赵辽英实验室', 0, '厉小润', '15888888888', 'lxr@zju.edu.cn', '0', '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '浙大实验室', 1, '厉小润', '15888888888', 'lxr@zju.edu.cn', '0', '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '杭电实验室', 2, '赵辽英', '15888888888', 'lxr@zju.edu.cn', '0', '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '电机楼206', 1, '张楠', '15888888888', 'czk@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '智泉大楼408', 2, '曹泽煜', '15888888888', 'czk@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '财务', 3, '谢美莲', '15888888888', 'czk@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '工程', 3, '王晶', '15888888888', 'czk@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-19 19:26:51');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-08-21 10:38:24');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-21 10:38:31');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-21 12:39:22');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-08-21 12:43:20');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-21 12:45:27');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-21 13:46:21');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-08-21 16:45:00');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-21 16:45:06');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-08-21 17:17:04');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-21 17:17:10');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-08-21 22:05:14');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-21 22:05:20');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-21 22:45:04');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-22 09:14:10');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-22 09:55:53');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-22 12:00:38');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '菜单类型（0目录 1菜单 2按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1059 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 'M', '0', '', 'system', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 'C', '0', 'system:user:list', 'user', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', 'system:role:list', 'peoples', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '1', 'system:menu:list', 'tree-table', 'admin', '2018-03-16 11:33:00', 'admin', '2020-08-21 23:43:32', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 'C', '0', 'system:dept:list', 'tree', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 'C', '0', 'system:post:list', 'post', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 'C', '1', 'system:dict:list', 'dict', 'admin', '2018-03-16 11:33:00', 'admin', '2020-08-21 23:42:59', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 'C', '1', 'system:config:list', 'edit', 'admin', '2018-03-16 11:33:00', 'admin', '2020-08-21 23:43:11', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 'C', '0', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 1, 'M', '0', '', 'log', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 'C', '0', 'monitor:online:list', 'online', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 'C', '0', 'monitor:job:list', 'job', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 'C', '0', 'monitor:druid:list', 'druid', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 'C', '0', 'monitor:server:list', 'server', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 'C', '0', 'tool:build:list', 'build', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'server', 'tool/gen/index', 1, 'C', '0', 'tool:gen:list', 'code', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 'C', '0', 'tool:swagger:list', 'swagger', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 'C', '0', 'monitor:operlog:list', 'form', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 'C', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', 'system:user:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', 'system:role:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 'F', '0', 'system:menu:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 'F', '0', 'system:dept:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 'F', '0', 'system:post:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 'F', '0', 'system:dict:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 'F', '0', 'system:config:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 'F', '0', 'system:notice:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 'F', '0', 'monitor:operlog:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 'F', '0', 'monitor:logininfor:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 'F', '0', 'monitor:online:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 'F', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 'F', '0', 'monitor:job:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 1, 'F', '0', 'tool:gen:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 1, 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 1, 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '预览代码', 114, 4, '#', '', 1, 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '生成代码', 114, 5, '#', '', 1, 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (10, '2020.08.11开部门组会', '1', '<p>2020.08.11开部门组会，请全体同学参加，参会方式为视频会议。</p>', '0', 'admin', '2020-08-22 10:29:22', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (11, '2020.08.11会议纪要', '2', '<p>以下为2020.08.11会议纪要。</p>', '0', 'admin', '2020-08-22 10:29:53', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '数据管理', 1, 'com.ruoyi.project.system.controller.DataManageController.add()', 'POST', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"fileName\":\"\",\"city\":\"深圳市\",\"rgbPath\":\"\",\"filePath\":\"\",\"county\":\"\",\"remark\":\"\",\"photoTime\":1597978998525,\"params\":{},\"type\":\"GF-1\",\"waterId\":1003,\"createBy\":\"admin\",\"contactInformation\":\"\",\"province\":\"浙江省\",\"contact\":\"\",\"location\":\"\",\"waterName\":\"茅家河\",\"department\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 11:03:53');
INSERT INTO `sys_oper_log` VALUES (101, '水体管理', 3, 'com.ruoyi.project.system.controller.DataManageController.remove()', 'DELETE', 1, 'admin', NULL, '/data/list/1003', '127.0.0.1', '内网IP', '{waterId=1003}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 14:04:31');
INSERT INTO `sys_oper_log` VALUES (102, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"厉小润-赵辽英实验室\",\"leader\":\"厉小润\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"lxr@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:15:10');
INSERT INTO `sys_oper_log` VALUES (103, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"浙大实验室\",\"leader\":\"厉小润\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"lxr@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:15:47');
INSERT INTO `sys_oper_log` VALUES (104, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"电机楼206\",\"leader\":\"张楠\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"lxr@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:16:25');
INSERT INTO `sys_oper_log` VALUES (105, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"智泉大楼408\",\"leader\":\"曹泽煜\",\"deptId\":104,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"lxr@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:17:01');
INSERT INTO `sys_oper_log` VALUES (106, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"财务\",\"leader\":\"谢美莲\",\"deptId\":105,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"lxr@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:17:16');
INSERT INTO `sys_oper_log` VALUES (107, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"工程\",\"leader\":\"王晶\",\"deptId\":106,\"orderNum\":\"4\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"lxr@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:17:31');
INSERT INTO `sys_oper_log` VALUES (108, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{deptId=107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:17:38');
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"杭电实验室\",\"leader\":\"赵辽英\",\"deptId\":102,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"lxr@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:17:52');
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{deptId=108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:18:00');
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 3, 'com.ruoyi.project.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{deptId=109}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:18:03');
INSERT INTO `sys_oper_log` VALUES (112, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"czk@zju.edu.cn\",\"nickName\":\"管理员\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"厉小润-赵辽英实验室\",\"leader\":\"厉小润\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}', 'null', 1, '不允许操作超级管理员用户', '2020-08-21 23:19:42');
INSERT INTO `sys_oper_log` VALUES (113, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"czk@zju.edu.cn\",\"nickName\":\"管理员\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"厉小润-赵辽英实验室\",\"leader\":\"厉小润\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}', 'null', 1, '不允许操作超级管理员用户', '2020-08-21 23:19:48');
INSERT INTO `sys_oper_log` VALUES (114, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"czk@zju.edu.cn\",\"nickName\":\"admin\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"厉小润-赵辽英实验室\",\"leader\":\"厉小润\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}', 'null', 1, '不允许操作超级管理员用户', '2020-08-21 23:26:59');
INSERT INTO `sys_oper_log` VALUES (115, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"lxr@zju.edu.cn\",\"nickName\":\"厉小润\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"财务\",\"leader\":\"谢美莲\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"lxr\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:29:17');
INSERT INTO `sys_oper_log` VALUES (116, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$wdkOYCa8FgmaIQd0U37PkOUQSZzqs699nArRnofdUfTpyy7XVgo7O\",\"postIds\":[],\"nickName\":\"陈仲锴\",\"deptId\":100,\"params\":{},\"userName\":\"czk\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:32:24');
INSERT INTO `sys_oper_log` VALUES (117, '岗位管理', 2, 'com.ruoyi.project.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"4\",\"flag\":false,\"remark\":\"\",\"postId\":4,\"params\":{},\"createBy\":\"admin\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"postName\":\"学生\",\"postCode\":\"student\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:32:48');
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[4],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"陈仲锴\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"厉小润-赵辽英实验室\",\"leader\":\"厉小润\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"czk\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1598023944000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:33:18');
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[4],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"陈仲锴\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"厉小润-赵辽英实验室\",\"leader\":\"厉小润\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"czk\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1598023944000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:34:27');
INSERT INTO `sys_oper_log` VALUES (120, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$PzC5Kgpd67wBQA8YnZt5Ruc9e/e3.NyZnjfgC8kb5byzBPNcRba66\",\"postIds\":[4],\"nickName\":\"张楠\",\"deptId\":103,\"params\":{},\"userName\":\"zn\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:34:51');
INSERT INTO `sys_oper_log` VALUES (121, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$VzRcCw4bEvlNu5O524icReEX37NmSiL7/6sctTJhcdFpFalqtnZTq\",\"postIds\":[1],\"nickName\":\"赵辽英\",\"sex\":\"1\",\"deptId\":100,\"params\":{},\"userName\":\"zly\",\"userId\":102,\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:35:24');
INSERT INTO `sys_oper_log` VALUES (122, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$k/N.IiCyc03qt9e.y6Wns.WNUZ093A1SvO5t3zhCvOmMcMDpvmvIa\",\"postIds\":[2],\"nickName\":\"王建军\",\"sex\":\"0\",\"deptId\":101,\"params\":{},\"userName\":\"wjj\",\"userId\":103,\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:36:23');
INSERT INTO `sys_oper_log` VALUES (123, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$IaSy6QxBMYPV1mmYOLu9W.gu00W/gHcTUQ9NaJih1GSZgGJpf0IBe\",\"postIds\":[2],\"nickName\":\"王晶\",\"sex\":\"0\",\"deptId\":106,\"params\":{},\"userName\":\"wj\",\"userId\":104,\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:36:50');
INSERT INTO `sys_oper_log` VALUES (124, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$k.hF5YrTYoVxlzURFAmHX.skeDyEilmORmkkzfQqnottoTPjW0SoC\",\"postIds\":[4],\"nickName\":\"华梓强\",\"sex\":\"0\",\"deptId\":104,\"params\":{},\"userName\":\"hzq\",\"userId\":105,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:37:26');
INSERT INTO `sys_oper_log` VALUES (125, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$fFj7omDoi9OyGXHBbHDNvu5bFsBTJbKWJUPhM4Wi1LBtWe2SCPjJq\",\"postIds\":[3],\"nickName\":\"谢美莲\",\"sex\":\"1\",\"deptId\":105,\"params\":{},\"userName\":\"xml\",\"userId\":106,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:38:07');
INSERT INTO `sys_oper_log` VALUES (126, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$zgx.3UD/s/svrzV1mLRBEes6DwzU0w6C4gAzKKs/cTY.Q5Q4qZQ8S\",\"postIds\":[4],\"nickName\":\"余绍奇\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"ysq\",\"userId\":107,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:38:31');
INSERT INTO `sys_oper_log` VALUES (127, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[4],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"余绍奇\",\"sex\":\"0\",\"deptId\":104,\"avatar\":\"\",\"dept\":{\"deptName\":\"厉小润-赵辽英实验室\",\"leader\":\"厉小润\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ysq\",\"userId\":107,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1598024311000,\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 8', '2020-08-21 23:38:48');
INSERT INTO `sys_oper_log` VALUES (128, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[4],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"余绍奇\",\"sex\":\"0\",\"deptId\":104,\"avatar\":\"\",\"dept\":{\"deptName\":\"厉小润-赵辽英实验室\",\"leader\":\"厉小润\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ysq\",\"userId\":107,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1598024311000,\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 8', '2020-08-21 23:38:57');
INSERT INTO `sys_oper_log` VALUES (129, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/107', '127.0.0.1', '内网IP', '{userId=107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:39:09');
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$gaxkPSP7KyRdG0W2PP4V4.DXsYAvTtpKy4/4tvi/H21fM0OZ1T75y\",\"postIds\":[4],\"nickName\":\"余绍奇\",\"deptId\":104,\"params\":{},\"userName\":\"ysq\",\"userId\":108,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:39:25');
INSERT INTO `sys_oper_log` VALUES (131, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$ixjr7/FSmK6zdyYpmUIn8.Ogwhv.qgoxkZhet7kCeCxMHTfJZIjom\",\"postIds\":[4],\"nickName\":\"徐云杰\",\"sex\":\"0\",\"deptId\":102,\"params\":{},\"userName\":\"xyj\",\"userId\":109,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:40:09');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 3, 'com.ruoyi.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/102', '127.0.0.1', '内网IP', '{menuId=102}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-08-21 23:41:49');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"dict\",\"orderNum\":\"6\",\"menuName\":\"字典管理\",\"params\":{},\"parentId\":1,\"path\":\"dict\",\"component\":\"system/dict/index\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":105,\"menuType\":\"C\",\"perms\":\"system:dict:list\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:42:59');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"edit\",\"orderNum\":\"7\",\"menuName\":\"参数设置\",\"params\":{},\"parentId\":1,\"path\":\"config\",\"component\":\"system/config/index\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":106,\"menuType\":\"C\",\"perms\":\"system:config:list\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:43:11');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"tree-table\",\"orderNum\":\"3\",\"menuName\":\"菜单管理\",\"params\":{},\"parentId\":1,\"path\":\"menu\",\"component\":\"system/menu/index\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":102,\"menuType\":\"C\",\"perms\":\"system:menu:list\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-21 23:43:32');
INSERT INTO `sys_oper_log` VALUES (136, '通知公告', 3, 'com.ruoyi.project.system.controller.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/1', '127.0.0.1', '内网IP', '{noticeId=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-22 10:27:34');
INSERT INTO `sys_oper_log` VALUES (137, '通知公告', 3, 'com.ruoyi.project.system.controller.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/2', '127.0.0.1', '内网IP', '{noticeId=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-22 10:27:36');
INSERT INTO `sys_oper_log` VALUES (138, '通知公告', 1, 'com.ruoyi.project.system.controller.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"1\",\"params\":{},\"noticeTitle\":\"2020.08.11开部门组会\",\"noticeContent\":\"<p>2020.08.11开部门组会，请全体同学参加，参会方式为视频会议。</p>\",\"createBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-22 10:29:22');
INSERT INTO `sys_oper_log` VALUES (139, '通知公告', 1, 'com.ruoyi.project.system.controller.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"2\",\"params\":{},\"noticeTitle\":\"2020.08.11会议纪要\",\"noticeContent\":\"<p>以下为2020.08.11会议纪要。</p>\",\"createBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-08-22 10:29:53');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'teacher', '老师', 1, '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'engineer', '工程师', 2, '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'accountant', '财务', 3, '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'student', '学生', 4, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-08-21 23:32:48', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', 'admin', '00', 'czk@zju.edu.cn', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'lxr', '厉小润', '00', 'lxr@zju.edu.cn', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'admin', '2020-08-21 23:29:17', '管理员');
INSERT INTO `sys_user` VALUES (100, 103, 'czk', '陈仲锴', '00', '', '', '0', '', '$2a$10$wdkOYCa8FgmaIQd0U37PkOUQSZzqs699nArRnofdUfTpyy7XVgo7O', '0', '0', '', NULL, 'admin', '2020-08-21 23:32:24', 'admin', '2020-08-21 23:34:27', NULL);
INSERT INTO `sys_user` VALUES (101, 103, 'zn', '张楠', '00', '', '', '0', '', '$2a$10$PzC5Kgpd67wBQA8YnZt5Ruc9e/e3.NyZnjfgC8kb5byzBPNcRba66', '0', '0', '', NULL, 'admin', '2020-08-21 23:34:51', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (102, 100, 'zly', '赵辽英', '00', '', '', '1', '', '$2a$10$VzRcCw4bEvlNu5O524icReEX37NmSiL7/6sctTJhcdFpFalqtnZTq', '0', '0', '', NULL, 'admin', '2020-08-21 23:35:24', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, 101, 'wjj', '王建军', '00', '', '', '0', '', '$2a$10$k/N.IiCyc03qt9e.y6Wns.WNUZ093A1SvO5t3zhCvOmMcMDpvmvIa', '0', '0', '', NULL, 'admin', '2020-08-21 23:36:23', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (104, 106, 'wj', '王晶', '00', '', '', '0', '', '$2a$10$IaSy6QxBMYPV1mmYOLu9W.gu00W/gHcTUQ9NaJih1GSZgGJpf0IBe', '0', '0', '', NULL, 'admin', '2020-08-21 23:36:50', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (105, 104, 'hzq', '华梓强', '00', '', '', '0', '', '$2a$10$k.hF5YrTYoVxlzURFAmHX.skeDyEilmORmkkzfQqnottoTPjW0SoC', '0', '0', '', NULL, 'admin', '2020-08-21 23:37:25', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (106, 105, 'xml', '谢美莲', '00', '', '', '1', '', '$2a$10$fFj7omDoi9OyGXHBbHDNvu5bFsBTJbKWJUPhM4Wi1LBtWe2SCPjJq', '0', '0', '', NULL, 'admin', '2020-08-21 23:38:07', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (108, 104, 'ysq', '余绍奇', '00', '', '', '0', '', '$2a$10$gaxkPSP7KyRdG0W2PP4V4.DXsYAvTtpKy4/4tvi/H21fM0OZ1T75y', '0', '0', '', NULL, 'admin', '2020-08-21 23:39:25', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (109, 102, 'xyj', '徐云杰', '00', '', '', '0', '', '$2a$10$ixjr7/FSmK6zdyYpmUIn8.Ogwhv.qgoxkZhet7kCeCxMHTfJZIjom', '0', '0', '', NULL, 'admin', '2020-08-21 23:40:09', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户会话id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '用户账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 1);
INSERT INTO `sys_user_post` VALUES (100, 4);
INSERT INTO `sys_user_post` VALUES (101, 4);
INSERT INTO `sys_user_post` VALUES (102, 1);
INSERT INTO `sys_user_post` VALUES (103, 2);
INSERT INTO `sys_user_post` VALUES (104, 2);
INSERT INTO `sys_user_post` VALUES (105, 4);
INSERT INTO `sys_user_post` VALUES (106, 3);
INSERT INTO `sys_user_post` VALUES (108, 4);
INSERT INTO `sys_user_post` VALUES (109, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 1);
INSERT INTO `sys_user_role` VALUES (100, 1);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (102, 1);
INSERT INTO `sys_user_role` VALUES (103, 1);
INSERT INTO `sys_user_role` VALUES (104, 1);
INSERT INTO `sys_user_role` VALUES (105, 2);
INSERT INTO `sys_user_role` VALUES (106, 2);
INSERT INTO `sys_user_role` VALUES (108, 2);
INSERT INTO `sys_user_role` VALUES (109, 2);

-- ----------------------------
-- Table structure for tn
-- ----------------------------
DROP TABLE IF EXISTS `tn`;
CREATE TABLE `tn`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `rgb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '反演结果路径',
  `para_1` double NULL DEFAULT 5 COMMENT '参数1',
  `para_2` double NULL DEFAULT 5 COMMENT '参数2',
  `para_3` double NULL DEFAULT 5 COMMENT '参数3',
  `min` double NULL DEFAULT 0 COMMENT 'min',
  `max` double NULL DEFAULT 0 COMMENT 'max',
  `mean` double NULL DEFAULT 0 COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'tn' COMMENT '参数flag',
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '总氮表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tn
-- ----------------------------
INSERT INTO `tn` VALUES (1000, '2019-10-30 11:33:00', '/waterData/tn/rgb/1001.jpg', 5, 5, 5, 5, 6, 7, 'tn');
INSERT INTO `tn` VALUES (1001, '2019-10-30 11:33:00', '/waterData/tn/rgb/1002.jpg', 5, 5, 5, 6, 7, 8, 'tn');
INSERT INTO `tn` VALUES (1002, '2019-10-30 11:33:00', '/waterData/tn/rgb/1003.jpg', 5, 5, 5, 8, 9, 10, 'tn');

-- ----------------------------
-- Table structure for tp
-- ----------------------------
DROP TABLE IF EXISTS `tp`;
CREATE TABLE `tp`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `rgb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '反演结果路径',
  `para_1` double NULL DEFAULT 5 COMMENT '参数1',
  `para_2` double NULL DEFAULT 5 COMMENT '参数2',
  `para_3` double NULL DEFAULT 5 COMMENT '参数3',
  `min` double NULL DEFAULT 0 COMMENT 'min',
  `max` double NULL DEFAULT 0 COMMENT 'max',
  `mean` double NULL DEFAULT 0 COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'tp' COMMENT '参数flag',
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '总磷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp
-- ----------------------------
INSERT INTO `tp` VALUES (1000, '2019-10-30 11:33:00', '/waterData/tp/rgb/1001.jpg', 5, 5, 5, 0, 0, 0, 'tp');
INSERT INTO `tp` VALUES (1001, '2019-10-30 11:33:00', '/waterData/tp/rgb/1002.jpg', 5, 5, 5, 1, 2, 3, 'tp');
INSERT INTO `tp` VALUES (1002, '2019-10-30 11:33:00', '/waterData/tp/rgb/1003.jpg', 5, 5, 5, 3, 2, 4, 'tp');

-- ----------------------------
-- Table structure for tss
-- ----------------------------
DROP TABLE IF EXISTS `tss`;
CREATE TABLE `tss`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `rgb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '反演结果路径',
  `para_1` double NULL DEFAULT 5 COMMENT '参数1',
  `para_2` double NULL DEFAULT 5 COMMENT '参数2',
  `para_3` double NULL DEFAULT 5 COMMENT '参数3',
  `min` double NULL DEFAULT 0 COMMENT 'min',
  `max` double NULL DEFAULT 0 COMMENT 'max',
  `mean` double NULL DEFAULT 0 COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'tss' COMMENT '参数flag',
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '总悬浮物表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tss
-- ----------------------------
INSERT INTO `tss` VALUES (1000, '2019-10-30 11:33:00', '/waterData/tss/rgb/1001.jpg', 5, 5, 5, 4, 3, 5, 'tss');
INSERT INTO `tss` VALUES (1001, '2019-10-30 11:33:00', '/waterData/tss/rgb/1002.jpg', 5, 5, 5, 4, 3, 5, 'tss');
INSERT INTO `tss` VALUES (1002, '2019-10-30 11:33:00', '/waterData/tss/rgb/1003.jpg', 5, 5, 5, 4, 3, 5, 'tss');

-- ----------------------------
-- Table structure for water_info
-- ----------------------------
DROP TABLE IF EXISTS `water_info`;
CREATE TABLE `water_info`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `water_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '水体名称',
  `photo_time` datetime(0) NULL DEFAULT NULL COMMENT '拍摄时间',
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '浙江省' COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '杭州市' COMMENT '城市',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '数据源',
  `bands` int(4) NULL DEFAULT 0 COMMENT '波段数',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `file_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '文件名称',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '文件路径',
  `rgb_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT 'RGB图片路径',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `level` int(4) NULL DEFAULT -1 COMMENT '水质等级',
  `county` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '西湖区' COMMENT '县区',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '位置',
  `department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主管部门',
  `contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '联系人',
  `contact_information` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '联系方式',
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '水体表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_info
-- ----------------------------
INSERT INTO `water_info` VALUES (1000, '滇池', '2018-08-31 00:00:00', '中国', '云南省', '昆明市', 'LANDSAT-8', 6, 'czk', '2019-10-06 11:33:00', 'czk', '2019-10-19 11:33:00', '', 'dianchi20191101', '/waterData/origin/1001.img', '/waterData/origin/rgb/1001.jpg', '0', 1, '', '', '', '', '');
INSERT INTO `water_info` VALUES (1001, '西湖', '2018-12-31 00:00:00', '中国', '浙江省', '杭州市', 'LANDSAT-5', 5, 'czk', '2019-10-16 11:33:00', 'czk', '2019-10-29 11:33:00', '', 'xihu20191101', '/waterData/origin/1001.img', '/waterData/origin/rgb/1002.jpg', '0', 1, '', '', '', '', '');
INSERT INTO `water_info` VALUES (1002, '太湖', '2018-10-31 00:00:00', '中国', '江苏省', '苏州市', 'MODIS', 1234, 'czk', '2019-10-13 11:33:00', 'czk', '2019-10-27 11:33:00', '', 'taihu20191101', '/waterData/origin/1001.img', '/waterData/origin/rgb/1003.jpg', '0', 1, '', '', '', '', '');

SET FOREIGN_KEY_CHECKS = 1;
