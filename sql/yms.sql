/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : yms

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 08/08/2020 00:19:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章表主键id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '文章标题',
  `article_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文章显示略缩图',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '文章主体内容',
  `is_disable` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否显示文章',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `active` tinyint(2) NOT NULL DEFAULT 1,
  `superior_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id，如果是0，那么就表示是顶级类别',
  `order_by` int(11) NOT NULL DEFAULT 0,
  `create_by` int(11) NOT NULL DEFAULT 0 COMMENT '被谁创建',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '时间戳：创建时间',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '栏目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (23, 'fas', 1, 0, 0, 1, 1577112737);
INSERT INTO `category` VALUES (24, '中国', 1, 0, 0, 1, 1577112989);
INSERT INTO `category` VALUES (25, '666', 1, 0, 0, 1, 1577113399);
INSERT INTO `category` VALUES (26, 'asf', 1, 0, 0, 1, 1577113437);
INSERT INTO `category` VALUES (27, '孙悟空', 1, 0, 0, 1, 1577113549);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员表主键id',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sex` tinyint(2) NOT NULL DEFAULT 0 COMMENT '性别 0保密 1男 2女',
  `phone` int(11) NOT NULL COMMENT '手机号，也是登录名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱，作为登录名',
  `last_login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后一次登录的ip',
  `last_login_time` int(11) NULL DEFAULT NULL COMMENT '最后一次登录的时间',
  `is_disable` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否禁用 0不禁用，1禁用',
  `is_vip` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否会员 0不是，1是',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '小陈', '', 0, 100862, '10086@qq.com', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `member` VALUES (2, '小陈', '', 0, 100863, '100861@qq.com', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `member` VALUES (3, '小陈', '', 0, 100864, '100862@qq.com', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `member` VALUES (4, '小陈', '', 0, 100865, '100826@qq.com', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `member` VALUES (5, '小陈', '', 0, 100866, '130086@qq.com', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `member` VALUES (6, '小陈', '', 0, 100867, '100486@qq.com', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `member` VALUES (7, '小陈', '', 0, 100868, '100686@qq.com', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `member` VALUES (8, '小陈', '', 0, 100869, '100786@qq.com', NULL, NULL, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `nick_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `phone` int(11) NULL DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否活跃',
  `create_by` int(11) NOT NULL DEFAULT 0 COMMENT '创建者',
  `create_time` int(11) NULL DEFAULT 0 COMMENT '时间戳：创建时间',
  `delete_by` int(11) NOT NULL DEFAULT 0 COMMENT '被谁删除',
  `delete_time` int(11) NULL DEFAULT 0 COMMENT '时间戳：删除时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '714326675', '人在江湖飘', '124591b839f4ffc9441271efe222ed0b6209002f', '广东省广州市', 10086, 1, 1, 1575813493, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
