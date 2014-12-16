/********************************************************************************
Copyright (C) Binod Nepal, Mix Open Foundation (http://mixof.org).

This file is part of phpBB2KunenaScript.

phpBB2KunenaScript is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

phpBB2KunenaScript is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with phpBB2KunenaScript.  If not, see <http://www.gnu.org/licenses/>.
***********************************************************************************/

SET @@SESSION.sql_mode='ALLOW_INVALID_DATES';

DROP FUNCTION IF EXISTS phpbb_database_name.get_alias;

DELIMITER $$
CREATE FUNCTION phpbb_database_name.get_alias(str varchar(256))
RETURNS varchar(256)
DETERMINISTIC
BEGIN
  DECLARE alias varchar(256);
  
  SET alias = REPLACE(REPLACE(LCASE(REPLACE(CONVERT(TRIM(str) USING ascii), '?', '')),' ','-'), '&amp;','and');
  
  RETURN alias;
END;
$$
DELIMITER ;

/*****************************************************************************
    http://forums.mysql.com/read.php?98,246527,246527
    Charlie Armor
*****************************************************************************/

DELIMITER $$
DROP FUNCTION IF EXISTS phpbb_database_name.HTML_UnEncode $$
CREATE FUNCTION phpbb_database_name.HTML_UnEncode(x text) RETURNS text CHARSET latin1
BEGIN

DECLARE TextString text;
SET TextString = x ;

#quotation mark
IF INSTR( x , '&quot;' )
THEN SET TextString = REPLACE(TextString, '&quot;','"') ;
END IF ;

#period
IF INSTR( x , '&#46;' )
THEN SET TextString = REPLACE(TextString, '&#46;','.') ;
END IF ;

#colon
IF INSTR( x , '&#58;' )
THEN SET TextString = REPLACE(TextString, '&#58;',':') ;
END IF ;



#apostrophe 
IF INSTR( x , '&apos;' )
THEN SET TextString = REPLACE(TextString, '&apos;','"') ;
END IF ;

#ampersand
IF INSTR( x , '&amp;' )
THEN SET TextString = REPLACE(TextString, '&amp;','&') ;
END IF ;

#less-than
IF INSTR( x , '&lt;' )
THEN SET TextString = REPLACE(TextString, '&lt;','<') ;
END IF ;

#greater-than
IF INSTR( x , '&gt;' )
THEN SET TextString = REPLACE(TextString, '&gt;','>') ;
END IF ;

#non-breaking space
IF INSTR( x , '&nbsp;' )
THEN SET TextString = REPLACE(TextString, '&nbsp;',' ') ;
END IF ;

#inverted exclamation mark
IF INSTR( x , '&iexcl;' )
THEN SET TextString = REPLACE(TextString, '&iexcl;','¡') ;
END IF ;

#cent
IF INSTR( x , '&cent;' )
THEN SET TextString = REPLACE(TextString, '&cent;','¢') ;
END IF ;

#pound
IF INSTR( x , '&pound;' )
THEN SET TextString = REPLACE(TextString, '&pound;','£') ;
END IF ;

#currency
IF INSTR( x , '&curren;' )
THEN SET TextString = REPLACE(TextString, '&curren;','¤') ;
END IF ;

#yen
IF INSTR( x , '&yen;' )
THEN SET TextString = REPLACE(TextString, '&yen;','¥') ;
END IF ;

#broken vertical bar
IF INSTR( x , '&brvbar;' )
THEN SET TextString = REPLACE(TextString, '&brvbar;','¦') ;
END IF ;

#section
IF INSTR( x , '&sect;' )
THEN SET TextString = REPLACE(TextString, '&sect;','§') ;
END IF ;

#spacing diaeresis
IF INSTR( x , '&uml;' )
THEN SET TextString = REPLACE(TextString, '&uml;','¨') ;
END IF ;

#copyright
IF INSTR( x , '&copy;' )
THEN SET TextString = REPLACE(TextString, '&copy;','©') ;
END IF ;

#feminine ordinal indicator
IF INSTR( x , '&ordf;' )
THEN SET TextString = REPLACE(TextString, '&ordf;','ª') ;
END IF ;

#angle quotation mark (left)
IF INSTR( x , '&laquo;' )
THEN SET TextString = REPLACE(TextString, '&laquo;','«') ;
END IF ;

#negation
IF INSTR( x , '&not;' )
THEN SET TextString = REPLACE(TextString, '&not;','¬') ;
END IF ;

#soft hyphen
IF INSTR( x , '&shy;' )
THEN SET TextString = REPLACE(TextString, '&shy;','­') ;
END IF ;

#registered trademark
IF INSTR( x , '&reg;' )
THEN SET TextString = REPLACE(TextString, '&reg;','®') ;
END IF ;

