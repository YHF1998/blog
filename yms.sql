/*
Navicat MySQL Data Transfer

Source Server         : php
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : yms

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-12-08 23:19:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `cat_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `active` tinyint(2) NOT NULL DEFAULT '1',
  `create_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建者',
  `create_date` int(10) DEFAULT '0' COMMENT '时间戳：创建时间',
  `delete_by` int(11) NOT NULL DEFAULT '0' COMMENT '被谁删除',
  `delete_date` int(10) DEFAULT '0' COMMENT '时间戳：删除时间',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='栏目表';

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `nick_name` varchar(128) COLLATE utf8_bin DEFAULT '',
  `password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `address` varchar(128) COLLATE utf8_bin DEFAULT '',
  `phone` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否活跃',
  `create_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建者',
  `create_time` int(11) DEFAULT '0' COMMENT '时间戳：创建时间',
  `delete_by` int(11) NOT NULL DEFAULT '0' COMMENT '被谁删除',
  `delete_time` int(11) DEFAULT '0' COMMENT '时间戳：删除时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '714326675', '人在江湖飘', 'e4af001202394bea766da25ca5a83adc8dfb1fe1', '广东省广州市', '10086', '1', '1', '1575813493', '0', '0');
