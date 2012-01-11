-- Chtunnel VPN Database
-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.chtunnel.com/
-- 
-- Host: localhost
-- Generation Time: Jan 09, 2012 at 07:32 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `chtunnel_vpn`
-- 
CREATE DATABASE `chtunnel_vpn` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `chtunnel_vpn`;

-- --------------------------------------------------------

-- 
-- Table structure for table `log`
-- 

CREATE TABLE `log` (
  `user_id` varchar(64) collate utf8_unicode_ci NOT NULL,
  `log_trusted_ip` varchar(32) collate utf8_unicode_ci default NULL,
  `log_trusted_port` varchar(10) collate utf8_unicode_ci default NULL,
  `log_start_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `log_end_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `log_remote_ip` varchar(32) collate utf8_unicode_ci default NULL,
  `log_protocol` varchar(16) collate utf8_unicode_ci default NULL,
  `log_received_bytes` bigint(32) default '0',
  `log_sent_bytes` bigint(32) default '0',
  KEY `user_id` (`user_id`),
  KEY `log_trusted_ip` (`log_trusted_ip`),
  KEY `log_end_time` (`log_end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `user`
-- 

CREATE TABLE `user` (
  `user_id` varchar(64) collate utf8_unicode_ci NOT NULL,
  `user_password` varchar(128) collate utf8_unicode_ci default NULL,
  `user_fname` varchar(32) collate utf8_unicode_ci default NULL,
  `user_lname` varchar(32) collate utf8_unicode_ci default NULL,
  `user_mail` varchar(128) collate utf8_unicode_ci default NULL,
  `user_phone` varchar(16) collate utf8_unicode_ci default NULL,
  `user_creation` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_id`),
  KEY `user_password` (`user_password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `user`
-- 

INSERT INTO `user` VALUES ('admin', 'admin', 'administrator', 'chtunnel.com', 'support@chtunnel.com', '0815447514', '2012-01-01 08:00:00');
INSERT INTO `user` VALUES ('chai', 'chai', 'chatchai', 'tosopon', 'mr.chai_@hotmail.com', '0828677210', '2012-01-01 08:00:00');
INSERT INTO `user` VALUES ('tea', 'tea', 'surapon', 'pokpon', 'tea_noy@hotmail.com', '0877794162', '2012-01-01 08:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table `user_detail`
-- 

CREATE TABLE `user_detail` (
  `user_id` varchar(64) collate utf8_unicode_ci NOT NULL,
  `user_admin` tinyint(3) unsigned NOT NULL default '0',
  `user_status` tinyint(3) unsigned NOT NULL default '0',
  `user_enable` tinyint(3) unsigned NOT NULL default '0',
  `user_start_date` date NOT NULL default '0000-00-00',
  `user_end_date` date NOT NULL default '0000-00-00',
  `user_ip_last` varchar(64) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `user_detail`
-- 

INSERT INTO `user_detail` VALUES ('admin', 1, 0, 1, '2012-01-01', '0000-00-00', NULL);
INSERT INTO `user_detail` VALUES ('chai', 0, 0, 1, '2012-01-01', '0000-00-00', NULL);
INSERT INTO `user_detail` VALUES ('tea', 0, 0, 1, '2012-01-01', '0000-00-00', NULL);
