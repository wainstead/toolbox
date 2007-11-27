#!/opt/php4/bin/php
<?

// $Id: flush_giftcards_tmpdir.php,v 1.1 2005/12/23 14:40:55 swain Exp $

// Clear out the temporary files for the Gifts project.  We determine
// the tmp dir from the gifts.conf file, where it's defined as a
// constant.

require "/opt/mpa/conf/gifts.conf";

$cmd = '/bin/find ' . TMP_DIR . ' -depth -mtime +7 -exec rm -rf {} \\;';

//echo "$cmd\n";

// weirdly PHP's system() returns the last line of output from the command.
// $retvar contains the exit code of the shell command (a.k.a. "$?")

$last_line = system($cmd, $retvar);

if ($retvar != 0) {
    echo "flush_giftcards_tmpdir: command returned '$last_line', return value '$retval'\n";
}



// $Log: flush_giftcards_tmpdir.php,v $
// Revision 1.1  2005/12/23 14:40:55  swain
// First version of a cron job to delete files older than a week in the
// gift project's temp directory.
//

?>