#spacing macron
IF INSTR( x , '&macr;' )
THEN SET TextString = REPLACE(TextString, '&macr;','¯') ;
END IF ;

#degree
IF INSTR( x , '&deg;' )
THEN SET TextString = REPLACE(TextString, '&deg;','°') ;
END IF ;

#plus-or-minus 
IF INSTR( x , '&plusmn;' )
THEN SET TextString = REPLACE(TextString, '&plusmn;','±') ;
END IF ;

#superscript 2
IF INSTR( x , '&sup2;' )
THEN SET TextString = REPLACE(TextString, '&sup2;','²') ;
END IF ;

#superscript 3
IF INSTR( x , '&sup3;' )
THEN SET TextString = REPLACE(TextString, '&sup3;','³') ;
END IF ;

#spacing acute
IF INSTR( x , '&acute;' )
THEN SET TextString = REPLACE(TextString, '&acute;','´') ;
END IF ;

#micro
IF INSTR( x , '&micro;' )
THEN SET TextString = REPLACE(TextString, '&micro;','µ') ;
END IF ;

#paragraph
IF INSTR( x , '&para;' )
THEN SET TextString = REPLACE(TextString, '&para;','¶') ;
END IF ;

#middle dot
IF INSTR( x , '&middot;' )
THEN SET TextString = REPLACE(TextString, '&middot;','·') ;
END IF ;

#spacing cedilla
IF INSTR( x , '&cedil;' )
THEN SET TextString = REPLACE(TextString, '&cedil;','¸') ;
END IF ;

#superscript 1
IF INSTR( x , '&sup1;' )
THEN SET TextString = REPLACE(TextString, '&sup1;','¹') ;
END IF ;

#masculine ordinal indicator
IF INSTR( x , '&ordm;' )
THEN SET TextString = REPLACE(TextString, '&ordm;','º') ;
END IF ;

#angle quotation mark (right)
IF INSTR( x , '&raquo;' )
THEN SET TextString = REPLACE(TextString, '&raquo;','»') ;
END IF ;

#fraction 1/4
IF INSTR( x , '&frac14;' )
THEN SET TextString = REPLACE(TextString, '&frac14;','¼') ;
END IF ;

#fraction 1/2
IF INSTR( x , '&frac12;' )
THEN SET TextString = REPLACE(TextString, '&frac12;','½') ;
END IF ;

#fraction 3/4
IF INSTR( x , '&frac34;' )
THEN SET TextString = REPLACE(TextString, '&frac34;','¾') ;
END IF ;

#inverted question mark
IF INSTR( x , '&iquest;' )
THEN SET TextString = REPLACE(TextString, '&iquest;','¿') ;
END IF ;

#multiplication
IF INSTR( x , '&times;' )
THEN SET TextString = REPLACE(TextString, '&times;','×') ;
END IF ;

#division
IF INSTR( x , '&divide;' )
THEN SET TextString = REPLACE(TextString, '&divide;','÷') ;
END IF ;

#capital a, grave accent
IF INSTR( x , '&Agrave;' )
THEN SET TextString = REPLACE(TextString, '&Agrave;','À') ;
END IF ;

#capital a, acute accent
IF INSTR( x , '&Aacute;' )
THEN SET TextString = REPLACE(TextString, '&Aacute;','Á') ;
END IF ;

#capital a, circumflex accent
IF INSTR( x , '&Acirc;' )
THEN SET TextString = REPLACE(TextString, '&Acirc;','Â') ;
END IF ;

#capital a, tilde
IF INSTR( x , '&Atilde;' )
THEN SET TextString = REPLACE(TextString, '&Atilde;','Ã') ;
END IF ;

#capital a, umlaut mark
IF INSTR( x , '&Auml;' )
THEN SET TextString = REPLACE(TextString, '&Auml;','Ä') ;
END IF ;

#capital a, ring
IF INSTR( x , '&Aring;' )
THEN SET TextString = REPLACE(TextString, '&Aring;','Å') ;
END IF ;

#capital ae
IF INSTR( x , '&AElig;' )
THEN SET TextString = REPLACE(TextString, '&AElig;','Æ') ;
END IF ;

#capital c, cedilla
IF INSTR( x , '&Ccedil;' )
THEN SET TextString = REPLACE(TextString, '&Ccedil;','Ç') ;
END IF ;

#capital e, grave accent
IF INSTR( x , '&Egrave;' )
THEN SET TextString = REPLACE(TextString, '&Egrave;','È') ;
END IF ;

#capital e, acute accent
IF INSTR( x , '&Eacute;' )
THEN SET TextString = REPLACE(TextString, '&Eacute;','É') ;
END IF ;

