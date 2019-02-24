/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : bootstyle

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2019-02-24 19:08:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_dict
-- ----------------------------
DROP TABLE IF EXISTS `base_dict`;
CREATE TABLE `base_dict` (
  `dict_id` varchar(32) NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(50) NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(50) NOT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) DEFAULT NULL COMMENT '数据字典项目代码(可为空)',
  `dict_sort` int(10) DEFAULT NULL COMMENT '排序字段',
  `dict_enable` char(1) NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_dict
-- ----------------------------
INSERT INTO `base_dict` VALUES ('1', '001', '客户行业', '人力资源', null, null, '1', null);
INSERT INTO `base_dict` VALUES ('2', '001', '客户行业', '服装设计', null, null, '1', null);
INSERT INTO `base_dict` VALUES ('3', '001', '客户行业', '电子商务', null, null, '1', null);
INSERT INTO `base_dict` VALUES ('4', '002', '客户性别', '男', null, null, '1', null);
INSERT INTO `base_dict` VALUES ('5', '002', '客户性别', '女', null, null, '1', null);
INSERT INTO `base_dict` VALUES ('6', '003', '客户级别', 'vip客户', null, null, '1', null);
INSERT INTO `base_dict` VALUES ('7', '003', '客户级别', '普通客户', null, null, '1', null);
INSERT INTO `base_dict` VALUES ('8', '001', '客户行业', '连锁经营', null, null, '1', null);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cust_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '客户编号(主键)',
  `cust_name` varchar(50) NOT NULL COMMENT '客户名称',
  `cust_sex` varchar(32) NOT NULL COMMENT '客户性别',
  `cust_level` varchar(32) NOT NULL COMMENT '客户级别',
  `cust_industry` varchar(50) NOT NULL COMMENT '客户行业',
  `cust_email` varchar(32) NOT NULL COMMENT '客户邮箱',
  `cust_phone` varchar(64) NOT NULL COMMENT '客户电话',
  `cust_user_id` int(32) DEFAULT NULL COMMENT '负责人id',
  `cust_create_id` int(32) DEFAULT NULL COMMENT '创建人id',
  `cust_createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('59', '伊人', '5', '6', '1', 'gmail', '12112344321', null, '2', '2018-12-02 22:07:43');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_code` varchar(50) NOT NULL COMMENT '用户账号',
  `user_password` varchar(50) NOT NULL COMMENT '用户密码',
  `user_name` varchar(50) NOT NULL COMMENT '用户名称',
  `user_state` varchar(1) DEFAULT NULL COMMENT '用户状态(1：正常，0:暂停)',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'hongjun500', '88688', '毕鸿钧', '1');
INSERT INTO `user` VALUES ('2', 'hongjun404', '123456', '李青', '1');
