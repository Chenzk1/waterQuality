/*
 Navicat Premium Data Transfer

 Source Server         : wq_vue
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : wq

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 30/12/2020 16:32:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `datatype` int(11) NULL DEFAULT 0 COMMENT '0 means image data; 1 means table data',
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
  `phonenumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '联系方式',
  `band_wavelength_file_path` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `water_quality_standard` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT "无" COMMENT '水质等级要求',
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '水体信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_info
-- ----------------------------
INSERT INTO `water_info` VALUES (1000, '茅洲河', '2019-03-11 16:39:39', '中国', '广东省', '深圳市', 'custom_1000', 1, 303, 'admin', '2020-11-27 16:40:53', 'admin', NULL, NULL, 'maozhouhe0311.csv', 'remoteTableFile/maozhouhe0311.csv', NULL, '0', -1, '', '深圳境内羊台山北麓', '深州市水务管理局', 'D', '17812345569', NULL, "three");
INSERT INTO `water_info` VALUES (1001, '茅洲河', '2019-03-11 16:42:53', '中国', '广东省', '深圳市', 'custom_1001', 0, 270, 'admin', '2020-11-27 16:43:45', 'admin', NULL, NULL, 'maozhouhe0311.tif', 'remoteImageFile/maozhouhe0311.tif', 'rgbFile/maozhouhe0311.png', '0', -1, '', '深圳境内羊台山北麓', '深州市水务管理局', 'D', '17812345569', NULL, "three");
INSERT INTO `water_info` VALUES (1002, '茅洲河', '2019-08-05 16:47:25', '中国', '广东省', '深圳市', 'custom_1002', 1, 751, 'admin', '2020-11-27 16:48:34', 'admin', NULL, NULL, 'maozhouhe0805.csv', 'remoteTableFile/maozhouhe0805.csv', NULL, '0', -1, '', '深圳境内羊台山北麓', '深州市水务管理局', 'D', '17812345569', NULL, "three");
INSERT INTO `water_info` VALUES (1006, '滇池', '2018-08-31 00:00:00', '中国', '云南省', '昆明市', 'LANDSAT-8', 0, 11, 'czk', '2019-10-06 11:33:00', 'admin', '2019-10-19 11:33:00', '', 'dianchi20191101', '/waterData/origin/1001.img', '/dev-api/profile/waterData/origin/rgb/1001.jpg', '0', 1, '', '云南省昆明市西南部', '昆明市水务管理局', 'A', '17812345523', NULL, "three");
INSERT INTO `water_info` VALUES (1007, '西湖', '2018-12-31 00:00:00', '中国', '浙江省', '杭州市', 'LANDSAT-5', 0, 7, 'czk', '2019-10-16 11:33:00', 'admin', '2019-10-29 11:33:00', '', 'xihu20191101', '/waterData/origin/1001.img', '/dev-api/profile/dev-api/profile/waterData/origin/rgb/1002.jpg', '0', 1, '', '杭州市西湖区东南面', '杭州市水务管理局', 'B', '17812345567', NULL, "three");
INSERT INTO `water_info` VALUES (1008, '太湖', '2018-10-31 00:00:00', '中国', '江苏省', '苏州市', 'MODIS', 0, 36, 'czk', '2019-10-13 11:33:00', 'admin', '2019-10-27 11:33:00', '', 'taihu20191101', '/waterData/origin/1001.img', '/dev-api/profile/waterData/origin/rgb/1003.jpg', '0', 1, '', '江苏省南部和浙江省北部交界处', '苏州市水务管理局', 'C', '17812345568', NULL, "three");
INSERT INTO `water_info` VALUES (1009, '茅洲河', '2019-08-05 19:02:11', '中国', '广东省', '深圳市', 'custom_1009', 0, 272, 'admin', '2020-11-27 19:03:30', 'admin', NULL, NULL, 'maozhouhe0805.tif', 'remoteTableFile/maozhouhe0805.tif', 'rgbFile/maozhouhe0805.png', '0', -1, '', '深圳境内羊台山北麓', '深圳市水务管理局', 'D', '17812345569', NULL, "three");

-- ----------------------------
-- Table structure for water_land
-- ----------------------------
DROP TABLE IF EXISTS `water_land`;
CREATE TABLE `water_land`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `ndwi_param` double NULL DEFAULT 0 COMMENT 'NDWI参数',
  `close_param` double NULL DEFAULT 5 COMMENT '闭操作参数',
  `open_param` double NULL DEFAULT 5 COMMENT '开操作参数',
  `water_land_path` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '水陆分割表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of water_land
-- ----------------------------
INSERT INTO `water_land` VALUES (1001, '2020-11-27 16:43:45', 0, 5, 5, 'waterLandFile/maozhouhe0311.png', '');

-- ----------------------------
-- Table structure for water_quality_standard
-- ----------------------------
DROP TABLE IF EXISTS `water_quality_standard`;
CREATE TABLE `water_quality_standard` (
  `param` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '水质指标',
  `direct` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'above' COMMENT '应该大于还是小于，above or below',
  `one` double NULL DEFAULT 0 COMMENT '一级',
  `two` double NULL DEFAULT 0 COMMENT '二级',
  `three` double NULL DEFAULT 0 COMMENT '三级',
  `four` double NULL DEFAULT 0 COMMENT '四级',
  `five` double NULL DEFAULT 0 COMMENT '五级',
  PRIMARY KEY (`param`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '水质标准基本项目限值' ROW_FORMAT = Dynamic;

INSERT INTO `water_quality_standard` VALUES ('cod', 'below', 15, 15, 20, 30, 40);
INSERT INTO `water_quality_standard` VALUES ('nh', 'below', 0.15, 0.5, 1.0, 1.5, 2.0);
INSERT INTO `water_quality_standard` VALUES ('tp', 'below', 0.02, 0.1, 0.2, 0.3, 0.4);
INSERT INTO `water_quality_standard` VALUES ('tn', 'below', 0.2, 0.5, 1.0, 1.5, 2.0);

-- ----------------------------
-- Table structure for water_info
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device`  (
  `device_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备id',
  `device_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '设备名称',
  `index_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '指标类型',
  `time_offset` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '采样间隔',
  `lower_limit` double NULL DEFAULT NULL COMMENT '报警下限',
  `upper_limit` double NULL DEFAULT NULL COMMENT '报警上限',
  `current_status` varchar(2) NULL DEFAULT "1" COMMENT '运行状态，"1" or "0"',
  `current_value` double NOT NULL DEFAULT 0 COMMENT '当前读数',
  `generate_time` datetime(0) NULL DEFAULT NULL COMMENT '监测时间',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '浙江省' COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '杭州市' COMMENT '城市',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '位置',
  `department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '主管部门',
  `contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '责任人',
  `phonenumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '联系方式',
  `email_address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '联系邮箱',
  PRIMARY KEY (`device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '设备信息表' ROW_FORMAT = Dynamic;

INSERT INTO `device` VALUES (100000, "悬浮物污泥浓度计", "悬浮物浓度",  '6小时', NULL, NULL, "1", 6.9, 
                              "2020-08-06 06:00:00", "广东省","深圳市",
                              "深圳市茅洲河洋涌大桥断面","深州市水务管理局","D",
                              "17812345569","17812345569@xx.com");  
INSERT INTO `device` VALUES (100001, "ph测定仪", "ph值", '6小时', 6.0, 9.0, "1", 7.6, 
                              "2020-08-05 06:00:00", "广东省","深圳市",
                              "深圳市茅洲河洋涌大桥断面","深州市水务管理局","D",
                              "17812345569","17812345569@xx.com");
INSERT INTO `device` VALUES (100002, "溶解氧测定仪", "溶解氧",  '6小时', 3, 3, "1", 8.5, 
                              "2020-08-05 06:00:00", "广东省","深圳市",
                              "深圳市茅洲河洋涌大桥断面","深州市水务管理局","D",
                              "17812345569","17812345569@xx.com");    
INSERT INTO `device` VALUES (100003, "化学需氧量测定仪", "化学需氧量", '6小时', NULL, 30, "1", 23.6, 
                              "2020-08-05 06:00:00", "广东省","深圳市",
                              "深圳市茅洲河洋涌大桥断面","深州市水务管理局","D",
                              "17812345569","17812345569@xx.com");    
INSERT INTO `device` VALUES (100004, "悬浮物污泥浓度计", "悬浮物浓度",  '6小时', NULL, NULL, "1", 6.9, 
                              "2020-08-05 06:00:00", "广东省","深圳市",
                              "深圳市茅洲河洋涌大桥断面","深州市水务管理局","D",
                              "17812345569","17812345569@xx.com");  
INSERT INTO `device` VALUES (100005, "ph测定仪", "ph值",  "6小时", 6.0, 9.0, "1", 8.5, 
                              "2020-08-05 06:00:00", "广东省","深圳市",
                               "深圳市茅洲河共和村断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");   
INSERT INTO `device` VALUES (100006, "溶解氧测定仪", "溶解氧",  "6小时", 3, 3, "1", 7.1, 
                              "2020-08-05 06:00:00", "广东省","深圳市",
                               "深圳市茅洲河共和村断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");   
INSERT INTO `device` VALUES (100007, "化学需氧量测定仪", "化学需氧量",  "6小时", NULL, 30, "1", 23.6, 
                              "2020-08-05 06:00:00", "广东省","深圳市",
                               "深圳市茅洲河共和村断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");   
INSERT INTO `device` VALUES (100008, "悬浮物污泥浓度计", "悬浮物浓度",  "6小时", NULL, NULL, "1", 8.1, 
                              "2020-08-05 06:00:00", "广东省","深圳市",
                               "深圳市茅洲河共和村断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");  
INSERT INTO `device` VALUES (100009, "ph测定仪", "ph值", "6小时", 6.0, 9.0, "1", 7.6, 
                              "2020-08-05 00:00:00", "广东省","深圳市",
                               "深圳市茅洲河洋涌大桥断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");   
INSERT INTO `device` VALUES (100010, "溶解氧测定仪", "溶解氧",  "6小时", 3, 3, "1", 8.5, 
                              "2020-08-05 00:00:00", "广东省","深圳市",
                               "深圳市茅洲河洋涌大桥断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");   
INSERT INTO `device` VALUES (100011, "化学需氧量测定仪", "化学需氧量",  "6小时", NULL, 30, "1", 23.6, 
                              "2020-08-05 00:00:00", "广东省","深圳市",
                               "深圳市茅洲河洋涌大桥断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");   
INSERT INTO `device` VALUES (100012, "悬浮物污泥浓度计", "悬浮物浓度",  "6小时", NULL, NULL, "1", 6.9, 
                              "2020-08-05 00:00:00", "广东省","深圳市",
                               "深圳市茅洲河洋涌大桥断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");   
INSERT INTO `device` VALUES (100013, "ph测定仪", "ph值",  "6小时", 6.0, 9.0, "1", 8.5, 
                              "2020-08-05 00:00:00", "广东省","深圳市",
                               "深圳市茅洲河共和村断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");   
INSERT INTO `device` VALUES (100014, "溶解氧测定仪", "溶解氧",  "6小时", 3, 3, "1", 7.1, 
                              "2020-08-05 00:00:00", "广东省","深圳市",
                               "深圳市茅洲河共和村断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");   
INSERT INTO `device` VALUES (100015, "化学需氧量测定仪", "化学需氧量",  "6小时", NULL, 30, "1", 23.6, 
                              "2020-08-05 00:00:00", "广东省","深圳市",
                               "深圳市茅洲河共和村断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");   
INSERT INTO `device` VALUES (100016, "悬浮物污泥浓度计", "悬浮物浓度",  "6小时", NULL, NULL, "1", 8.1, 
                              "2020-08-05 00:00:00", "广东省","深圳市",
                               "深圳市茅洲河共和村断面","深州市水务管理局","D",
                               "17812345569","17812345569@xx.com");

DROP TABLE IF EXISTS `device_history`;
CREATE TABLE `device_history`  (
  `device_id` bigint(20) NOT NULL COMMENT '设备id',
  `current_value` double NOT NULL DEFAULT 0 COMMENT '当前读数',
  `generate_time` datetime(0) NOT NULL COMMENT '监测时间',
  PRIMARY KEY (`device_id`, `generate_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '设备历史数据表' ROW_FORMAT = Dynamic;

INSERT INTO `device_history` VALUES (100000, 6.9, "2020-08-06 06:00:00"); 
INSERT INTO `device_history` VALUES (100000, 7.6, "2020-08-06 00:00:00");  
INSERT INTO `device_history` VALUES (100000, 7.2, "2020-08-05 18:00:00");  
INSERT INTO `device_history` VALUES (100000, 7.3, "2020-08-05 12:00:00");  
INSERT INTO `device_history` VALUES (100000, 7.9, "2020-08-05 06:00:00");  
INSERT INTO `device_history` VALUES (100000, 6.6, "2020-08-05 00:00:00");  
INSERT INTO `device_history` VALUES (100000, 6.8, "2020-08-04 18:00:00");  
INSERT INTO `device_history` VALUES (100000, 6.9, "2020-08-04 12:00:00");  
INSERT INTO `device_history` VALUES (100000, 7.6, "2020-08-04 06:00:00");  
INSERT INTO `device_history` VALUES (100000, 7.2, "2020-08-04 00:00:00");  
INSERT INTO `device_history` VALUES (100001, 7.6, "2020-08-05 06:00:00");
INSERT INTO `device_history` VALUES (100002, 8.5, "2020-08-05 06:00:00");    
INSERT INTO `device_history` VALUES (100003, 23.6, "2020-08-05 06:00:00");    
INSERT INTO `device_history` VALUES (100004, 6.9, "2020-08-05 06:00:00");  
INSERT INTO `device_history` VALUES (100005, 8.5, "2020-08-05 06:00:00");   
INSERT INTO `device_history` VALUES (100006, 7.1, "2020-08-05 06:00:00");   
INSERT INTO `device_history` VALUES (100007, 23.6, "2020-08-05 06:00:00");   
INSERT INTO `device_history` VALUES (100008, 8.1, "2020-08-05 06:00:00");  
INSERT INTO `device_history` VALUES (100009, 7.6, "2020-08-05 00:00:00");   
INSERT INTO `device_history` VALUES (100010, 8.5, "2020-08-05 00:00:00");   
INSERT INTO `device_history` VALUES (100011, 23.6, "2020-08-05 00:00:00");   
INSERT INTO `device_history` VALUES (100012, 6.9, "2020-08-05 00:00:00");   
INSERT INTO `device_history` VALUES (100013, 8.5, "2020-08-05 00:00:00");   
INSERT INTO `device_history` VALUES (100014, 7.1, "2020-08-05 00:00:00");   
INSERT INTO `device_history` VALUES (100015, 23.6, "2020-08-05 00:00:00");   
INSERT INTO `device_history` VALUES (100016, 8.1, "2020-08-05 00:00:00");
-- ----------------------------
-- Table structure for tss
-- ----------------------------
DROP TABLE IF EXISTS `tss`;
CREATE TABLE `tss`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `min` double NULL DEFAULT NULL COMMENT 'min',
  `max` double NULL DEFAULT NULL COMMENT 'max',
  `mean` double NULL DEFAULT NULL COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'tss' COMMENT '参数',
  `save_method` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `result_path` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `custom_model` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '总悬浮物表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tss
-- ----------------------------
INSERT INTO `tss` VALUES (1001, '2020-11-27 16:43:45', 4, 18, 12, 'tss', 'Modified-QAA', 'retrievalResultFile/TSMResultFile/maozhouhe0311.png', null);

-- ----------------------------
-- Table structure for chla
-- ----------------------------
DROP TABLE IF EXISTS `chla`;
CREATE TABLE `chla`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `min` double NULL DEFAULT NULL COMMENT 'min',
  `max` double NULL DEFAULT NULL COMMENT 'max',
  `mean` double NULL DEFAULT NULL COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'chla' COMMENT '参数',
  `save_method` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `result_path` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `custom_model` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '叶绿素a表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chla
-- ----------------------------

-- ----------------------------
-- Table structure for cod
-- ----------------------------
DROP TABLE IF EXISTS `cod`;
CREATE TABLE `cod`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `min` double NULL DEFAULT NULL COMMENT 'min',
  `max` double NULL DEFAULT NULL COMMENT 'max',
  `mean` double NULL DEFAULT NULL COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'cod' COMMENT '参数',
  `save_method` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `result_path` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `custom_model` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'cod表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cod
-- ----------------------------
-- INSERT INTO `cod` VALUES (1000, '2020-11-27 16:40:53',  5, 2, 6, 'cod', NULL, NULL);

-- ----------------------------
-- Table structure for nh
-- ----------------------------
DROP TABLE IF EXISTS `nh`;
CREATE TABLE `nh`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `min` double NULL DEFAULT NULL COMMENT 'min',
  `max` double NULL DEFAULT NULL COMMENT 'max',
  `mean` double NULL DEFAULT NULL COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'nh' COMMENT '参数',
  `save_method` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `result_path` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `custom_model` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '氨氮表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nh
-- ----------------------------
-- INSERT INTO `nh` VALUES (1000, '2020-11-27 16:40:53',  5, 2, 6, 'nh', NULL, NULL);

-- ----------------------------
-- Table structure for tp
-- ----------------------------
DROP TABLE IF EXISTS `tp`;
CREATE TABLE `tp`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `min` double NULL DEFAULT NULL COMMENT 'min',
  `max` double NULL DEFAULT NULL COMMENT 'max',
  `mean` double NULL DEFAULT NULL COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'tp' COMMENT '参数',
  `save_method` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `result_path` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `custom_model` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '总磷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tn
-- ----------------------------
DROP TABLE IF EXISTS `tn`;
CREATE TABLE `tn`  (
  `water_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '水体id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `min` double NULL DEFAULT NULL COMMENT 'min',
  `max` double NULL DEFAULT NULL COMMENT 'max',
  `mean` double NULL DEFAULT NULL COMMENT 'mean',
  `params` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'tn' COMMENT '参数',
  `save_method` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `result_path` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `custom_model` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`water_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '总氮表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 228 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '浙江省水务管理局', 0, 'A', '15888888888', 'A@zju.edu.cn', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:49:20');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '杭州市水务管理局', 1, 'B', '15888888888', 'B@zju.edu.cn', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:49:20');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '宁波市水务管理局', 2, '赵辽英', '15888888888', 'lxr@zju.edu.cn', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:47:55');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '西湖区水务管理局', 1, 'C', '15888888888', 'C@zju.edu.cn', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:49:20');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '拱墅区水务管理局', 2, 'D', '15888888888', 'D@zju.edu.cn', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:44:57');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '上城区水务管理局', 3, 'D', '15888888888', 'D@zju.edu.cn', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:45:29');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '下城区水务管理局', 3, 'D', '15888888888', 'F@zju.edu.cn', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:46:19');
INSERT INTO `sys_dept` VALUES (200, 101, '0,100,101', '余杭区水务管理局', 2, 'D', NULL, 'D@zju.edu.cn', '0', '0', 'admin', '2020-11-26 17:46:57', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 101, '0,100,101', '萧山区水务管理局', 2, 'E', NULL, 'E@zju.edu.cn', '0', '0', 'admin', '2020-11-26 17:47:18', '', NULL);
INSERT INTO `sys_dept` VALUES (202, 102, '0,100,102', '海曙区水务管理局', 2, 'F', NULL, 'F@zju.edu.cn', '0', '0', 'admin', '2020-11-26 17:48:22', '', NULL);
INSERT INTO `sys_dept` VALUES (203, 103, '0,100,101,103', '工程部', 3, 'D', NULL, 'D@zju.edu.cn', '0', '0', 'admin', '2020-11-26 17:48:46', 'admin', '2020-11-26 17:49:20');
INSERT INTO `sys_dept` VALUES (204, 103, '0,100,101,103', '检修部', 3, 'D', NULL, 'D@zju.edu.cn', '0', '0', 'admin', '2020-11-26 17:49:37', '', NULL);
INSERT INTO `sys_dept` VALUES (205, 103, '0,100,101,103', '财务部', 3, 'F', NULL, 'F@zju.edu.cn', '0', '0', 'admin', '2020-11-26 17:49:57', '', NULL);
INSERT INTO `sys_dept` VALUES (206, 104, '0,100,101,104', '工程部', 4, 'D', NULL, NULL, '0', '0', 'admin', '2020-11-26 18:03:39', '', NULL);
INSERT INTO `sys_dept` VALUES (207, 200, '0,100,101,200', '工程部', 4, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:03:49', '', NULL);
INSERT INTO `sys_dept` VALUES (208, 201, '0,100,101,201', '工程部', 4, 'D', NULL, NULL, '0', '0', 'admin', '2020-11-26 18:03:58', '', NULL);
INSERT INTO `sys_dept` VALUES (209, 105, '0,100,101,105', '工程部', 4, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:04:06', '', NULL);
INSERT INTO `sys_dept` VALUES (210, 106, '0,100,101,106', '工程部', 4, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:04:16', '', NULL);
INSERT INTO `sys_dept` VALUES (211, 202, '0,100,102,202', '工程部', 4, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:04:26', '', NULL);
INSERT INTO `sys_dept` VALUES (212, 100, '0,100', '温州市水务管理局', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:05:04', '', NULL);
INSERT INTO `sys_dept` VALUES (213, 100, '0,100', '湖州市水务管理局', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:05:30', '', NULL);
INSERT INTO `sys_dept` VALUES (214, 100, '0,100', '嘉兴市水务管理局', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:06:45', '', NULL);
INSERT INTO `sys_dept` VALUES (215, 100, '0,100', '绍兴市水务管理局', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:07:05', '', NULL);
INSERT INTO `sys_dept` VALUES (216, 100, '0,100', '金华市水务管理局', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:07:14', '', NULL);
INSERT INTO `sys_dept` VALUES (217, 100, '0,100', '衢州市水务管理局', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:07:29', '', NULL);
INSERT INTO `sys_dept` VALUES (218, 100, '0,100', '舟山市水务管理局', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:07:43', '', NULL);
INSERT INTO `sys_dept` VALUES (219, 100, '0,100', '台州市水务管理局', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:07:51', '', NULL);
INSERT INTO `sys_dept` VALUES (220, 212, '0,100,212', '温州区水务管理局', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:08:12', '', NULL);
INSERT INTO `sys_dept` VALUES (221, 213, '0,100,213', '湖州区水务管理局', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:08:30', '', NULL);
INSERT INTO `sys_dept` VALUES (222, 214, '0,100,214', '湖州区水务管理局', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:08:36', '', NULL);
INSERT INTO `sys_dept` VALUES (223, 215, '0,100,215', '湖州区水务管理局', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:08:42', '', NULL);
INSERT INTO `sys_dept` VALUES (224, 216, '0,100,216', '湖州区水务管理局', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:08:48', '', NULL);
INSERT INTO `sys_dept` VALUES (225, 217, '0,100,217', '湖州区水务管理局', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:08:54', '', NULL);
INSERT INTO `sys_dept` VALUES (226, 218, '0,100,218', '湖州区水务管理局', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:08:59', '', NULL);
INSERT INTO `sys_dept` VALUES (227, 219, '0,100,219', '湖州区水务管理局', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-11-26 18:09:05', '', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-26 05:59:52');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-26 06:00:00');
INSERT INTO `sys_logininfor` VALUES (119, 'lxr', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-26 06:00:13');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-26 07:34:45');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-26 16:20:47');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-26 17:07:15');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-27 09:29:37');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-27 12:37:39');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-27 13:25:20');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-27 14:16:24');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-27 15:01:31');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-27 18:17:06');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-27 19:47:22');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-27 22:43:31');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-28 09:43:24');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-28 10:43:27');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-28 11:23:25');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-11-28 13:33:08');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-28 13:33:14');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-28 14:18:59');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-28 23:41:52');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-29 10:09:13');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-29 12:40:52');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-29 13:17:59');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-30 10:28:23');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-30 11:04:32');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-30 16:13:06');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-30 16:55:33');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-01 11:07:53');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-01 14:14:38');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-01 14:46:56');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-01 16:15:08');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-01 17:07:55');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-12-30 15:37:19');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-12-30 15:37:24');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 'C', '1', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 1, 'M', '1', '', 'log', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
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
) ENGINE = InnoDB AUTO_INCREMENT = 226 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_oper_log` VALUES (140, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"浙江省水务管理局\",\"leader\":\"A\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"A@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:42:52');
INSERT INTO `sys_oper_log` VALUES (141, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"杭州市水务管理局\",\"leader\":\"A\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"A@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:43:24');
INSERT INTO `sys_oper_log` VALUES (142, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"西湖区水务管理局\",\"leader\":\"C\",\"deptId\":103,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"C@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:44:26');
INSERT INTO `sys_oper_log` VALUES (143, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"杭州市水务管理局\",\"leader\":\"B\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"B@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:44:32');
INSERT INTO `sys_oper_log` VALUES (144, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"拱墅区水务管理局\",\"leader\":\"D\",\"deptId\":104,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"D@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:44:57');
INSERT INTO `sys_oper_log` VALUES (145, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"上城区水务管理局\",\"leader\":\"D\",\"deptId\":105,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"D@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:45:29');
INSERT INTO `sys_oper_log` VALUES (146, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"下城区水务管理局\",\"leader\":\"D\",\"deptId\":106,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100,101\",\"email\":\"F@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:46:19');
INSERT INTO `sys_oper_log` VALUES (147, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"余杭区水务管理局\",\"leader\":\"D\",\"orderNum\":\"2\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,101\",\"email\":\"D@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:46:57');
INSERT INTO `sys_oper_log` VALUES (148, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"萧山区水务管理局\",\"leader\":\"E\",\"orderNum\":\"2\",\"params\":{},\"parentId\":101,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,101\",\"email\":\"E@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:47:18');
INSERT INTO `sys_oper_log` VALUES (149, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"宁波市水务管理局\",\"leader\":\"赵辽英\",\"deptId\":102,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"lxr@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:47:55');
INSERT INTO `sys_oper_log` VALUES (150, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"海曙区水务管理局\",\"leader\":\"F\",\"orderNum\":\"2\",\"params\":{},\"parentId\":102,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,102\",\"email\":\"F@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:48:22');
INSERT INTO `sys_oper_log` VALUES (151, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"工程检修部\",\"leader\":\"D\",\"orderNum\":\"3\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,101,103\",\"email\":\"D@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:48:46');
INSERT INTO `sys_oper_log` VALUES (152, '部门管理', 2, 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"工程部\",\"leader\":\"D\",\"deptId\":203,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"createTime\":1606384126000,\"updateBy\":\"admin\",\"ancestors\":\"0,100,101,103\",\"email\":\"D@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:49:20');
INSERT INTO `sys_oper_log` VALUES (153, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"检修部\",\"leader\":\"D\",\"orderNum\":\"3\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,101,103\",\"email\":\"D@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:49:37');
INSERT INTO `sys_oper_log` VALUES (154, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"财务部\",\"leader\":\"F\",\"orderNum\":\"3\",\"params\":{},\"parentId\":103,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,101,103\",\"email\":\"F@zju.edu.cn\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:49:57');
INSERT INTO `sys_oper_log` VALUES (155, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1521171180000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"A@zju.edu.cn\",\"nickName\":\"A\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"浙江省水务管理局\",\"leader\":\"A\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"A\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1521171180000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:50:51');
INSERT INTO `sys_oper_log` VALUES (156, '岗位管理', 2, 'com.ruoyi.project.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"1\",\"flag\":false,\"remark\":\"\",\"postId\":1,\"params\":{},\"createBy\":\"admin\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"postName\":\"局长\",\"postCode\":\"Director\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:51:26');
INSERT INTO `sys_oper_log` VALUES (157, '岗位管理', 2, 'com.ruoyi.project.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"2\",\"flag\":false,\"remark\":\"\",\"postId\":2,\"params\":{},\"createBy\":\"admin\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"postName\":\"工程师\",\"postCode\":\"Engineer\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:51:33');
INSERT INTO `sys_oper_log` VALUES (158, '岗位管理', 2, 'com.ruoyi.project.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"3\",\"flag\":false,\"remark\":\"\",\"postId\":3,\"params\":{},\"createBy\":\"admin\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"postName\":\"财务\",\"postCode\":\"Accountant\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:52:09');
INSERT INTO `sys_oper_log` VALUES (159, '岗位管理', 2, 'com.ruoyi.project.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"4\",\"flag\":false,\"remark\":\"\",\"postId\":4,\"params\":{},\"createBy\":\"admin\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"postName\":\"科员\",\"postCode\":\"Stuff\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:52:21');
INSERT INTO `sys_oper_log` VALUES (160, '角色管理', 1, 'com.ruoyi.project.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"createBy\":\"admin\",\"roleKey\":\"SRE\",\"roleName\":\"运维\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:53:59');
INSERT INTO `sys_oper_log` VALUES (161, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"createTime\":1606384438000,\"updateBy\":\"admin\",\"roleKey\":\"SRE\",\"roleName\":\"运维\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:54:11');
INSERT INTO `sys_oper_log` VALUES (162, '角色管理', 2, 'com.ruoyi.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"createTime\":1521171180000,\"updateBy\":\"admin\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:54:22');
INSERT INTO `sys_oper_log` VALUES (163, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/2', '127.0.0.1', '内网IP', '{userId=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:54:57');
INSERT INTO `sys_oper_log` VALUES (164, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"A\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"西湖区水务管理局\",\"leader\":\"C\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"A\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1598023944000,\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 9', '2020-11-26 17:55:19');
INSERT INTO `sys_oper_log` VALUES (165, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"A\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"西湖区水务管理局\",\"leader\":\"C\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"A\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1598023944000,\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 9', '2020-11-26 17:56:03');
INSERT INTO `sys_oper_log` VALUES (166, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$T0WKioBIx44CzavUiH5frOIVvCxXFCJqmWxG/kfCikrsFaQ2LFsJO\",\"postIds\":[1],\"nickName\":\"A\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"A\",\"userId\":110,\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:56:22');
INSERT INTO `sys_oper_log` VALUES (167, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/101', '127.0.0.1', '内网IP', '{userId=101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:56:41');
INSERT INTO `sys_oper_log` VALUES (168, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/102', '127.0.0.1', '内网IP', '{userId=102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:56:43');
INSERT INTO `sys_oper_log` VALUES (169, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/103', '127.0.0.1', '内网IP', '{userId=103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:56:45');
INSERT INTO `sys_oper_log` VALUES (170, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/104', '127.0.0.1', '内网IP', '{userId=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:56:46');
INSERT INTO `sys_oper_log` VALUES (171, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/100', '127.0.0.1', '内网IP', '{userId=100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:56:47');
INSERT INTO `sys_oper_log` VALUES (172, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/105', '127.0.0.1', '内网IP', '{userId=105}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:56:49');
INSERT INTO `sys_oper_log` VALUES (173, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/106', '127.0.0.1', '内网IP', '{userId=106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:56:51');
INSERT INTO `sys_oper_log` VALUES (174, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/108', '127.0.0.1', '内网IP', '{userId=108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:56:53');
INSERT INTO `sys_oper_log` VALUES (175, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/109', '127.0.0.1', '内网IP', '{userId=109}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:56:54');
INSERT INTO `sys_oper_log` VALUES (176, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"\",\"admin\":false,\"password\":\"123456\",\"postIds\":[1],\"nickName\":\"B\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"B\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增用户\'B\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2020-11-26 17:57:17');
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"\",\"admin\":false,\"password\":\"123456\",\"postIds\":[1],\"nickName\":\"B\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"B\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增用户\'B\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2020-11-26 17:57:18');
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"17812345567\",\"admin\":false,\"password\":\"$2a$10$Sym3cpVPtYdXnSzP8Tr8O.O4S0LeTqZx4CxG.QDQZZEEWboyA8nda\",\"postIds\":[1],\"nickName\":\"B\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"B\",\"userId\":111,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:57:43');
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"17812345568\",\"admin\":false,\"password\":\"$2a$10$jIPIdlPYXXzMHj6kiBeeDu5XfPOdS9Vab7IMeBN4JgMH4eMslmD.u\",\"postIds\":[1],\"nickName\":\"C\",\"sex\":\"1\",\"deptId\":103,\"params\":{},\"userName\":\"C\",\"userId\":112,\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:58:18');
INSERT INTO `sys_oper_log` VALUES (180, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"17812345567\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"B\",\"sex\":\"0\",\"deptId\":101,\"avatar\":\"\",\"dept\":{\"deptName\":\"浙江省水务管理局\",\"leader\":\"A\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"B\",\"userId\":111,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1606384663000,\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 3', '2020-11-26 17:58:28');
INSERT INTO `sys_oper_log` VALUES (181, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"17812345569\",\"admin\":false,\"password\":\"$2a$10$xbevlFchhJHgUhnL/BVoCOnF.BX02KShC.P.hIDr6uUf9VOlNZw/W\",\"postIds\":[1],\"nickName\":\"D\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"D\",\"userId\":113,\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:58:58');
INSERT INTO `sys_oper_log` VALUES (182, '用户管理', 3, 'com.ruoyi.project.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/113', '127.0.0.1', '内网IP', '{userId=113}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:59:04');
INSERT INTO `sys_oper_log` VALUES (183, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"17812345569\",\"admin\":false,\"password\":\"$2a$10$V1hJ0KOTaaOpItoCOfhNzeCoaCE4QFbivGmoPcRUvHYYy/XjjIQbO\",\"postIds\":[1],\"nickName\":\"D\",\"sex\":\"1\",\"deptId\":101,\"params\":{},\"userName\":\"D\",\"userId\":114,\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 17:59:38');
INSERT INTO `sys_oper_log` VALUES (184, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"17812345589\",\"admin\":false,\"password\":\"$2a$10$cmxO9o7zge8Jrxa6pTtdreQ4PUUjOSKVgRLwp3j75Q6QEGGrh1H/2\",\"postIds\":[2],\"nickName\":\"E\",\"sex\":\"0\",\"deptId\":203,\"params\":{},\"userName\":\"E\",\"userId\":115,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:00:15');
INSERT INTO `sys_oper_log` VALUES (185, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"17812345578\",\"admin\":false,\"password\":\"$2a$10$93Mr8.JVKBpxbeC0BPCaXutNMeXKy0jkW61B71BfrBLfyEyY15FzK\",\"postIds\":[3],\"nickName\":\"F\",\"sex\":\"0\",\"deptId\":205,\"params\":{},\"userName\":\"F\",\"userId\":116,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:00:40');
INSERT INTO `sys_oper_log` VALUES (186, '用户管理', 2, 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"17812345533\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"A\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"浙江省水务管理局\",\"leader\":\"A\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"A\",\"userId\":110,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1606384582000,\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 6', '2020-11-26 18:01:01');
INSERT INTO `sys_oper_log` VALUES (187, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"17812345512\",\"admin\":false,\"password\":\"$2a$10$G0C8pmI.ObK1enPUVC.aY.xifV3f16QbDVwaTocGJ7VbG/EDoftum\",\"postIds\":[4],\"nickName\":\"G\",\"sex\":\"1\",\"deptId\":204,\"params\":{},\"userName\":\"G\",\"userId\":117,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:02:33');
INSERT INTO `sys_oper_log` VALUES (188, '用户管理', 1, 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"17812342367\",\"admin\":false,\"password\":\"$2a$10$vlGpWuDoJjvXQVcgW0tc/ueVnfPgdIw/yEzzb3Lz6lhrid3r4oaZ2\",\"postIds\":[1],\"nickName\":\"H\",\"sex\":\"1\",\"deptId\":104,\"params\":{},\"userName\":\"H\",\"userId\":118,\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:03:02');
INSERT INTO `sys_oper_log` VALUES (189, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"工程部\",\"leader\":\"D\",\"orderNum\":\"4\",\"params\":{},\"parentId\":104,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,101,104\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:03:39');
INSERT INTO `sys_oper_log` VALUES (190, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"工程部\",\"orderNum\":\"4\",\"params\":{},\"parentId\":200,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,101,200\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:03:49');
INSERT INTO `sys_oper_log` VALUES (191, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"工程部\",\"leader\":\"D\",\"orderNum\":\"4\",\"params\":{},\"parentId\":201,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,101,201\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:03:58');
INSERT INTO `sys_oper_log` VALUES (192, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"工程部\",\"orderNum\":\"4\",\"params\":{},\"parentId\":105,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,101,105\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:04:06');
INSERT INTO `sys_oper_log` VALUES (193, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"工程部\",\"orderNum\":\"4\",\"params\":{},\"parentId\":106,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,101,106\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:04:16');
INSERT INTO `sys_oper_log` VALUES (194, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"工程部\",\"orderNum\":\"4\",\"params\":{},\"parentId\":202,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,102,202\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:04:26');
INSERT INTO `sys_oper_log` VALUES (195, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"温州市水务管理局\",\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:05:04');
INSERT INTO `sys_oper_log` VALUES (196, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"湖州市水务管理局\",\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:05:30');
INSERT INTO `sys_oper_log` VALUES (197, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"嘉兴市水务管理局\",\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:06:45');
INSERT INTO `sys_oper_log` VALUES (198, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"绍兴市水务管理局\",\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:07:05');
INSERT INTO `sys_oper_log` VALUES (199, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"金华市水务管理局\",\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:07:14');
INSERT INTO `sys_oper_log` VALUES (200, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"衢州市水务管理局\",\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:07:29');
INSERT INTO `sys_oper_log` VALUES (201, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"舟山市水务管理局\",\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:07:43');
INSERT INTO `sys_oper_log` VALUES (202, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"台州市水务管理局\",\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:07:51');
INSERT INTO `sys_oper_log` VALUES (203, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"温州区水务管理局\",\"orderNum\":\"3\",\"params\":{},\"parentId\":212,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,212\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:08:12');
INSERT INTO `sys_oper_log` VALUES (204, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"湖州区水务管理局\",\"orderNum\":\"3\",\"params\":{},\"parentId\":213,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,213\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:08:30');
INSERT INTO `sys_oper_log` VALUES (205, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"湖州区水务管理局\",\"orderNum\":\"3\",\"params\":{},\"parentId\":214,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,214\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:08:36');
INSERT INTO `sys_oper_log` VALUES (206, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"湖州区水务管理局\",\"orderNum\":\"3\",\"params\":{},\"parentId\":215,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,215\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:08:42');
INSERT INTO `sys_oper_log` VALUES (207, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"湖州区水务管理局\",\"orderNum\":\"3\",\"params\":{},\"parentId\":216,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,216\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:08:48');
INSERT INTO `sys_oper_log` VALUES (208, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"湖州区水务管理局\",\"orderNum\":\"3\",\"params\":{},\"parentId\":217,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,217\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:08:54');
INSERT INTO `sys_oper_log` VALUES (209, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"湖州区水务管理局\",\"orderNum\":\"3\",\"params\":{},\"parentId\":218,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,218\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:08:59');
INSERT INTO `sys_oper_log` VALUES (210, '部门管理', 1, 'com.ruoyi.project.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"湖州区水务管理局\",\"orderNum\":\"3\",\"params\":{},\"parentId\":219,\"createBy\":\"admin\",\"children\":[],\"ancestors\":\"0,100,219\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 18:09:05');
INSERT INTO `sys_oper_log` VALUES (211, '数据管理', 2, 'com.ruoyi.project.system.controller.DataManageController.edit()', 'PUT', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"country\":\"中国\",\"city\":\"昆明市\",\"rgbPath\":\"/dev-api/profile/waterData/origin/rgb/1001.jpg\",\"county\":\"\",\"bands\":\"6\",\"type\":\"LANDSAT-8\",\"waterId\":1000,\"province\":\"云南省\",\"updateBy\":\"admin\",\"contact\":\"A\",\"department\":\"昆明市水务管理局\",\"dataType\":0,\"filePath\":\"/waterData/origin/1001.img\",\"updateTime\":1571455980000,\"photoTime\":1535644800000,\"params\":{},\"createBy\":\"czk\",\"contactInformation\":\"17812345523\",\"createTime\":1570332780000,\"location\":\"云南省昆明市西南部\",\"waterName\":\"滇池\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-27 16:36:18');
INSERT INTO `sys_oper_log` VALUES (212, '数据管理', 2, 'com.ruoyi.project.system.controller.DataManageController.edit()', 'PUT', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"country\":\"中国\",\"city\":\"杭州市\",\"rgbPath\":\"/dev-api/profile/waterData/origin/rgb/1002.jpg\",\"county\":\"西湖区\",\"remark\":\"\",\"bands\":\"5\",\"type\":\"LANDSAT-5\",\"waterId\":1001,\"province\":\"浙江省\",\"updateBy\":\"admin\",\"contact\":\"B\",\"department\":\"杭州市水务管理局\",\"dataType\":0,\"filePath\":\"/waterData/origin/1001.img\",\"updateTime\":1572319980000,\"photoTime\":1546185600000,\"params\":{},\"createBy\":\"czk\",\"contactInformation\":\"17812345567\",\"createTime\":1571196780000,\"location\":\"杭州市西湖区东南面\",\"waterName\":\"西湖\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-27 16:37:25');
INSERT INTO `sys_oper_log` VALUES (213, '数据管理', 1, 'com.ruoyi.project.system.controller.DataManageController.add()', 'POST', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"fileName\":\"\",\"city\":\"深圳市\",\"rgbPath\":\"\",\"county\":\"\",\"remark\":\"\",\"type\":\"自定义\",\"waterId\":1003,\"province\":\"广东省\",\"contact\":\"D\",\"department\":\"深州市水务管理局\",\"dataType\":1,\"filePath\":\"\",\"photoTime\":1606466379319,\"params\":{},\"createBy\":\"admin\",\"contactInformation\":\"17812345569\",\"location\":\"深圳境内羊台山北麓\",\"waterName\":\"茅洲河\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-27 16:40:53');
INSERT INTO `sys_oper_log` VALUES (214, '数据管理', 2, 'com.ruoyi.project.system.controller.DataManageController.edit()', 'PUT', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"country\":\"中国\",\"city\":\"深圳市\",\"rgbPath\":\"/dev-api/profile\",\"county\":\"西湖区\",\"bands\":\"0\",\"type\":\"自定义\",\"waterId\":1003,\"province\":\"广东省\",\"updateBy\":\"admin\",\"contact\":\"D\",\"department\":\"深州市水务管理局\",\"dataType\":1,\"filePath\":\"\",\"photoTime\":1606466379000,\"params\":{},\"createBy\":\"admin\",\"createTime\":1606466453000,\"location\":\"深圳境内羊台山北麓\",\"waterName\":\"茅洲河\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-27 16:41:09');
INSERT INTO `sys_oper_log` VALUES (215, '数据管理', 1, 'com.ruoyi.project.system.controller.DataManageController.add()', 'POST', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"fileName\":\"\",\"city\":\"深圳市\",\"rgbPath\":\"\",\"county\":\"\",\"remark\":\"\",\"type\":\"自定义\",\"waterId\":1004,\"province\":\"广东省\",\"contact\":\"D\",\"department\":\"深州市水务管理局\",\"dataType\":0,\"filePath\":\"\",\"photoTime\":1606466572932,\"params\":{},\"createBy\":\"admin\",\"contactInformation\":\"17812345569\",\"location\":\"深圳境内羊台山北麓\",\"waterName\":\"茅洲河\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-27 16:43:45');
INSERT INTO `sys_oper_log` VALUES (216, '数据管理', 2, 'com.ruoyi.project.system.controller.DataManageController.edit()', 'PUT', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"country\":\"中国\",\"city\":\"深圳市\",\"rgbPath\":\"/dev-api/profile/dev-api/profile\",\"county\":\"西湖区\",\"bands\":\"0\",\"type\":\"自定义\",\"waterId\":1003,\"province\":\"广东省\",\"updateBy\":\"admin\",\"contact\":\"D\",\"department\":\"深州市水务管理局\",\"dataType\":1,\"filePath\":\"\",\"photoTime\":1552293579000,\"params\":{},\"createBy\":\"admin\",\"createTime\":1606466453000,\"location\":\"深圳境内羊台山北麓\",\"waterName\":\"茅洲河\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-27 16:46:31');
INSERT INTO `sys_oper_log` VALUES (217, '数据管理', 2, 'com.ruoyi.project.system.controller.DataManageController.edit()', 'PUT', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"country\":\"中国\",\"city\":\"深圳市\",\"rgbPath\":\"/dev-api/profile\",\"county\":\"西湖区\",\"bands\":\"0\",\"type\":\"自定义\",\"waterId\":1004,\"province\":\"广东省\",\"updateBy\":\"admin\",\"contact\":\"D\",\"department\":\"深州市水务管理局\",\"dataType\":0,\"filePath\":\"\",\"photoTime\":1552293773000,\"params\":{},\"createBy\":\"admin\",\"createTime\":1606466625000,\"location\":\"深圳境内羊台山北麓\",\"waterName\":\"茅洲河\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-27 16:46:46');
INSERT INTO `sys_oper_log` VALUES (218, '数据管理', 1, 'com.ruoyi.project.system.controller.DataManageController.add()', 'POST', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"fileName\":\"\",\"city\":\"深圳市\",\"rgbPath\":\"\",\"county\":\"\",\"remark\":\"\",\"type\":\"自定义\",\"waterId\":1005,\"province\":\"广东省\",\"contact\":\"D\",\"department\":\"深州市水务管理局\",\"dataType\":1,\"filePath\":\"\",\"photoTime\":1564994845000,\"params\":{},\"createBy\":\"admin\",\"contactInformation\":\"17812345569\",\"location\":\"深圳境内羊台山北麓\",\"waterName\":\"茅洲河\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-27 16:48:34');
INSERT INTO `sys_oper_log` VALUES (219, '数据管理', 1, 'com.ruoyi.project.system.controller.DataManageController.add()', 'POST', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"fileName\":\"\",\"city\":\"深圳市\",\"rgbPath\":\"\",\"county\":\"\",\"remark\":\"\",\"type\":\"自定义\",\"waterId\":1009,\"province\":\"广东省\",\"contact\":\"D\",\"department\":\"深圳市水务管理局\",\"dataType\":0,\"filePath\":\"\",\"photoTime\":1565002931000,\"params\":{},\"createBy\":\"admin\",\"contactInformation\":\"17812345569\",\"location\":\"深圳境内羊台山北麓\",\"waterName\":\"茅洲河\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-27 19:03:30');
INSERT INTO `sys_oper_log` VALUES (220, '数据管理', 2, 'com.ruoyi.project.system.controller.DataManageController.edit()', 'PUT', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"country\":\"中国\",\"city\":\"杭州市\",\"rgbPath\":\"/dev-api/profile/dev-api/profile/waterData/origin/rgb/1002.jpg\",\"county\":\"西湖区\",\"phonenumber\":\"17812345567\",\"bands\":\"5\",\"type\":\"LANDSAT-5\",\"waterId\":1007,\"province\":\"浙江省\",\"updateBy\":\"admin\",\"contact\":\"B\",\"department\":\"杭州市水务管理局\",\"dataType\":0,\"filePath\":\"/waterData/origin/1001.img\",\"updateTime\":1572319980000,\"photoTime\":1546185600000,\"params\":{},\"createBy\":\"czk\",\"createTime\":1571196780000,\"location\":\"杭州市西湖区东南面\",\"waterName\":\"西湖\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-27 20:20:20');
INSERT INTO `sys_oper_log` VALUES (221, '数据管理', 2, 'com.ruoyi.project.system.controller.DataManageController.edit()', 'PUT', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"country\":\"中国\",\"city\":\"苏州市\",\"rgbPath\":\"/dev-api/profile/waterData/origin/rgb/1003.jpg\",\"county\":\"\",\"phonenumber\":\"17812345568\",\"bands\":\"36\",\"type\":\"MODIS\",\"waterId\":1008,\"province\":\"江苏省\",\"updateBy\":\"admin\",\"contact\":\"C\",\"department\":\"苏州市水务管理局\",\"dataType\":0,\"filePath\":\"/waterData/origin/1001.img\",\"updateTime\":1572147180000,\"photoTime\":1540915200000,\"params\":{},\"createBy\":\"czk\",\"createTime\":1570937580000,\"location\":\"江苏省南部和浙江省北部交界处\",\"waterName\":\"太湖\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-27 20:20:43');
INSERT INTO `sys_oper_log` VALUES (222, '数据管理', 2, 'com.ruoyi.project.system.controller.DataManageController.edit()', 'PUT', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"country\":\"中国\",\"city\":\"深圳市\",\"rgbPath\":\"/dev-api/profile/dev-api/profile/dev-api/profile\",\"county\":\"\",\"phonenumber\":\"17812345569\",\"bands\":\"0\",\"type\":\"自定义\",\"waterId\":1000,\"province\":\"广东省\",\"updateBy\":\"admin\",\"contact\":\"D\",\"department\":\"深州市水务管理局\",\"dataType\":1,\"filePath\":\"\",\"photoTime\":1552293579000,\"params\":{},\"createBy\":\"admin\",\"createTime\":1606466453000,\"location\":\"深圳境内羊台山北麓\",\"waterName\":\"茅洲河\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 23:43:48');
INSERT INTO `sys_oper_log` VALUES (223, '数据管理', 2, 'com.ruoyi.project.system.controller.DataManageController.edit()', 'PUT', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"country\":\"中国\",\"city\":\"深圳市\",\"rgbPath\":\"/dev-api/profile/dev-api/profile\",\"county\":\"\",\"phonenumber\":\"17812345569\",\"bands\":\"0\",\"type\":\"自定义\",\"waterId\":1001,\"province\":\"广东省\",\"updateBy\":\"admin\",\"contact\":\"D\",\"department\":\"深州市水务管理局\",\"dataType\":0,\"filePath\":\"\",\"photoTime\":1552293773000,\"params\":{},\"createBy\":\"admin\",\"createTime\":1606466625000,\"location\":\"深圳境内羊台山北麓\",\"waterName\":\"茅洲河\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 23:43:59');
INSERT INTO `sys_oper_log` VALUES (224, '数据管理', 2, 'com.ruoyi.project.system.controller.DataManageController.edit()', 'PUT', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"country\":\"中国\",\"city\":\"深圳市\",\"rgbPath\":\"/dev-api/profile\",\"county\":\"\",\"phonenumber\":\"17812345569\",\"bands\":\"0\",\"type\":\"自定义\",\"waterId\":1002,\"province\":\"广东省\",\"updateBy\":\"admin\",\"contact\":\"D\",\"department\":\"深州市水务管理局\",\"dataType\":0,\"filePath\":\"\",\"photoTime\":1564994845000,\"params\":{},\"createBy\":\"admin\",\"createTime\":1606466914000,\"location\":\"深圳境内羊台山北麓\",\"waterName\":\"茅洲河\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 23:44:04');
INSERT INTO `sys_oper_log` VALUES (225, '数据管理', 2, 'com.ruoyi.project.system.controller.DataManageController.edit()', 'PUT', 1, 'admin', NULL, '/data/list', '127.0.0.1', '内网IP', '{\"country\":\"中国\",\"city\":\"深圳市\",\"rgbPath\":\"/dev-api/profile\",\"county\":\"\",\"phonenumber\":\"17812345569\",\"bands\":\"0\",\"type\":\"自定义\",\"waterId\":1009,\"province\":\"广东省\",\"updateBy\":\"admin\",\"contact\":\"D\",\"department\":\"深圳市水务管理局\",\"dataType\":0,\"filePath\":\"\",\"photoTime\":1565002931000,\"params\":{},\"createBy\":\"admin\",\"createTime\":1606475010000,\"location\":\"深圳境内羊台山北麓\",\"waterName\":\"茅洲河\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 23:44:13');
INSERT INTO `sys_oper_log` VALUES (226, '用户头像', 2, 'com.ruoyi.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2020/11/29/00233692839cba742af0b2facbd589c6.jpeg\",\"code\":200}', 0, NULL, '2020-11-29 00:09:59');

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
INSERT INTO `sys_post` VALUES (1, 'Director', '局长', 1, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:51:26', '');
INSERT INTO `sys_post` VALUES (2, 'Engineer', '工程师', 2, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:51:33', '');
INSERT INTO `sys_post` VALUES (3, 'Accountant', '财务', 3, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:52:09', '');
INSERT INTO `sys_post` VALUES (4, 'Stuff', '科员', 4, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:52:21', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-11-26 17:54:22', '普通角色');
INSERT INTO `sys_role` VALUES (100, '运维', 'SRE', 3, '1', '0', '0', 'admin', '2020-11-26 17:53:58', 'admin', '2020-11-26 17:54:11', NULL);

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
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
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
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);

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
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', 'admin', '00', 'czk@zju.edu.cn', '15888888888', '1', '/profile/avatar/2020/11/29/00233692839cba742af0b2facbd589c6.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'czk', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES (110, 100, 'A', 'A', '00', '', '17812345523', '0', '', '$2a$10$T0WKioBIx44CzavUiH5frOIVvCxXFCJqmWxG/kfCikrsFaQ2LFsJO', '0', '0', '', NULL, 'admin', '2020-11-26 17:56:22', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (111, 100, 'B', 'B', '00', '', '17812345567', '0', '', '$2a$10$Sym3cpVPtYdXnSzP8Tr8O.O4S0LeTqZx4CxG.QDQZZEEWboyA8nda', '0', '0', '', NULL, 'admin', '2020-11-26 17:57:43', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (112, 103, 'C', 'C', '00', '', '17812345568', '1', '', '$2a$10$jIPIdlPYXXzMHj6kiBeeDu5XfPOdS9Vab7IMeBN4JgMH4eMslmD.u', '0', '0', '', NULL, 'admin', '2020-11-26 17:58:18', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (114, 101, 'D', 'D', '00', '', '17812345569', '1', '', '$2a$10$V1hJ0KOTaaOpItoCOfhNzeCoaCE4QFbivGmoPcRUvHYYy/XjjIQbO', '0', '0', '', NULL, 'admin', '2020-11-26 17:59:38', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (115, 203, 'E', 'E', '00', '', '17812345589', '0', '', '$2a$10$cmxO9o7zge8Jrxa6pTtdreQ4PUUjOSKVgRLwp3j75Q6QEGGrh1H/2', '0', '0', '', NULL, 'admin', '2020-11-26 18:00:15', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (116, 205, 'F', 'F', '00', '', '17812345578', '0', '', '$2a$10$93Mr8.JVKBpxbeC0BPCaXutNMeXKy0jkW61B71BfrBLfyEyY15FzK', '0', '0', '', NULL, 'admin', '2020-11-26 18:00:40', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (117, 204, 'G', 'G', '00', '', '17812345512', '1', '', '$2a$10$G0C8pmI.ObK1enPUVC.aY.xifV3f16QbDVwaTocGJ7VbG/EDoftum', '0', '0', '', NULL, 'admin', '2020-11-26 18:02:33', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (118, 104, 'H', 'H', '00', '', '17812342367', '1', '', '$2a$10$vlGpWuDoJjvXQVcgW0tc/ueVnfPgdIw/yEzzb3Lz6lhrid3r4oaZ2', '0', '0', '', NULL, 'admin', '2020-11-26 18:03:02', '', NULL, NULL);

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
INSERT INTO `sys_user_post` VALUES (110, 1);
INSERT INTO `sys_user_post` VALUES (111, 1);
INSERT INTO `sys_user_post` VALUES (112, 1);
INSERT INTO `sys_user_post` VALUES (114, 1);
INSERT INTO `sys_user_post` VALUES (115, 2);
INSERT INTO `sys_user_post` VALUES (116, 3);
INSERT INTO `sys_user_post` VALUES (117, 4);
INSERT INTO `sys_user_post` VALUES (118, 1);

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
INSERT INTO `sys_user_role` VALUES (110, 1);
INSERT INTO `sys_user_role` VALUES (112, 1);
INSERT INTO `sys_user_role` VALUES (114, 1);
INSERT INTO `sys_user_role` VALUES (115, 2);
INSERT INTO `sys_user_role` VALUES (116, 2);
INSERT INTO `sys_user_role` VALUES (117, 2);
INSERT INTO `sys_user_role` VALUES (118, 1);


SET FOREIGN_KEY_CHECKS = 1;