#capital e, circumflex accent
IF INSTR( x , '&Ecirc;' )
THEN SET TextString = REPLACE(TextString, '&Ecirc;','Ê') ;
END IF ;

#capital e, umlaut mark
IF INSTR( x , '&Euml;' )
THEN SET TextString = REPLACE(TextString, '&Euml;','Ë') ;
END IF ;

#capital i, grave accent
IF INSTR( x , '&Igrave;' )
THEN SET TextString = REPLACE(TextString, '&Igrave;','Ì') ;
END IF ;

#capital i, acute accent
IF INSTR( x , '&Iacute;' )
THEN SET TextString = REPLACE(TextString, '&Iacute;','Í') ;
END IF ;

#capital i, circumflex accent
IF INSTR( x , '&Icirc;' )
THEN SET TextString = REPLACE(TextString, '&Icirc;','Î') ;
END IF ;

#capital i, umlaut mark
IF INSTR( x , '&Iuml;' )
THEN SET TextString = REPLACE(TextString, '&Iuml;','Ï') ;
END IF ;

#capital eth, Icelandic
IF INSTR( x , '&ETH;' )
THEN SET TextString = REPLACE(TextString, '&ETH;','Ð') ;
END IF ;

#capital n, tilde
IF INSTR( x , '&Ntilde;' )
THEN SET TextString = REPLACE(TextString, '&Ntilde;','Ñ') ;
END IF ;

#capital o, grave accent
IF INSTR( x , '&Ograve;' )
THEN SET TextString = REPLACE(TextString, '&Ograve;','Ò') ;
END IF ;

#capital o, acute accent
IF INSTR( x , '&Oacute;' )
THEN SET TextString = REPLACE(TextString, '&Oacute;','Ó') ;
END IF ;

#capital o, circumflex accent
IF INSTR( x , '&Ocirc;' )
THEN SET TextString = REPLACE(TextString, '&Ocirc;','Ô') ;
END IF ;

#capital o, tilde
IF INSTR( x , '&Otilde;' )
THEN SET TextString = REPLACE(TextString, '&Otilde;','Õ') ;
END IF ;

#capital o, umlaut mark
IF INSTR( x , '&Ouml;' )
THEN SET TextString = REPLACE(TextString, '&Ouml;','Ö') ;
END IF ;

#capital o, slash
IF INSTR( x , '&Oslash;' )
THEN SET TextString = REPLACE(TextString, '&Oslash;','Ø') ;
END IF ;

#capital u, grave accent
IF INSTR( x , '&Ugrave;' )
THEN SET TextString = REPLACE(TextString, '&Ugrave;','Ù') ;
END IF ;

#capital u, acute accent
IF INSTR( x , '&Uacute;' )
THEN SET TextString = REPLACE(TextString, '&Uacute;','Ú') ;
END IF ;

#capital u, circumflex accent
IF INSTR( x , '&Ucirc;' )
THEN SET TextString = REPLACE(TextString, '&Ucirc;','Û') ;
END IF ;

#capital u, umlaut mark
IF INSTR( x , '&Uuml;' )
THEN SET TextString = REPLACE(TextString, '&Uuml;','Ü') ;
END IF ;

#capital y, acute accent
IF INSTR( x , '&Yacute;' )
THEN SET TextString = REPLACE(TextString, '&Yacute;','Ý') ;
END IF ;

#capital THORN, Icelandic
IF INSTR( x , '&THORN;' )
THEN SET TextString = REPLACE(TextString, '&THORN;','Þ') ;
END IF ;

#small sharp s, German
IF INSTR( x , '&szlig;' )
THEN SET TextString = REPLACE(TextString, '&szlig;','ß') ;
END IF ;

#small a, grave accent
IF INSTR( x , '&agrave;' )
THEN SET TextString = REPLACE(TextString, '&agrave;','à') ;
END IF ;

#small a, acute accent
IF INSTR( x , '&aacute;' )
THEN SET TextString = REPLACE(TextString, '&aacute;','á') ;
END IF ;

#small a, circumflex accent
IF INSTR( x , '&acirc;' )
THEN SET TextString = REPLACE(TextString, '&acirc;','â') ;
END IF ;

#small a, tilde
IF INSTR( x , '&atilde;' )
THEN SET TextString = REPLACE(TextString, '&atilde;','ã') ;
END IF ;

#small a, umlaut mark
IF INSTR( x , '&auml;' )
THEN SET TextString = REPLACE(TextString, '&auml;','ä') ;
END IF ;

#small a, ring
IF INSTR( x , '&aring;' )
THEN SET TextString = REPLACE(TextString, '&aring;','å') ;
END IF ;

#small ae
IF INSTR( x , '&aelig;' )
THEN SET TextString = REPLACE(TextString, '&aelig;','æ') ;
END IF ;

