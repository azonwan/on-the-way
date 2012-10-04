CREATE TABLE IF NOT EXISTS `c_album_comment` (
  `c_album_comment_id` int(11) NOT NULL auto_increment,
  `c_album_id` int(11) NOT NULL default '0',
  `c_member_id` int(11) NOT NULL default '0',
  `body` text NOT NULL,
  `r_datetime` datetime NOT NULL default '0000-00-00 00:00:00',
  `image_filename_1` text NOT NULL,
  `image_filename_2` text NOT NULL,
  `image_filename_3` text NOT NULL,
  PRIMARY KEY  (`c_album_comment_id`),
  KEY `c_member_id` (`c_member_id`),
  KEY `c_album_id` (`c_album_id`),
  KEY `r_datetime_c_album_id_c_member_id` (`r_datetime`,`c_album_id`,`c_member_id`),
  KEY `c_member_id_c_album_id` (`c_member_id`,`c_album_id`),
  KEY `c_album_id_r_datetime` (`c_album_id`,`r_datetime`),
  KEY `c_member_id_r_datetime_c_album_id` (`c_member_id`,`r_datetime`,`c_album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;