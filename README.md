#phpBB to Kunena Migration Script

We have migrated our forum from phpBB to Kunena and would like to share the migration script with the Joomla community.

Before you run this script, you need to do the ***following modifications*** correctly:

* Find and replace the token "phpbb_database_name" according to your setup.
* Find and replace the token "joomla_database_name"  according to your setup.
* Find and replace the token "jos_" to whatever prefix you have in your joomla installation.
 
##Please Note:
* This script will delete all the contents of Kunena forum and joomla users. Make a backup before you proceed.
* To migrate attachments from phpBB, copy the files inside phpBB attachment folder and paste those on 'media/kunena/attachments/migrated/'. Add file extensions to the files (generally .jpg). Done!
* This script will migrate all phpBB users. Remember, the user will have to use the joomla feature "forgot password" in order to reset their password.
* This script is licensed under GNU/GPLv2.
