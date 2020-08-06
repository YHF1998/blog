/*
Navicat MySQL Data Transfer

Source Server         : php
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : yms

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-12-10 23:00:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cate_id` int(11) NOT NULL,
  `cat_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `active` tinyint(2) NOT NULL DEFAULT '1',
  `superior_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id，如果是0，那么就表示是顶级类别',
  `create_by` int(11) NOT NULL DEFAULT '0' COMMENT '被谁创建',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '时间戳：创建时间',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='栏目表';
