/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.99.5
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 192.168.99.5:3306
 Source Schema         : intellif_lglab

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 30/04/2019 19:40:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_comp_info
-- ----------------------------
DROP TABLE IF EXISTS `t_comp_info`;
CREATE TABLE `t_comp_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_comp_info
-- ----------------------------
INSERT INTO `t_comp_info` VALUES (1, 'web', 'web相关组件', '2019-04-27 13:00:24');
INSERT INTO `t_comp_info` VALUES (2, 'api', '提供web相关接口服务组件', '2019-04-27 13:00:27');
INSERT INTO `t_comp_info` VALUES (3, 'engine', '提供图片等结构化服务组件', '2019-04-27 13:00:30');
INSERT INTO `t_comp_info` VALUES (4, 'solr', '搜索引擎服务', '2019-04-27 13:00:32');

-- ----------------------------
-- Table structure for t_device_info
-- ----------------------------
DROP TABLE IF EXISTS `t_device_info`;
CREATE TABLE `t_device_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `ip`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_device_info
-- ----------------------------
INSERT INTO `t_device_info` VALUES (1, '8000', '68.71.85.166', 'zkf', '2019-04-29 16:29:23', '1', '测试数据');
INSERT INTO `t_device_info` VALUES (2, '8000', '68.71.85.185', 'zkf', '2019-04-29 17:52:08', '2222', '测试');
INSERT INTO `t_device_info` VALUES (3, '8000', '68.71.117.190', 'zkf', '2019-04-29 17:52:13', '3333', '反恐标准化平台');
INSERT INTO `t_device_info` VALUES (5, '8888', '68.71.41.10', 'kefan zeng', '2019-04-29 17:50:00', '16.04', '手动阀手动阀');

-- ----------------------------
-- Table structure for t_server_info
-- ----------------------------
DROP TABLE IF EXISTS `t_server_info`;
CREATE TABLE `t_server_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comp_id` int(11) NULL DEFAULT NULL,
  `device_id` int(11) NULL DEFAULT NULL,
  `port` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_server_info
-- ----------------------------
INSERT INTO `t_server_info` VALUES (1, '视频门禁web服务', 1, 3, '8080', 'v1.0.0', '2019-04-29 15:31:14', '123123');
INSERT INTO `t_server_info` VALUES (2, '深目现网API', 2, 2, '8082', 'v1.4.21', '2019-04-27 16:37:35', '6666');
INSERT INTO `t_server_info` VALUES (3, '123166', 2, 1, '8083', '100.32', '2019-04-28 22:35:33', '4546');
INSERT INTO `t_server_info` VALUES (6, '999998888', 3, 3, '9999', '100.32', '2019-04-29 14:05:42', '4546');
INSERT INTO `t_server_info` VALUES (8, '1231666666', 3, 3, '8083', '100.32', '2019-04-29 15:16:27', '4546');
INSERT INTO `t_server_info` VALUES (9, '999998888', 2, 3, '9999，8888', '100.32', '2019-04-29 15:33:41', '4546');
INSERT INTO `t_server_info` VALUES (10, '999998888', 2, 1, '9999', '100.32', '2019-04-29 15:29:02', '4546');
INSERT INTO `t_server_info` VALUES (12, '99999888800', 3, 2, '8083', 'v1.0.0', '2019-04-29 15:57:39', '123123');
INSERT INTO `t_server_info` VALUES (13, '1231666666', 3, 1, '9999', '100.32', '2019-04-29 16:03:00', '123123');
INSERT INTO `t_server_info` VALUES (14, '1111', 2, 3, '9999', '100.32', '2019-04-29 16:32:31', '4546');
INSERT INTO `t_server_info` VALUES (15, '999998888', 2, 3, '8083', '16.04', '2019-04-29 17:06:30', '123123');
INSERT INTO `t_server_info` VALUES (16, '999998888', 1, 3, '8083', '100.32', '2019-04-29 17:22:39', '4546');
INSERT INTO `t_server_info` VALUES (17, '123', 2, 3, '123', '123', '2019-04-29 17:25:37', '123');
INSERT INTO `t_server_info` VALUES (18, '123', 1, 5, '11', '11', '2019-04-29 17:53:24', '11');

-- ----------------------------
-- Table structure for t_system_info
-- ----------------------------
DROP TABLE IF EXISTS `t_system_info`;
CREATE TABLE `t_system_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_system_info
-- ----------------------------
INSERT INTO `t_system_info` VALUES (1, '视频门禁', 'http://68.71.85.166:8080', '68.71.85.166', '1,2', '2019-04-28 09:38:30', '123123123');
INSERT INTO `t_system_info` VALUES (2, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (3, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (4, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (5, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (6, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (7, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (8, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (9, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (10, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (11, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (12, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (13, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (14, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (15, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (16, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (17, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (18, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (19, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');
INSERT INTO `t_system_info` VALUES (20, '深目系统', 'http://68.71.41.10:8081/lg01/WebClient', '172.18.224.160', '1,2', '2019-04-28 09:44:07', '现网深目系统');

SET FOREIGN_KEY_CHECKS = 1;
