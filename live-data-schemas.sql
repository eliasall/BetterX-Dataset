CREATE DATABASE  IF NOT EXISTS `betterX` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `betterX`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: <removed>    Database: betterX
-- ------------------------------------------------------
-- Server version	5.6.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_lab_webSessions`
--

DROP TABLE IF EXISTS `_lab_webSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_lab_webSessions` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tabid` bigint(20) DEFAULT NULL,
  `tbl_id` bigint(20) NOT NULL DEFAULT '0',
  `pageStartTime` bigint(20) DEFAULT NULL,
  `labTime` datetime DEFAULT NULL,
  `pageTitle` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pageOnContentLoad` int(11) DEFAULT NULL,
  `pageOnLoad` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `blocked` int(11) DEFAULT NULL,
  `dns` int(11) DEFAULT NULL,
  `connect` int(11) DEFAULT NULL,
  `send` int(11) DEFAULT NULL,
  `wait` int(11) DEFAULT NULL,
  `receive` int(11) DEFAULT NULL,
  `url` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headerSizeRequest` int(11) DEFAULT NULL,
  `bodySizeRequest` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headerSizeResponse` int(11) DEFAULT NULL,
  `bodySizeResponse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_metrics_app`
--

DROP TABLE IF EXISTS `_metrics_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_metrics_app` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `value` varchar(341) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `index1` (`uid`),
  KEY `index2` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_metrics_battery`
--

DROP TABLE IF EXISTS `_metrics_battery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_metrics_battery` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `temp` int(11) DEFAULT NULL,
  KEY `index1` (`uid`),
  KEY `index2` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_metrics_connection`
--

DROP TABLE IF EXISTS `_metrics_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_metrics_connection` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roaming` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssid` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connected` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connecting` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `index1` (`uid`),
  KEY `index2` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_metrics_connectionStrength`
--

DROP TABLE IF EXISTS `_metrics_connectionStrength`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_metrics_connectionStrength` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `strength` int(11) DEFAULT NULL,
  KEY `index1` (`uid`),
  KEY `index2` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_metrics_network`
--

DROP TABLE IF EXISTS `_metrics_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_metrics_network` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `hasInternet` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkSpeed` int(11) DEFAULT NULL,
  `mobileStatus` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signalStrength` int(11) DEFAULT NULL,
  `wifiStatus` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rssi` int(11) DEFAULT NULL,
  `ssid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mLinkDownBandwidthKbps` bigint(20) DEFAULT NULL,
  `mLinkUpBandwidthKbps` bigint(20) DEFAULT NULL,
  `mSignalStrength` int(11) DEFAULT NULL,
  `mMtu` int(11) DEFAULT NULL,
  KEY `index1` (`uid`),
  KEY `index2` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_metrics_phoneScreen`
--

DROP TABLE IF EXISTS `_metrics_phoneScreen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_metrics_phoneScreen` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `value` varchar(341) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `index1` (`uid`),
  KEY `index2` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_metrics_phoneState`
--

DROP TABLE IF EXISTS `_metrics_phoneState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_metrics_phoneState` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `value` varchar(341) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `index1` (`uid`),
  KEY `index2` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_metrics_phoneState2`
--

DROP TABLE IF EXISTS `_metrics_phoneState2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_metrics_phoneState2` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `value` varchar(341) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count_call_in` decimal(11,0) DEFAULT NULL,
  `count_call_out` decimal(11,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_user_geolocations`
--

DROP TABLE IF EXISTS `_user_geolocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_geolocations` (
  `Latitude` float(12,9) NOT NULL,
  `Longitude` float(12,9) NOT NULL,
  `Address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Latitude`,`Longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_user_locations`
--

DROP TABLE IF EXISTS `_user_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_locations` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestmp` timestamp NOT NULL,
  `unxTm` bigint(20) NOT NULL,
  `latitude` float(12,9) NOT NULL,
  `longitude` float(12,9) NOT NULL,
  `accuracy` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `index1` (`uid`),
  KEY `index2` (`timestmp`),
  KEY `index3` (`latitude`),
  KEY `index4` (`longitude`),
  KEY `index5` (`accuracy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_user_readings`
--

DROP TABLE IF EXISTS `_user_readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_readings` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestmp` timestamp NOT NULL,
  `feed` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `index1` (`uid`),
  KEY `index2` (`timestmp`),
  KEY `index3` (`feed`),
  KEY `index4` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_user_timeZones`
--

DROP TABLE IF EXISTS `_user_timeZones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_timeZones` (
  `tzone_raw` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tzone_abbr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_user_webPages`
--

DROP TABLE IF EXISTS `_user_webPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_webPages` (
  `Host_Name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Speed_MediaLoadingTime` int(11) DEFAULT NULL,
  `Speed_Percentile` int(11) DEFAULT NULL,
  `Category1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Category2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Category3` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Host_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_user_webRequests`
--

DROP TABLE IF EXISTS `_user_webRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_webRequests` (
  `id` bigint(20) NOT NULL,
  `web_entries_id` bigint(20) NOT NULL,
  `url` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_user_webSessions`
--

DROP TABLE IF EXISTS `_user_webSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_user_webSessions` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tabid` bigint(20) DEFAULT NULL,
  `tbl_id` bigint(20) NOT NULL DEFAULT '0',
  `pageStartTime` bigint(20) DEFAULT NULL,
  `userTimestamp` int(11) DEFAULT NULL,
  `userTime` datetime DEFAULT NULL,
  `pageTitle` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pageOnContentLoad` int(11) DEFAULT NULL,
  `pageOnLoad` int(11) DEFAULT NULL,
  `origin` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryStartTime` bigint(20) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `serverIPAddress` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked` int(11) DEFAULT NULL,
  `dns` int(11) DEFAULT NULL,
  `connect` int(11) DEFAULT NULL,
  `send` int(11) DEFAULT NULL,
  `wait` int(11) DEFAULT NULL,
  `receive` int(11) DEFAULT NULL,
  `ssl` int(11) DEFAULT NULL,
  `beforeRequestCacheEntries` int(11) DEFAULT NULL,
  `afterRequestCacheEntries` int(11) DEFAULT NULL,
  `hitCount` int(11) DEFAULT NULL,
  `method` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `httpVersionRequest` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cookieNumberRequest` int(11) DEFAULT NULL,
  `header_Host` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_UserAgent` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Accept` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_AcceptEncoding` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ConnectionRequest` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentLengthRequest` bigint(20) DEFAULT NULL,
  `header_KeepAliveRequest` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headerSize` int(11) DEFAULT NULL,
  `bodySizeRequest` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusText` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `httpVersionResponse` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cookieNumberResponse` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Server` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_XPoweredBy` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentEncoding` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentLengthResponse` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_KeepAliveResponse` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ConnectionResponse` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirectUrl` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headersSize` int(11) DEFAULT NULL,
  `bodySizeResponse` int(11) DEFAULT NULL,
  `content_size` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_compression` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_mimeType` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_encoding` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Host_Name` varchar(250) COLLATE utf8_unicode_ci,
  `Title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Speed_MediaLoadingTime` int(11) DEFAULT NULL,
  `Speed_Percentile` int(11) DEFAULT NULL,
  `Category1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Category2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Category3` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestmp` datetime DEFAULT NULL,
  `durationSession` bigint(20) DEFAULT NULL,
  `tabOpenTm` bigint(20) DEFAULT NULL,
  `tabCloseTm` bigint(20) DEFAULT NULL,
  `durationTab` bigint(20) DEFAULT NULL,
  `estimateDuration` bigint(20) DEFAULT NULL,
  `location_address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_accuracy` bigint(20) DEFAULT NULL,
  `location_unxTm` bigint(20) DEFAULT NULL,
  `location_type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_day_cnt` int(11) DEFAULT NULL,
  `app_latest_time` bigint(20) DEFAULT NULL,
  `app_latest_name` varchar(350) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_after_time` bigint(20) DEFAULT NULL,
  `app_after_name` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `battery_latest_time` bigint(20) DEFAULT NULL,
  `battery_latest_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `battery_latest_value` int(11) DEFAULT NULL,
  `battery_latest_temp` int(11) DEFAULT NULL,
  `battery_after_time` bigint(20) DEFAULT NULL,
  `battery_after_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `battery_after_value` int(11) DEFAULT NULL,
  `battery_after_temp` int(11) DEFAULT NULL,
  `connection_latest_time` bigint(20) DEFAULT NULL,
  `connection_latest_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_latest_roaming` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_latest_ssid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_latest_strength` int(11) DEFAULT NULL,
  `connection_latest_connected` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_latest_connecting` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_latest_available` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_after_time` bigint(20) DEFAULT NULL,
  `connection_after_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_after_roaming` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_after_ssid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_after_strength` int(11) DEFAULT NULL,
  `connection_after_connected` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_after_connecting` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection_after_available` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `network_latest_time` bigint(20) DEFAULT NULL,
  `network_latest_hasInternet` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `network_latest_linkSpeed` int(11) DEFAULT NULL,
  `network_latest_mobile` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `network_latest_signalStrength` int(11) DEFAULT NULL,
  `network_latest_wifi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `network_latest_rssi` int(11) DEFAULT NULL,
  `network_latest_ssid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `network_latest_mLinkDown` bigint(20) DEFAULT NULL,
  `network_latest_mLinkUp` bigint(20) DEFAULT NULL,
  `network_latest_mSignalStrength` int(11) DEFAULT NULL,
  `network_latest_mMtu` int(11) DEFAULT NULL,
  `network_after_time` bigint(20) DEFAULT NULL,
  `network_after_hasInternet` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `network_after_linkSpeed` int(11) DEFAULT NULL,
  `network_after_mobile` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `network_after_signalStrength` int(11) DEFAULT NULL,
  `network_after_wifi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `network_after_rssi` int(11) DEFAULT NULL,
  `network_after_ssid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `network_after_mLinkDown` bigint(20) DEFAULT NULL,
  `network_after_mLinkUp` bigint(20) DEFAULT NULL,
  `network_after_mSignalStrength` int(11) DEFAULT NULL,
  `network_after_mMtu` int(11) DEFAULT NULL,
  `phone_state_latest_time` bigint(20) DEFAULT NULL,
  `phone_state_latest_value` varchar(341) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_state_after_time` bigint(20) DEFAULT NULL,
  `phone_state_after_value` varchar(341) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_screen_latest_time` bigint(20) DEFAULT NULL,
  `phone_screen_latest_value` varchar(341) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_screen_after_time` bigint(20) DEFAULT NULL,
  `phone_screen_after_value` varchar(341) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dayname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `activity_page_start_per_uid`
--

DROP TABLE IF EXISTS `activity_page_start_per_uid`;
/*!50001 DROP VIEW IF EXISTS `activity_page_start_per_uid`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `activity_page_start_per_uid` AS SELECT 
 1 AS `uid`,
 1 AS `timestmp`,
 1 AS `feed`,
 1 AS `action`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `activity_tabs_per_uid`
--

DROP TABLE IF EXISTS `activity_tabs_per_uid`;
/*!50001 DROP VIEW IF EXISTS `activity_tabs_per_uid`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `activity_tabs_per_uid` AS SELECT 
 1 AS `uid`,
 1 AS `timestmp`,
 1 AS `feed`,
 1 AS `action`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `apps`
--

DROP TABLE IF EXISTS `apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `app` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`timestamp`),
  KEY `index4` (`app`)
) ENGINE=InnoDB AUTO_INCREMENT=90899 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `daily_data_counts_per_uid`
--