#small c, cedilla
IF INSTR( x , '&ccedil;' )
THEN SET TextString = REPLACE(TextString, '&ccedil;','ç') ;
END IF ;

#small e, grave accent
IF INSTR( x , '&egrave;' )
THEN SET TextString = REPLACE(TextString, '&egrave;','è') ;
END IF ;

#small e, acute accent
IF INSTR( x , '&eacute;' )
THEN SET TextString = REPLACE(TextString, '&eacute;','é') ;
END IF ;

#small e, circumflex accent
IF INSTR( x , '&ecirc;' )
THEN SET TextString = REPLACE(TextString, '&ecirc;','ê') ;
END IF ;

#small e, umlaut mark
IF INSTR( x , '&euml;' )
THEN SET TextString = REPLACE(TextString, '&euml;','ë') ;
END IF ;

#small i, grave accent
IF INSTR( x , '&igrave;' )
THEN SET TextString = REPLACE(TextString, '&igrave;','ì') ;
END IF ;

#small i, acute accent
IF INSTR( x , '&iacute;' )
THEN SET TextString = REPLACE(TextString, '&iacute;','í') ;
END IF ;

#small i, circumflex accent
IF INSTR( x , '&icirc;' )
THEN SET TextString = REPLACE(TextString, '&icirc;','î') ;
END IF ;

#small i, umlaut mark
IF INSTR( x , '&iuml;' )
THEN SET TextString = REPLACE(TextString, '&iuml;','ï') ;
END IF ;

#small eth, Icelandic
IF INSTR( x , '&eth;' )
THEN SET TextString = REPLACE(TextString, '&eth;','ð') ;
END IF ;

#small n, tilde
IF INSTR( x , '&ntilde;' )
THEN SET TextString = REPLACE(TextString, '&ntilde;','ñ') ;
END IF ;

#small o, grave accent
IF INSTR( x , '&ograve;' )
THEN SET TextString = REPLACE(TextString, '&ograve;','ò') ;
END IF ;

#small o, acute accent
IF INSTR( x , '&oacute;' )
THEN SET TextString = REPLACE(TextString, '&oacute;','ó') ;
END IF ;

#small o, circumflex accent
IF INSTR( x , '&ocirc;' )
THEN SET TextString = REPLACE(TextString, '&ocirc;','ô') ;
END IF ;

#small o, tilde
IF INSTR( x , '&otilde;' )
THEN SET TextString = REPLACE(TextString, '&otilde;','õ') ;
END IF ;

#small o, umlaut mark
IF INSTR( x , '&ouml;' )
THEN SET TextString = REPLACE(TextString, '&ouml;','ö') ;
END IF ;

#small o, slash
IF INSTR( x , '&oslash;' )
THEN SET TextString = REPLACE(TextString, '&oslash;','ø') ;
END IF ;

#small u, grave accent
IF INSTR( x , '&ugrave;' )
THEN SET TextString = REPLACE(TextString, '&ugrave;','ù') ;
END IF ;

#small u, acute accent
IF INSTR( x , '&uacute;' )
THEN SET TextString = REPLACE(TextString, '&uacute;','ú') ;
END IF ;

#small u, circumflex accent
IF INSTR( x , '&ucirc;' )
THEN SET TextString = REPLACE(TextString, '&ucirc;','û') ;
END IF ;

#small u, umlaut mark
IF INSTR( x , '&uuml;' )
THEN SET TextString = REPLACE(TextString, '&uuml;','ü') ;
END IF ;

#small y, acute accent
IF INSTR( x , '&yacute;' )
THEN SET TextString = REPLACE(TextString, '&yacute;','ý') ;
END IF ;

#small thorn, Icelandic
IF INSTR( x , '&thorn;' )
THEN SET TextString = REPLACE(TextString, '&thorn;','þ') ;
END IF ;

#small y, umlaut mark
IF INSTR( x , '&yuml;' )
THEN SET TextString = REPLACE(TextString, '&yuml;','ÿ') ;
END IF ;

RETURN TextString ;

END$$

DELIMITER ;


DROP FUNCTION IF EXISTS phpbb_database_name.get_forum_alias;

DELIMITER $$
CREATE FUNCTION phpbb_database_name.get_forum_alias(id int)
RETURNS text
DETERMINISTIC
BEGIN
  DECLARE alias text;
  DECLARE p_id int;
    
  SELECT 
    phpbb_database_name.get_alias(phpbb_database_name.HTML_UnEncode(forum_name)),
    parent_id
  INTO
    alias,
    p_id
  FROM phpbb_database_name.phpbb_forums
  WHERE forum_id = id;
  
  IF(p_id <> 0) THEN
    SELECT 
      concat(alias, '-', phpbb_database_name.get_alias(phpbb_database_name.HTML_UnEncode(forum_name)))
    INTO
      alias
    FROM phpbb_database_name.phpbb_forums
    WHERE forum_id = p_id;    
  END IF;

  RETURN alias;
