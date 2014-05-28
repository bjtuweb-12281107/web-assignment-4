# Host: 127.0.0.1  (Version: 5.0.96-community-nt)
# Date: 2014-05-26 20:49:06
# Generator: MySQL-Front 5.3  (Build 4.13)

/*!40101 SET NAMES utf8 */;

#
# Source for table "role"
#

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL auto_increment,
  `admins` varchar(20) default NULL,
  `pass` varchar(20) default NULL,
  `sitename` varchar(50) default NULL,
  `check` int(4) default NULL,
  `votename` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "role"
#

INSERT INTO `role` VALUES (1,'admin','admin','你最喜欢哪门课',0,'votename\r\n您需要获得哪些方面的信息？');

#
# Source for table "vote"
#

DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL auto_increment,
  `lid` int(11) default NULL,
  `vname` varchar(50) default NULL,
  `vcount` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "vote"
#

INSERT INTO `vote` VALUES (1,1,'语文',3),(2,2,'数学',5),(3,3,'英语',4),(4,4,'体育',3),(5,5,'计算机',4);
