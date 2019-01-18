/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : teacherdemo

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-01-18 18:24:05
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
  `category_id` int(11) NOT NULL,
  `createby_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
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
INSERT INTO `activity` VALUES ('1', '参加会议', '参加班主任工作会议', '1', '2', '2018-12-24 02:00:00', '教三311', '1', '2018-2019', '2019-01-08 21:47:57');
INSERT INTO `activity` VALUES ('2', '参加助班会议', '参加助班工作会议', '1', '1', '2018-12-24 00:00:00', '教三105', '1', '2018-2019', '2018-12-24 14:38:00');

-- ----------------------------
-- Table structure for `activity_category`
-- ----------------------------
DROP TABLE IF EXISTS `activity_category`;
CREATE TABLE `activity_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_category
-- ----------------------------
INSERT INTO `activity_category` VALUES ('1', '工作会议', '参加学院组织的班主任会议');
INSERT INTO `activity_category` VALUES ('2', '工作反馈', '向学院提交班主任工作报告或工作总结');
INSERT INTO `activity_category` VALUES ('3', '学生活动', '参与学生举办的活动');
INSERT INTO `activity_category` VALUES ('4', '学生交流', '与学生进行沟通与交流活动');
INSERT INTO `activity_category` VALUES ('23', '其他', '其他');

-- ----------------------------
-- Table structure for `activity_image`
-- ----------------------------
DROP TABLE IF EXISTS `activity_image`;
CREATE TABLE `activity_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_file_name` varchar(255) NOT NULL,
  `new_file_name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `activity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_image
-- ----------------------------

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `majorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '15', '信管4班', '30', '1');
INSERT INTO `class` VALUES ('2', '15', '信管3班', '30', '1');
INSERT INTO `class` VALUES ('3', '15', '软工1班', '30', '2');
INSERT INTO `class` VALUES ('4', '15', '车辆1班', '30', '3');
INSERT INTO `class` VALUES ('5', '15', '信管1班', '30', '1');

-- ----------------------------
-- Table structure for `college`
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('1', '数学与信息学院（软件学院）', '数学与信息学院（软件学院）');
INSERT INTO `college` VALUES ('2', '工程学院', '工程学院');
INSERT INTO `college` VALUES ('6', '农学院', '农学院');
INSERT INTO `college` VALUES ('8', '经济管理学院', '经济管理学院');
INSERT INTO `college` VALUES ('9', '兽医学院', '兽医学院');
INSERT INTO `college` VALUES ('10', '园艺学院', '园艺学院');
INSERT INTO `college` VALUES ('11', '林学与风景园林学院', '林学与风景园林学院');
INSERT INTO `college` VALUES ('12', '资源环境学院', '资源环境学院');
INSERT INTO `college` VALUES ('13', '生命科学学院', '生命科学学院');
INSERT INTO `college` VALUES ('14', '动物科学学院', '动物科学学院');
INSERT INTO `college` VALUES ('15', '海洋学院', '海洋学院');
INSERT INTO `college` VALUES ('16', '食品学院', '食品学院');
INSERT INTO `college` VALUES ('17', '人文与法学学院', '人文与法学学院');
INSERT INTO `college` VALUES ('18', '水利与土木工程学院', '水利与土木工程学院');
INSERT INTO `college` VALUES ('19', '材料与能源学院', '材料与能源学院');
INSERT INTO `college` VALUES ('20', '电子工程学院', '电子工程学院');
INSERT INTO `college` VALUES ('21', '公共管理学院', '公共管理学院');
INSERT INTO `college` VALUES ('22', '艺术学院', '艺术学院');
INSERT INTO `college` VALUES ('23', '外国语学院', '外国语学院');

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `collegeId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '信息管理与信息系统', null, '1');
INSERT INTO `major` VALUES ('2', '软件工程', null, '1');
INSERT INTO `major` VALUES ('3', '车辆工程', null, '2');
INSERT INTO `major` VALUES ('4', '工业工程', '工业工程', '1');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `time` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `collegeId` int(11) DEFAULT NULL,
  `majorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for `notice_category`
-- ----------------------------
DROP TABLE IF EXISTS `notice_category`;
CREATE TABLE `notice_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_category
-- ----------------------------
INSERT INTO `notice_category` VALUES ('1', '通知', '通知');
INSERT INTO `notice_category` VALUES ('3', '类别2', '类别2');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '助班', '123', '助班', '信管4班助班', '男', '1234556', '123@qq.com');
INSERT INTO `user` VALUES ('2', '班主任', '123', '班主任', '班主任', '女', '123456', '123@qq.');
INSERT INTO `user` VALUES ('4', '系统管理员', '123', '系统管理员', '系统管理员', '女', '123456', '123@qq.com');
INSERT INTO `user` VALUES ('5', '数信学院管理员', '123', '学院管理员', '数信学院管理员', '男', '123', '123@qq.com');
INSERT INTO `user` VALUES ('6', '数信学院管理员2', '123', '学院管理员', '数信学院管理员2', '男', '123', '123@qq.com');
INSERT INTO `user` VALUES ('9', '工程学院管理员', '123', '学院管理员', '工程学院管理员', '男', '123', '123@qq.com');
INSERT INTO `user` VALUES ('10', 'admin', '123', '系统管理员', 'admin', '男', '123', '123');

-- ----------------------------
-- Table structure for `user_class_college_map`
-- ----------------------------
DROP TABLE IF EXISTS `user_class_college_map`;
CREATE TABLE `user_class_college_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `classesId` int(11) DEFAULT NULL,
  `collegeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_class_college_map
-- ----------------------------
INSERT INTO `user_class_college_map` VALUES ('1', '1', '1', '1');
INSERT INTO `user_class_college_map` VALUES ('3', '5', null, '1');
INSERT INTO `user_class_college_map` VALUES ('4', '6', null, '1');
INSERT INTO `user_class_college_map` VALUES ('5', '9', null, '2');
INSERT INTO `user_class_college_map` VALUES ('6', '11', null, '8');
INSERT INTO `user_class_college_map` VALUES ('7', '12', '1', '5');
INSERT INTO `user_class_college_map` VALUES ('8', '13', '1', '5');
INSERT INTO `user_class_college_map` VALUES ('9', '14', '1', '5');
INSERT INTO `user_class_college_map` VALUES ('10', '15', '3', '1');
INSERT INTO `user_class_college_map` VALUES ('12', '16', '1', '1');
INSERT INTO `user_class_college_map` VALUES ('17', '1', '2', '1');
INSERT INTO `user_class_college_map` VALUES ('18', '2', '2', '1');
