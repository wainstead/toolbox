-- set mpa_club_memberships.expire_date for the users expire2, expire15, expire30 and expired.
-- 7/3/7: added expire3years
-- 12/19/07: added update to last_purchase_date
-- 7/18/08: updated to use the mpa_club_memberships table.

update users
set last_purchase_date= now()
where (
   username like 'expire%'
OR username like 'trial%'
OR username like 'clubnotauto%'
);

update mpa_club_memberships set expire_date = date_add(date(now()), interval 14 day) where mpa_userid = (select userid from users where username='expire15');
update mpa_club_memberships set expire_date = date_add(date(now()), interval 1 day)  where mpa_userid = (select userid from users where username='expire2');
update mpa_club_memberships set expire_date = date_add(date(now()), interval 29 day) where mpa_userid = (select userid from users where username='expire30');
update mpa_club_memberships set expire_date = date_sub(date(now()), interval 55 day) where mpa_userid = (select userid from users where username='expired');
update mpa_club_memberships set expire_date = date_add(date(now()), interval 3 year) where mpa_userid = (select userid from users where username='expire3years');



-- 2/19/2009: new file, called testaccounts.sql. adding trial accounts and non autorenew club accounts.


update users set status=5, date_confirmed = date_sub(now(), interval 1 day)  where username = 'trialonedayold';
update users set status=5, date_confirmed = date_sub(now(), interval 15 day) where username = 'trialfifteendaysold';
update users set status=5, date_confirmed = date_sub(now(), interval 30 day) where username = 'trialthirtydaysold';
update users set status=5, date_confirmed = date_sub(now(), interval 31 day) where username = 'trialendedonedayago';

update mpa_club_memberships set expire_date = date_sub(date(now()), interval 30 day), auto_renew='n'
  where mpa_userid = (select userid from users where username='clubnotautorenewexpire30days');

update mpa_club_memberships set expire_date = date_sub(date(now()), interval 1 day), auto_renew='n'
  where mpa_userid = (select userid from users where username='clubnotautorenewexpire1day');

update mpa_club_memberships set expire_date = date_add(date(now()), interval 1 day), auto_renew='n'
  where mpa_userid = (select userid from users where username='clubnotautorenewexpired1dayago');


select username, status, expire_date AS 'expire date or date confirmed', userid, to_days(expire_date) - to_days(date(now())) as d
from users, mpa_club_memberships
where userid=mpa_userid
and (
   username like 'expire%'
OR username like 'clubnotauto%'
)
UNION
select username, status, date_confirmed AS 'expire date or date confirmed', userid, to_days(date_confirmed) - to_days(date(now())) as d
from users
where username like 'trial%';



-- From:   jessyhanley@yahoo.com
-- Subject: To Test for the new staus tests
-- Date: February 19, 2009 4:42:52 PM EST
-- To:   swain@myphotoalbum.com, fmarte@myphotoalbum.com

-- These are the accounts that I need:
-- Status 5 - Trial
-- Trial Account 1 day old
-- Trial Account 15 days Old
-- Trial Account 30 days Old
-- Trial Ended 1 day ago
-- Club Account - Not Auto Renew
-- Club Will Expire in 30 days
-- Club Will Expire in 1 day
-- Club that expired 1 day ago
-- Club Account -  Auto Renw
-- Club Will Auto renew in 30 days
-- Club Will Renew Today
-- Club auto renew failed 1 day ago


-- /opt/mpa/admin/unix-bin/createaccount.pl trialonedayold                  112233 trialonedayold@test.myphotodevel.com
-- /opt/mpa/admin/unix-bin/createaccount.pl trialfifteendaysold             112233 trialfifteendaysold@test.myphotodevel.com
-- /opt/mpa/admin/unix-bin/createaccount.pl trialthirtydaysold              112233 trialthirtydaysold@test.myphotodevel.com
-- /opt/mpa/admin/unix-bin/createaccount.pl trialendedonedayago             112233 trialendedonedayago@test.myphotodevel.com
-- /opt/mpa/admin/unix-bin/createaccount.pl clubnotautorenewexpire30days    112233 clubnotautorenewexpire30days@test.myphotodevel.com
-- /opt/mpa/admin/unix-bin/createaccount.pl clubnotautorenewexpire1day      112233 clubnotautorenewexpire1day@test.myphotodevel.com
-- /opt/mpa/admin/unix-bin/createaccount.pl clubnotautorenewexpired1dayago  112233 clubnotautorenewexpired1dayago@test.myphotodevel.com

-- #!/usr/bin/perl

-- @accounts = qw(trialonedayold                
-- trialfifteendaysold           
-- trialthirtydaysold            
-- trialendedonedayago           
-- clubnotautorenewexpire30days  
-- clubnotautorenewexpire1day    
-- clubnotautorenewexpired1dayago);

-- foreach $username (@accounts) {

--     open CONFFILE, ">$username.myphotodevel.com.conf" or die $!;

--     print CONFFILE <<"EOLN";
-- <VirtualHost 10.1.1.190:80>
-- AddType application/x-httpd-php .php
-- AddType application/x-httpd-php-source .phps
-- DirectoryIndex  index.php
-- ServerAdmin ops\@myphotoalbum.com
-- ServerName $username.myphotodevel.com
-- DocumentRoot /opt/mpa/custom-sites/jhanley/mpa_gallery
-- #DocumentRoot /home/swain/public_html/projects/ampiradev/gallery
-- </VirtualHost>
-- EOLN

-- close CONFFILE;
-- }
