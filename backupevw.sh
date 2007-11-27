#!/opt/gnu/bin/bash
# $Id: backupevw.sh,v 1.3 2003/06/13 20:31:17 swain Exp $

echo "Do not run this until tested."
exit

# first, remember to do: . /etc/profile

# second, on cws-1.dvl, make a backup tarball like this:
# tar -czvf /opt/backup/cws-1.DATE.tar.gz /opt/evw/var /usr/local/apache/conf /opt/bind/etc /home/web/members /usr/local/frontpage

# make sure there are no jobs in the system **VERY IMORTANT**

echo "stopping evolutionware..."
/etc/init.d/evolutionware stop

echo "test for the presence of GlobalSystemsProxy and devNull gateway"
echo "run kill -9 on them if they are there"
echo "see the diejava page in twiki if that fails..."
/usr/ucb/ps awwwx | grep java

echo "make sure no binaries are running from /opt/evw/sbin..."
ps -ef | grep sbin

echo "stopping all services that are being controlled by Evolutionware..."
/etc/init.d/exim stop
/etc/init.d/named stop
/etc/init.d/mysql.server stop

echo "backing up directories..."
# note: these are broken up into two tar files because one is too big for one drive
mkdir /d1/backup/[BACKUP DATE]
tar -czvf /d1/backup/[OPT DIR NAME AND DATE].tar.gz /opt/evw/var 
mkdir /d2/backup/[BACKUP DATE]
tar -czvf /d2/backup/[today''s date]/[MAILMAN, MYSQL, EVW-MAIL].tar.gz /usr/local/mailman /usr/local/mysql/data /var/evw-mail

echo "backing up the database..."
mkdir /d2/backup/[BACKUP DATE]/db2backup
chown db2inst1 /d2/backup/[BACKUP DATE]/db2backup
su - db2inst1
db2 force applications all
db2stop
db2start
db2 backup db evw to /d2/backup/[BACKUP DATE]/db2backup

echo "backing up ldap..."
mkdir /d1/ldap-backup/[BACKUP DATE]
chown nobody /d1/ldap-backup/[BACKUP DATE]
/opt/netscape/server4/slapd-Evolutionware/db2bak /d1/ldap-backup/[BACKUP DATE] 


###
### end backup procedure; start restore procedure
###

# restore ldap:
# more info: http://enterprise.netscape.com/docs/directory/60/ag/dbmanage.htm

echo "stopping ldap"
/etc/init.d/ldap stop
ech "restoring ldap from backup"
/opt/netscape/server4/slapd-Evolutionware/bak2db /d1/ldap-backup/[RESTORE DATE]

# restore the database:
echo "backing up the database..."
su - db2inst1
db2 force applications all
db2stop
db2start
db2 restore db database-name from /d2/backup/[RESTORE DATE]/db2backup

# this is from Chris's doc on rollouts... you may need to do a
# rollforward on DB2 to recover the stuff in the transaction logs
# since the last backup:

# "Now recover the database up to the time
# stamp of the last backup with 'db2 rollforward db evwv to
# 2002-11-25-14.27.32.001 and complete' note the example date format.
# Go to http://nscpcw.physics.upenn.edu/db2_docs/db2n0/sqln0096.htm
# for more information on the rollforward command."


# restore other backups
cd /
tar -xzvf /d1/[name+date].tar.gz

echo "restarting exim, named, mysql.server, ldap..."
/etc/init.d/exim start
/etc/init.d/named start
/etc/init.d/mysql.server start
/etc/init.d/ldap start

# start evolutionware
/etc/init.d/evolutionware start