END;
$$
DELIMITER ;


DROP FUNCTION IF EXISTS phpbb_database_name.get_message_by_post_id;

DELIMITER $$
CREATE FUNCTION phpbb_database_name.get_message_by_post_id(id int) 
RETURNS mediumtext
DETERMINISTIC
BEGIN 
  RETURN
  (
      SELECT post_text
      FROM phpbb_database_name.phpbb_posts
      WHERE post_id = id
  );
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS phpbb_database_name.get_user_name;

DELIMITER $$
CREATE FUNCTION phpbb_database_name.get_user_name(id int) 
RETURNS varchar(255)
DETERMINISTIC
BEGIN 
  RETURN
  (
      SELECT username
      FROM phpbb_database_name.phpbb_users
      WHERE user_id = id
  );
END;
$$
DELIMITER ;


-- Todo
DROP FUNCTION IF EXISTS phpbb_database_name.parse_phpbb_date;

-- DELIMITER $$
-- CREATE FUNCTION phpbb_database_name.parse_phpbb_date(string varchar(10), dateformat varchar(10)) 
-- RETURNS date
-- DETERMINISTIC
-- BEGIN 
  -- DECLARE str varchar(10);
  
  -- SET str = REPLACE(TRIM(string), ' ', '');
  
  -- IF str = '0-0-0' THEN  SET str = '';
  -- END IF;


  -- RETURN
  -- (
    -- STR_TO_DATE(str, dateformat)
  -- );
-- END;
-- $$
-- DELIMITER ;



DROP FUNCTION IF EXISTS phpbb_database_name.get_hits;

DELIMITER $$
CREATE FUNCTION phpbb_database_name.get_hits(id int) 
RETURNS int
DETERMINISTIC
BEGIN 
  RETURN
  (
      SELECT topic_views
      FROM phpbb_database_name.phpbb_topics
      WHERE topic_id = id
  );
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS phpbb_database_name.get_first_post_id;

DELIMITER $$
CREATE FUNCTION phpbb_database_name.get_first_post_id(topicid int) 
RETURNS int
DETERMINISTIC
BEGIN 
  RETURN
  (
      SELECT topic_first_post_id
      FROM phpbb_database_name.phpbb_topics
      WHERE topic_id = topicid
      AND topic_moved_id = 0
);
END;
$$
DELIMITER ;



DROP FUNCTION IF EXISTS phpbb_database_name.fix_url;

DELIMITER $$
CREATE FUNCTION phpbb_database_name.fix_url(message text)
RETURNS text
DETERMINISTIC
BEGIN
  DECLARE str text;
  set str = message;

  set str = replace(str, '<a class="postlink" href="', '[url=');
  set str = replace(str, '">', ']');
  set str = replace(str, '</a>', '[/url]');

  
  RETURN str;
END;
$$
DELIMITER ;



DROP FUNCTION IF EXISTS phpbb_database_name.get_topic_id;

DELIMITER $$
CREATE FUNCTION phpbb_database_name.get_topic_id(id int) 
RETURNS varchar(255)
DETERMINISTIC
BEGIN 
  RETURN
  (
      SELECT topic_id
      FROM phpbb_database_name.phpbb_posts
      WHERE post_id = id
  );
END;
$$
DELIMITER ;


DROP FUNCTION IF EXISTS phpbb_database_name.fix_tag;

DELIMITER $$
CREATE FUNCTION phpbb_database_name.fix_tag(message text, tag_name varchar(20))
RETURNS text
DETERMINISTIC
BEGIN
  DECLARE str text;
  DECLARE pos int;
  DECLARE tag_pos int;
  DECLARE pattern varchar(100);
  
  SET str = message;
  
  SET tag_pos = INSTR(str, CONCAT('[',  tag_name));
  set pos = LOCATE(']', str, tag_pos);
  

  SET pattern = substring(str, tag_pos + length(tag_name) + 1, pos - tag_pos - length(tag_name) - 1);


  SET str = replace(str, pattern, '');

  RETURN str;
END;
$$
DELIMITER ;

DELETE FROM joomla_database_name.jos_kunena_messages_text;
DELETE FROM joomla_database_name.jos_kunena_messages;
DELETE FROM joomla_database_name.jos_kunena_topics;
DELETE FROM joomla_database_name.jos_kunena_aliases;
DELETE FROM joomla_database_name.jos_kunena_categories;
DELETE FROM joomla_database_name.jos_kunena_attachments;
DELETE FROM joomla_database_name.jos_kunena_users;
DELETE FROM joomla_database_name.jos_kunena_ranks;

