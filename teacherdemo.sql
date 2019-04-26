/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : teacherdemo

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-04-21 19:47:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '参加班主任会议', '参加班主任工作会议', '1', '2', '2018-12-24 02:00:00', '教三311', '1', '2018-2019', '2019-01-08 21:47:57');
INSERT INTO `activity` VALUES ('16', '参加学生班会', '2019年3月13日下午3点 参加信管4班班会', '4', '1', '2019-04-04 00:00:00', '教3211', '2', '2017-2018', '2019-04-04 23:11:23');
INSERT INTO `activity` VALUES ('17', '与挂科学生交流', '与15信管4班的挂科学生交流，让他们引起重视。', '4', '1', '2019-03-08 15:00:00', '宿舍', '2', '2018-2019', '2019-03-13 17:55:59');

-- ----------------------------
-- Table structure for activity_category
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
-- Table structure for activity_image
-- ----------------------------
DROP TABLE IF EXISTS `activity_image`;
CREATE TABLE `activity_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `activityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_image
-- ----------------------------
INSERT INTO `activity_image` VALUES ('5', '网工分享4.png', '/image/20190404230823-网工分享4.png', '2019-04-04', '16');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `majorId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `majorId` (`majorId`),
  CONSTRAINT `majorId` FOREIGN KEY (`majorId`) REFERENCES `major` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '15', '15信管4班', '30', '1');
INSERT INTO `class` VALUES ('2', '15', '15信管3班', '30', '1');
INSERT INTO `class` VALUES ('3', '15', '15软工1班', '30', '2');
INSERT INTO `class` VALUES ('4', '15', '15车辆1班', '30', '3');
INSERT INTO `class` VALUES ('5', '15', '15信管1班', '30', '1');
INSERT INTO `class` VALUES ('6', '15', '15信管2班', '30', '1');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

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
INSERT INTO `college` VALUES ('24', '全校', '全校');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `collegeId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `collegeId1` (`collegeId`),
  CONSTRAINT `collegeId1` FOREIGN KEY (`collegeId`) REFERENCES `college` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '信息管理与信息系统', '信息管理与信息系统', '1');
INSERT INTO `major` VALUES ('2', '软件工程', '软件工程', '1');
INSERT INTO `major` VALUES ('3', '车辆工程', '车辆工程', '2');
INSERT INTO `major` VALUES ('4', '工业工程', '工业工程', '1');
INSERT INTO `major` VALUES ('5', '全校', '全校', '24');

