-- $Id: recreate-items-tables.sql,v 1.2 2007/08/06 19:43:38 swain Exp $

SET FOREIGN_KEY_CHECKS=0;

drop table if exists mpa_albumitems2;

CREATE TABLE `mpa_albumitems2` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `album_id` bigint(20) unsigned NOT NULL default '0',
  `file_name` varchar(256) default NULL,
  `type_id` tinyint(3) NOT NULL default '0',
  `full_size` int(11) NOT NULL default '0',
  `sized_size` int(11) NOT NULL default '0',
  `thumb_size` int(11) NOT NULL default '0',
  `highlight_size` int(11) NOT NULL default '0',
  `upload_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `upload_tool_id` tinyint(3) NOT NULL default '0',
  `from_ip` varchar(15) default '',
  `status` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `upload_date_idx` (`upload_date`),
  KEY `user_id` (`user_id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `mpa_albumitems2_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `mpa_albums2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


drop table if exists mpa_albums2;

CREATE TABLE `mpa_albums2` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL default '0',
  `name` varchar(256) default NULL,
  `title` varchar(256) default NULL,
  `description` varchar(512) default NULL,
  `summary` varchar(512) default NULL,
  `skin_name` varchar(256) default NULL,
  `last_updated` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `last_updated_idx` (`last_updated`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `mpa_albums2_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `mpa_albums2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS=1;
