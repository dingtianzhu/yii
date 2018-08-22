/*
Navicat MySQL Data Transfer

Source Server         : 47.94.163.255
Source Server Version : 50554
Source Host           : 47.94.163.255:3306
Source Database       : rffx

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2018-08-17 11:57:56
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO auth_assignment VALUES ('注册用户', '4', '1479267383');
INSERT INTO auth_assignment VALUES ('注册用户', '53', '1533449116');
INSERT INTO auth_assignment VALUES ('注册用户', '54', '1533449125');
INSERT INTO auth_assignment VALUES ('注册用户', '55', '1533449131');
INSERT INTO auth_assignment VALUES ('注册用户', '56', '1533449140');
INSERT INTO auth_assignment VALUES ('注册用户', '57', '1533449146');
INSERT INTO auth_assignment VALUES ('注册用户', '58', '1533449152');
INSERT INTO auth_assignment VALUES ('注册用户', '59', '1533449158');
INSERT INTO auth_assignment VALUES ('注册用户', '60', '1533449164');
INSERT INTO auth_assignment VALUES ('注册用户', '64', '1533632618');
INSERT INTO auth_assignment VALUES ('泽优管理员', '30', '1511942084');
INSERT INTO auth_assignment VALUES ('用户管理', '30', '1511942143');
INSERT INTO auth_assignment VALUES ('超级权限', '1', '1508998607');
INSERT INTO auth_assignment VALUES ('超级管理员', '1', '1467629090');

-- ----------------------------
-- Table structure for `auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO auth_item VALUES ('/*', '2', null, null, null, '1467628934', '1467628934');
INSERT INTO auth_item VALUES ('/admin/*', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/admin/assignment/*', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/assignment/assign', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/assignment/index', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/assignment/revoke', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/assignment/view', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/default/*', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/default/index', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/menu/*', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/menu/create', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/menu/delete', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/menu/index', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/menu/update', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/menu/view', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/permission/*', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/permission/assign', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/permission/create', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/permission/delete', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/permission/index', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/permission/remove', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/permission/update', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/permission/view', '2', null, null, null, '1467628930', '1467628930');
INSERT INTO auth_item VALUES ('/admin/role/*', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/role/assign', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/role/create', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/role/delete', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/role/index', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/role/remove', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/role/update', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/role/view', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/route/*', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/route/assign', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/route/create', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/route/index', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/route/refresh', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/route/remove', '2', null, null, null, '1467628931', '1467628931');
INSERT INTO auth_item VALUES ('/admin/rule/*', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/rule/create', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/rule/delete', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/rule/index', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/rule/update', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/rule/view', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/user/*', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/admin/user/activate', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/admin/user/change-password', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/admin/user/delete', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/user/index', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/user/login', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/user/logout', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/user/reset-password', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/admin/user/signup', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/admin/user/view', '2', null, null, null, '1467628932', '1467628932');
INSERT INTO auth_item VALUES ('/count/list', '2', null, null, null, '1533457720', '1533457720');
INSERT INTO auth_item VALUES ('/debug/*', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/debug/default/*', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/debug/default/db-explain', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/debug/default/download-mail', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/debug/default/index', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/debug/default/toolbar', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/debug/default/view', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/family/*', '2', null, null, null, '1509615521', '1509615521');
INSERT INTO auth_item VALUES ('/family/index', '2', null, null, null, '1509615521', '1509615521');
INSERT INTO auth_item VALUES ('/family/list', '2', null, null, null, '1509615521', '1509615521');
INSERT INTO auth_item VALUES ('/getcashrecord/agree', '2', null, null, null, '1533455820', '1533455820');
INSERT INTO auth_item VALUES ('/getcashrecord/list', '2', null, null, null, '1533455781', '1533455781');
INSERT INTO auth_item VALUES ('/getcashrecord/sharemoneylist', '2', null, null, null, '1534477668', '1534477668');
INSERT INTO auth_item VALUES ('/getcashrecord/userbalance', '2', null, null, null, '1533456594', '1533456594');
INSERT INTO auth_item VALUES ('/gii/*', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/gii/default/*', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/gii/default/action', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/gii/default/diff', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/gii/default/index', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/gii/default/preview', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/gii/default/view', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/healthword/*', '2', null, null, null, '1512375626', '1512375626');
INSERT INTO auth_item VALUES ('/healthword/create', '2', null, null, null, '1512375626', '1512375626');
INSERT INTO auth_item VALUES ('/healthword/delete', '2', null, null, null, '1512375626', '1512375626');
INSERT INTO auth_item VALUES ('/healthword/index', '2', null, null, null, '1512375626', '1512375626');
INSERT INTO auth_item VALUES ('/healthword/list', '2', null, null, null, '1512375626', '1512375626');
INSERT INTO auth_item VALUES ('/healthword/list2', '2', null, null, null, '1512376790', '1512376790');
INSERT INTO auth_item VALUES ('/healthword/update', '2', null, null, null, '1512375626', '1512375626');
INSERT INTO auth_item VALUES ('/homedatamanage/list', '2', null, null, null, '1509009437', '1509009437');
INSERT INTO auth_item VALUES ('/homedatamanage/list2', '2', null, null, null, '1511941899', '1511941899');
INSERT INTO auth_item VALUES ('/homedatamanage/list3', '2', null, null, null, '1511941899', '1511941899');
INSERT INTO auth_item VALUES ('/homedatamanage/list4', '2', null, null, null, '1511941899', '1511941899');
INSERT INTO auth_item VALUES ('/homehistorydata/*', '2', null, null, null, '1512033366', '1512033366');
INSERT INTO auth_item VALUES ('/homehistorydata/create', '2', null, null, null, '1512033366', '1512033366');
INSERT INTO auth_item VALUES ('/homehistorydata/delete', '2', null, null, null, '1512033366', '1512033366');
INSERT INTO auth_item VALUES ('/homehistorydata/index', '2', null, null, null, '1512033366', '1512033366');
INSERT INTO auth_item VALUES ('/homehistorydata/list', '2', null, null, null, '1512033366', '1512033366');
INSERT INTO auth_item VALUES ('/homehistorydata/list2', '2', null, null, null, '1512033366', '1512033366');
INSERT INTO auth_item VALUES ('/homehistorydata/list3', '2', null, null, null, '1512033366', '1512033366');
INSERT INTO auth_item VALUES ('/homehistorydata/update', '2', null, null, null, '1512033366', '1512033366');
INSERT INTO auth_item VALUES ('/index/welcome', '2', null, null, null, '1467885038', '1467885038');
INSERT INTO auth_item VALUES ('/livevoice/*', '2', null, null, null, '1512460140', '1512460140');
INSERT INTO auth_item VALUES ('/livevoice/create', '2', null, null, null, '1512460140', '1512460140');
INSERT INTO auth_item VALUES ('/livevoice/delete', '2', null, null, null, '1512460140', '1512460140');
INSERT INTO auth_item VALUES ('/livevoice/index', '2', null, null, null, '1512460140', '1512460140');
INSERT INTO auth_item VALUES ('/livevoice/list', '2', null, null, null, '1512460140', '1512460140');
INSERT INTO auth_item VALUES ('/livevoice/list2', '2', null, null, null, '1512460140', '1512460140');
INSERT INTO auth_item VALUES ('/livevoice/update', '2', null, null, null, '1512460140', '1512460140');
INSERT INTO auth_item VALUES ('/order/list', '2', null, null, null, '1533454911', '1533454911');
INSERT INTO auth_item VALUES ('/product/create', '2', null, null, null, '1533453841', '1533453841');
INSERT INTO auth_item VALUES ('/product/list', '2', null, null, null, '1533453829', '1533453829');
INSERT INTO auth_item VALUES ('/product/status', '2', null, null, null, '1533453925', '1533453925');
INSERT INTO auth_item VALUES ('/product/update', '2', null, null, null, '1533453972', '1533453972');
INSERT INTO auth_item VALUES ('/robot/*', '2', null, null, null, '1509697387', '1509697387');
INSERT INTO auth_item VALUES ('/robot/create', '2', null, null, null, '1511508104', '1511508104');
INSERT INTO auth_item VALUES ('/robot/index', '2', null, null, null, '1509697387', '1509697387');
INSERT INTO auth_item VALUES ('/robot/list', '2', null, null, null, '1509697387', '1509697387');
INSERT INTO auth_item VALUES ('/site/*', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/site/error', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/site/index', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/site/list', '2', null, null, null, '1508987981', '1508987981');
INSERT INTO auth_item VALUES ('/site/login', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/site/logout', '2', null, null, null, '1467628933', '1467628933');
INSERT INTO auth_item VALUES ('/team/list', '2', null, null, null, '1533452420', '1533452420');
INSERT INTO auth_item VALUES ('/team/teaminfo', '2', null, null, null, '1533452550', '1533452550');
INSERT INTO auth_item VALUES ('/user/*', '2', null, null, null, '1467626433', '1467626433');
INSERT INTO auth_item VALUES ('/user/authuser', '2', null, null, null, '1534213357', '1534213357');
INSERT INTO auth_item VALUES ('/user/create', '2', null, null, null, '1467626433', '1467626433');
INSERT INTO auth_item VALUES ('/user/delete', '2', null, null, null, '1467626433', '1467626433');
INSERT INTO auth_item VALUES ('/user/index', '2', null, null, null, '1467626433', '1467626433');
INSERT INTO auth_item VALUES ('/user/list', '2', null, null, null, '1467684059', '1467684059');
INSERT INTO auth_item VALUES ('/user/update', '2', null, null, null, '1467626433', '1467626433');
INSERT INTO auth_item VALUES ('/user/view', '2', null, null, null, '1467626433', '1467626433');
INSERT INTO auth_item VALUES ('注册用户', '1', '注册用户', null, null, '1467626553', '1509611841');
INSERT INTO auth_item VALUES ('泽优管理员', '1', '泽优管理人员', null, null, '1508983265', '1512460211');
INSERT INTO auth_item VALUES ('用户管理', '2', '用户管理', null, null, '1467626475', '1467626475');
INSERT INTO auth_item VALUES ('超级权限', '2', '超级权限拥有最高级系统权限', null, null, '1467628984', '1512376831');
INSERT INTO auth_item VALUES ('超级管理员', '1', '超级管理员拥有最高级别系统权限', null, null, '1467629059', '1509697471');

-- ----------------------------
-- Table structure for `auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO auth_item_child VALUES ('超级权限', '/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/assignment/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/assignment/assign');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/assignment/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/assignment/revoke');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/assignment/view');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/default/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/default/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/menu/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/menu/create');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/menu/delete');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/menu/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/menu/update');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/menu/view');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/permission/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/permission/assign');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/permission/create');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/permission/delete');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/permission/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/permission/remove');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/permission/update');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/permission/view');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/role/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/role/assign');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/role/create');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/role/delete');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/role/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/role/remove');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/role/update');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/role/view');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/route/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/route/assign');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/route/create');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/route/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/route/refresh');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/route/remove');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/rule/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/rule/create');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/rule/delete');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/rule/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/rule/update');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/rule/view');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/user/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/user/activate');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/user/change-password');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/user/delete');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/user/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/user/login');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/user/logout');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/user/request-password-reset');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/user/reset-password');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/user/signup');
INSERT INTO auth_item_child VALUES ('超级权限', '/admin/user/view');
INSERT INTO auth_item_child VALUES ('超级权限', '/count/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/debug/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/debug/default/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/debug/default/db-explain');
INSERT INTO auth_item_child VALUES ('超级权限', '/debug/default/download-mail');
INSERT INTO auth_item_child VALUES ('超级权限', '/debug/default/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/debug/default/toolbar');
INSERT INTO auth_item_child VALUES ('超级权限', '/debug/default/view');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/family/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/family/*');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/family/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/family/index');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/family/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/family/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/getcashrecord/agree');
INSERT INTO auth_item_child VALUES ('超级权限', '/getcashrecord/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/getcashrecord/sharemoneylist');
INSERT INTO auth_item_child VALUES ('超级权限', '/getcashrecord/userbalance');
INSERT INTO auth_item_child VALUES ('超级权限', '/gii/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/gii/default/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/gii/default/action');
INSERT INTO auth_item_child VALUES ('超级权限', '/gii/default/diff');
INSERT INTO auth_item_child VALUES ('超级权限', '/gii/default/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/gii/default/preview');
INSERT INTO auth_item_child VALUES ('超级权限', '/gii/default/view');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/healthword/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/healthword/*');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/healthword/create');
INSERT INTO auth_item_child VALUES ('超级权限', '/healthword/create');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/healthword/delete');
INSERT INTO auth_item_child VALUES ('超级权限', '/healthword/delete');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/healthword/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/healthword/index');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/healthword/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/healthword/list');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/healthword/list2');
INSERT INTO auth_item_child VALUES ('超级权限', '/healthword/list2');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/healthword/update');
INSERT INTO auth_item_child VALUES ('超级权限', '/healthword/update');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homedatamanage/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/homedatamanage/list');
INSERT INTO auth_item_child VALUES ('超级管理员', '/homedatamanage/list');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homedatamanage/list2');
INSERT INTO auth_item_child VALUES ('超级权限', '/homedatamanage/list2');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homedatamanage/list3');
INSERT INTO auth_item_child VALUES ('超级权限', '/homedatamanage/list3');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homedatamanage/list4');
INSERT INTO auth_item_child VALUES ('超级权限', '/homedatamanage/list4');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homehistorydata/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/homehistorydata/*');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homehistorydata/create');
INSERT INTO auth_item_child VALUES ('超级权限', '/homehistorydata/create');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homehistorydata/delete');
INSERT INTO auth_item_child VALUES ('超级权限', '/homehistorydata/delete');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homehistorydata/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/homehistorydata/index');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homehistorydata/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/homehistorydata/list');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homehistorydata/list2');
INSERT INTO auth_item_child VALUES ('超级权限', '/homehistorydata/list2');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homehistorydata/list3');
INSERT INTO auth_item_child VALUES ('超级权限', '/homehistorydata/list3');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/homehistorydata/update');
INSERT INTO auth_item_child VALUES ('超级权限', '/homehistorydata/update');
INSERT INTO auth_item_child VALUES ('超级权限', '/index/welcome');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/livevoice/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/livevoice/*');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/livevoice/create');
INSERT INTO auth_item_child VALUES ('超级权限', '/livevoice/create');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/livevoice/delete');
INSERT INTO auth_item_child VALUES ('超级权限', '/livevoice/delete');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/livevoice/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/livevoice/index');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/livevoice/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/livevoice/list');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/livevoice/list2');
INSERT INTO auth_item_child VALUES ('超级权限', '/livevoice/list2');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/livevoice/update');
INSERT INTO auth_item_child VALUES ('超级权限', '/livevoice/update');
INSERT INTO auth_item_child VALUES ('超级权限', '/order/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/product/create');
INSERT INTO auth_item_child VALUES ('超级权限', '/product/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/product/status');
INSERT INTO auth_item_child VALUES ('超级权限', '/product/update');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/robot/*');
INSERT INTO auth_item_child VALUES ('超级管理员', '/robot/*');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/robot/create');
INSERT INTO auth_item_child VALUES ('超级权限', '/robot/create');
INSERT INTO auth_item_child VALUES ('超级管理员', '/robot/create');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/robot/index');
INSERT INTO auth_item_child VALUES ('超级管理员', '/robot/index');
INSERT INTO auth_item_child VALUES ('泽优管理员', '/robot/list');
INSERT INTO auth_item_child VALUES ('超级管理员', '/robot/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/site/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/site/error');
INSERT INTO auth_item_child VALUES ('超级权限', '/site/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/site/login');
INSERT INTO auth_item_child VALUES ('超级权限', '/site/logout');
INSERT INTO auth_item_child VALUES ('超级权限', '/team/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/team/teaminfo');
INSERT INTO auth_item_child VALUES ('超级权限', '/user/*');
INSERT INTO auth_item_child VALUES ('超级权限', '/user/authuser');
INSERT INTO auth_item_child VALUES ('超级权限', '/user/create');
INSERT INTO auth_item_child VALUES ('超级权限', '/user/delete');
INSERT INTO auth_item_child VALUES ('用户管理', '/user/index');
INSERT INTO auth_item_child VALUES ('超级权限', '/user/index');
INSERT INTO auth_item_child VALUES ('用户管理', '/user/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/user/list');
INSERT INTO auth_item_child VALUES ('超级权限', '/user/update');
INSERT INTO auth_item_child VALUES ('超级权限', '/user/view');
INSERT INTO auth_item_child VALUES ('泽优管理员', '注册用户');
INSERT INTO auth_item_child VALUES ('注册用户', '用户管理');
INSERT INTO auth_item_child VALUES ('超级管理员', '超级权限');

-- ----------------------------
-- Table structure for `auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO auth_rule VALUES ('编辑文章', 'O:30:\"backend\\components\\ArticleRule\":3:{s:4:\"name\";s:12:\"编辑文章\";s:9:\"createdAt\";i:1467706283;s:9:\"updatedAt\";i:1467706305;}', '1467706283', '1467706305');

-- ----------------------------
-- Table structure for `getcashrecord`
-- ----------------------------
DROP TABLE IF EXISTS `getcashrecord`;
CREATE TABLE `getcashrecord` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `amount` varchar(20) DEFAULT NULL COMMENT '提现金额',
  `creat_time` varchar(15) DEFAULT NULL COMMENT '申请提现时间',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '提现完成时间',
  `verify_user_id` int(10) DEFAULT NULL COMMENT '审核用户id',
  `status` int(10) DEFAULT NULL COMMENT '提现状态：1.已申请，2，转账中，3，已完成。',
  `info` varchar(140) DEFAULT NULL COMMENT '提现信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of getcashrecord
-- ----------------------------
INSERT INTO getcashrecord VALUES ('1', '11', '', '0000-00-00 00:0', null, null, '1', ',建设银行,258765424598696969,XX路XX支行');
INSERT INTO getcashrecord VALUES ('2', '11', '', '1534232511', null, null, '1', ',建设银行,258765424598696969,XX路XX支行');
INSERT INTO getcashrecord VALUES ('3', '11', '123', '1534232535', null, null, '1', ',建设银行,258765424598696969,XX路XX支行');
INSERT INTO getcashrecord VALUES ('4', '66', '123', '1534233060', null, null, '1', ',建设银行,258765424598696969,XX路XX支行');
INSERT INTO getcashrecord VALUES ('5', '66', '123', '1534233097', null, null, '1', ',建设银行,258765424598696969,XX路XX支行');
INSERT INTO getcashrecord VALUES ('6', '66', '123', '1534233149', null, null, '1', ',建设银行,258765424598696969,XX路XX支行');
INSERT INTO getcashrecord VALUES ('7', '66', '123', '1534233156', null, null, '1', ',建设银行,258765424598696969,XX路XX支行');

-- ----------------------------
-- Table structure for `kkbot_family`
-- ----------------------------
DROP TABLE IF EXISTS `kkbot_family`;
CREATE TABLE `kkbot_family` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `main_user_id` int(10) NOT NULL COMMENT '一家之主',
  `name` varchar(50) DEFAULT '还没取名字' COMMENT '家庭名字',
  `robot_id` int(10) NOT NULL COMMENT '机器人id',
  `info` varchar(50) NOT NULL DEFAULT '' COMMENT '家庭其他信息',
  `timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kkbot_family
-- ----------------------------
INSERT INTO kkbot_family VALUES ('1', '28', '小九的快乐家庭', '2', '康康家', '2017-11-23 16:09:09');
INSERT INTO kkbot_family VALUES ('2', '12', '小八的换了家庭', '0', '三口之家', '2017-11-22 09:24:30');

-- ----------------------------
-- Table structure for `kkbot_robot`
-- ----------------------------
DROP TABLE IF EXISTS `kkbot_robot`;
CREATE TABLE `kkbot_robot` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '机器人id',
  `number` varchar(50) DEFAULT '' COMMENT '编号',
  `mac` varchar(50) DEFAULT NULL COMMENT 'mac地址',
  `info` varchar(50) NOT NULL DEFAULT '' COMMENT '机器人其他信息',
  `sex` tinyint(2) NOT NULL DEFAULT '1' COMMENT '性别',
  `voice` int(10) NOT NULL DEFAULT '50' COMMENT '音量',
  `network` varchar(50) DEFAULT NULL COMMENT '网络',
  `timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kkbot_robot
-- ----------------------------
INSERT INTO kkbot_robot VALUES ('1', '10000001', 'FC:DB:12:34:33', '18722665795', '2', '99', '1213:2131', '2017-11-22 17:18:42');
INSERT INTO kkbot_robot VALUES ('2', '10000002', 'FC:DB:12:34:23', '康老西', '0', '36', 'wifi1:111', '2017-11-22 18:09:41');
INSERT INTO kkbot_robot VALUES ('3', '10000003', 'FC:DB:12:34:13', '只会睡觉的机器人', '1', '50', null, '2017-11-03 16:59:43');
INSERT INTO kkbot_robot VALUES ('4', '43', '4343', '', '1', '50', null, '0000-00-00 00:00:00');
INSERT INTO kkbot_robot VALUES ('5', '10000008', '1411070a0023', '', '1', '50', null, '0000-00-00 00:00:00');
INSERT INTO kkbot_robot VALUES ('6', '10000009', '14110c0e0001', '', '1', '50', null, '2017-12-06 17:08:07');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `data` varchar(64) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO log VALUES ('1', 'lzkong1029', '127.0.0.1', '', '1460439851');
INSERT INTO log VALUES ('2', 'lzkong1029', '127.0.0.1', '', '1460441344');
INSERT INTO log VALUES ('3', 'test', '127.0.0.1', '', '1460441372');
INSERT INTO log VALUES ('4', 'lzkong1029', '127.0.0.1', '', '1460441448');
INSERT INTO log VALUES ('5', 'lzkong1029', '127.0.0.1', '', '1460443092');
INSERT INTO log VALUES ('6', 'test', '127.0.0.1', '', '1460510935');
INSERT INTO log VALUES ('7', 'lzkong1029', '127.0.0.1', '', '1460511022');
INSERT INTO log VALUES ('8', 'lzkong1029', '127.0.0.1', '', '1460511099');
INSERT INTO log VALUES ('9', 'test', '127.0.0.1', '', '1460511126');
INSERT INTO log VALUES ('10', 'lzkong1029', '127.0.0.1', '', '1460518525');
INSERT INTO log VALUES ('11', 'test', '127.0.0.1', '', '1460529644');
INSERT INTO log VALUES ('12', 'lzkong1029', '127.0.0.1', '', '1460683222');
INSERT INTO log VALUES ('13', 'test', '127.0.0.1', '', '1460687319');
INSERT INTO log VALUES ('14', 'lzkong1029', '127.0.0.1', '', '1460687331');
INSERT INTO log VALUES ('15', 'admin', '127.0.0.1', '', '1460687467');
INSERT INTO log VALUES ('16', 'admin', '127.0.0.1', '', '1460713859');
INSERT INTO log VALUES ('17', 'admin', '127.0.0.1', '', '1466130336');
INSERT INTO log VALUES ('18', 'test', '127.0.0.1', '', '1467701285');
INSERT INTO log VALUES ('19', 'admin', '127.0.0.1', '', '1467704379');
INSERT INTO log VALUES ('20', 'admin', '127.0.0.1', '', '1467711872');
INSERT INTO log VALUES ('21', 'test', '127.0.0.1', '', '1467711883');
INSERT INTO log VALUES ('22', 'admin', '127.0.0.1', '', '1467712267');
INSERT INTO log VALUES ('23', 'test', '127.0.0.1', '', '1467799040');
INSERT INTO log VALUES ('24', 'admin', '127.0.0.1', '', '1467806743');
INSERT INTO log VALUES ('25', 'admin', '127.0.0.1', '', '1467874541');
INSERT INTO log VALUES ('26', 'test', '127.0.0.1', '', '1467885125');
INSERT INTO log VALUES ('27', 'admin', '127.0.0.1', '', '1467888107');
INSERT INTO log VALUES ('28', 'admin', '127.0.0.1', '', '1479280452');
INSERT INTO log VALUES ('29', 'admin', '127.0.0.1', '', '1479280483');
INSERT INTO log VALUES ('30', 'chenhan', '112.193.144.70', '四川-成都--', '1508987374');
INSERT INTO log VALUES ('31', 'admin', '112.193.144.70', '四川-成都--', '1508987585');
INSERT INTO log VALUES ('32', 'chenhan', '112.193.144.70', '四川-成都--', '1508987658');
INSERT INTO log VALUES ('33', 'admin', '112.193.144.70', '四川-成都--', '1508987690');
INSERT INTO log VALUES ('34', 'chenhan', '112.193.144.70', '四川-成都--', '1508987735');
INSERT INTO log VALUES ('35', 'admin', '112.193.144.70', '四川-成都--', '1508987911');
INSERT INTO log VALUES ('36', 'chenhan', '112.193.144.70', '四川-成都--', '1508999070');
INSERT INTO log VALUES ('37', 'admin', '112.193.144.70', '四川-成都--', '1508999110');
INSERT INTO log VALUES ('38', 'admin', '112.193.144.70', '四川-成都--', '1509001919');
INSERT INTO log VALUES ('39', 'admin', '112.193.144.70', '四川-成都--', '1509002186');
INSERT INTO log VALUES ('40', 'admin', '112.193.144.70', '四川-成都--', '1509007088');
INSERT INTO log VALUES ('41', 'admin', '112.193.144.70', '四川-成都--', '1509007281');
INSERT INTO log VALUES ('42', 'admin', '112.193.144.70', '四川-成都--', '1509007432');
INSERT INTO log VALUES ('43', 'chenhan', '112.193.144.70', '四川-成都--', '1509008637');
INSERT INTO log VALUES ('44', 'admin', '112.193.144.70', '四川-成都--', '1509009316');
INSERT INTO log VALUES ('45', 'chenhan', '112.193.144.70', '四川-成都--', '1509009825');
INSERT INTO log VALUES ('46', 'chenqizhou', '112.193.144.70', '四川-成都--', '1509009846');
INSERT INTO log VALUES ('47', 'admin', '112.193.144.70', '四川-成都--', '1509009864');
INSERT INTO log VALUES ('48', 'chenhan', '112.193.144.70', '四川-成都--', '1509073382');
INSERT INTO log VALUES ('49', 'chenhan', '112.193.144.70', '四川-成都--', '1509087121');
INSERT INTO log VALUES ('50', 'admin', '101.204.29.231', '四川-成都--', '1509595246');
INSERT INTO log VALUES ('51', 'chenhan', '101.204.29.231', '四川-成都--', '1509610895');
INSERT INTO log VALUES ('52', 'admin', '101.204.29.231', '四川-成都--', '1509611304');
INSERT INTO log VALUES ('53', 'chenhan', '101.204.29.231', '四川-成都--', '1509613215');
INSERT INTO log VALUES ('54', 'admin', '101.204.29.231', '四川-成都--', '1509614869');
INSERT INTO log VALUES ('55', 'admin', '101.204.29.231', '四川-成都--', '1509616361');
INSERT INTO log VALUES ('56', 'admin', '119.4.178.46', '四川-成都--', '1511313650');
INSERT INTO log VALUES ('57', '18722665795', '119.4.178.46', '四川-成都--', '1511313732');
INSERT INTO log VALUES ('58', 'admin', '119.4.178.46', '四川-成都--', '1511313797');
INSERT INTO log VALUES ('59', '18722665795', '119.4.178.46', '四川-成都--', '1511313826');
INSERT INTO log VALUES ('60', 'admin', '119.4.178.46', '四川-成都--', '1511401608');
INSERT INTO log VALUES ('61', 'admin', '112.193.145.47', '四川-成都--', '1511942064');
INSERT INTO log VALUES ('62', 'chenhan', '112.193.145.47', '四川-成都--', '1511942107');
INSERT INTO log VALUES ('63', 'admin', '112.193.145.47', '四川-成都--', '1511942131');
INSERT INTO log VALUES ('64', 'chenhan', '112.193.145.47', '四川-成都--', '1511942155');
INSERT INTO log VALUES ('65', 'admin', '112.193.145.47', '四川-成都--', '1511942173');
INSERT INTO log VALUES ('66', 'chenhan', '112.193.145.47', '四川-成都--', '1511942199');
INSERT INTO log VALUES ('67', 'admin', '112.193.145.47', '四川-成都--', '1511942226');
INSERT INTO log VALUES ('68', 'chenhan', '101.204.151.149', '四川-成都--', '1512033489');
INSERT INTO log VALUES ('69', 'admin', '101.204.151.149', '四川-成都--', '1512033502');
INSERT INTO log VALUES ('70', 'admin', '101.204.151.149', '四川-成都--', '1512036876');
INSERT INTO log VALUES ('71', 'chenhan', '101.204.29.102', '四川-成都--', '1512375729');
INSERT INTO log VALUES ('72', 'admin', '101.204.29.102', '四川-成都--', '1512375950');
INSERT INTO log VALUES ('73', 'chenhan', '101.204.29.102', '四川-成都--', '1512376854');
INSERT INTO log VALUES ('74', 'admin', '101.204.29.102', '四川-成都--', '1512377367');
INSERT INTO log VALUES ('75', 'chenhan', '101.204.29.102', '四川-成都--', '1512460258');
INSERT INTO log VALUES ('76', 'admin', '101.204.29.102', '四川-成都--', '1512460281');
INSERT INTO log VALUES ('77', 'admin', '119.4.176.128', '四川-成都--', '1512988279');
INSERT INTO log VALUES ('78', 'chenhan', '119.4.176.128', '四川-成都--', '1513071569');
INSERT INTO log VALUES ('79', 'chenhan', '125.69.115.54', '四川-成都--', '1520319264');
INSERT INTO log VALUES ('80', 'chenhan', '222.212.196.117', '四川-成都--', '1522130310');
INSERT INTO log VALUES ('81', 'admin', '118.112.127.82', '四川-成都--', '1522735941');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO menu VALUES ('1', '用户中心', null, '/user/list', null, 0x7B2269636F6E223A202266612066612D75736572227D);
INSERT INTO menu VALUES ('2', '权限控制', null, '/admin/default/index', '1', 0x7B2269636F6E223A202266612066612D6B6579227D);
INSERT INTO menu VALUES ('3', '路由列表', '2', '/admin/route/index', '2', null);
INSERT INTO menu VALUES ('4', '菜单管理', '2', '/admin/menu/index', '7', null);
INSERT INTO menu VALUES ('5', '权限管理', '2', '/admin/permission/index', '3', null);
INSERT INTO menu VALUES ('6', '角色管理', '2', '/admin/role/index', '4', null);
INSERT INTO menu VALUES ('7', '分配权限', '2', '/admin/assignment/index', '5', null);
INSERT INTO menu VALUES ('9', '规则管理', '2', '/admin/rule/index', '6', null);
INSERT INTO menu VALUES ('10', '新增用户', '11', '/user/create', '2', null);
INSERT INTO menu VALUES ('11', '用户管理', '1', '/user/list', '8', 0x7B2269636F6E223A202266612066612D67726F7570227D);
INSERT INTO menu VALUES ('12', '用户列表', '11', '/user/list', '1', null);
INSERT INTO menu VALUES ('13', '团队管理', null, '/user/list', null, null);
INSERT INTO menu VALUES ('14', '团队列表', '13', '/team/list', null, null);
INSERT INTO menu VALUES ('15', '商品管理', null, '/user/list', null, null);
INSERT INTO menu VALUES ('16', '商品列表', '15', '/product/list', null, null);
INSERT INTO menu VALUES ('17', '商品状态管理', '15', '/product/status', null, null);
INSERT INTO menu VALUES ('20', '支付管理', null, '/user/list', null, null);
INSERT INTO menu VALUES ('21', '订单支付列表', '20', '/order/list', null, null);
INSERT INTO menu VALUES ('24', '分红提现管理', null, '/user/list', null, null);
INSERT INTO menu VALUES ('25', '提现记录', '24', '/getcashrecord/list', null, null);
INSERT INTO menu VALUES ('26', '用户余额', '24', '/getcashrecord/userbalance', null, null);
INSERT INTO menu VALUES ('27', '报表数据统计', null, '/user/list', null, null);
INSERT INTO menu VALUES ('28', '统计报表', '27', '/count/list', null, null);
INSERT INTO menu VALUES ('33', '分红记录', '24', '/getcashrecord/sharemoneylist', null, null);

-- ----------------------------
-- Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO migration VALUES ('m000000_000000_base', '1467622624');
INSERT INTO migration VALUES ('m140602_111327_create_menu_table', '1467622628');
INSERT INTO migration VALUES ('m160312_050000_create_user', '1467622628');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `product_id` int(10) DEFAULT NULL COMMENT '商品id',
  `creat_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `status` int(5) DEFAULT NULL COMMENT '订单状态：1未支付，2已支付',
  `use_status` int(5) DEFAULT NULL COMMENT '商品使用状态',
  `total_price` varchar(20) DEFAULT NULL COMMENT '订单总价格',
  `number` int(10) DEFAULT NULL COMMENT '商品购买数量',
  `price` varchar(20) DEFAULT NULL COMMENT '商品单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `stock` int(10) DEFAULT NULL COMMENT '商品库存',
  `product_image` varchar(200) DEFAULT NULL COMMENT '商品图片位置',
  `product_description` varchar(100) DEFAULT NULL COMMENT '商品描述',
  `price` varchar(20) DEFAULT NULL COMMENT '商品价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO product VALUES ('1', '康小宝机器人', '10000', 'http://www.zeroioe.com/rffx/api/dysms_php/images/product/product1.jpg', '8寸TFT显示屏；电容式全触摸面板；全双工语音交互。人脸识别。电容式触摸面板', '2999');
INSERT INTO product VALUES ('2', '光灸器', '10000', 'http://www.zeroioe.com/rffx/api/dysms_php/images/product/product2.jpg', '时光隧道光量子端粒酶细胞激活仪光疗补钙祛痘祛斑光动力美容仪', '138');

-- ----------------------------
-- Table structure for `team`
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(50) DEFAULT NULL COMMENT '团队名称',
  `team_leader_id` int(10) DEFAULT NULL COMMENT '团长id',
  `creat_time` varchar(10) DEFAULT NULL,
  `status` int(10) DEFAULT NULL COMMENT '团队状态，1.申请建团中，2，已建团，3.冻结中',
  `total_balance` varchar(20) DEFAULT '0' COMMENT '总收款',
  `total_share` varchar(20) DEFAULT '0' COMMENT '分红总金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO team VALUES ('1', '无敌团4', '54', '1527894521', '2', '0', '0');
INSERT INTO team VALUES ('3', '无敌团', '44', '1527894521', '1', '0', '0');
INSERT INTO team VALUES ('4', '98团', '52', '1534567894', '2', '0', '0');
INSERT INTO team VALUES ('5', '98团', '57', '1534567894', '2', '0', '0');
INSERT INTO team VALUES ('6', '康康123', '66', '1534212612', '1', '66000', '16320');
INSERT INTO team VALUES ('7', '康康123', '84', '1534214790', '1', '10000', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `user_really_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户真实姓名',
  `other_info` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户其他信息',
  `family_id` int(11) DEFAULT NULL COMMENT '家庭id',
  `is_main_user` bigint(2) DEFAULT '0' COMMENT '是否是主用户',
  `password_app` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bind_robot_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_x` double(8,3) DEFAULT '0.000' COMMENT '经度',
  `location_y` double(8,3) DEFAULT '0.000' COMMENT '纬度',
  `originphone` varchar(12) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '推荐人手机号',
  `origincode` varchar(8) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '推荐码',
  `seflcode` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '本人推荐码',
  `team_id` int(10) DEFAULT NULL COMMENT '所属团队id',
  `team_role` int(5) DEFAULT NULL COMMENT '团队角色：１.团长，２，稽查，３.审计，４，团员，５，会员,６，待审核',
  `team_in_time` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入团时间',
  `total_balance` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '用户总余额',
  `freeze_balance` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '用户冻结余额',
  `auth_status` int(3) DEFAULT NULL COMMENT '会员认证状态:1.已认证，2.认证中，3.认证失败，4.未认证',
  `wx_openid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信openid',
  `idcard` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证号',
  `sex` int(5) DEFAULT NULL COMMENT '1.男 2.女',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', 'admin', 'C5f5K1Kg8tL-IutYAom4-s7RMh_xMk_l', '$2y$13$zUhKPW6Y69gn.DDWjSI.kOp9OXZWSuMDTq5JRZvw6yK9dr2QK43qu', null, '272067517@qq.com', '10', '1467626063', '1467626063', '泽优', null, null, null, null, null, '0.000', '0.000', null, null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO user VALUES ('53', '123123123', 'qzluBOMj7yV4JVERNzx6-9IIdaeJYNBO', '$2y$13$ponetPKEqiL23NUuPNqbPe0ZjICtGL1PIzgsIf54Cgu0E3eFdz3De', null, '312312312312', '10', '1533449116', '0', null, null, null, '0', null, null, '0.000', '0.000', null, null, null, null, null, null, '0', '0', '1', null, null, null);
INSERT INTO user VALUES ('54', '18779147147', 'kxeE_M-4ewVT07smIJsPqO-PJxpoCzkj', '$2y$13$tQaPrTH2Txnmi6vEiui9gOyNMaRgFwtrPX7iZ80LGS0EaBnQ9nKpa', null, '4234234', '10', '1533449125', '0', '6陈会员3', null, null, '0', null, null, '0.000', '0.000', '', '66', null, '6', '4', '1524567812', '80', '0', '1', null, null, null);
INSERT INTO user VALUES ('55', '18779147146', 'nCQkJuP4UXKCwatbFDszPKv1BCIZL2Jl', '$2y$13$PlCedUC4g3NZRV0ZOSAPHeJSi09OtmOxk565foD9AuDWARw0khwqK', null, '5235235', '10', '1533449131', '0', '陈会员5', null, null, '0', null, null, '0.000', '0.000', null, '66', null, '6', '3', null, '80', '0', '1', null, null, null);
INSERT INTO user VALUES ('56', '18779147145', 'tipHuohhmzRGdnSNVloRD6nrIeGY_yw5', '$2y$13$4hGg2DHrydkod5ugHOg07uEKshl4JDhEadEBAY7E66JCV9nyV7g96', null, '654363', '10', '1533449140', '0', '陈会员4', null, null, '0', null, null, '0.000', '0.000', null, '66', null, '6', '4', null, '80', '0', '1', null, null, null);
INSERT INTO user VALUES ('57', '18779147144', '1lngiKbueInhfOoIGDFDtqDnYs04VaRp', '$2y$13$4XuNYMoZALKhUsII.xyQ9uNvdACOc8zd6JQ8QJKu0JAeb6r1r8ywi', null, '3523523', '10', '1533449146', '0', '陈会员3', null, null, '0', null, null, '0.000', '0.000', '', '66', null, '6', '3', '1524567812', '0', '0', '1', null, null, null);
INSERT INTO user VALUES ('58', '18779147143', 'JXw1CmWHVpKpxnsQ6lFxxSrH7KrusQP-', '$2y$13$J2Of5B.Bl2VZXk8Ht478VOQyCx2cXIRzMe.6tk9UiSYFQmO6.0W8e', null, '3634563', '10', '1533449152', '0', '陈会员2', null, null, '0', null, null, '0.000', '0.000', null, '60', null, '6', '5', '1524567812', '0', '0', '1', null, null, null);
INSERT INTO user VALUES ('59', '18779147142', 'p2bP0XrGNExvqja-ddzI831tRV8TGTaX', '$2y$13$xw.gFaPeHqfDivdQWwyaw.P.c4Jr2EoK1Jmt/2ErdodpQYs6t9vW2', null, '36436', '10', '1533449158', '0', '陈会员1', null, null, '0', null, null, '0.000', '0.000', null, '66', null, '6', '4', '1524567812', '8080', '0', '1', null, null, null);
INSERT INTO user VALUES ('60', '18779147141', 'sawEcZjhBD2hkupKNnnC0dfWqhDtKhL5', '$2y$13$qctlR0jeptpg6fJYveEwq.ChM28rLaLY79xkTuXpuaD9OcB7I.BVu', null, '52435235', '10', '1533449164', '0', '陈团员', '天津XXXX', null, '0', null, null, '0.000', '0.000', '', '59', null, '6', '5', '1524567812', '5000', '0', '1', null, null, null);
INSERT INTO user VALUES ('64', 'chenhan', 'sUAikbPa6qHVCbo31DctMxgEIGyDMEAO', '$2y$13$bNKXSgUSbxVXkeHG2g/HTuNlvWZH93bwsDH4ILjvPvx2V93fRcWCO', null, '132@123qq.com', '10', '1533632618', '0', null, null, null, '0', null, null, '0.000', '0.000', '', null, null, null, null, null, '0', '0', '1', null, null, null);
INSERT INTO user VALUES ('66', '18779147140', '', '', '', '', '10', '0', '0', '陈其州', '', null, '0', '', '100', '0.000', '0.000', '1854872545', '0', '', '6', '1', '123123123', '5000', '0', '1', '22343224324', '18779147140', null);
INSERT INTO user VALUES ('67', '18722665795', '', '', null, '', '10', '0', '0', '陈晗', null, null, '0', null, '100', '0.000', '0.000', null, null, null, null, null, null, '0', '0', '1', 'oOsgM0TGZh-JIoX8H1PprQCw5RNA', '150426199606030810', null);
INSERT INTO user VALUES ('71', '13642003682', '', '', null, '', '10', '0', '0', 'ms', null, null, '0', null, '100', '0.000', '0.000', '0', '0', null, null, null, null, '0', '0', '1', 'ouf0u5RQ9xpyia2NkaByJ-AmxZkc', '130682199003257063', null);

-- ----------------------------
-- Table structure for `user_bank`
-- ----------------------------
DROP TABLE IF EXISTS `user_bank`;
CREATE TABLE `user_bank` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户姓名',
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_address` varchar(40) DEFAULT NULL COMMENT '开户行地址',
  `bank_cardid` varchar(40) DEFAULT NULL COMMENT '卡号',
  `create_time` varchar(15) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`,`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_bank
-- ----------------------------
INSERT INTO user_bank VALUES ('1', '11', '', '建设银行', 'XX路XX支行', '258765424598696969', '1534229254', '2018-08-14 14:48:53');
INSERT INTO user_bank VALUES ('4', '71', '马松', '中国建设银行', '天津时代奥城支行', '6217000060034033348', '1534476955', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `user_sharemoney`
-- ----------------------------
DROP TABLE IF EXISTS `user_sharemoney`;
CREATE TABLE `user_sharemoney` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `team_id` int(10) DEFAULT NULL COMMENT '团队id',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `username` varchar(30) DEFAULT NULL COMMENT '分红人姓名',
  `amount` varchar(30) DEFAULT NULL COMMENT '分红金额',
  `creat_time` varchar(15) DEFAULT NULL COMMENT '分红时间',
  `info` varchar(50) DEFAULT NULL COMMENT '分红备注',
  `new_user_id` int(10) DEFAULT NULL COMMENT '新进团会员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_sharemoney
-- ----------------------------
INSERT INTO user_sharemoney VALUES ('3', '6', '59', '陈会员1', '0', '1534313858', '团员、稽查和审计入团，该次审核不进行分红,团队总收款+10000', '59');
INSERT INTO user_sharemoney VALUES ('4', '6', '59', '陈会员1', '0', '1534313897', '该用户在该团已有分红记录，该次审核不进行分红', null);
INSERT INTO user_sharemoney VALUES ('5', '6', '54', '', '0', '1534314007', '团员、稽查和审计入团，该次审核不进行分红,团队总收款+10000', '54');
INSERT INTO user_sharemoney VALUES ('6', '6', '59', '陈会员1', '0', '1534314246', '该用户在该团已有分红记录，该次审核不进行分红', null);
INSERT INTO user_sharemoney VALUES ('41', '6', '59', '陈会员1', '5000', '1534316829', '会员陈团员入团时作为上级分红', '60');
INSERT INTO user_sharemoney VALUES ('42', '6', '66', '陈其州', '3000', '1534316829', '会员陈团员入团时作为上上级分红', '60');
INSERT INTO user_sharemoney VALUES ('43', '6', '66', '陈其州', '1000', '1534316829', '会员陈团员入团时作为团长分红,团队总收款+18000', '60');
INSERT INTO user_sharemoney VALUES ('44', '6', '54', '6陈会员3', '40', '1534316829', '会员陈团员入团时作为团员分红', '60');
INSERT INTO user_sharemoney VALUES ('45', '6', '55', '陈会员5', '40', '1534316829', '会员陈团员入团时作为团员分红', '60');
INSERT INTO user_sharemoney VALUES ('46', '6', '56', '陈会员4', '40', '1534316829', '会员陈团员入团时作为团员分红', '60');
INSERT INTO user_sharemoney VALUES ('47', '6', '59', '陈会员1', '40', '1534316829', '会员陈团员入团时作为团员分红', '60');
INSERT INTO user_sharemoney VALUES ('48', '6', '60', '陈团员', '5000', '1534317014', '会员陈会员2入团时作为上级分红', '58');
INSERT INTO user_sharemoney VALUES ('49', '6', '59', '陈会员1', '3000', '1534317014', '会员陈会员2入团时作为上上级分红', '58');
INSERT INTO user_sharemoney VALUES ('50', '6', '66', '陈其州', '1000', '1534317014', '会员陈会员2入团时作为团长分红,团队总收款+18000', '58');
INSERT INTO user_sharemoney VALUES ('51', '6', '54', '6陈会员3', '40', '1534317014', '会员陈会员2入团时作为团员分红', '58');
INSERT INTO user_sharemoney VALUES ('52', '6', '55', '陈会员5', '40', '1534317014', '会员陈会员2入团时作为团员分红', '58');
INSERT INTO user_sharemoney VALUES ('53', '6', '56', '陈会员4', '40', '1534317014', '会员陈会员2入团时作为团员分红', '58');
INSERT INTO user_sharemoney VALUES ('54', '6', '59', '陈会员1', '40', '1534317014', '会员陈会员2入团时作为团员分红', '58');
INSERT INTO user_sharemoney VALUES ('55', '6', '57', '陈会员3', '0', '1534317180', '团员、稽查和审计入团，该次审核不进行分红,团队总收款+10000', '57');
INSERT INTO user_sharemoney VALUES ('56', '7', '84', '', '0', '1534319245', '团员、稽查和审计入团，该次审核不进行分红,团队总收款+10000', '84');
