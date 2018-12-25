/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : teacherdemo

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2018-12-24 19:21:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `createby_id` int(11) NOT NULL,
  `time` date NOT NULL,
  `semester` int(11) NOT NULL,
  `schoolyear` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category_id`),
  KEY `creator` (`createby_id`),
  CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `activity_category` (`id`),
  CONSTRAINT `creator` FOREIGN KEY (`createby_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '参加会议', '参加班主任工作会议', null, '1', '2', '2018-12-24', '1', '2018-2019', '2018-12-24 14:35:32');
INSERT INTO `activity` VALUES ('2', '参加助班会议', '参加助班工作会议', null, '1', '1', '2018-12-24', '1', '2018-2019', '2018-12-24 14:38:00');

-- ----------------------------
-- Table structure for `activity_category`
-- ----------------------------
DROP TABLE IF EXISTS `activity_category`;
CREATE TABLE `activity_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_category
-- ----------------------------
INSERT INTO `activity_category` VALUES ('1', '工作会议', '参加学院组织的班主任会议');
INSERT INTO `activity_category` VALUES ('2', '工作反馈', '向学院提交班主任工作报告或工作总结');
INSERT INTO `activity_category` VALUES ('3', '学生活动', '参与学生举办的活动');
INSERT INTO `activity_category` VALUES ('4', '学生交流', '与学生进行沟通与交流活动');
INSERT INTO `activity_category` VALUES ('15', '测试5', '测试6');
INSERT INTO `activity_category` VALUES ('16', '测试', '测试');
INSERT INTO `activity_category` VALUES ('17', '测试', '测试');
INSERT INTO `activity_category` VALUES ('18', '测试', '');
INSERT INTO `activity_category` VALUES ('19', '测试', '');
INSERT INTO `activity_category` VALUES ('20', '测试', '');
INSERT INTO `activity_category` VALUES ('21', '测试', '');
INSERT INTO `activity_category` VALUES ('22', '测试', '');

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
