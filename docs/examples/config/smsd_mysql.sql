-- phpMyAdmin SQL Dump
-- version 2.6.0-beta2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Sep 08, 2004 at 12:08 AM
-- Server version: 4.0.18
-- PHP Version: 4.3.8
-- 
-- Database: `sms`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `gammu`
-- 

CREATE TABLE `gammu` (
  `Version` tinyint(4) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `gammu`
-- 

INSERT INTO `gammu` VALUES (3);

-- --------------------------------------------------------

-- 
-- Table structure for table `inbox`
-- 

CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp(14) NOT NULL,
  `ReceivingDateTime` timestamp(14) NOT NULL default '00000000000000',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL default '',
  `Coding` enum('Default','Unicode','8bit') NOT NULL default 'Default',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL default '',
  `Class` int(11) NOT NULL default '-1',
  `TextDecoded` varchar(160) NOT NULL default '',
  `ID` int(11) unsigned NOT NULL auto_increment,
  `RecipientID` text NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) TYPE=MyISAM AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `outbox`
-- 

CREATE TABLE `outbox` (
  `UpdatedInDB` timestamp(14) NOT NULL,
  `InsertIntoDB` timestamp(14) NOT NULL default '00000000000000',
  `SendingDateTime` timestamp(14) NOT NULL default '00000000000000',
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL default '',
  `Coding` enum('Default','Unicode','8bit') NOT NULL default 'Default',
  `UDH` text NOT NULL,
  `Class` int(11) NOT NULL default '-1',
  `TextDecoded` varchar(160) NOT NULL default '',
  `ID` int(11) unsigned NOT NULL auto_increment,
  `MultiPart` enum('false','true') NOT NULL default 'false',
  `RelativeValidity` int(11) NOT NULL default '-1',
  `SenderID` text NOT NULL,
  `SendingTimeOut` timestamp(14) NOT NULL default '00000000000000',
  `DeliveryReport` enum('default','yes','no') NOT NULL default 'default',
  UNIQUE KEY `ID` (`ID`)
) TYPE=MyISAM AUTO_INCREMENT=58 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `outbox_multipart`
-- 

CREATE TABLE `outbox_multipart` (
  `Text` text NOT NULL,
  `Coding` enum('Default','Unicode','8bit') NOT NULL default 'Default',
  `UDH` text NOT NULL,
  `Class` int(11) NOT NULL default '-1',
  `TextDecoded` varchar(160) NOT NULL default '',
  `ID` int(11) unsigned NOT NULL default '0',
  `SequencePosition` int(11) NOT NULL default '1'
) TYPE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `phones`
-- 

CREATE TABLE `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp(14) NOT NULL,
  `InsertIntoDB` timestamp(14) NOT NULL default '00000000000000',
  `TimeOut` timestamp(14) NOT NULL default '00000000000000',
  `Send` enum('yes','no') NOT NULL default 'no',
  `Receive` enum('yes','no') NOT NULL default 'no',
  `IMEI` text NOT NULL
) TYPE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `sentitems`
-- 

CREATE TABLE `sentitems` (
  `UpdatedInDB` timestamp(14) NOT NULL,
  `InsertIntoDB` timestamp(14) NOT NULL default '00000000000000',
  `SendingDateTime` timestamp(14) NOT NULL default '00000000000000',
  `DeliveryDateTime` timestamp(14) NOT NULL default '00000000000000',
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL default '',
  `Coding` enum('Default','Unicode','8bit') NOT NULL default 'Default',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL default '',
  `Class` int(11) NOT NULL default '-1',
  `TextDecoded` varchar(160) NOT NULL default '',
  `ID` int(11) unsigned NOT NULL default '0',
  `SenderID` text NOT NULL,
  `SequencePosition` int(11) NOT NULL default '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL default 'SendingOK',
  `StatusError` int(11) NOT NULL default '-1',
  `TPMR` int(11) NOT NULL default '-1',
  `RelativeValidity` int(11) NOT NULL default '-1'
) TYPE=MyISAM;