-- ----------------------------
-- Table structure for notice
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
  PRIMARY KEY (`id`),
  KEY `categoryid` (`categoryId`),
  CONSTRAINT `categoryid` FOREIGN KEY (`categoryId`) REFERENCES `notice_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '2018-2019年寒假放假通知', '1', '2018-2019年寒假放假时间2019年1月21日-2019年2月21日，2月22日，23日为新学期开学注册时间。', '2019-01-11 00:03:47', '10', '24', '5');
INSERT INTO `notice` VALUES ('2', '2019年2月24日数信学院班主任会议通知', '1', '请数信学院各位班主任与2019年2月24日下午2点在院楼500举行班主任会议，请各位按时出席', '2019-02-24 14:00:00', '10', '1', '0');
INSERT INTO `notice` VALUES ('3', '关于开展2017-2018学年度数学与信息学院、软件学院优秀班主任评选工作的通知', '1', '各位班主任、辅导员：\n\n根据学校《关于开展“十佳班主任”和“优秀班主任”评选工作的通知》要求，现按照《华南农业大学班主任工作实施细则》（华南农办[2011]60号）及《数学与信息学院、软件学院优秀班主任评选实施办法（试行）》（见附件），现开展2017-2018学年度我院优秀班主任评选工作。相关事宜通知如下：\n\n一、评优范围\n\n2017-2018学年度在岗满一年的所有班主任（2018级班主任不参评）。\n\n二、评优内容和要求\n\n1.2017-2018学年度，凡担任我院本科生班主任满一年（含一年）以上者均需填写班主任工作登记表（见附件），2019年3月13日（周三）17:00前完成，登记表发到相应年级辅导员邮箱，邮件主题写明“XXX班主任工作登记表”。\n\n2.各年级辅导员组织本年级学生班（不含2014级学生班）开展班主任工作学生民主评议（见附件），2018年3月13日（周三）17：00前完成，并由各班长提交民主评议汇总表电子版（以“班级+班主任”命名）给年级辅导员（注：每位同学的打分表纸质版由各班班长存底备查，不需要上交，注意保管）。登记表中工作总结时间界定为2017年9月—2018年8月，内容从思想政治及职业道德、工作表现和工作成绩等方面展现，包括班级思想政治教育、学风建设、班风建设、个别辅导、学业和就业指引、学生综合测评及奖助学等工作。具体内容可按照我院优秀班主任评选工作实施办法第七、八、九条撰写。\n\n3.班主任工作学生评议和学院党委评议相结合，其中学生评议占40%，学院党委评议占60%。2014级班主任工作直接由学院党委评议。\n\n4.所有被评为“优秀班主任”的老师后期均需提交不少于1500字的班主任年度工作总结，以备学院汇编存档。\n\n三、评选流程\n\n1.成立学院党委优秀班主任评议小组，由学院党政领导班子及全体辅导员组成。\n\n2.学院评议小组根据班主任个人提交的学年度班主任工作总结进行评分。\n\n3.学院学生工作办公室负责统计学生评议和党委评议班主任得分，向评议小组提交评议结果，并将学院评优结果公示3个工作日。\n\n4.学院优秀班主任比例不超过全院班主任人数的20%，评选出的优秀班主任学院将进行适当奖励。\n\n                    \n\n                                 数学与信息学院、软件学院\n\n                    2019年3月6日', '2019-03-06 13:24:09', '10', '1', '0');
INSERT INTO `notice` VALUES ('4', '2018学年校青年教师教学优秀奖数学与信息学院申报名单公示', '3', '经资格审查和筛选，数学与信息学院申报2018学年青年教师教学优秀奖的老师名单如下：\n\n\n\n    刘  丹         杨志程       尤雪莲', '2018-09-27 14:48:41', '6', '1', '0');

-- ----------------------------
-- Table structure for notice_category
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
INSERT INTO `notice_category` VALUES ('3', '公告', '公告');

-- ----------------------------
-- Table structure for schoolyear
-- ----------------------------
DROP TABLE IF EXISTS `schoolyear`;
CREATE TABLE `schoolyear` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schoolyear` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schoolyear
-- ----------------------------
INSERT INTO `schoolyear` VALUES ('1', '2017-2018');
INSERT INTO `schoolyear` VALUES ('2', '2018-2019');
INSERT INTO `schoolyear` VALUES ('3', '2019-2020');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '助班', '123', '助班', '陈锐豪', '男', '15622158773', '673055417@qq.com');
INSERT INTO `user` VALUES ('2', '班主任', '123', '班主任', '杨梓', '女', '13448616488', '458848441@qq.com');
INSERT INTO `user` VALUES ('6', '数信学院管理员', '123', '学院管理员', '陈信', '男', '15688897653', '495484516@qq.com');
INSERT INTO `user` VALUES ('10', 'admin', '123', '系统管理员', 'admin', '男', '13454844185', '846621164@qq.com');

-- ----------------------------
-- Table structure for user_class_college_map
-- ----------------------------
DROP TABLE IF EXISTS `user_class_college_map`;
CREATE TABLE `user_class_college_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `classesId` int(11) DEFAULT NULL,
  `collegeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `classesId` (`classesId`),
  KEY `collegeId` (`collegeId`),
  CONSTRAINT `classesId` FOREIGN KEY (`classesId`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collegeId` FOREIGN KEY (`collegeId`) REFERENCES `college` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_class_college_map
-- ----------------------------
INSERT INTO `user_class_college_map` VALUES ('1', '1', '1', '1');
INSERT INTO `user_class_college_map` VALUES ('17', '1', '2', '1');
INSERT INTO `user_class_college_map` VALUES ('18', '2', '2', '1');
INSERT INTO `user_class_college_map` VALUES ('25', '6', null, '1');