CREATE TEMPORARY TABLE IF NOT EXISTS joomla_database_name.jos_users_backup AS (SELECT * FROM joomla_database_name.jos_users);
DELETE FROM joomla_database_name.jos_user_usergroup_map WHERE user_id NOT IN(SELECT id FROM  joomla_database_name.jos_users_backup);
DELETE FROM joomla_database_name.jos_users WHERE id NOT IN(SELECT id FROM  joomla_database_name.jos_users_backup);
DROP TABLE joomla_database_name.jos_users_backup;


INSERT INTO joomla_database_name.jos_kunena_ranks
(
  rank_id, 
  rank_title, 
  rank_min, 
  rank_special, 
  rank_image 
)

SELECT 
  rank_id, 
  rank_title, 
  rank_min, 
  rank_special, 
  rank_image 
FROM phpbb_database_name.phpbb_ranks;

INSERT INTO joomla_database_name.jos_users
(
    id, 
    name, 
    username, 
    email, 
    password, 
    block, 
    sendEmail, 
    registerDate, 
    lastVisitDate, 
    activation, 
    requireReset,
    params
)
SELECT 
    user_id as id, 
    username as name, 
    username, 
    user_email as email, 
    user_password as password,  /*lets not store blank passwords.*/
    0 as block, 
    0 as sendEmail, 
    from_unixtime(user_regdate) as registerDate, 
    from_unixtime(user_lastvisit) as lastVisitDate, 
    1 as activation, 
    1 as requireReset, /*The phpBB password cannot be converted to joomla password.*/
    '' as params
FROM phpbb_database_name.phpbb_users
WHERE user_posts > 0;

INSERT INTO joomla_database_name.jos_user_usergroup_map(user_id,group_id)
SELECT 
    user_id as id, 
    (SELECT id FROM joomla_database_name.jos_usergroups WHERE title='Registered') as group_id
FROM phpbb_database_name.phpbb_users
WHERE user_posts > 0;



INSERT INTO joomla_database_name.jos_kunena_users
(
  userid, 
  signature, 
  moderator, 
  banned, 
  ordering, 
  posts, 
  avatar, 
  karma, 
  karma_time, 
  group_id, 
  uhits, 
  personalText, 
  gender, 
  birthdate, 
  location, 
  icq, 
  aim, 
  yim, 
  msn, 
  skype, 
  twitter, 
  facebook, 
  gtalk, 
  myspace, 
  linkedin, 
  delicious, 
  friendfeed, 
  digg, 
  blogspot, 
  flickr, 
  bebo, 
  websitename, 
  websiteurl, 
  rank, 
  hideEmail, 
  showOnline, 
  thankyou 
)


SELECT 
  user_id, 
  user_sig,
  0 as moderator,
  NULL as banned,
  0 as ordering,
  user_posts,
  '' as avatar,
  0 as karma,
  0 as karma_time,
  0 as group_id,
  0 as uhits, /*phpBB does not support this feature*/
  '' as personalText,
  0 as gender, /*phpBB does not support this feature*/
  STR_TO_DATE(REPLACE(TRIM(user_birthday), ' ', ''), 'dd-mm-yyyy') as birthdate,
  user_from as location,
  user_icq 	as  icq, 
  user_aim 	as aim, 
  user_yim 	as yim, 
  user_msnm as msn, 
  NULL AS skype, /*phpBB does not support this feature*/
  NULL AS twitter, /*phpBB does not support this feature*/
  NULL AS facebook, /*phpBB does not support this feature*/
  NULL AS gtalk, 
  NULL AS myspace, /*phpBB does not support this feature*/
  NULL AS linkedin, /*phpBB does not support this feature*/
  NULL AS delicious, /*phpBB does not support this feature*/
  NULL AS friendfeed, /*phpBB does not support this feature*/
  NULL AS digg, /*phpBB does not support this feature*/
  NULL AS blogspot, /*phpBB does not support this feature*/
  NULL AS flickr, /*phpBB does not support this feature*/
  NULL AS bebo, /*phpBB does not support this feature*/
  user_website as websitename, 
  user_website as websiteurl, 
  user_rank as rank, 
  1 as hideEmail, /*phpBB does not support this feature*/
  user_allow_viewonline as showOnline, 
  0 as thankyou /*phpBB does not support this feature*/
FROM phpbb_database_name.phpbb_users
WHERE user_posts > 0;





INSERT INTO joomla_database_name.jos_kunena_categories
(
  id, 
  parent_id, 
  name, 
  alias, 
  icon_id, 
  locked, 
  accesstype, 
  access, 
  pub_access, 
  pub_recurse, 
  admin_access, 
  admin_recurse, 
  ordering, 
  published, 
  checked_out, 
  checked_out_time, 
  review, 
  allow_anonymous, 
  post_anonymous, 
  hits, 
  description, 
  headerdesc, 
  class_sfx, 
  allow_polls, 
  topic_ordering, 
  numTopics, 
  numPosts, 
  last_topic_id, 
  last_post_id, 
  last_post_time, 
  params
)


