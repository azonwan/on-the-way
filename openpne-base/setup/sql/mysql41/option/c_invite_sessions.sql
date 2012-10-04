CREATE TABLE IF NOT EXISTS `c_invite_sessions` (
  `c_invite_sessions_id` int(11) NOT NULL auto_increment,
  `c_member_id` int(11) NOT NULL,
  `sessions_id` text NOT NULL,
   PRIMARY KEY  (`c_invite_sessions_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