DROP TABLE IF EXISTS `daily_data_counts_per_uid`;
/*!50001 DROP VIEW IF EXISTS `daily_data_counts_per_uid`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `daily_data_counts_per_uid` AS SELECT 
 1 AS `uid`,
 1 AS `date`,
 1 AS `type`,
 1 AS `cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `features` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `manufacturer` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen_height` int(11) DEFAULT NULL,
  `screen_width` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`epoch`),
  KEY `index4` (`manufacturer`),
  KEY `index5` (`model`),
  KEY `index6` (`version`),
  KEY `index7` (`screen_height`),
  KEY `index8` (`screen_width`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_log`
--

DROP TABLE IF EXISTS `file_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_zip` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `file_uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_time` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `zip_file` int(11) NOT NULL,
  `zip_file_no` int(11) NOT NULL,
  `zip_file_total` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`file_zip`(255)),
  KEY `index3` (`file_name`(255)),
  KEY `index4` (`file_uid`),
  KEY `index5` (`file_time`),
  KEY `index6` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gcm_msgs`
--

DROP TABLE IF EXISTS `gcm_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcm_msgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver_id` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msg_id` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `msg_content` text COLLATE utf8_unicode_ci,
  `msg_tm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `json` text COLLATE utf8_unicode_ci,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index2` (`sender_id`(333)),
  KEY `index3` (`receiver_id`(333)),
  KEY `index4` (`msg_id`(333)),
  KEY `index6` (`msg_tm`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gcm_users`
--

DROP TABLE IF EXISTS `gcm_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gcm_users` (
  `gcm_regid` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `imei` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `meid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `simserial` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `androidid` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `removed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`gcm_regid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_web_entries`
--

DROP TABLE IF EXISTS `lab_web_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_web_entries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(20) NOT NULL,
  `entryStartTime` bigint(20) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `serverIPAddress` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked` int(11) DEFAULT NULL,
  `dns` int(11) DEFAULT NULL,
  `connect` int(11) DEFAULT NULL,
  `send` int(11) DEFAULT NULL,
  `wait` int(11) DEFAULT NULL,
  `receive` int(11) DEFAULT NULL,
  `ssl` int(11) DEFAULT NULL,
  `beforeRequestCacheEntries` int(11) DEFAULT NULL,
  `afterRequestCacheEntries` int(11) DEFAULT NULL,
  `hitCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`id`),
  KEY `index3` (`pageid`),
  KEY `index4` (`entryStartTime`),
  KEY `index5` (`time`),
  KEY `index6` (`serverIPAddress`),
  KEY `index7` (`connection`),
  KEY `index8` (`blocked`),
  KEY `index9` (`dns`),
  KEY `index10` (`connect`),
  KEY `index11` (`send`),
  KEY `index12` (`wait`),
  KEY `index13` (`receive`),
  KEY `index14` (`ssl`),
  KEY `index15` (`beforeRequestCacheEntries`),
  KEY `index16` (`afterRequestCacheEntries`),
  KEY `index17` (`hitCount`)
) ENGINE=InnoDB AUTO_INCREMENT=94313 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_web_entries_request`
--

DROP TABLE IF EXISTS `lab_web_entries_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_web_entries_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `web_entries_id` bigint(20) NOT NULL,
  `method` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `httpVersion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cookieNumber` int(11) DEFAULT NULL,
  `header_Host` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_UserAgent` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Accept` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_AcceptEncoding` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Connection` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentLength` bigint(20) DEFAULT NULL,
  `header_KeepAlive` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headerSize` int(11) DEFAULT NULL,
  `bodySize` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`id`),
  KEY `index3` (`method`),
  KEY `index4` (`url`(255)),
  KEY `index5` (`httpVersion`),
  KEY `index6` (`cookieNumber`),
  KEY `index7` (`header_Host`(255)),
  KEY `index8` (`header_UserAgent`),
  KEY `index9` (`header_Accept`),
  KEY `index10` (`header_AcceptEncoding`),
  KEY `index11` (`header_Connection`),
  KEY `index12` (`headerSize`),
  KEY `index13` (`bodySize`)
) ENGINE=InnoDB AUTO_INCREMENT=86659 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_web_entries_response`
--

DROP TABLE IF EXISTS `lab_web_entries_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_web_entries_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `web_entries_id` bigint(20) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `statusText` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `httpVersion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cookieNumber` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Server` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_XPoweredBy` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentEncoding` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentLength` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_KeepAlive` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Connection` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirectUrl` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headersSize` int(11) DEFAULT NULL,
  `bodySize` int(11) DEFAULT NULL,
  `content_size` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_compression` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_mimeType` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_encoding` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`id`),
  KEY `index3` (`status`),
  KEY `index4` (`statusText`),
  KEY `index5` (`httpVersion`),
  KEY `index6` (`cookieNumber`),
  KEY `index7` (`header_Date`),
  KEY `index8` (`header_Server`),
  KEY `index9` (`header_XPoweredBy`),
  KEY `index10` (`header_ContentEncoding`),
  KEY `index11` (`header_ContentLength`),
  KEY `index12` (`header_KeepAlive`),
  KEY `index13` (`header_Connection`),
  KEY `index14` (`header_ContentType`),
  KEY `index15` (`redirectUrl`(255)),
  KEY `index16` (`headersSize`),
  KEY `index17` (`bodySize`)
) ENGINE=InnoDB AUTO_INCREMENT=80710 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lab_web_pages`
--

DROP TABLE IF EXISTS `lab_web_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_web_pages` (
  `tbl_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tabid` bigint(20) DEFAULT NULL,
  `pageStartTime` bigint(20) DEFAULT NULL,
  `id` bigint(20) DEFAULT NULL,
  `pageTitle` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pageOnContentLoad` int(11) DEFAULT NULL,
  `pageOnLoad` int(11) DEFAULT NULL,
  `origin` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tbl_id`),
  KEY `index3` (`pageStartTime`),
  KEY `index5` (`id`),
  KEY `index6` (`pageTitle`(255)),
  KEY `index7` (`pageOnContentLoad`),
  KEY `index8` (`pageOnLoad`),
  KEY `index9` (`origin`),
  KEY `index10` (`tbl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3309 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mTurk`
--

DROP TABLE IF EXISTS `mTurk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mTurk` (
  `HITId` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `HITTypeId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Keywords` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Reward` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreationTime` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaxAssignments` bigint(20) DEFAULT NULL,
  `RequesterAnnotation` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AssignmentDurationInSeconds` bigint(20) DEFAULT NULL,
  `AutoApprovalDelayInSeconds` bigint(20) DEFAULT NULL,
  `Expiration` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NumberOfSimilarHITs` bigint(20) DEFAULT NULL,
  `LifetimeInSeconds` bigint(20) DEFAULT NULL,
  `AssignmentId` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `WorkerId` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `AssignmentStatus` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AcceptTime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SubmitTime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AutoApprovalTime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ApprovalTime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RejectionTime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RequesterFeedback` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WorkTimeInSeconds` bigint(20) DEFAULT NULL,
  `LifetimeApprovalRate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Last30DaysApprovalRate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Last7DaysApprovalRate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Answer.Q1DevicdeId` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Answer.Q2FirefoxAddonName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Answer.Q3FirefoxAddonName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Approve` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AssignmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mTurk_payments`
--

DROP TABLE IF EXISTS `mTurk_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mTurk_payments` (
  `AssignmentId` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `WorkerId` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Accepted` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `Reward` double NOT NULL,
  `Bonus` double NOT NULL,
  `Notes` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AssignmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network`
--

DROP TABLE IF EXISTS `network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `bssid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mac` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rssi` int(11) DEFAULT NULL,
  `ssid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detailedState` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extraInfo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `hasInternet` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkSpeed` int(11) DEFAULT NULL,
  `mobileStatus` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `netID` int(11) DEFAULT NULL,
  `signalStrength` int(11) DEFAULT NULL,
  `wiMaxStatus` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wifiStatus` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`epoch`),
  KEY `index4` (`bssid`),
  KEY `index5` (`ip`),
  KEY `index6` (`mac`),
  KEY `index7` (`rssi`),
  KEY `index8` (`ssid`),
  KEY `index9` (`detailedState`),
  KEY `index10` (`extraInfo`),
  KEY `index11` (`hasInternet`),
  KEY `index12` (`frequency`),
  KEY `index13` (`hasInternet`),
  KEY `index14` (`linkSpeed`),
  KEY `index15` (`mobileStatus`),
  KEY `index16` (`netID`),
  KEY `index17` (`signalStrength`),
  KEY `index18` (`wiMaxStatus`),
  KEY `index19` (`wifiStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=108608 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_availableNetwork`
--

DROP TABLE IF EXISTS `network_availableNetwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_availableNetwork` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `network_id` bigint(20) NOT NULL,
  `bssid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capabilities` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id6_idx` (`network_id`),
  KEY `index3` (`bssid`),
  KEY `index4` (`ssid`),
  KEY `index5` (`capabilities`)
) ENGINE=InnoDB AUTO_INCREMENT=965660 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_capabilities`
--

DROP TABLE IF EXISTS `network_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_capabilities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `network_id` bigint(20) NOT NULL,
  `mLinkDownBandwidthKbps` bigint(20) DEFAULT NULL,
  `mLinkUpBandwidthKbps` bigint(20) DEFAULT NULL,
  `mNetworkCapabilities` bigint(20) DEFAULT NULL,
  `mSignalStrength` int(11) DEFAULT NULL,
  `mTransportTypes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id7_idx` (`network_id`),
  KEY `index3` (`mLinkDownBandwidthKbps`),
  KEY `index4` (`mLinkUpBandwidthKbps`),
  KEY `index5` (`mNetworkCapabilities`),
  KEY `index6` (`mSignalStrength`),
  KEY `index7` (`mTransportTypes`)
) ENGINE=InnoDB AUTO_INCREMENT=12659 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_linkProperties`
--

DROP TABLE IF EXISTS `network_linkProperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_linkProperties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `network_id` bigint(20) NOT NULL,
  `mDnses` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mDomains` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mIfaceName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mMtu` int(11) DEFAULT NULL,
  `mTcpBufferSizes` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id8_idx` (`network_id`),
  KEY `index3` (`mDnses`),
  KEY `index4` (`mDomains`),
  KEY `index5` (`mIfaceName`),
  KEY `index6` (`mMtu`),
  KEY `index7` (`mTcpBufferSizes`(255))
) ENGINE=InnoDB AUTO_INCREMENT=12345 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_linkProperties_mLinkAddresses`
--

DROP TABLE IF EXISTS `network_linkProperties_mLinkAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_linkProperties_mLinkAddresses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `network_linkProperties_id` bigint(20) NOT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flags` int(11) DEFAULT NULL,
  `prefixLength` int(11) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id9_idx` (`network_linkProperties_id`),
  KEY `index3` (`address`),
  KEY `index4` (`flags`),
  KEY `index5` (`prefixLength`),
  KEY `index6` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=23920 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `network_linkProperties_mRoutes`
--

DROP TABLE IF EXISTS `network_linkProperties_mRoutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_linkProperties_mRoutes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `network_linkProperties_id` bigint(20) NOT NULL,
  `mGateway` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mHasGateway` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mInterface` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mIsHost` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mType` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`network_linkProperties_id`),
  KEY `index3` (`mGateway`),
  KEY `index4` (`mHasGateway`),
  KEY `index5` (`mInterface`),
  KEY `index6` (`mIsHost`),
  KEY `index7` (`mType`)
) ENGINE=InnoDB AUTO_INCREMENT=34035 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `pages_entries_per_uid`
--

DROP TABLE IF EXISTS `pages_entries_per_uid`;
/*!50001 DROP VIEW IF EXISTS `pages_entries_per_uid`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pages_entries_per_uid` AS SELECT 
 1 AS `uid`,
 1 AS `web_entries_id`,
 1 AS `tabid`,
 1 AS `timestmp`,
 1 AS `ContentLoad`,
 1 AS `PageLoad`,
 1 AS `time`,
 1 AS `serverIPAddress`,
 1 AS `connection`,
 1 AS `blocked`,
 1 AS `dns`,
 1 AS `connect`,
 1 AS `send`,
 1 AS `wait`,
 1 AS `receive`,
 1 AS `ssl`,
 1 AS `CacheBefore`,
 1 AS `CacheAfter`,
 1 AS `hits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `request_response_per_webEntry`
--

DROP TABLE IF EXISTS `request_response_per_webEntry`;
/*!50001 DROP VIEW IF EXISTS `request_response_per_webEntry`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `request_response_per_webEntry` AS SELECT 
 1 AS `web_entries_id`,
 1 AS `qmethod`,
 1 AS `qHTTP`,
 1 AS `qHeader`,
 1 AS `qBody`,
 1 AS `qCookie`,
 1 AS `qDomain`,
 1 AS `sStat`,
 1 AS `sHTTP`,
 1 AS `sHeader`,
 1 AS `sBody`,
 1 AS `sContent`,
 1 AS `sType`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sensor_WiFi`
--

DROP TABLE IF EXISTS `sensor_WiFi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_WiFi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `senseCycles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `index3` (`uid`),
  KEY `index4` (`epoch`),
  KEY `index5` (`senseCycles`)
) ENGINE=InnoDB AUTO_INCREMENT=10874 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensor_WiFi_scanResult`
--

DROP TABLE IF EXISTS `sensor_WiFi_scanResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_WiFi_scanResult` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sensor_WiFi_id` bigint(20) NOT NULL,
  `ssid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bssid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capabilities` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_idx` (`sensor_WiFi_id`),
  KEY `index4` (`ssid`),
  KEY `index5` (`bssid`),
  KEY `index6` (`capabilities`),
  KEY `index7` (`level`),
  KEY `index8` (`frequency`),
  CONSTRAINT `id` FOREIGN KEY (`sensor_WiFi_id`) REFERENCES `sensor_WiFi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=128589 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensor_battery`
--

DROP TABLE IF EXISTS `sensor_battery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_battery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `temp` int(11) DEFAULT NULL,
  `voltage` int(11) DEFAULT NULL,
  `plugged` int(11) DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `health` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`epoch`),
  KEY `index4` (`level`),
  KEY `index5` (`scale`),
  KEY `index6` (`temp`),
  KEY `index7` (`voltage`),
  KEY `index9` (`plugged`),
  KEY `index10` (`status`),
  KEY `index11` (`health`)
) ENGINE=InnoDB AUTO_INCREMENT=854272 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensor_connection`
--

DROP TABLE IF EXISTS `sensor_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_connection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `connected` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connecting` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `networkType` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roaming` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssid` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`epoch`),
  KEY `index4` (`connected`),
  KEY `index5` (`connecting`),
  KEY `index6` (`available`),
  KEY `index7` (`networkType`),
  KEY `index8` (`roaming`),
  KEY `index9` (`ssid`)
) ENGINE=InnoDB AUTO_INCREMENT=17009 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensor_connectionStrength`
--

DROP TABLE IF EXISTS `sensor_connectionStrength`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_connectionStrength` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `strength` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`epoch`),
  KEY `index4` (`strength`)
) ENGINE=InnoDB AUTO_INCREMENT=53312 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensor_location`
--

DROP TABLE IF EXISTS `sensor_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `configAccuracy` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`epoch`),
  KEY `index4` (`configAccuracy`)
) ENGINE=InnoDB AUTO_INCREMENT=10178 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensor_location_data`
--

DROP TABLE IF EXISTS `sensor_location_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_location_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sensor_location_id` bigint(20) NOT NULL,
  `latitude` float(12,9) DEFAULT NULL,
  `longitude` float(12,9) DEFAULT NULL,
  `accuracy` double DEFAULT NULL,
  `speed` double DEFAULT NULL,
  `bearing` double DEFAULT NULL,
  `provider` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `local_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id5_idx` (`sensor_location_id`),
  KEY `index3` (`latitude`),
  KEY `index4` (`longitude`),
  KEY `index5` (`accuracy`),
  KEY `index6` (`speed`),
  KEY `index7` (`bearing`),
  KEY `index8` (`provider`),
  KEY `index9` (`time`),
  KEY `index10` (`local_time`),
  CONSTRAINT `id5` FOREIGN KEY (`sensor_location_id`) REFERENCES `sensor_location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38861 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensor_passiveLocation`
--

DROP TABLE IF EXISTS `sensor_passiveLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_passiveLocation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `latitude` float(12,9) DEFAULT NULL,
  `longitude` float(12,9) DEFAULT NULL,
  `accuracy` double DEFAULT NULL,
  `speed` double DEFAULT NULL,
  `bearing` double DEFAULT NULL,
  `provider` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`epoch`),
  KEY `index4` (`latitude`),
  KEY `index5` (`longitude`),
  KEY `index6` (`accuracy`),
  KEY `index7` (`speed`),
  KEY `index8` (`bearing`),
  KEY `index9` (`provider`),
  KEY `index10` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=29511 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensor_phoneState`
--

DROP TABLE IF EXISTS `sensor_phoneState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_phoneState` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `eventType` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`epoch`),
  KEY `index4` (`eventType`),
  KEY `index5` (`data`(255))
) ENGINE=InnoDB AUTO_INCREMENT=445063 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensor_screen`
--

DROP TABLE IF EXISTS `sensor_screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_screen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`epoch`),
  KEY `index4` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=43814 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sensor_stepCounter`
--

DROP TABLE IF EXISTS `sensor_stepCounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_stepCounter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `stepCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`epoch`),
  KEY `index4` (`stepCount`)
) ENGINE=InnoDB AUTO_INCREMENT=36354 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setup`
--

DROP TABLE IF EXISTS `setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `gender` char(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` float(12,9) DEFAULT NULL,
  `longitude` float(12,9) DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phoneusefrequency` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `webusefrequency` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datatransmit_charging` bit(1) DEFAULT NULL,
  `datatransmit_wifi` bit(1) DEFAULT NULL,
  `datatransmit_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`timestamp`),
  KEY `index4` (`gender`),
  KEY `index5` (`age`),
  KEY `index6` (`education`),
  KEY `index7` (`timezone`),
  KEY `index8` (`latitude`),
  KEY `index9` (`longitude`),
  KEY `index10` (`city`),
  KEY `index11` (`country`),
  KEY `index12` (`phoneusefrequency`),
  KEY `index13` (`webusefrequency`),
  KEY `index14` (`datatransmit_charging`),
  KEY `index15` (`datatransmit_wifi`),
  KEY `index16` (`datatransmit_time`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `epoch` bigint(20) NOT NULL,
  `tickets` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`epoch`),
  KEY `index4` (`tickets`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_entries`
--

DROP TABLE IF EXISTS `web_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_entries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(20) NOT NULL,
  `entryStartTime` bigint(20) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `serverIPAddress` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connection` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked` int(11) DEFAULT NULL,
  `dns` int(11) DEFAULT NULL,
  `connect` int(11) DEFAULT NULL,
  `send` int(11) DEFAULT NULL,
  `wait` int(11) DEFAULT NULL,
  `receive` int(11) DEFAULT NULL,
  `ssl` int(11) DEFAULT NULL,
  `beforeRequestCacheEntries` int(11) DEFAULT NULL,
  `afterRequestCacheEntries` int(11) DEFAULT NULL,
  `hitCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`id`),
  KEY `index3` (`pageid`),
  KEY `index4` (`entryStartTime`),
  KEY `index5` (`time`),
  KEY `index6` (`serverIPAddress`),
  KEY `index7` (`connection`),
  KEY `index8` (`blocked`),
  KEY `index9` (`dns`),
  KEY `index10` (`connect`),
  KEY `index11` (`send`),
  KEY `index12` (`wait`),
  KEY `index13` (`receive`),
  KEY `index14` (`ssl`),
  KEY `index15` (`beforeRequestCacheEntries`),
  KEY `index16` (`afterRequestCacheEntries`),
  KEY `index17` (`hitCount`)
) ENGINE=InnoDB AUTO_INCREMENT=81220 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_entries_request`
--

DROP TABLE IF EXISTS `web_entries_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_entries_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `web_entries_id` bigint(20) NOT NULL,
  `method` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `httpVersion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cookieNumber` int(11) DEFAULT NULL,
  `header_Host` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_UserAgent` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Accept` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_AcceptEncoding` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Connection` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentLength` bigint(20) DEFAULT NULL,
  `header_KeepAlive` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headerSize` int(11) DEFAULT NULL,
  `bodySize` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`id`),
  KEY `index3` (`method`),
  KEY `index4` (`url`(255)),
  KEY `index5` (`httpVersion`),
  KEY `index6` (`cookieNumber`),
  KEY `index7` (`header_Host`(255)),
  KEY `index8` (`header_UserAgent`),
  KEY `index9` (`header_Accept`),
  KEY `index10` (`header_AcceptEncoding`),
  KEY `index11` (`header_Connection`),
  KEY `index12` (`headerSize`),
  KEY `index13` (`bodySize`)
) ENGINE=InnoDB AUTO_INCREMENT=73566 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_entries_response`
--

DROP TABLE IF EXISTS `web_entries_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_entries_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `web_entries_id` bigint(20) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `statusText` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `httpVersion` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cookieNumber` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Server` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_XPoweredBy` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentEncoding` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentLength` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_KeepAlive` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_Connection` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header_ContentType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirectUrl` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headersSize` int(11) DEFAULT NULL,
  `bodySize` int(11) DEFAULT NULL,
  `content_size` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_compression` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_mimeType` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_encoding` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`id`),
  KEY `index3` (`status`),
  KEY `index4` (`statusText`),
  KEY `index5` (`httpVersion`),
  KEY `index6` (`cookieNumber`),
  KEY `index7` (`header_Date`),
  KEY `index8` (`header_Server`),
  KEY `index9` (`header_XPoweredBy`),
  KEY `index10` (`header_ContentEncoding`),
  KEY `index11` (`header_ContentLength`),
  KEY `index12` (`header_KeepAlive`),
  KEY `index13` (`header_Connection`),
  KEY `index14` (`header_ContentType`),
  KEY `index15` (`redirectUrl`(255)),
  KEY `index16` (`headersSize`),
  KEY `index17` (`bodySize`)
) ENGINE=InnoDB AUTO_INCREMENT=67617 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_info`
--

DROP TABLE IF EXISTS `web_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `version` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`timestamp`),
  KEY `index3` (`version`),
  KEY `index4` (`browser`),
  KEY `index6` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_pages`
--

DROP TABLE IF EXISTS `web_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_pages` (
  `tbl_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tabid` bigint(20) DEFAULT NULL,
  `pageStartTime` bigint(20) DEFAULT NULL,
  `id` bigint(20) DEFAULT NULL,
  `pageTitle` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pageOnContentLoad` int(11) DEFAULT NULL,
  `pageOnLoad` int(11) DEFAULT NULL,
  `origin` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tbl_id`),
  KEY `index3` (`pageStartTime`),
  KEY `index5` (`id`),
  KEY `index6` (`pageTitle`(255)),
  KEY `index7` (`pageOnContentLoad`),
  KEY `index8` (`pageOnLoad`),
  KEY `index9` (`origin`),
  KEY `index10` (`tbl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2921 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_tabs`
--

DROP TABLE IF EXISTS `web_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_tabs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `tabid` int(11) NOT NULL,
  `tabstatus` char(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`uid`),
  KEY `index3` (`timestamp`),
  KEY `index4` (`tabid`),
  KEY `index5` (`tabstatus`),
  KEY `index6` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2810 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tabstatus can be: Open / Closed / Focused';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'betterX'
--

--
-- Dumping routines for database 'betterX'
--
/*!50003 DROP PROCEDURE IF EXISTS `append_duration_temp_webDuration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elias`@`%` PROCEDURE `append_duration_temp_webDuration`()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE tisUID varchar(255);
DECLARE tisDay int;
DECLARE cur1 CURSOR FOR 
SELECT uid,  dayofyear(timestmp) from _temp_webDuration group by uid,  dayofyear(timestmp) order by uid asc;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur1;
read_loop: LOOP
    FETCH cur1 INTO tisUID, tisDay;
    SET @this_uid = tisUID;
    SET @this_day = tisDay;
    IF done THEN
      LEAVE read_loop;
    END IF;
    
    CALL append_duration_temp_webDuration2(@this_uid, @this_day);

END LOOP;
CLOSE cur1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `append_duration_temp_webDuration2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elias`@`%` PROCEDURE `append_duration_temp_webDuration2`(tisUID varchar(255), tisDay int)
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE tisID int;
DECLARE tisFeed varchar(255);
DECLARE tisStamp timestamp;
DECLARE cur1 CURSOR FOR 
SELECT id,feed,timestmp from _temp_webDuration where uid = tisUID and dayofyear(timestmp) = tisDay order by timestmp asc;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

SET @counter = 0;
SET @previousTimestamp = null;
SET @previousID = null;

OPEN cur1;
read_loop: LOOP
    FETCH cur1 INTO tisID, tisFeed, tisStamp;
    SET @this_uid = tisUID;
    SET @this_day = tisDay;
    SET @this_id = tisID;
    SET @this_feed =  tisFeed;
	SET @this_stamp =  tisStamp;
    IF done THEN
      LEAVE read_loop;
    END IF;
    
    
    if @counter > 0 THEN
    
        #set @updateID = (select id from _temp_webDuration 
        #where id <> @this_id and timestmp < @this_stamp and uid = @this_uid and dayofyear(timestmp) = @this_day
        #order by timestmp desc limit 1);
        
        #set @updateTimestamp = (select timestmp from _temp_webDuration 
        #where id <> @this_id and timestmp < @this_stamp and uid = @this_uid and dayofyear(timestmp) = @this_day
        #order by timestmp desc limit 1);
        
		set @updateID = (select id from _temp_webDuration 
        where id < @this_id and uid = @this_uid and dayofyear(timestmp) = @this_day
        order by timestmp desc limit 1);
        
        set @updateTimestamp = (select timestmp from _temp_webDuration 
        where id < @this_id and uid = @this_uid and dayofyear(timestmp) = @this_day
        order by timestmp desc limit 1);
        
        update _temp_webDuration set duration = TIMESTAMPDIFF(SECOND,@updateTimestamp,@this_stamp) where id = @previousID;
    
    END IF;
    
    SET @counter = @counter + 1;
	SET @previousTimestamp  = @this_stamp;
    SET @previousID  = @this_id;

END LOOP;
CLOSE cur1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `append_location_user_webSessions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elias`@`%` PROCEDURE `append_location_user_webSessions`()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE tisUID varchar(255);
DECLARE tisID bigint;
DECLARE tisPageStartTime bigint;
DECLARE cur1 CURSOR FOR 
SELECT tbl_id, uid,  userTimestamp from _user_webSessions order by uid asc, userTimestamp asc; 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur1;
read_loop: LOOP
    FETCH cur1 INTO tisID, tisUID, tisPageStartTime;
    SET @this_uid = tisUID;
    SET @this_id = tisID;
	SET @this_start = tisPageStartTime;
    IF done THEN
      LEAVE read_loop;
    END IF;
    
    set @gotId = (SELECT id FROM betterX._temp where uid = @this_uid and userTimestamp <= @this_start order by userTimestamp desc limit 1);
    set @gotAddress = (SELECT address FROM betterX._temp where id = @gotId);
    set @gotAccuracy = (SELECT accuracy FROM betterX._temp where id = @gotId);
	set @gotunxTm = (SELECT userTimestamp FROM betterX._temp where id = @gotId);
    
    update _user_webSessions set location_address = @gotAddress, location_accuracy = @gotAccuracy,
    location_unxTm = @gotunxTm where tbl_id = @this_id;
    

END LOOP;
CLOSE cur1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `append_metrics_user_webSessions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elias`@`%` PROCEDURE `append_metrics_user_webSessions`()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE tisUID varchar(255);
DECLARE tisID bigint;
DECLARE tisPageStartTime bigint;
DECLARE cur1 CURSOR FOR 
SELECT tbl_id, uid,  userTimestamp from _user_webSessions order by uid asc, userTimestamp asc; 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur1;
read_loop: LOOP
    FETCH cur1 INTO tisID, tisUID, tisPageStartTime;
    SET @this_uid = tisUID;
    SET @this_id = tisID;
	SET @this_start = tisPageStartTime;
    IF done THEN
      LEAVE read_loop;
    END IF;
    
    ## latest
    set @app_latest_time = (SELECT `timestamp` FROM betterX._metrics_app where uid = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
    set @app_latest_name = (SELECT `value` FROM betterX._metrics_app where uid = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
    
	set @battery_latest_time = (select `timestamp` from betterX._metrics_battery where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @battery_latest_status = (select `status` from betterX._metrics_battery where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @battery_latest_value = (select `value` from betterX._metrics_battery where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @battery_latest_temp = (select `temp` from betterX._metrics_battery where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	
    set @connection_latest_time = (select `timestamp` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @connection_latest_type = (select `type` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @connection_latest_roaming = (select `roaming` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @connection_latest_ssid = (select `ssid` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @connection_latest_strength = (select `strength` from betterX._metrics_connectionStrength where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @connection_latest_connected = (select `connected` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @connection_latest_connecting = (select `connecting` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @connection_latest_available = (select `available` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	
    set @network_latest_time = (select `timestamp` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @network_latest_hasInternet = (select `hasInternet` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @network_latest_linkSpeed = (select `linkSpeed` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @network_latest_mobile = (select `mobileStatus` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @network_latest_signalStrength = (select `signalStrength` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @network_latest_wifi = (select `wifiStatus` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @network_latest_rssi = (select `rssi` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @network_latest_ssid = (select `ssid` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @network_latest_mLinkDown = (select `mLinkDownBandwidthKbps` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @network_latest_mLinkUp = (select `mLinkUpBandwidthKbps` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @network_latest_mSignalStrength = (select `mSignalStrength` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @network_latest_mMtu = (select `mMtu` from betterX._metrics_network where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	
    set @phone_state_latest_time = (select `timestamp` from betterX._metrics_phoneState where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @phone_state_latest_value = (select `value` from betterX._metrics_phoneState where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	
    set @phone_screen_latest_time = (select `timestamp` from betterX._metrics_phoneScreen where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);
	set @phone_screen_latest_value = (select `value` from betterX._metrics_phoneScreen where `uid` = @this_uid and `timestamp` <= @this_start order by `timestamp` desc limit 1);

    ## after
	set @app_after_time = (SELECT `timestamp` FROM betterX._metrics_app where uid = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
    set @app_after_name = (SELECT `value` FROM betterX._metrics_app where uid = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
    
	set @battery_after_time = (select `timestamp` from betterX._metrics_battery where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @battery_after_status = (select `status` from betterX._metrics_battery where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @battery_after_value = (select `value` from betterX._metrics_battery where `uid` = @this_uid and `timestamp` >@this_start order by `timestamp` asc limit 1);
	set @battery_after_temp = (select `temp` from betterX._metrics_battery where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	
    set @connection_after_time = (select `timestamp` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @connection_after_type = (select `type` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @connection_after_roaming = (select `roaming` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @connection_after_ssid = (select `ssid` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @connection_after_strength = (select `strength` from betterX._metrics_connectionStrength where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @connection_after_connected = (select `connected` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @connection_after_connecting = (select `connecting` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @connection_after_available = (select `available` from betterX._metrics_connection where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	
    set @network_after_time = (select `timestamp` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @network_after_hasInternet = (select `hasInternet` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @network_after_linkSpeed = (select `linkSpeed` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @network_after_mobile = (select `mobileStatus` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @network_after_signalStrength = (select `signalStrength` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @network_after_wifi = (select `wifiStatus` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @network_after_rssi = (select `rssi` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @network_after_ssid = (select `ssid` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @network_after_mLinkDown = (select `mLinkDownBandwidthKbps` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @network_after_mLinkUp = (select `mLinkUpBandwidthKbps` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @network_after_mSignalStrength = (select `mSignalStrength` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @network_after_mMtu = (select `mMtu` from betterX._metrics_network where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	
    set @phone_state_after_time = (select `timestamp` from betterX._metrics_phoneState where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @phone_state_after_value = (select `value` from betterX._metrics_phoneState where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	
    set @phone_screen_after_time = (select `timestamp` from betterX._metrics_phoneScreen where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);
	set @phone_screen_after_value = (select `value` from betterX._metrics_phoneScreen where `uid` = @this_uid and `timestamp` > @this_start order by `timestamp` asc limit 1);

	#other
	set @app_day_cnt = (	SELECT count(*) as cnt
							FROM betterX._metrics_app
							where uid = @this_uid 
							and dayofyear(from_unixtime(betterX._metrics_app.`timestamp`)) = dayofyear(from_unixtime(@this_start))
						);
	
    set @day_name =  (select DAYNAME(from_unixtime(@this_start)));
    
    
    ## update statement
    update _user_webSessions as a
    set 
    a.`dayname` = @day_name,
    a.`app_day_cnt` =  @app_day_cnt,
	a.`app_latest_time` =  @app_latest_time,
	a.`app_latest_name` =  @app_latest_name,
	a.`app_after_time` =  @app_after_time,
	a.`app_after_name` =  @app_after_name,
	a.`battery_latest_time` =  @battery_latest_time,
	a.`battery_latest_status` =  @battery_latest_status,
	a.`battery_latest_value` =  @battery_latest_value,
	a.`battery_latest_temp` =  @battery_latest_temp,
	a.`battery_after_time` =  @battery_after_time,
	a.`battery_after_status` =  @battery_after_status,
	a.`battery_after_value` =  @battery_after_value,
	a.`battery_after_temp` =  @battery_after_temp,
	a.`connection_latest_time` =  @connection_latest_time,
	a.`connection_latest_type` =  @connection_latest_type,
	a.`connection_latest_roaming` =  @connection_latest_roaming,
	a.`connection_latest_ssid` =  @connection_latest_ssid,
	a.`connection_latest_strength` =  @connection_latest_strength,
	a.`connection_latest_connected` =  @connection_latest_connected,
	a.`connection_latest_connecting` =  @connection_latest_connecting,
	a.`connection_latest_available` =  @connection_latest_available,
	a.`connection_after_time` =  @connection_after_time,
	a.`connection_after_type` =  @connection_after_type,
	a.`connection_after_roaming` =  @connection_after_roaming,
	a.`connection_after_ssid` =  @connection_after_ssid,
	a.`connection_after_strength` =  @connection_after_strength,
	a.`connection_after_connected` =  @connection_after_connected,
	a.`connection_after_connecting` =  @connection_after_connecting,
	a.`connection_after_available` =  @connection_after_available,
	a.`network_latest_time` =  @network_latest_time,
	a.`network_latest_hasInternet` =  @network_latest_hasInternet,
	a.`network_latest_linkSpeed` =  @network_latest_linkSpeed,
	a.`network_latest_mobile` =  @network_latest_mobile,
	a.`network_latest_signalStrength` =  @network_latest_signalStrength,
	a.`network_latest_wifi` =  @network_latest_wifi,
	a.`network_latest_rssi` =  @network_latest_rssi,
	a.`network_latest_ssid` =  @network_latest_ssid,
	a.`network_latest_mLinkDown` =  @network_latest_mLinkDown,
	a.`network_latest_mLinkUp` =  @network_latest_mLinkUp,
	a.`network_latest_mSignalStrength` =  @network_latest_mSignalStrength,
	a.`network_latest_mMtu` =  @network_latest_mMtu,
	a.`network_after_time` =  @network_after_time,
	a.`network_after_hasInternet` =  @network_after_hasInternet,
	a.`network_after_linkSpeed` =  @network_after_linkSpeed,
	a.`network_after_mobile` =  @network_after_mobile,
	a.`network_after_signalStrength` =  @network_after_signalStrength,
	a.`network_after_wifi` =  @network_after_wifi,
	a.`network_after_rssi` =  @network_after_rssi,
	a.`network_after_ssid` =  @network_after_ssid,
	a.`network_after_mLinkDown` =  @network_after_mLinkDown,
	a.`network_after_mLinkUp` =  @network_after_mLinkUp,
	a.`network_after_mSignalStrength` =  @network_after_mSignalStrength,
	a.`network_after_mMtu` =  @network_after_mMtu,
	a.`phone_state_latest_time` =  @phone_state_latest_time,
	a.`phone_state_latest_value` =  @phone_state_latest_value,
	a.`phone_state_after_time` =  @phone_state_after_time,
	a.`phone_state_after_value` =  @phone_state_after_value,
	a.`phone_screen_latest_time` =  @phone_screen_latest_time,
	a.`phone_screen_latest_value` =  @phone_screen_latest_value,
	a.`phone_screen_after_time` =  @phone_screen_after_time,
	a.`phone_screen_after_value` =  @phone_screen_after_value
    where a.`tbl_id` = @this_id;

END LOOP;
CLOSE cur1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `append_tabClose_temp_webDuration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elias`@`%` PROCEDURE `append_tabClose_temp_webDuration`()
BEGIN

DECLARE done INT DEFAULT FALSE;
DECLARE tisUID varchar(255);
DECLARE tisID bigint;
DECLARE tisTabID bigint;
DECLARE tisUnixStamp bigint;
DECLARE tisOpenUnixStamp bigint;
DECLARE cur1 CURSOR FOR 
SELECT tbl_id, uid, tabid, unix_stamp, tabOpenUnix from _temp_webDuration order by uid asc, unix_stamp asc;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur1;
read_loop: LOOP
    FETCH cur1 INTO tisID, tisUID, tisTabID , tisUnixStamp, tisOpenUnixStamp;
    SET @this_id = tisID;
    SET @this_uid = tisUID;
    SET @this_tabid = tisTabID;
    SET @this_unixStamp = tisUnixStamp;
    SET @this_OpenunixStamp = tisOpenUnixStamp;
    IF done THEN
      LEAVE read_loop;
    END IF;
    
    CALL append_tabClose_temp_webDuration2(@this_id,@this_uid, @this_tabid,@this_unixStamp,@this_OpenunixStamp);

END LOOP;
CLOSE cur1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `append_tabClose_temp_webDuration2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elias`@`%` PROCEDURE `append_tabClose_temp_webDuration2`(tisID bigint, tisUID varchar(255), tisTabID bigint, tisUnixStamp bigint, tisOpenUnixStamp bigint)
BEGIN

IF tisOpenUnixStamp is not null THEN
    
    set @CloseUnixStamp = (select distinct(a.userTimestamp)
from 
	(
		SELECT betterX.web_tabs.id, betterX.web_tabs.uid, betterX.web_tabs.tabid, betterX.web_tabs.tabstatus, UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime(cast(cast(betterX.web_tabs.`timestamp` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `userTimestamp`
		FROM betterX.web_tabs
		left join setup on setup.uid =  web_tabs.uid 
		left join _user_timeZones on _user_timeZones.tzone_raw = setup.timezone
    ) as a
left join setup on setup.uid =  a.uid 
left join _user_timeZones on _user_timeZones.tzone_raw = setup.timezone
where a.uid = tisUID and a.tabid = tisTabID and a.tabstatus = 'Closed'
and a.`userTimestamp` > tisUnixStamp and a.`userTimestamp` > tisOpenUnixStamp
order by a.`userTimestamp` asc
limit 1);

ELSE
    
	set @CloseUnixStamp = (select distinct(a.userTimestamp)
from 
	(
		SELECT betterX.web_tabs.id, betterX.web_tabs.uid, betterX.web_tabs.tabid, betterX.web_tabs.tabstatus, UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime(cast(cast(betterX.web_tabs.`timestamp` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `userTimestamp`
		FROM betterX.web_tabs
		left join setup on setup.uid =  web_tabs.uid 
		left join _user_timeZones on _user_timeZones.tzone_raw = setup.timezone
    ) as a
left join setup on setup.uid =  a.uid 
left join _user_timeZones on _user_timeZones.tzone_raw = setup.timezone
where a.uid = tisUID and a.tabid = tisTabID and a.tabstatus = 'Closed'
and a.`userTimestamp` > tisUnixStamp
order by a.`userTimestamp` asc
limit 1);

END IF;


update _temp_webDuration set tabCloseUnix = @CloseUnixStamp  where tbl_id = tisID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `append_tabOpen_temp_webDuration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elias`@`%` PROCEDURE `append_tabOpen_temp_webDuration`()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE tisUID varchar(255);
DECLARE tisID bigint;
DECLARE tisTabID bigint;
DECLARE tisUnixStamp bigint;
DECLARE cur1 CURSOR FOR 
SELECT tbl_id, uid, tabid, unix_stamp from _temp_webDuration order by uid asc, unix_stamp asc;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur1;
read_loop: LOOP
    FETCH cur1 INTO tisID, tisUID, tisTabID , tisUnixStamp;
    SET @this_id = tisID;
    SET @this_uid = tisUID;
    SET @this_tabid = tisTabID;
    SET @this_unixStamp = tisUnixStamp;
    IF done THEN
      LEAVE read_loop;
    END IF;
    
    CALL append_tabOpen_temp_webDuration2(@this_id,@this_uid, @this_tabid,@this_unixStamp);

END LOOP;
CLOSE cur1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `append_tabOpen_temp_webDuration2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`elias`@`%` PROCEDURE `append_tabOpen_temp_webDuration2`(tisID bigint, tisUID varchar(255), tisTabID bigint, tisUnixStamp bigint )
BEGIN

set @OpenUnixStamp = (select distinct(a.userTimestamp)
from 
	(
		SELECT betterX.web_tabs.id, betterX.web_tabs.uid, betterX.web_tabs.tabid, betterX.web_tabs.tabstatus, UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime(cast(cast(betterX.web_tabs.`timestamp` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `userTimestamp`
		FROM betterX.web_tabs
		left join setup on setup.uid =  web_tabs.uid 
		left join _user_timeZones on _user_timeZones.tzone_raw = setup.timezone
    ) as a
left join setup on setup.uid =  a.uid 
left join _user_timeZones on _user_timeZones.tzone_raw = setup.timezone
where a.uid = tisUID and a.tabid = tisTabID and a.tabstatus = 'Open'
and a.`userTimestamp` < tisUnixStamp
order by a.`userTimestamp` asc
limit 1);

#update _temp_webDuration set tabOpen = @OpenTimeStamp, tabOpenUnix = @OpenUnixStamp where tbl_id = tisID;
update _temp_webDuration set tabOpenUnix = @OpenUnixStamp where tbl_id = tisID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `activity_page_start_per_uid`
--

/*!50001 DROP VIEW IF EXISTS `activity_page_start_per_uid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elias`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `activity_page_start_per_uid` AS select `web_pages`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`web_pages`.`pageStartTime` as char(10) charset utf8) as unsigned)) as datetime) AS `timestmp`,('Web Session Start' collate utf8_unicode_ci) AS `feed`,concat('Web Session Start',' (tabid=',cast(`web_pages`.`tabid` as char(12) charset utf8),' ContentLoad=',cast(`web_pages`.`pageOnContentLoad` as char(10) charset utf8),' Load=',cast(`web_pages`.`pageOnLoad` as char(10) charset utf8),')') AS `action` from `web_pages` order by cast(from_unixtime(cast(cast(`web_pages`.`pageStartTime` as char(10) charset utf8) as unsigned)) as datetime),concat('Web Session Start',' (tabid=',cast(`web_pages`.`tabid` as char(12) charset utf8),' ContentLoad=',cast(`web_pages`.`pageOnContentLoad` as char(10) charset utf8),' Load=',cast(`web_pages`.`pageOnLoad` as char(10) charset utf8),')') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `activity_tabs_per_uid`
--

/*!50001 DROP VIEW IF EXISTS `activity_tabs_per_uid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elias`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `activity_tabs_per_uid` AS select `web_tabs`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`web_tabs`.`timestamp` as char(10) charset utf8) as unsigned)) as datetime) AS `timestmp`,('Browser Tab' collate utf8_unicode_ci) AS `feed`,concat('Browser Tab ',`web_tabs`.`tabstatus`,' (',cast(`web_tabs`.`tabid` as char(12) charset utf8),')') AS `action` from `web_tabs` order by cast(from_unixtime(cast(cast(`web_tabs`.`timestamp` as char(10) charset utf8) as unsigned)) as datetime),`web_tabs`.`tabstatus` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `daily_data_counts_per_uid`
--

/*!50001 DROP VIEW IF EXISTS `daily_data_counts_per_uid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elias`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `daily_data_counts_per_uid` AS select `apps`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`apps`.`timestamp` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_app_count' AS `type`,count(0) AS `cnt` from `apps` group by `apps`.`uid`,cast(from_unixtime(cast(cast(`apps`.`timestamp` as char(10) charset utf8) as unsigned)) as date) union select `network`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`network`.`epoch` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_net_count' AS `type`,count(0) AS `cnt` from `network` group by `network`.`uid`,cast(from_unixtime(cast(cast(`network`.`epoch` as char(10) charset utf8) as unsigned)) as date) union select `sensor_battery`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`sensor_battery`.`epoch` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_battery_count' AS `type`,count(0) AS `cnt` from `sensor_battery` group by `sensor_battery`.`uid`,cast(from_unixtime(cast(cast(`sensor_battery`.`epoch` as char(10) charset utf8) as unsigned)) as date) union select `sensor_connection`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`sensor_connection`.`epoch` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_connection_count' AS `type`,count(0) AS `cnt` from `sensor_connection` group by `sensor_connection`.`uid`,cast(from_unixtime(cast(cast(`sensor_connection`.`epoch` as char(10) charset utf8) as unsigned)) as date) union select `sensor_location`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`sensor_location`.`epoch` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_location_count' AS `type`,count(0) AS `cnt` from `sensor_location` group by `sensor_location`.`uid`,cast(from_unixtime(cast(cast(`sensor_location`.`epoch` as char(10) charset utf8) as unsigned)) as date) union select `sensor_passiveLocation`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`sensor_passiveLocation`.`epoch` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_passivelocation_count' AS `type`,count(0) AS `cnt` from `sensor_passiveLocation` group by `sensor_passiveLocation`.`uid`,cast(from_unixtime(cast(cast(`sensor_passiveLocation`.`epoch` as char(10) charset utf8) as unsigned)) as date) union select `sensor_phoneState`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`sensor_phoneState`.`epoch` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_phoneState_count' AS `type`,count(0) AS `cnt` from `sensor_phoneState` group by `sensor_phoneState`.`uid`,cast(from_unixtime(cast(cast(`sensor_phoneState`.`epoch` as char(10) charset utf8) as unsigned)) as date) union select `sensor_screen`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`sensor_screen`.`epoch` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_screen_count' AS `type`,count(0) AS `cnt` from `sensor_screen` group by `sensor_screen`.`uid`,cast(from_unixtime(cast(cast(`sensor_screen`.`epoch` as char(10) charset utf8) as unsigned)) as date) union select `sensor_stepCounter`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`sensor_stepCounter`.`epoch` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_step_count' AS `type`,count(0) AS `cnt` from `sensor_stepCounter` group by `sensor_stepCounter`.`uid`,cast(from_unixtime(cast(cast(`sensor_stepCounter`.`epoch` as char(10) charset utf8) as unsigned)) as date) union select `sensor_WiFi`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`sensor_WiFi`.`epoch` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_wifi_count' AS `type`,count(0) AS `cnt` from `sensor_WiFi` group by `sensor_WiFi`.`uid`,cast(from_unixtime(cast(cast(`sensor_WiFi`.`epoch` as char(10) charset utf8) as unsigned)) as date) union select `web_tabs`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`web_tabs`.`timestamp` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_tab_count' AS `type`,count(0) AS `cnt` from `web_tabs` group by `web_tabs`.`uid`,cast(from_unixtime(cast(cast(`web_tabs`.`timestamp` as char(10) charset utf8) as unsigned)) as date) union select `web_pages`.`uid` AS `uid`,cast(from_unixtime(cast(cast(`web_pages`.`pageStartTime` as char(10) charset utf8) as unsigned)) as date) AS `date`,'daily_page_count' AS `type`,count(0) AS `cnt` from `web_pages` group by `web_pages`.`uid`,cast(from_unixtime(cast(cast(`web_pages`.`pageStartTime` as char(10) charset utf8) as unsigned)) as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pages_entries_per_uid`
--

/*!50001 DROP VIEW IF EXISTS `pages_entries_per_uid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elias`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `pages_entries_per_uid` AS select `a`.`uid` AS `uid`,`b`.`id` AS `web_entries_id`,`a`.`tabid` AS `tabid`,cast(from_unixtime(cast(cast(`a`.`pageStartTime` as char(10) charset utf8) as unsigned)) as datetime) AS `timestmp`,`a`.`pageOnContentLoad` AS `ContentLoad`,`a`.`pageOnLoad` AS `PageLoad`,`b`.`time` AS `time`,`b`.`serverIPAddress` AS `serverIPAddress`,`b`.`connection` AS `connection`,`b`.`blocked` AS `blocked`,`b`.`dns` AS `dns`,`b`.`connect` AS `connect`,`b`.`send` AS `send`,`b`.`wait` AS `wait`,`b`.`receive` AS `receive`,`b`.`ssl` AS `ssl`,`b`.`beforeRequestCacheEntries` AS `CacheBefore`,`b`.`afterRequestCacheEntries` AS `CacheAfter`,`b`.`hitCount` AS `hits` from (`web_pages` `a` join `web_entries` `b` on(((`b`.`pageid` = `a`.`id`) and (`b`.`entryStartTime` = `a`.`pageStartTime`)))) order by `a`.`uid`,cast(from_unixtime(cast(cast(`a`.`pageStartTime` as char(10) charset utf8) as unsigned)) as datetime) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `request_response_per_webEntry`
--

/*!50001 DROP VIEW IF EXISTS `request_response_per_webEntry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`elias`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `request_response_per_webEntry` AS select `a`.`web_entries_id` AS `web_entries_id`,`a`.`method` AS `qmethod`,`a`.`httpVersion` AS `qHTTP`,`a`.`headerSize` AS `qHeader`,`a`.`bodySize` AS `qBody`,`a`.`cookieNumber` AS `qCookie`,left(right(`a`.`url`,((length(`a`.`url`) - locate('://',`a`.`url`)) - 2)),(locate('/',right(`a`.`url`,((length(`a`.`url`) - locate('://',`a`.`url`)) - 2))) - 1)) AS `qDomain`,`b`.`statusText` AS `sStat`,`b`.`httpVersion` AS `sHTTP`,`b`.`headersSize` AS `sHeader`,`b`.`bodySize` AS `sBody`,`b`.`content_size` AS `sContent`,`b`.`content_mimeType` AS `sType` from (`web_entries_request` `a` join `web_entries_response` `b` on((`a`.`web_entries_id` = `b`.`web_entries_id`))) order by `a`.`web_entries_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-06 13:00:38