SELECT 
  forum_id, 
  parent_id, 
  REPLACE(forum_name, '&amp;', '&'), 
  phpbb_database_name.get_forum_alias(forum_id) AS alias, 
  1 as icon_id,
  0 as locked,
  'joomla.level' AS accesstype,
  1 as access,
  1 as pub_access,
  1 as pub_recurse,
  8 as admin_access,
  1 as admin_recurse,
  left_id as ordering,
  1 as published,
  0 as checked_out,
  '0000-00-00 00:00:00' as checked_out_time,
  0 as review,
  0 as allow_anonymous,
  0 as post_anonymous,
  0 as hits,  
  forum_desc, 
  '' as headerdesc,
  '' as class_sfx,
  1 as allow_polls,
  'lastpost' as topic_ordering,
  forum_topics,
  forum_posts,
  phpbb_database_name.get_topic_id(forum_last_post_id) as last_topic_id,
  forum_last_post_id,
  forum_last_post_time,
  '{}' as params
  FROM phpbb_database_name.phpbb_forums
ORDER BY forum_id;


INSERT INTO joomla_database_name.jos_kunena_aliases(alias, type, item, state)
SELECT alias, 'catid', id, 0
FROM joomla_database_name.jos_kunena_categories;


INSERT INTO joomla_database_name.jos_kunena_topics
(
  id, 
  category_id, 
  subject, 
  icon_id, 
  locked, 
  hold, 
  ordering, 
  posts, 
  hits, 
  attachments, 
  poll_id, 
  moved_id, 
  first_post_id, 
  first_post_time, 
  first_post_userid, 
  first_post_message, 
  first_post_guest_name, 
  last_post_id, 
  last_post_time, 
  last_post_userid, 
  last_post_message, 
  last_post_guest_name, 
  params
)

SELECT 
  topic_id as id, 
  forum_id as category_id, 
  topic_title as subject,
  0 as icon_id, 
  0 as locked,
  0 as hold,
  0 as ordering,
  topic_replies_real + 1 as posts,
  topic_views as hits,
  topic_attachment as attachments,
  0 as poll_id,
  topic_moved_id as moved_id,
  topic_first_post_id as first_post_id,
  topic_time as first_post_time,
  topic_poster as first_post_userid,
  phpbb_database_name.get_message_by_post_id(topic_first_post_id) as first_post_message,
  topic_first_poster_name as first_post_guest_name,
  topic_last_post_id as last_post_id,
  topic_last_post_time as last_post_time,
  topic_last_poster_id as last_post_userid,
  phpbb_database_name.get_message_by_post_id(topic_last_post_id) last_post_message,
  topic_last_poster_name as last_post_guest_name,
  '' as params
FROM phpbb_database_name.phpbb_topics;


INSERT INTO joomla_database_name.jos_kunena_messages
(
  id,
  parent,
  thread,
  catid,
  name,
  userid,
  email,
  subject,
  time,
  ip,
  topic_emoticon,
  locked,
  hold,
  ordering,
  hits,
  moved
)

SELECT
  phpbb_database_name.phpbb_posts.post_id as id,
  0 as parent,
  phpbb_database_name.phpbb_posts.topic_id as thread,
  phpbb_database_name.phpbb_posts.forum_id as catid,
  phpbb_database_name.get_user_name(phpbb_database_name.phpbb_posts.poster_id) as name,
  poster_id as userid,
  '' as email,
  post_subject as subject,
  post_time as time,
  poster_id as ip,
  0 as topic_emoticon,
  post_edit_locked as locked,
  0 as hold,
  0 as ordering,
  phpbb_database_name.phpbb_topics.topic_views as hits,
  0 as moved
FROM phpbb_database_name.phpbb_posts
INNER JOIN phpbb_database_name.phpbb_topics
ON phpbb_database_name.phpbb_posts.post_id = phpbb_database_name.phpbb_topics.topic_first_post_id
WHERE phpbb_database_name.phpbb_topics.topic_moved_id = 0;



INSERT INTO joomla_database_name.jos_kunena_messages_text(mesid, message)
SELECT post_id, post_text FROM phpbb_database_name.phpbb_posts
INNER JOIN phpbb_database_name.phpbb_topics
ON phpbb_database_name.phpbb_posts.post_id = phpbb_database_name.phpbb_topics.topic_first_post_id
WHERE phpbb_database_name.phpbb_topics.topic_moved_id = 0;




