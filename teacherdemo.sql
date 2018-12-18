/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : teacherdemo

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2018-12-18 19:33:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity_category`
-- ----------------------------
DROP TABLE IF EXISTS `activity_category`;
CREATE TABLE `activity_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_category
-- ----------------------------
INSERT INTO `activity_category` VALUES ('1', '工作会议', '参加学院组织的班主任会议');
INSERT INTO `activity_category` VALUES ('2', '工作反馈', '向学院提交班主任工作报告或工作总结');
INSERT INTO `activity_category` VALUES ('3', '学生活动', '参与学生举办的活动');
INSERT INTO `activity_category` VALUES ('4', '学生交流', '与学生进行沟通与交流活动');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '助班', '123', '助班', '助班', '男', '1234556', '123@qq.com');
INSERT INTO `user` VALUES ('2', '班主任', '123', '班主任', '班主任', '女', '123456', '123@qq.');
INSERT INTO `user` VALUES ('3', '学院管理员', '123', '学院管理员', '学院管理员', '男', '123456', '123@qq.com');
INSERT INTO `user` VALUES ('4', '系统管理员', '123', '系统管理员', '系统管理员', '女', '123456', '123@qq.com');
INSERT INTO `user` VALUES ('5', '测试', '123', '助班', '测试', '男', '123', '123@qq.com');
