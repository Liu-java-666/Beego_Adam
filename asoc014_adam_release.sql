/*
Navicat MySQL Data Transfer

Source Server         : 10.10.11.18
Source Server Version : 50726
Source Host           : 10.10.11.18:3306
Source Database       : asoc014_adam_release

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-11-03 11:14:35
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`asoc014_adam` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `asoc014_adam`;
-- ----------------------------
-- Table structure for action_log
-- ----------------------------
DROP TABLE IF EXISTS `action_log`;
CREATE TABLE `action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '执行操作的用户',
  `to_user_id` int(11) NOT NULL COMMENT '被操作的用户',
  `action` enum('focus','blacklist','gift','pay','dynamic_like','dynamic_comment','dynamic_comment_like','video_like','video_comment','video_comment_like') NOT NULL DEFAULT 'focus' COMMENT '执行的操作（关注，黑名单，充值，送礼物，点赞动态，评论动态，点赞动态评论，点赞视频，评论视频，点赞视频评论）',
  `type` int(11) NOT NULL COMMENT '操作类型：1执行，0取消',
  `coins` int(11) NOT NULL DEFAULT '0' COMMENT '货币（>0为收入，<0为支出）',
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '日期时间',
  `description` varchar(50) DEFAULT NULL COMMENT '描述',
  `extra` int(11) NOT NULL DEFAULT '0' COMMENT '额外参数，比如动态ID',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='用户操作日志';

-- ----------------------------
-- Records of action_log
-- ----------------------------
INSERT INTO `action_log` VALUES ('1', '23', '11', 'dynamic_like', '1', '0', '2020-10-29 15:31:41', '点赞了你的动态', '1');
INSERT INTO `action_log` VALUES ('2', '23', '11', 'dynamic_like', '0', '0', '2020-10-29 15:31:48', '对你的动态取消了点赞', '1');
INSERT INTO `action_log` VALUES ('3', '23', '18', 'focus', '0', '0', '2020-10-29 15:32:26', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('4', '23', '18', 'focus', '0', '0', '2020-10-29 15:32:29', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('5', '23', '18', 'focus', '1', '0', '2020-10-29 15:32:40', '关注了你', '0');
INSERT INTO `action_log` VALUES ('6', '23', '18', 'focus', '0', '0', '2020-10-29 15:32:45', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('7', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 09:37:47', '点赞了你的动态', '41');
INSERT INTO `action_log` VALUES ('8', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 09:38:41', '对你的动态取消了点赞', '41');
INSERT INTO `action_log` VALUES ('9', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 09:38:54', '点赞了你的动态', '41');
INSERT INTO `action_log` VALUES ('10', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 09:40:49', '点赞了你的动态', '39');
INSERT INTO `action_log` VALUES ('11', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 09:41:16', '对你的动态取消了点赞', '39');
INSERT INTO `action_log` VALUES ('12', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 09:41:16', '点赞了你的动态', '39');
INSERT INTO `action_log` VALUES ('13', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 09:41:17', '对你的动态取消了点赞', '39');
INSERT INTO `action_log` VALUES ('14', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 09:41:18', '对你的动态取消了点赞', '41');
INSERT INTO `action_log` VALUES ('15', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 09:41:19', '点赞了你的动态', '41');
INSERT INTO `action_log` VALUES ('16', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 09:41:21', '对你的动态取消了点赞', '41');
INSERT INTO `action_log` VALUES ('17', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 09:41:22', '点赞了你的动态', '41');
INSERT INTO `action_log` VALUES ('18', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 09:41:23', '对你的动态取消了点赞', '41');
INSERT INTO `action_log` VALUES ('19', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 09:41:24', '点赞了你的动态', '41');
INSERT INTO `action_log` VALUES ('20', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 09:41:24', '对你的动态取消了点赞', '41');
INSERT INTO `action_log` VALUES ('21', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 10:01:51', '点赞了你的动态', '43');
INSERT INTO `action_log` VALUES ('22', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 10:01:51', '对你的动态取消了点赞', '43');
INSERT INTO `action_log` VALUES ('23', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 10:01:52', '点赞了你的动态', '43');
INSERT INTO `action_log` VALUES ('24', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 10:01:53', '对你的动态取消了点赞', '43');
INSERT INTO `action_log` VALUES ('25', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 10:01:53', '点赞了你的动态', '43');
INSERT INTO `action_log` VALUES ('26', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 10:01:54', '对你的动态取消了点赞', '43');
INSERT INTO `action_log` VALUES ('27', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 10:30:36', '点赞了你的动态', '39');
INSERT INTO `action_log` VALUES ('28', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 10:30:37', '对你的动态取消了点赞', '39');
INSERT INTO `action_log` VALUES ('29', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 10:30:38', '点赞了你的动态', '39');
INSERT INTO `action_log` VALUES ('30', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 10:33:19', '点赞了你的动态', '44');
INSERT INTO `action_log` VALUES ('31', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 10:33:20', '对你的动态取消了点赞', '44');
INSERT INTO `action_log` VALUES ('32', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 10:33:21', '点赞了你的动态', '44');
INSERT INTO `action_log` VALUES ('33', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 10:33:21', '对你的动态取消了点赞', '44');
INSERT INTO `action_log` VALUES ('34', '45', '45', 'dynamic_like', '1', '0', '2020-11-02 10:35:19', '点赞了你的动态', '46');
INSERT INTO `action_log` VALUES ('35', '45', '45', 'dynamic_like', '0', '0', '2020-11-02 10:35:20', '对你的动态取消了点赞', '46');
INSERT INTO `action_log` VALUES ('36', '45', '14', 'blacklist', '1', '0', '2020-11-02 14:00:12', '拉黑了你', '0');
INSERT INTO `action_log` VALUES ('37', '45', '13', 'blacklist', '1', '0', '2020-11-02 14:11:32', '拉黑了你', '0');
INSERT INTO `action_log` VALUES ('38', '45', '12', 'blacklist', '1', '0', '2020-11-02 14:14:29', '拉黑了你', '0');
INSERT INTO `action_log` VALUES ('39', '45', '12', 'blacklist', '0', '0', '2020-11-02 14:14:34', '将你移除了黑名单', '0');
INSERT INTO `action_log` VALUES ('40', '38', '16', 'dynamic_like', '1', '0', '2020-11-02 16:07:51', '点赞了你的动态', '19');
INSERT INTO `action_log` VALUES ('41', '38', '16', 'dynamic_like', '0', '0', '2020-11-02 16:07:59', '对你的动态取消了点赞', '19');
INSERT INTO `action_log` VALUES ('42', '38', '16', 'dynamic_like', '1', '0', '2020-11-02 16:08:06', '点赞了你的动态', '19');
INSERT INTO `action_log` VALUES ('43', '38', '16', 'dynamic_like', '0', '0', '2020-11-02 16:08:13', '对你的动态取消了点赞', '19');
INSERT INTO `action_log` VALUES ('44', '38', '16', 'dynamic_like', '1', '0', '2020-11-02 16:08:53', '点赞了你的动态', '19');
INSERT INTO `action_log` VALUES ('45', '38', '16', 'dynamic_like', '0', '0', '2020-11-02 16:08:54', '对你的动态取消了点赞', '19');
INSERT INTO `action_log` VALUES ('46', '38', '16', 'dynamic_like', '1', '0', '2020-11-02 16:08:56', '点赞了你的动态', '19');
INSERT INTO `action_log` VALUES ('47', '38', '16', 'dynamic_like', '0', '0', '2020-11-02 16:08:58', '对你的动态取消了点赞', '19');
INSERT INTO `action_log` VALUES ('48', '38', '16', 'dynamic_like', '1', '0', '2020-11-02 16:08:59', '点赞了你的动态', '19');
INSERT INTO `action_log` VALUES ('49', '38', '16', 'dynamic_like', '0', '0', '2020-11-02 16:09:00', '对你的动态取消了点赞', '19');
INSERT INTO `action_log` VALUES ('50', '38', '16', 'dynamic_like', '1', '0', '2020-11-02 16:09:01', '点赞了你的动态', '19');
INSERT INTO `action_log` VALUES ('51', '38', '16', 'dynamic_like', '0', '0', '2020-11-02 16:09:03', '对你的动态取消了点赞', '19');
INSERT INTO `action_log` VALUES ('52', '38', '16', 'dynamic_like', '1', '0', '2020-11-02 16:09:04', '点赞了你的动态', '19');
INSERT INTO `action_log` VALUES ('53', '38', '16', 'dynamic_like', '0', '0', '2020-11-02 16:09:05', '对你的动态取消了点赞', '19');
INSERT INTO `action_log` VALUES ('54', '38', '16', 'dynamic_like', '1', '0', '2020-11-02 16:09:06', '点赞了你的动态', '19');
INSERT INTO `action_log` VALUES ('55', '38', '16', 'dynamic_like', '0', '0', '2020-11-02 16:09:08', '对你的动态取消了点赞', '19');
INSERT INTO `action_log` VALUES ('56', '38', '16', 'dynamic_like', '1', '0', '2020-11-02 16:09:09', '点赞了你的动态', '19');
INSERT INTO `action_log` VALUES ('57', '38', '14', 'dynamic_like', '1', '0', '2020-11-02 16:14:07', '点赞了你的动态', '17');
INSERT INTO `action_log` VALUES ('58', '39', '16', 'dynamic_like', '1', '0', '2020-11-02 16:27:59', '点赞了你的动态', '19');
INSERT INTO `action_log` VALUES ('59', '11', '23', 'focus', '0', '0', '2020-11-02 16:41:43', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('60', '11', '23', 'focus', '0', '0', '2020-11-02 16:41:44', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('61', '11', '23', 'focus', '0', '0', '2020-11-02 16:41:45', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('62', '11', '23', 'focus', '0', '0', '2020-11-02 16:41:46', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('63', '11', '23', 'focus', '0', '0', '2020-11-02 16:41:48', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('64', '11', '23', 'focus', '0', '0', '2020-11-02 16:41:48', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('65', '11', '23', 'focus', '0', '0', '2020-11-02 16:41:49', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('66', '11', '23', 'focus', '1', '0', '2020-11-02 16:43:38', '关注了你', '0');
INSERT INTO `action_log` VALUES ('67', '11', '23', 'focus', '0', '0', '2020-11-02 16:43:39', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('68', '11', '23', 'focus', '1', '0', '2020-11-02 16:43:40', '关注了你', '0');
INSERT INTO `action_log` VALUES ('69', '11', '23', 'focus', '0', '0', '2020-11-02 16:43:41', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('70', '11', '23', 'focus', '1', '0', '2020-11-02 16:43:41', '关注了你', '0');
INSERT INTO `action_log` VALUES ('71', '11', '23', 'focus', '0', '0', '2020-11-02 16:43:43', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('72', '11', '23', 'focus', '1', '0', '2020-11-02 16:43:44', '关注了你', '0');
INSERT INTO `action_log` VALUES ('73', '11', '23', 'focus', '0', '0', '2020-11-02 16:43:45', '对你取消了关注', '0');
INSERT INTO `action_log` VALUES ('74', '11', '23', 'focus', '1', '0', '2020-11-02 16:43:46', '关注了你', '0');
INSERT INTO `action_log` VALUES ('75', '11', '45', 'blacklist', '1', '0', '2020-11-02 16:45:07', '拉黑了你', '0');
INSERT INTO `action_log` VALUES ('76', '11', '14', 'blacklist', '1', '0', '2020-11-02 16:45:32', '拉黑了你', '0');
INSERT INTO `action_log` VALUES ('77', '11', '45', 'blacklist', '0', '0', '2020-11-02 16:47:22', '将你移除了黑名单', '0');
INSERT INTO `action_log` VALUES ('78', '11', '13', 'blacklist', '1', '0', '2020-11-02 16:48:27', '拉黑了你', '0');
INSERT INTO `action_log` VALUES ('79', '11', '12', 'blacklist', '1', '0', '2020-11-02 16:48:33', '拉黑了你', '0');
INSERT INTO `action_log` VALUES ('80', '11', '14', 'blacklist', '0', '0', '2020-11-02 16:48:40', '将你移除了黑名单', '0');
INSERT INTO `action_log` VALUES ('81', '11', '13', 'blacklist', '0', '0', '2020-11-02 16:48:46', '将你移除了黑名单', '0');
INSERT INTO `action_log` VALUES ('82', '11', '13', 'blacklist', '1', '0', '2020-11-02 16:49:25', '拉黑了你', '0');
INSERT INTO `action_log` VALUES ('83', '38', '14', 'blacklist', '1', '0', '2020-11-02 16:55:06', '拉黑了你', '0');
INSERT INTO `action_log` VALUES ('84', '38', '14', 'blacklist', '0', '0', '2020-11-02 16:55:12', '将你移除了黑名单', '0');

-- ----------------------------
-- Table structure for blacklist
-- ----------------------------
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行拉黑操作的用户',
  `to_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '被拉黑的用户',
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '拉黑时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_to_user_id` (`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='拉黑列表';

-- ----------------------------
-- Records of blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for captcha
-- ----------------------------
DROP TABLE IF EXISTS `captcha`;
CREATE TABLE `captcha` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone_number` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '电话号码',
  `captcha` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '验证码',
  `generation_time` int(11) NOT NULL DEFAULT '0' COMMENT '验证码生成时间',
  `expire_time` int(11) NOT NULL DEFAULT '0' COMMENT '过期时间',
  `is_used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被使用，0未被使用，1已被使用',
  PRIMARY KEY (`id`),
  KEY `idx_phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='手机验证码表';

-- ----------------------------
-- Records of captcha
-- ----------------------------
INSERT INTO `captcha` VALUES ('1', '18500000001', '123456', '1604309059', '1604309359', '1');
INSERT INTO `captcha` VALUES ('2', '15000000001', '123456', '1604304807', '1604305107', '1');
INSERT INTO `captcha` VALUES ('3', '18999999999', '123456', '1604301492', '1604301792', '1');
INSERT INTO `captcha` VALUES ('4', '18666666666', '123456', '1603949500', '1603949800', '1');
INSERT INTO `captcha` VALUES ('5', '18911111111', '123456', '1603958846', '1603959146', '1');
INSERT INTO `captcha` VALUES ('6', '18941565465', '123456', '1603949657', '1603949957', '1');
INSERT INTO `captcha` VALUES ('7', '19900000001', '123456', '1604309083', '1604309383', '1');
INSERT INTO `captcha` VALUES ('8', '18999945454', '123456', '1603950650', '1603950950', '0');
INSERT INTO `captcha` VALUES ('9', '19999999999', '123456', '1603950671', '1603950971', '1');
INSERT INTO `captcha` VALUES ('10', '18988888888', '123456', '1604023264', '1604023564', '1');
INSERT INTO `captcha` VALUES ('11', '13288888888', '123456', '1604365894', '1604366194', '1');
INSERT INTO `captcha` VALUES ('12', '15511111111', '123456', '1604309490', '1604309790', '1');
INSERT INTO `captcha` VALUES ('13', '18944522333', '123456', '1603958897', '1603959197', '1');
INSERT INTO `captcha` VALUES ('14', '18966666666', '123456', '1603959120', '1603959420', '1');
INSERT INTO `captcha` VALUES ('15', '18645546456', '123456', '1603961845', '1603962145', '0');
INSERT INTO `captcha` VALUES ('16', '18995555445', '123456', '1604022546', '1604022846', '1');
INSERT INTO `captcha` VALUES ('17', '19900000003', '123456', '1604309281', '1604309581', '1');
INSERT INTO `captcha` VALUES ('18', '13299999999', '123456', '1604308952', '1604309252', '1');
INSERT INTO `captcha` VALUES ('19', '13622223333', '123456', '1604046654', '1604046954', '1');
INSERT INTO `captcha` VALUES ('20', '13622220000', '123456', '1604366537', '1604366837', '1');
INSERT INTO `captcha` VALUES ('21', '18912345678', '123456', '1604038509', '1604038809', '1');
INSERT INTO `captcha` VALUES ('22', '15000000002', '123456', '1604041626', '1604041926', '1');
INSERT INTO `captcha` VALUES ('23', '18199999999', '123456', '1604042653', '1604042953', '1');
INSERT INTO `captcha` VALUES ('24', '18411111111', '123456', '1604042736', '1604043036', '1');
INSERT INTO `captcha` VALUES ('25', '18511111111', '123456', '1604044427', '1604044727', '1');
INSERT INTO `captcha` VALUES ('26', '18533333333', '123456', '1604044543', '1604044843', '1');
INSERT INTO `captcha` VALUES ('27', '13200000000', '123456', '1604366109', '1604366409', '1');
INSERT INTO `captcha` VALUES ('28', '18500000002', '123456', '1604302503', '1604302803', '1');
INSERT INTO `captcha` VALUES ('29', '13255555555', '123456', '1604308712', '1604309012', '1');

-- ----------------------------
-- Table structure for certification
-- ----------------------------
DROP TABLE IF EXISTS `certification`;
CREATE TABLE `certification` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `front_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '正面图',
  `back_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '背面图',
  `is_audit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 0 审核 1通过 -1 失败',
  `audit_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`user_id`),
  KEY `post_time` (`post_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='实名认证表';

-- ----------------------------
-- Records of certification
-- ----------------------------

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通话ID',
  `fromUserId` int(11) NOT NULL COMMENT '通话发起方UserId',
  `toUserId` int(11) NOT NULL COMMENT '通话接收方UserId',
  `agoraId` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '通话房间ID',
  `agoraToken` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '通话房间Token',
  `create_time` int(11) DEFAULT NULL COMMENT '发起时间',
  `connect_time` int(11) NOT NULL DEFAULT '0' COMMENT '接通时间',
  `talk_second` int(11) NOT NULL DEFAULT '0' COMMENT '通话时长',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0-未接通 1-已接通 2-已挂断',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES ('1', '29', '13', '5710fd42668f4409c067150723052ea6', '00656c5b9715edc453a867d799b911404f2IADx25z5o9eTtg6JCuYsDGRijYN3Lvm7rMvcf44SIKfpHlxKEdCGzqzzIgA3OAEEtPycXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604037428', '0', '0', '0');
INSERT INTO `chat` VALUES ('2', '29', '13', 'd5ee6fbed38ca8133dada5ebc35534a8', '00656c5b9715edc453a867d799b911404f2IADTExMUK8eH9YJOmMO2B2rdLiBsA+mR/4MaFDSXyh+Mw2QvgxGGzqzzIgAS0KkFBP2cXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604037508', '0', '0', '0');
INSERT INTO `chat` VALUES ('3', '13', '29', '0b2d85a3f62a5535db7c2203fae6238d', '00656c5b9715edc453a867d799b911404f2IAAX17F/6uAfnSDGHVG7F7quwaUwMCXGeirW+5XIO/cdgB+vKJNbdFQ4IgCqLFECY/2cXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604037603', '1604037619', '4', '2');
INSERT INTO `chat` VALUES ('4', '13', '29', '06649d2c72f802c7e7abd760f69cea46', '00656c5b9715edc453a867d799b911404f2IADoe6TdytfU7i9CYyBsM/ff6LfhqWMAe2AF0wIwb7+Y0kLkKZ1bdFQ4IgC48QgDnP2cXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604037660', '1604037662', '18', '2');
INSERT INTO `chat` VALUES ('5', '29', '13', '4501695562ac58ca1e832762098c831f', '00656c5b9715edc453a867d799b911404f2IABfxWQz+/Hc4+MnLxe0OlHEeJME4JE0wnx/we57h2P0yKcijeCGzqzzIgBk4zwD1/2cXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604037719', '1604037721', '5', '2');
INSERT INTO `chat` VALUES ('6', '29', '13', '59520c53d0c7e9bd1b0a75c6109ae85c', '00656c5b9715edc453a867d799b911404f2IADaIVHoaFb9+NmbFMvZD+jyydlzJYFCajcKYfCiPYKoGzEQqoWGzqzzIgCLoEMFB/6cXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604037767', '1604037769', '18', '2');
INSERT INTO `chat` VALUES ('7', '29', '13', '010ad3d271e4caf2fb22eb285d164023', '00656c5b9715edc453a867d799b911404f2IABa9LlVN5/666YRIH/EhP7Cs37z7H+H/S08wAOYrkrHz1x6eP+GzqzzIgDZkjUDfQSdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604039421', '0', '0', '2');
INSERT INTO `chat` VALUES ('8', '29', '13', '0161aa497e4c8d2ce0241fa790bfb700', '00656c5b9715edc453a867d799b911404f2IACjAI42lsGnp9kZJmx6UojIe4ZZx/p1DxyEY5E2HFLl8l5YwCWGzqzzIgAsnz8ErQSdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604039469', '0', '0', '2');
INSERT INTO `chat` VALUES ('9', '29', '13', '0e16b23a210b66aa6267bbdabfdd64a5', '00656c5b9715edc453a867d799b911404f2IACBt6HWxJBJzfYaBQFVBXpkTWHwz5bIf6tLKGYXBVeNPM2lI9SGzqzzIgCAMQMBAwWdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604039555', '1604039558', '17', '2');
INSERT INTO `chat` VALUES ('10', '29', '13', '0379f1d6469984d7940469253f6c2cc3', '00656c5b9715edc453a867d799b911404f2IAAITjZLSZRDyIMBFMj6u89d50upoq/9O0lK3zwGzbz+2dKmfESGzqzzIgAKkK4BkQadXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604039953', '1604039959', '13', '2');
INSERT INTO `chat` VALUES ('11', '13', '29', '4dcf1b375f579b1ef80308acdb3a7c88', '00656c5b9715edc453a867d799b911404f2IADa2L463I6VHFEiiajFV7udHW8GV+9jhafeolqoITUFGop+UWdbdFQ4IgCGtYkErgadXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604039982', '1604039984', '12', '2');
INSERT INTO `chat` VALUES ('12', '13', '29', '5e6658271fec8c7a778c4738b19fae60', '00656c5b9715edc453a867d799b911404f2IADRDget2nVoiUlHSeUY8bipEA7o7fB7YSpQVSm6rbAhciPCxs9bdFQ4IgCZFjYCwgadXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604040002', '1604040004', '13', '2');
INSERT INTO `chat` VALUES ('13', '13', '29', '2b2db23e93f1cba8841eeadd887230dd', '00656c5b9715edc453a867d799b911404f2IAD8zCx+dfqprIrJB2maO94jnnLvFPdckpRFxxrglSGFkdS93e9bdFQ4IgAQehADOAqdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604040888', '1604040890', '1', '2');
INSERT INTO `chat` VALUES ('14', '29', '13', '7e51bfffde71953dab11d0a923ce8084', '00656c5b9715edc453a867d799b911404f2IACs+nZ7nHqZ7eQPj3ojPvTN+gtiuf9kJfJpSNTAulE4PKeT/giGzqzzIgDKhm0CSwqdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604040907', '1604040913', '15', '2');
INSERT INTO `chat` VALUES ('15', '29', '13', '6dce7e848e5796a1e6392b50df4844d5', '00656c5b9715edc453a867d799b911404f2IACgEOkzthKgeUymEgJxxVsUQfgPbvLBqxGfc/kvZ7/vB8IagSmGzqzzIgC/yCwDbgqdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604040942', '1604040947', '16', '2');
INSERT INTO `chat` VALUES ('16', '29', '13', 'ab0793af961744b63970ebe639c02dce', '00656c5b9715edc453a867d799b911404f2IADImbDsXcz8HXrchhxZPBUTjFyTSechQtIm92MJvdou1EIrO5CGzqzzIgBLuOwCiwqdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604040971', '1604040974', '17', '2');
INSERT INTO `chat` VALUES ('17', '13', '29', '3e879ebb8eac74b5e1ab3396d4c75a40', '00656c5b9715edc453a867d799b911404f2IABPLPFw6rUuoZ+rL1vl09tJU4/fOOEqxlmGoLBTYlMrTs1NmopbdFQ4IgD8nJkBCQudXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604041097', '1604041106', '11', '2');
INSERT INTO `chat` VALUES ('18', '29', '13', 'c19c13e8e9fad0849d008be131af5e36', '00656c5b9715edc453a867d799b911404f2IADnbxGh7lxvghIsGODYjTARc5X+PrlMZKXPTKTJ+6GjLDtfofeGzqzzIgDAWG0ETAydXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604041420', '1604041428', '0', '1');
INSERT INTO `chat` VALUES ('19', '29', '13', '846151225637a22a9e12341081281a22', '00656c5b9715edc453a867d799b911404f2IABQ9l8D/tMcxlMzcdjN8QNHPmnNeLZnM1wCm0XaWlRl8IgxY5OGzqzzIgAHszID8wydXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604041587', '1604041591', '13', '2');
INSERT INTO `chat` VALUES ('20', '29', '13', '466bf028684ac777ab1127dfd3955e44', '00656c5b9715edc453a867d799b911404f2IAALOdUMq3bHuQTPgPrAEcDOR2caz3URESeFbwO+Dqqlq8KR7XqGzqzzIgCYuw0EDw2dXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604041615', '1604041619', '16', '2');
INSERT INTO `chat` VALUES ('21', '29', '13', '9a16e5812975a60fb92f745bee02481a', '00656c5b9715edc453a867d799b911404f2IABKf6NY5uUjvKPpmjqzC37lAsMSxyOZ7zXqKLSUzambPkIjl4mGzqzzIgApItAEPw2dXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604041663', '1604041665', '18', '2');
INSERT INTO `chat` VALUES ('22', '29', '13', '67007beaf60ddef3e5cc495b6f63b68b', '00656c5b9715edc453a867d799b911404f2IAC57fpAdNxmuXLMcjxMN3Pm/Tnt/vtHAHY7WiTpPV0NsY+B1gmGzqzzIgAdqiYCgg2dXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604041730', '1604041734', '16', '2');
INSERT INTO `chat` VALUES ('23', '29', '13', '9423a9fc2c3ca38a69e1af51341b0a3a', '00656c5b9715edc453a867d799b911404f2IADs9Wyu1eHMj/j99jGdqBBGPXN2R3yiie72UKiIdjiOirETsKOGzqzzIgBxgZkEchqdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604045042', '1604045046', '16', '2');
INSERT INTO `chat` VALUES ('24', '29', '13', 'b32abf3e1f8a0c95286a873a034c2a55', '00656c5b9715edc453a867d799b911404f2IAAPBm1vXCpXpXw2FgIib736uVUkyqutsDw/SkbhVBGBe1kSBqiGzqzzIgD96dcAkRqdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604045073', '1604045078', '15', '2');
INSERT INTO `chat` VALUES ('25', '29', '13', 'b7b8f5c2eb2b83e6b09022d62d52c413', '00656c5b9715edc453a867d799b911404f2IACzkRutxuSaLdu8iPwYzhrlSIk+RGxB+daENZJppDQXqKsDLqWGzqzzIgCQp9wDrhqdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604045102', '1604045105', '17', '2');
INSERT INTO `chat` VALUES ('26', '29', '13', 'af149d41ff62c9cb6d13b0067b9ceb64', '00656c5b9715edc453a867d799b911404f2IADlp5hvbBdt7RQApO6+/mcC6DS5mLDPIIsWRJaCils5NTjwIamGzqzzIgC8Ih0D2xqdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604045147', '1604045148', '17', '2');
INSERT INTO `chat` VALUES ('27', '29', '13', 'fb441df6d56fc01dd1c768dc9533c232', '00656c5b9715edc453a867d799b911404f2IAB3T5y8WYArJd6tuo/eYwg3E+LXeGVok6tzxUAoT26CvOxo7v+GzqzzIgANoS8F9BqdXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604045172', '1604045174', '18', '2');
INSERT INTO `chat` VALUES ('28', '29', '13', 'a5f1d8da49dfc1cb988cd29af44c1b3d', '00656c5b9715edc453a867d799b911404f2IABwG2o80S7fBaSW9yapDlPSLhloiHZSfV0KyFbnwOokG939i4+GzqzzIgAGzeEANhudXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604045238', '1604045241', '17', '2');
INSERT INTO `chat` VALUES ('29', '13', '29', '26a36c0ff360d953aae683ab3bd9761f', '00656c5b9715edc453a867d799b911404f2IADrC5Clz7tDoxp8CZFKB/mA9fpXeAKl97iKaD66FSbS41xxU/dbdFQ4IgB7+R0FXx2dXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604045791', '1604045796', '15', '2');
INSERT INTO `chat` VALUES ('30', '13', '29', '002978d3d9d4c891281d23a505cde147', '00656c5b9715edc453a867d799b911404f2IADUo5YHsyKXELRn2l2zhQVJ4B+I9mPTTr1zFM01U1zTF6RJvk9bdFQ4IgB4AjIBtR2dXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604045877', '1604045881', '16', '2');
INSERT INTO `chat` VALUES ('31', '13', '29', '6e511d959131518a15ed19f9f37acef1', '00656c5b9715edc453a867d799b911404f2IABYW3C66UNyHWur7EI/xf9TfrCHR8hwnI/fRuPAF7u7mo8L3DZbdFQ4IgCqNsgA9h2dXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604045942', '1604045948', '15', '2');
INSERT INTO `chat` VALUES ('32', '13', '29', '3d84d5608446a3ff4eb180dff283697b', '00656c5b9715edc453a867d799b911404f2IABStIIP9JSJ3UAqWNNOioXptFm044xOYpiwMOfzuHtbExEghwpbdFQ4IgAT/PkAFB6dXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604045972', '1604045976', '17', '2');
INSERT INTO `chat` VALUES ('33', '29', '13', '8d39422a32aa0c3c210112040995ffc5', '00656c5b9715edc453a867d799b911404f2IABYFiHDhDXBI6bGw/jH+wk1lTYR75hnYhUNkijjAflQE89MtBeGzqzzIgDnX9ICMh6dXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604046002', '1604046005', '15', '2');
INSERT INTO `chat` VALUES ('34', '13', '29', '0d6c6f202d3bf0206735b5244db4e472', '00656c5b9715edc453a867d799b911404f2IAALGGbjLGrXuSCqHhTTFfS7nDDeImwXW8XESCKmxSpVqtiHvPFbdFQ4IgCqPlgEoBuhXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604307488', '0', '0', '0');
INSERT INTO `chat` VALUES ('35', '13', '29', '6321a68158143e4e03c8701230621b43', '00656c5b9715edc453a867d799b911404f2IACK2HvFcNgWxy9+QFc7h587KrS3V1HjZa6Mxx6tc4PovdpjQeBbdFQ4IgC3LA8CXhyhXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604307678', '0', '0', '2');
INSERT INTO `chat` VALUES ('36', '29', '13', '7056b876041b953e2e289d4b2facfedf', '00656c5b9715edc453a867d799b911404f2IABBWHxej1yj1XGMLs9QJRsvefmQjawi/m+Y9WXQ023KM+T0VX2GzqzzIgCTGw8EZRyhXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604307685', '0', '0', '2');
INSERT INTO `chat` VALUES ('37', '13', '29', 'b26f35a092b5d51fb8e4a179d50220d3', '00656c5b9715edc453a867d799b911404f2IAATvK/Bna/Uvo28ylCG/0Mkyjmfvem2HPe4Q7iVtxU+eqBoSYdbdFQ4IgDvDqEEDx+hXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604308367', '1604308370', '17', '2');
INSERT INTO `chat` VALUES ('38', '13', '29', '6f37bbf3695c8d677d9669b1de399320', '00656c5b9715edc453a867d799b911404f2IAD/RjLL/jdnfWISmn/GxepEX7xptApDZd4V9ChkIOTNxMdGOadbdFQ4IgD8BQQEqR+hXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604308521', '1604308522', '21', '2');
INSERT INTO `chat` VALUES ('39', '29', '13', '34012f0d96805fbf9cf672528effb241', '00656c5b9715edc453a867d799b911404f2IADpA5R2a3uhdFYxDz28399ZXutBpVAKqJgFFdwqVoHOBXc6jJ6GzqzzIgDHi9EESyChXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604308683', '1604308684', '20', '2');
INSERT INTO `chat` VALUES ('40', '13', '29', '68b0dd44feb98bc1af376da7a581cd7d', '00656c5b9715edc453a867d799b911404f2IAApA++K2DAAYe0tV57nO4mEP3mjieqva5+kHGB7k3Xe5KqdsShbdFQ4IgC9fO4FySChXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604308809', '1604308811', '51', '2');
INSERT INTO `chat` VALUES ('41', '29', '13', '0622b8a66c36ccb14832876966f2324c', '00656c5b9715edc453a867d799b911404f2IADmwZzZ4kXWBSKIaEjHPjPIbQIXgBWU2WZ41Ek33EFBqXWQgfqGzqzzIgAQnHcFQiGhXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604308930', '1604308932', '12', '2');
INSERT INTO `chat` VALUES ('42', '29', '13', '75760f2e40c58ce3de447b199350b510', '00656c5b9715edc453a867d799b911404f2IAB7idh/3kkemO3SZq8o0Ya3wU916atfhHLawsh0b2QjpjtBD3OGzqzzIgBYv1cDpyGhXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604309031', '1604309033', '0', '1');
INSERT INTO `chat` VALUES ('43', '29', '13', '0708a477a12a5780e92fdb6c7f1f1fce', '00656c5b9715edc453a867d799b911404f2IABD8yRiSmqBED3+B6zIhQcSufhnHHTWiMmI1G9KI/+Kf4wknaSGzqzzIgBOK3UFqSKhXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604309289', '1604309291', '0', '1');
INSERT INTO `chat` VALUES ('44', '13', '29', 'a0f735e04632e7856f0fb50161531d1b', '00656c5b9715edc453a867d799b911404f2IAAKoRljTD1UxVRaDnAZz8+bOx0vfswPjNNzXjvIv66MZ+Um+VJbdFQ4IgBsyb4CJSOhXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604309413', '1604309415', '5', '2');
INSERT INTO `chat` VALUES ('45', '13', '29', '18c87369e13da77a27681ae082665acf', '00656c5b9715edc453a867d799b911404f2IACSg+Lfxc4Bo2j6YayrwrGZ7qemh3nZKwFkw9tW66H5lC78ilpbdFQ4IgA8xT8AeiOhXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604309498', '1604309500', '6', '2');
INSERT INTO `chat` VALUES ('46', '29', '13', 'c49fca221277897d3007657998dfe682', '00656c5b9715edc453a867d799b911404f2IABTQvoma1Xpre3yWvs/usniaxp3mUW+k+X3jDp6ZUmsF9FaJpGGzqzzIgBAw10FhSOhXwQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA', '1604309509', '1604309511', '47', '2');

-- ----------------------------
-- Table structure for chat_log
-- ----------------------------
DROP TABLE IF EXISTS `chat_log`;
CREATE TABLE `chat_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chatId` int(11) NOT NULL COMMENT '通话ID',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `action` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '0-拨打电话 1-接听电话 2-通话接通 3-正常挂断 4-后台挂断(重新登录)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of chat_log
-- ----------------------------
INSERT INTO `chat_log` VALUES ('1', '1', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('2', '2', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('3', '3', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('4', '3', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('5', '3', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('6', '3', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('7', '4', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('8', '4', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('9', '4', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('10', '5', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('11', '5', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('12', '5', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('13', '6', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('14', '6', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('15', '6', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('16', '7', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('17', '7', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('18', '8', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('19', '8', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('20', '9', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('21', '9', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('22', '9', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('23', '10', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('24', '10', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('25', '10', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('26', '10', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('27', '11', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('28', '11', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('29', '11', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('30', '12', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('31', '12', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('32', '12', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('33', '13', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('34', '13', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('35', '13', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('36', '13', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('37', '14', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('38', '14', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('39', '14', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('40', '15', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('41', '15', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('42', '15', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('43', '16', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('44', '16', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('45', '16', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('46', '17', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('47', '17', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('48', '17', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('49', '17', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('50', '18', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('51', '18', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('52', '19', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('53', '19', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('54', '19', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('55', '19', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('56', '20', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('57', '20', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('58', '20', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('59', '21', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('60', '21', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('61', '21', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('62', '21', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('63', '22', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('64', '22', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('65', '22', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('66', '23', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('67', '23', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('68', '23', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('69', '24', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('70', '24', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('71', '24', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('72', '25', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('73', '25', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('74', '25', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('75', '26', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('76', '26', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('77', '26', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('78', '27', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('79', '27', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('80', '27', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('81', '28', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('82', '28', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('83', '28', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('84', '29', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('85', '29', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('86', '29', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('87', '30', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('88', '30', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('89', '30', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('90', '31', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('91', '31', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('92', '31', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('93', '32', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('94', '32', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('95', '32', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('96', '33', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('97', '33', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('98', '33', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('99', '33', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('100', '34', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('101', '35', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('102', '35', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('103', '36', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('104', '36', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('105', '37', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('106', '37', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('107', '37', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('108', '38', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('109', '38', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('110', '38', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('111', '39', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('112', '39', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('113', '39', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('114', '40', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('115', '40', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('116', '40', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('117', '41', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('118', '41', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('119', '41', '29', '挂断电话');
INSERT INTO `chat_log` VALUES ('120', '42', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('121', '42', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('122', '43', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('123', '43', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('124', '44', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('125', '44', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('126', '44', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('127', '45', '13', '拨打电话');
INSERT INTO `chat_log` VALUES ('128', '45', '29', '接听电话');
INSERT INTO `chat_log` VALUES ('129', '45', '13', '挂断电话');
INSERT INTO `chat_log` VALUES ('130', '46', '29', '拨打电话');
INSERT INTO `chat_log` VALUES ('131', '46', '13', '接听电话');
INSERT INTO `chat_log` VALUES ('132', '46', '29', '挂断电话');

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `description` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `topic` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '画廊模板 1 2 3',
  `filetype` enum('image','video','voice') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image' COMMENT '文件类型',
  `filelist` varchar(512) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '文件列表：1,2,...n 对应image表或者video表主键',
  `voice_id` int(11) NOT NULL DEFAULT '0' COMMENT '声音',
  `is_audit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 0 审核 1通过 -1 失败',
  `audit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_audit_time` (`audit_time`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='动态视频表';

-- ----------------------------
-- Records of dynamic
-- ----------------------------
INSERT INTO `dynamic` VALUES ('1', '11', '2020-08-13 11:50:40', '', '', 'image', '25', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('2', '11', '2020-08-13 11:50:40', '', '', 'image', '26', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('3', '11', '2020-08-13 11:50:40', '', '', 'image', '27', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('4', '11', '2020-08-13 11:50:40', '', '', 'image', '28', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('5', '11', '2020-08-13 11:50:40', '', '', 'image', '29', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('6', '11', '2020-08-13 11:50:40', '', '', 'image', '30', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('7', '12', '2020-08-13 11:50:40', '', '', 'image', '31', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('8', '12', '2020-08-13 11:50:40', '', '', 'image', '32', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('9', '12', '2020-08-13 11:50:40', '', '', 'image', '33', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('10', '12', '2020-08-13 11:50:40', '', '', 'image', '34', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('11', '12', '2020-08-13 11:50:40', '', '', 'image', '35', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('12', '12', '2020-08-13 11:50:40', '', '', 'image', '36', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('13', '13', '2020-08-13 11:50:40', '', '', 'image', '37', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('14', '13', '2020-08-13 11:50:40', '', '', 'image', '38', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('15', '13', '2020-08-13 11:50:40', '', '', 'image', '39', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('16', '13', '2020-08-13 11:50:40', '', '', 'image', '10', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('17', '13', '2020-08-13 11:50:40', '', '', 'image', '41', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('18', '13', '2020-08-13 11:50:40', '', '', 'image', '42', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('19', '14', '2020-08-13 11:50:40', '', '', 'image', '43', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('20', '14', '2020-08-13 11:50:40', '', '', 'image', '44', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('21', '14', '2020-08-13 11:50:40', '', '', 'image', '45', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('22', '14', '2020-08-13 11:50:40', '', '', 'image', '46', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('23', '14', '2020-08-13 11:50:40', '', '', 'image', '47', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('24', '14', '2020-08-13 11:50:40', '', '', 'image', '48', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('25', '14', '2020-08-13 11:50:40', '', '', 'image', '49', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('26', '15', '2020-08-13 11:50:40', '', '', 'image', '50', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('27', '15', '2020-08-13 11:50:40', '', '', 'image', '51', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('28', '15', '2020-08-13 11:50:40', '', '', 'image', '52', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('29', '15', '2020-08-13 11:50:40', '', '', 'image', '53', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('30', '15', '2020-08-13 11:50:40', '', '', 'image', '54', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('31', '15', '2020-08-13 11:50:40', '', '', 'image', '55', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('32', '15', '2020-08-13 11:50:40', '', '', 'image', '56', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('33', '15', '2020-08-13 11:50:40', '', '', 'image', '57', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('34', '16', '2020-08-13 11:50:40', '', '', 'image', '58', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('35', '16', '2020-08-13 11:50:40', '', '', 'image', '59', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('36', '16', '2020-08-13 11:50:40', '', '', 'image', '60', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('37', '16', '2020-08-13 11:50:40', '', '', 'image', '61', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('38', '16', '2020-08-13 11:50:40', '', '', 'image', '62', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('39', '16', '2020-08-13 11:50:40', '', '', 'image', '63', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('40', '16', '2020-08-13 11:50:40', '', '', 'image', '64', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('41', '17', '2020-08-13 11:50:40', '', '', 'image', '65', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('42', '17', '2020-08-13 11:50:40', '', '', 'image', '66', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('43', '17', '2020-08-13 11:50:40', '', '', 'image', '67', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('44', '17', '2020-08-13 11:50:40', '', '', 'image', '68', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('45', '17', '2020-08-13 11:50:40', '', '', 'image', '69', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('46', '17', '2020-08-13 11:50:40', '', '', 'image', '70', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('47', '17', '2020-08-13 11:50:40', '', '', 'image', '71', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('48', '18', '2020-08-13 11:50:40', '', '', 'image', '72', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('49', '18', '2020-08-13 11:50:40', '', '', 'image', '73', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('50', '18', '2020-08-13 11:50:40', '', '', 'image', '74', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('51', '18', '2020-08-13 11:50:40', '', '', 'image', '75', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('52', '18', '2020-08-13 11:50:40', '', '', 'image', '76', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('53', '18', '2020-08-13 11:50:40', '', '', 'image', '77', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('54', '18', '2020-08-13 11:50:40', '', '', 'image', '78', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('55', '18', '2020-08-13 11:50:40', '', '', 'image', '79', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('56', '13', '2020-08-13 11:50:40', '', '', 'voice', '1', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('57', '14', '2020-08-13 11:50:40', '', '', 'voice', '2', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('58', '15', '2020-08-13 11:50:40', '', '', 'voice', '3', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('59', '16', '2020-08-13 11:50:40', '', '', 'voice', '4', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('60', '11', '2020-08-13 11:50:40', '放空自己~拥抱大海', '', 'video', '1', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('61', '11', '2020-08-13 11:50:40', '面朝大海~春暖花开', '', 'video', '2', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('62', '12', '2020-08-13 11:50:40', 'hotboyjerr', '', 'video', '3', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('63', '13', '2020-08-13 11:50:40', '四十岁的人生会是什么', '', 'video', '4', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('64', '13', '2020-08-13 11:50:40', '一个旅行博主的2019', '', 'video', '5', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('65', '14', '2020-08-13 11:50:40', '夕阳西下几时回', '', 'video', '6', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('66', '14', '2020-08-13 11:50:40', '这么美的小仙女', '', 'video', '7', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('67', '15', '2020-08-13 11:50:40', '2020日本—两个人', '', 'video', '8', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('68', '15', '2020-08-13 11:50:40', '藏在京都的绝美雪国', '', 'video', '9', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('69', '15', '2020-08-13 11:50:40', '濑户内海之夏', '', 'video', '10', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('70', '16', '2020-08-13 11:50:40', '巴黎Vlog 02', '', 'video', '11', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('71', '16', '2020-08-13 11:50:40', '再见，我的2019', '', 'video', '12', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('72', '17', '2020-08-13 11:50:40', '毕业快乐祝你快乐', '', 'video', '13', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('73', '18', '2020-08-13 11:50:40', '程一蜜的视频', '', 'video', '14', '0', '1', '2020-08-13 11:50:40');
INSERT INTO `dynamic` VALUES ('74', '18', '2020-08-13 11:50:40', '一只小一蜜', '', 'video', '15', '0', '1', '2020-08-13 11:50:40');

-- ----------------------------
-- Table structure for dynamic_comment
-- ----------------------------
DROP TABLE IF EXISTS `dynamic_comment`;
CREATE TABLE `dynamic_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dynamic_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '动态Id',
  `postuser_id` int(11) NOT NULL DEFAULT '0' COMMENT '动态发布者Id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '评论内容',
  `comment_time` int(11) NOT NULL DEFAULT '0' COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `idx_dynamic_id` (`dynamic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='动态评论表';

-- ----------------------------
-- Records of dynamic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dynamic_comment_like
-- ----------------------------
DROP TABLE IF EXISTS `dynamic_comment_like`;
CREATE TABLE `dynamic_comment_like` (
  `comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论Id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '点赞的人',
  `commentuser_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论者Id',
  `dynamic_id` int(11) NOT NULL DEFAULT '0' COMMENT '动态id',
  PRIMARY KEY (`comment_id`,`user_id`),
  KEY `postuser_id` (`commentuser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='动态评论点赞表';

-- ----------------------------
-- Records of dynamic_comment_like
-- ----------------------------

-- ----------------------------
-- Table structure for dynamic_like
-- ----------------------------
DROP TABLE IF EXISTS `dynamic_like`;
CREATE TABLE `dynamic_like` (
  `dynamic_id` int(11) NOT NULL DEFAULT '0' COMMENT '动态Id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '点赞的人',
  `postuser_id` int(11) NOT NULL DEFAULT '0' COMMENT '动态发布者Id',
  `like_time` int(11) NOT NULL DEFAULT '6' COMMENT '点赞时间',
  PRIMARY KEY (`dynamic_id`,`user_id`),
  KEY `postuser_id` (`postuser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='动态点赞表';

-- ----------------------------
-- Records of dynamic_like
-- ----------------------------

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `image_id` int(11) NOT NULL DEFAULT '0' COMMENT '图片id，对应image表主键',
  `description` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '描述',
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '联系地址',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='意见反馈';

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for focuslist
-- ----------------------------
DROP TABLE IF EXISTS `focuslist`;
CREATE TABLE `focuslist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行关注操作的用户',
  `to_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '被关注的用户',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0 未删除  1 删除',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_to_user_id` (`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='关注列表';

-- ----------------------------
-- Records of focuslist
-- ----------------------------

-- ----------------------------
-- Table structure for gift
-- ----------------------------
DROP TABLE IF EXISTS `gift`;
CREATE TABLE `gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '礼物ID',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '礼物价格',
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '礼物名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='礼物表';

-- ----------------------------
-- Records of gift
-- ----------------------------

-- ----------------------------
-- Table structure for gift_log
-- ----------------------------
DROP TABLE IF EXISTS `gift_log`;
CREATE TABLE `gift_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '送出的用户',
  `to_user_id` int(11) NOT NULL COMMENT '接收的用户',
  `gift_id` int(11) NOT NULL COMMENT '礼物ID',
  `coins` int(11) NOT NULL DEFAULT '0' COMMENT '花费货币',
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '送礼时间',
  `scene` enum('dynamic','room','message') NOT NULL DEFAULT 'dynamic' COMMENT '送礼场景（动态，房间，私信）',
  `scene_id` int(11) NOT NULL DEFAULT '0' COMMENT '场景标志（动态id，房间id，用户id）',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='礼物日志';

-- ----------------------------
-- Records of gift_log
-- ----------------------------

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'jpg' COMMENT '文件类型（jpg,png,url）',
  `use_type` enum('avatar','dynamic','photo','certification','feedback') COLLATE utf8mb4_bin NOT NULL DEFAULT 'avatar' COMMENT '图片用途（头像，动态，照片，身份认证，意见反馈）',
  `is_audit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 0 审核 1通过 -1 失败',
  `audit_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `pos` int(11) NOT NULL DEFAULT '0' COMMENT '位置',
  `dynamic_id` int(11) NOT NULL DEFAULT '0' COMMENT '动态ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='图片表';

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '0', '2020-08-05 13:43:12', 'avatar_0.png', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('2', '0', '2020-08-05 13:43:12', 'avatar_1.png', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('3', '11', '2020-08-05 13:43:12', 'avatar_11.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('4', '12', '2020-08-05 13:43:12', 'avatar_12.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('5', '13', '2020-08-05 13:43:12', 'avatar_13.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('6', '14', '2020-08-05 13:43:12', 'avatar_14.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('7', '15', '2020-08-05 13:43:12', 'avatar_15.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('8', '16', '2020-08-05 13:43:12', 'avatar_16.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('9', '17', '2020-08-05 13:43:12', 'avatar_17.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('10', '18', '2020-08-05 13:43:12', 'avatar_18.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('11', '19', '2020-08-05 13:43:12', 'avatar_19.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('12', '20', '2020-08-05 13:43:12', 'avatar_20.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('13', '0', '2020-08-05 13:43:12', 'avatar_default_0_1.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('14', '0', '2020-08-05 13:43:12', 'avatar_default_0_2.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('15', '0', '2020-08-05 13:43:12', 'avatar_default_0_3.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('16', '0', '2020-08-05 13:43:12', 'avatar_default_0_4.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('17', '0', '2020-08-05 13:43:12', 'avatar_default_0_5.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('18', '0', '2020-08-05 13:43:12', 'avatar_default_0_6.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('19', '0', '2020-08-05 13:43:12', 'avatar_default_1_1.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('20', '0', '2020-08-05 13:43:12', 'avatar_default_1_2.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('21', '0', '2020-08-05 13:43:12', 'avatar_default_1_3.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('22', '0', '2020-08-05 13:43:12', 'avatar_default_1_4.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('23', '0', '2020-08-05 13:43:12', 'avatar_default_1_5.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('24', '0', '2020-08-05 13:43:12', 'avatar_default_1_6.jpg', 'jpg', 'avatar', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('25', '11', '2020-08-05 13:43:12', 'dynamic_11_1.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('26', '11', '2020-08-05 13:43:12', 'dynamic_11_2.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('27', '11', '2020-08-05 13:43:12', 'dynamic_11_3.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('28', '11', '2020-08-05 13:43:12', 'dynamic_11_4.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('29', '11', '2020-08-05 13:43:12', 'dynamic_11_5.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('30', '11', '2020-08-05 13:43:12', 'dynamic_11_6.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('31', '12', '2020-08-05 13:43:12', 'dynamic_12_1.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('32', '12', '2020-08-05 13:43:12', 'dynamic_12_2.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('33', '12', '2020-08-05 13:43:12', 'dynamic_12_3.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('34', '12', '2020-08-05 13:43:12', 'dynamic_12_4.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('35', '12', '2020-08-05 13:43:12', 'dynamic_12_5.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('36', '12', '2020-08-05 13:43:12', 'dynamic_12_6.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('37', '13', '2020-08-05 13:43:12', 'dynamic_13_1.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('38', '13', '2020-08-05 13:43:12', 'dynamic_13_2.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('39', '13', '2020-08-05 13:43:12', 'dynamic_13_3.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('40', '13', '2020-08-05 13:43:12', 'dynamic_13_4.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('41', '13', '2020-08-05 13:43:12', 'dynamic_13_5.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('42', '13', '2020-08-05 13:43:12', 'dynamic_13_6.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('43', '14', '2020-08-05 13:43:12', 'dynamic_14_1.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('44', '14', '2020-08-05 13:43:12', 'dynamic_14_2.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('45', '14', '2020-08-05 13:43:12', 'dynamic_14_3.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('46', '14', '2020-08-05 13:43:12', 'dynamic_14_4.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('47', '14', '2020-08-05 13:43:12', 'dynamic_14_5.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('48', '14', '2020-08-05 13:43:12', 'dynamic_14_6.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('49', '14', '2020-08-05 13:43:12', 'dynamic_14_7.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('50', '15', '2020-08-05 13:43:12', 'dynamic_15_1.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('51', '15', '2020-08-05 13:43:12', 'dynamic_15_2.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('52', '15', '2020-08-05 13:43:12', 'dynamic_15_3.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('53', '15', '2020-08-05 13:43:12', 'dynamic_15_4.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('54', '15', '2020-08-05 13:43:12', 'dynamic_15_5.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('55', '15', '2020-08-05 13:43:12', 'dynamic_15_6.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('56', '15', '2020-08-05 13:43:12', 'dynamic_15_7.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('57', '15', '2020-08-05 13:43:12', 'dynamic_15_8.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('58', '16', '2020-08-05 13:43:12', 'dynamic_16_1.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('59', '16', '2020-08-05 13:43:12', 'dynamic_16_2.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('60', '16', '2020-08-05 13:43:12', 'dynamic_16_3.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('61', '16', '2020-08-05 13:43:12', 'dynamic_16_4.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('62', '16', '2020-08-05 13:43:12', 'dynamic_16_5.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('63', '16', '2020-08-05 13:43:12', 'dynamic_16_6.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('64', '16', '2020-08-05 13:43:12', 'dynamic_16_7.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('65', '17', '2020-08-05 13:43:12', 'dynamic_17_1.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('66', '17', '2020-08-05 13:43:12', 'dynamic_17_2.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('67', '17', '2020-08-05 13:43:12', 'dynamic_17_3.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('68', '17', '2020-08-05 13:43:12', 'dynamic_17_4.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('69', '17', '2020-08-05 13:43:12', 'dynamic_17_5.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('70', '17', '2020-08-05 13:43:12', 'dynamic_17_6.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('71', '17', '2020-08-05 13:43:12', 'dynamic_17_7.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('72', '18', '2020-08-05 13:43:12', 'dynamic_18_1.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('73', '18', '2020-08-05 13:43:12', 'dynamic_18_2.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('74', '18', '2020-08-05 13:43:12', 'dynamic_18_3.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('75', '18', '2020-08-05 13:43:12', 'dynamic_18_4.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('76', '18', '2020-08-05 13:43:12', 'dynamic_18_5.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('77', '18', '2020-08-05 13:43:12', 'dynamic_18_6.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('78', '18', '2020-08-05 13:43:12', 'dynamic_18_7.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');
INSERT INTO `image` VALUES ('79', '18', '2020-08-05 13:43:12', 'dynamic_18_8.jpg', 'jpg', 'dynamic', '1', '2020-08-05 13:43:12', '0', '0');

-- ----------------------------
-- Table structure for match_log
-- ----------------------------
DROP TABLE IF EXISTS `match_log`;
CREATE TABLE `match_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '发起用户Id',
  `to_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '被匹配用户Id',
  `match_date` date NOT NULL COMMENT '匹配时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_audit_time` (`match_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='匹配日志表';

-- ----------------------------
-- Records of match_log
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息Url',
  `elem_type` int(11) NOT NULL COMMENT '消息类型 0 文本 1 图片 2 声音',
  `from_user_id` int(11) NOT NULL COMMENT '发送方ID',
  `to_user_id` int(11) NOT NULL COMMENT '接收方ID',
  `text_elem_content` varchar(1000) COLLATE utf8mb4_bin NOT NULL COMMENT '消息内容',
  `message_server_time` int(11) NOT NULL COMMENT '消息发送时间',
  `is_read` int(11) NOT NULL DEFAULT '0' COMMENT '是否已读 0-未读 1-已读',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否已读 0-正常 1-删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for pay_config
-- ----------------------------
DROP TABLE IF EXISTS `pay_config`;
CREATE TABLE `pay_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '人民币（元）',
  `coins` int(11) NOT NULL DEFAULT '0' COMMENT '货币',
  `appid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'AppStore商品ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='充值配置';

-- ----------------------------
-- Records of pay_config
-- ----------------------------

-- ----------------------------
-- Table structure for pay_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `orderid` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `money` int(11) NOT NULL COMMENT '人民币（元）',
  `coins` int(11) NOT NULL COMMENT '货币',
  `postdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态：0未完成，1成功，-1失败',
  `finishdate` timestamp NULL DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='充值订单';

-- ----------------------------
-- Records of pay_order
-- ----------------------------

-- ----------------------------
-- Table structure for photolist
-- ----------------------------
DROP TABLE IF EXISTS `photolist`;
CREATE TABLE `photolist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `photolist` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '相片列表：1,2,...n 对应photo表主键',
  `is_audit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 0 审核 1通过 -1 失败',
  `audit_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_audit_time` (`audit_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='照片列表表';

-- ----------------------------
-- Records of photolist
-- ----------------------------

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '举报用户Id',
  `to_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '被举报用户Id',
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '举报类型',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '举报内容',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='举报';

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', '45', '13', '2020-11-02 14:08:25', '', '色情低俗');
INSERT INTO `report` VALUES ('2', '45', '13', '2020-11-02 14:10:06', '', '色情低俗');
INSERT INTO `report` VALUES ('3', '45', '13', '2020-11-02 14:11:28', '', '色情低俗');
INSERT INTO `report` VALUES ('4', '45', '11', '2020-11-02 14:17:01', '', '涉嫌诈骗');
INSERT INTO `report` VALUES ('5', '38', '14', '2020-11-02 16:58:23', '', '色情低俗');
INSERT INTO `report` VALUES ('6', '38', '14', '2020-11-02 16:58:27', '', '政治敏感');
INSERT INTO `report` VALUES ('7', '38', '14', '2020-11-02 16:58:31', '', '涉嫌诈骗');
INSERT INTO `report` VALUES ('8', '38', '45', '2020-11-02 17:10:17', '', '发布垃圾广告等');
INSERT INTO `report` VALUES ('9', '38', '45', '2020-11-02 17:10:19', '', '侮辱谩骂');
INSERT INTO `report` VALUES ('10', '38', '18', '2020-11-02 17:10:24', '', '涉嫌诈骗');
INSERT INTO `report` VALUES ('11', '38', '16', '2020-11-02 17:10:32', '', '侮辱谩骂');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL COMMENT '房间ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `im_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'IM群组',
  `room_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '房间名',
  `hot_num` int(11) NOT NULL DEFAULT '0' COMMENT '热度值',
  `seat_user` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '入座用户',
  `open_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开房时间',
  `enter_num` int(11) NOT NULL DEFAULT '0' COMMENT '房间人数',
  `enter_sex` int(1) NOT NULL DEFAULT '-1' COMMENT '性别限制 -1 全部 1 男 0 女',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='房间表';

-- ----------------------------
-- Records of room
-- ----------------------------

-- ----------------------------
-- Table structure for room_collect
-- ----------------------------
DROP TABLE IF EXISTS `room_collect`;
CREATE TABLE `room_collect` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `room_id` int(11) NOT NULL COMMENT '房间ID',
  `im_group` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '群组ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of room_collect
-- ----------------------------

-- ----------------------------
-- Table structure for room_mic
-- ----------------------------
DROP TABLE IF EXISTS `room_mic`;
CREATE TABLE `room_mic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请上麦组ID',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `room_id` int(11) NOT NULL COMMENT '房间id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of room_mic
-- ----------------------------

-- ----------------------------
-- Table structure for room_seat
-- ----------------------------
DROP TABLE IF EXISTS `room_seat`;
CREATE TABLE `room_seat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `room_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '房间id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='房间上座申请列表';

-- ----------------------------
-- Records of room_seat
-- ----------------------------

-- ----------------------------
-- Table structure for room_user
-- ----------------------------
DROP TABLE IF EXISTS `room_user`;
CREATE TABLE `room_user` (
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `room_id` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '房间id',
  `im_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'IM群组',
  PRIMARY KEY (`user_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='房间用户表';

-- ----------------------------
-- Records of room_user
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `registration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户注册时间',
  `nickname` char(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '1男,0女 -1 未选择',
  `birthday` date NOT NULL DEFAULT '1900-01-01' COMMENT '生日',
  `age` int(11) NOT NULL DEFAULT '0' COMMENT '年龄',
  `user_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户key',
  `lastlogon_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次登陆时间',
  `lastlogon_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0.0.0' COMMENT '最后一次登陆ip',
  `avatar_id` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '用户头像，关联avatar表主键',
  `photolist_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户照片列表，关联photolist表主键',
  `certification` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否实名认证',
  `signature` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '签名',
  `relationship_status` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '情感状态',
  `friends_purpose` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '交友意向',
  `hobbies` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '感兴趣的事(逗号分隔)',
  `cpsth` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '想和伴侣完成的事',
  `coins` int(11) NOT NULL DEFAULT '0' COMMENT '货币',
  `coins_used` int(11) NOT NULL DEFAULT '0' COMMENT '已使用货币',
  `chatId` int(4) NOT NULL DEFAULT '0' COMMENT '通话ID',
  `height` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '身高',
  `weight` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '体重',
  `constellation` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT '星座',
  `city` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT '城市',
  `hot_num` int(11) NOT NULL DEFAULT '0' COMMENT '热度',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态 0-未提交 1-审核中 2-审核通过',
  `is_cp` tinyint(4) DEFAULT '0' COMMENT '是否组成CP 1 是 0 否',
  PRIMARY KEY (`id`),
  KEY `idx_phone_number` (`phone_number`),
  KEY `registration_time` (`registration_time`),
  KEY `lastlogon_time` (`lastlogon_time`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '19800000001', '2020-08-05 11:24:51', '最佳小助手', '0', '1900-01-01', '0', '', '2020-10-21 14:41:44', '0.0.0.0', '2', '0', '0', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('2', '19800000002', '2020-08-05 11:24:51', '预留', '0', '1900-01-01', '0', '', '2020-10-21 14:43:11', '0.0.0.0', '1', '0', '0', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('3', '19800000003', '2020-08-05 11:24:51', '预留', '0', '1900-01-01', '0', '', '2020-10-21 14:48:59', '0.0.0.0', '1', '0', '0', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('4', '19800000004', '2020-08-05 11:24:51', '预留', '1', '1900-01-01', '0', '', '2020-08-05 11:24:51', '0.0.0.0', '1', '0', '0', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('5', '19800000005', '2020-08-05 11:24:51', '预留', '1', '1900-01-01', '0', '', '2020-08-05 11:24:51', '0.0.0.0', '1', '0', '0', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('6', '19800000006', '2020-08-05 11:24:51', '预留', '1', '1900-01-01', '0', '', '2020-08-05 11:24:51', '0.0.0.0', '1', '0', '0', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('7', '19800000007', '2020-08-05 11:24:51', '预留', '1', '1900-01-01', '0', '', '2020-08-05 11:24:51', '0.0.0.0', '1', '0', '0', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('8', '19800000008', '2020-08-05 11:24:51', '预留', '1', '1900-01-01', '0', '', '2020-08-05 11:24:51', '0.0.0.0', '1', '0', '0', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('9', '19800000009', '2020-08-05 11:24:52', '预留', '1', '1900-01-01', '0', '', '2020-08-05 11:24:52', '0.0.0.0', '1', '0', '0', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('10', '19800000010', '2020-08-05 11:24:52', '预留', '1', '1900-01-01', '0', '', '2020-08-05 11:24:52', '0.0.0.0', '1', '0', '0', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('11', '19900000001', '2020-08-05 11:24:52', 'DJ雨小轩', '1', '1994-01-01', '20', '0BbUGTmBXBMNxFZHco6bXzzr4hHGWFPE', '2020-11-02 17:24:48', '10.10.11.41', '3', '0', '0', '我也曾来过', '', '', '电影,咖啡控', '', '0', '0', '0', '0', '0', '', '', '0', '0', '1');
INSERT INTO `user` VALUES ('12', '19900000002', '2020-09-24 17:24:24', 'hotboyjerry', '1', '1900-01-01', '0', '', '2020-10-19 14:21:13', '10.10.11.41', '4', '0', '0', '桃桃同学在这里', '', '', '二次元', '', '0', '0', '0', '0', '0', '', '', '0', '0', '1');
INSERT INTO `user` VALUES ('13', '19900000003', '2020-09-24 17:24:25', '逆光纪', '1', '1900-01-01', '0', '1F9JOSGLJLDdltC4qfNa09TWq3lUMYu1', '2020-11-02 17:28:04', '10.10.11.40', '5', '0', '0', '简简单单就好', '', '', '二次元', '', '0', '0', '0', '0', '0', '', '', '0', '0', '1');
INSERT INTO `user` VALUES ('14', '19900000004', '2020-09-24 17:24:26', '水彩张雷雷', '1', '1900-01-01', '0', '', '2020-09-24 17:24:26', '0.0.0.0', '6', '0', '0', '可乐就是力量', '', '', '二次元', '', '0', '0', '0', '0', '0', '', '', '0', '0', '1');
INSERT INTO `user` VALUES ('15', '19900000005', '2020-09-24 17:24:27', 'Fairyria', '0', '1900-01-01', '0', '', '2020-09-24 17:24:27', '0.0.0.0', '7', '0', '0', '偷偷告诉你，照片是本人', '', '', '二次元', '', '0', '0', '0', '0', '0', '', '', '0', '0', '1');
INSERT INTO `user` VALUES ('16', '19900000006', '2020-09-24 17:24:28', 'itsRae', '0', '1900-01-01', '0', '', '2020-10-16 16:01:05', '10.10.11.41', '8', '0', '0', '青青爱喝冰可乐', '', '', '二次元', '', '0', '0', '0', '0', '0', '', '', '0', '0', '1');
INSERT INTO `user` VALUES ('17', '19900000007', '2020-09-24 17:24:30', '龙梦柔_kuriko', '0', '1900-01-01', '0', '', '2020-09-24 17:24:30', '0.0.0.0', '9', '0', '0', '家住酒店喜欢唱唱', '', '', '二次元', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('18', '19900000008', '2020-09-24 17:25:56', '一只小一蜜', '0', '1900-01-01', '0', '', '2020-10-21 14:04:35', '10.10.11.40', '10', '0', '0', '可爱多又多', '', '', '二次元', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('19', '19900000009', '2020-10-22 16:51:22', '你的二恒', '1', '1900-01-01', '0', '', '2020-10-22 16:51:22', '0.0.0.0', '11', '0', '0', '你的晚安是想让我闭嘴吧', '', '', '二次元', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');
INSERT INTO `user` VALUES ('20', '19900000010', '2020-10-22 16:51:47', '王蓉蓉', '0', '1900-01-01', '0', '', '2020-10-22 16:51:47', '0.0.0.0', '12', '0', '0', '慢慢享受无限宠爱', '', '', '电影,咖啡控', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'mp4' COMMENT '文件类型',
  `cover_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '封面文件名',
  `cover_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'jpg' COMMENT '封面文件类型',
  `rotation` int(11) NOT NULL DEFAULT '0' COMMENT '旋转角度',
  `use_type` enum('dynamic','certification','feedback') COLLATE utf8mb4_bin NOT NULL DEFAULT 'dynamic' COMMENT '视频用途（动态，身份认证，意见反馈）',
  `is_audit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 0 审核 1通过 -1 失败',
  `audit_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='视频表';

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', '11', '2020-07-31 11:21:21', 'dynamic_11_1.mp4', 'mp4', 'dynamic_11_1_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('2', '11', '2020-07-31 11:21:21', 'dynamic_11_2.mp4', 'mp4', 'dynamic_11_2_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('3', '12', '2020-07-31 11:21:21', 'dynamic_12_1.mp4', 'mp4', 'dynamic_12_1_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('4', '13', '2020-07-31 11:21:21', 'dynamic_13_1.mp4', 'mp4', 'dynamic_13_1_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('5', '13', '2020-07-31 11:21:21', 'dynamic_13_2.mp4', 'mp4', 'dynamic_13_2_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('6', '14', '2020-07-31 11:21:21', 'dynamic_14_1.mp4', 'mp4', 'dynamic_14_1_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('7', '14', '2020-07-31 11:21:21', 'dynamic_14_2.mp4', 'mp4', 'dynamic_14_2_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('8', '15', '2020-07-31 11:21:21', 'dynamic_15_1.mp4', 'mp4', 'dynamic_15_1_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('9', '15', '2020-07-31 11:21:21', 'dynamic_15_2.mp4', 'mp4', 'dynamic_15_2_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('10', '15', '2020-07-31 11:21:21', 'dynamic_15_3.mp4', 'mp4', 'dynamic_15_3_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('11', '16', '2020-07-31 11:21:21', 'dynamic_16_1.mp4', 'mp4', 'dynamic_16_1_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('12', '16', '2020-07-31 11:21:21', 'dynamic_16_2.mp4', 'mp4', 'dynamic_16_2_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('13', '17', '2020-07-31 11:21:21', 'dynamic_17_1.mp4', 'mp4', 'dynamic_17_1_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('14', '18', '2020-07-31 11:21:21', 'dynamic_18_1.mp4', 'mp4', 'dynamic_18_1_1.jpg', 'jpg', '0', 'dynamic', '1', null);
INSERT INTO `video` VALUES ('15', '18', '2020-07-31 11:21:21', 'dynamic_18_2.mp4', 'mp4', 'dynamic_18_2_1.jpg', 'jpg', '0', 'dynamic', '1', null);

-- ----------------------------
-- Table structure for voice
-- ----------------------------
DROP TABLE IF EXISTS `voice`;
CREATE TABLE `voice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `file_name` varchar(200) COLLATE utf8mb4_bin NOT NULL COMMENT '文件名',
  `file_type` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '文件类型',
  `file_second` int(11) NOT NULL COMMENT '语音时长 秒',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of voice
-- ----------------------------
INSERT INTO `voice` VALUES ('1', '13', '2020-07-30 14:20:10', 'dynamic_13_1.mp3', 'mp3', '5');
INSERT INTO `voice` VALUES ('2', '14', '2020-07-30 14:20:10', 'dynamic_14_1.mp3', 'mp3', '3');
INSERT INTO `voice` VALUES ('3', '15', '2020-07-30 14:20:10', 'dynamic_15_1.mp3', 'mp3', '4');
INSERT INTO `voice` VALUES ('4', '16', '2020-07-30 14:20:10', 'dynamic_16_1.mp3', 'mp3', '4');