INSERT INTO joomla_database_name.jos_kunena_messages
(
  id,
  parent,
  thread,
  catid,
  name,
  userid,
  email,
  subject,
  time,
  ip,
  topic_emoticon,
  locked,
  hold,
  ordering,
  hits,
  moved
)

SELECT
  phpbb_database_name.phpbb_posts.post_id as id,
  phpbb_database_name.get_first_post_id(topic_id) as parent,
  phpbb_database_name.phpbb_posts.topic_id as thread,
  phpbb_database_name.phpbb_posts.forum_id as catid,
  phpbb_database_name.get_user_name(phpbb_database_name.phpbb_posts.poster_id) as name,
  poster_id as userid,
  '' as email,
  post_subject as subject,
  post_time as time,
  poster_id as ip,
  0 as topic_emoticon,
  post_edit_locked as locked,
  0 as hold,
  0 as ordering,
  phpbb_database_name.get_hits(topic_id) as hits,
  0 as moved
FROM phpbb_database_name.phpbb_posts
WHERE phpbb_database_name.phpbb_posts.post_id NOT IN
(
  SELECT topic_first_post_id FROM phpbb_database_name.phpbb_topics
);


INSERT INTO joomla_database_name.jos_kunena_messages_text(mesid, message)
SELECT post_id, post_text 
FROM phpbb_database_name.phpbb_posts
WHERE phpbb_database_name.phpbb_posts.post_id NOT IN
(
  SELECT topic_first_post_id FROM phpbb_database_name.phpbb_topics
);



INSERT INTO joomla_database_name.jos_kunena_attachments
(
  id, 
  mesid, 
  userid, 
  hash, 
  size, 
  folder, 
  filetype, 
  filename
)
SELECT 
  attach_id as id, 
  post_msg_id as mesid, 
  poster_id as userid,
  md5(physical_filename) as hash,
  filesize as size,
  'media/kunena/attachments/migrated' as folder,
  mimetype as filetype,
  CONCAT(physical_filename, '.jpg') as filename  
FROM phpbb_database_name.phpbb_attachments;



UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = replace(message, '<!-- m -->', '');

UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = phpbb_database_name.fix_url(message)
WHERE message LIKE '%<a%>%</a>%';



UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = phpbb_database_name.fix_tag(message, 'code')
WHERE message LIKE '%[code%';

UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = phpbb_database_name.fix_tag(message, 'b')
WHERE message LIKE '%[b%';


UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = phpbb_database_name.fix_tag(message, 'quote')
WHERE message LIKE '%[quote%';


/*********************************************
Convert Emoticons to Kunena
**********************************************/


UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = replace(message, '<!-- s:-) --><img src="{SMILIES_PATH}/icon_e_smile.gif" alt=":-)" title="Smile" /><!-- s:-) -->', ':-)');

UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = replace(message, ' <!-- s:oops: --><img src="{SMILIES_PATH}/icon_redface.gif" alt=":oops:" title="Embarrassed" /><!-- s:oops: -->', ':oops:');

UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = replace(message, '<!-- s:P --><img src="{SMILIES_PATH}/icon_razz.gif" alt=":P" title="Razz" /><!-- s:P -->', ':P');

UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = replace(message, '<!-- s:) --><img src="{SMILIES_PATH}/icon_e_smile.gif" alt=":)" title="Smile" /><!-- s:) -->', ':)');


UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = replace(message, '<!-- s:D --><img src="{SMILIES_PATH}/icon_e_biggrin.gif" alt=":D" title="Very Happy" /><!-- s:D -->', ':D');


UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = replace(message, '<!-- s:mrgreen: --><img src="{SMILIES_PATH}/icon_mrgreen.gif" alt=":mrgreen:" title="Mr. Green" /><!-- s:mrgreen: -->', ':mrgreen:');


UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = replace(message, '<!-- s:( --><img src="{SMILIES_PATH}/icon_e_sad.gif" alt=":(" title="Sad" /><!-- s:( -->', ':(');


UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = replace(message, '<!-- s;) --><img src="{SMILIES_PATH}/icon_e_wink.gif" alt=";)" title="Wink" /><!-- s;) -->', ';)');


UPDATE 
joomla_database_name.jos_kunena_messages_text
SET message = replace(message, '<!-- s:roll: --><img src="{SMILIES_PATH}/icon_rolleyes.gif" alt=":roll:" title="Rolling Eyes" /><!-- s:roll: -->', ':rolleyes:');



UPDATE joomla_database_name.jos_kunena_messages_text
SET message = phpbb_database_name.HTML_UnEncode(message);

UPDATE joomla_database_name.jos_kunena_topics
SET subject = phpbb_database_name.HTML_UnEncode(subject);


UPDATE joomla_database_name.jos_kunena_messages
SET subject = phpbb_database_name.HTML_UnEncode(subject);
