SVN=/usr/local/bin/svn
$SVN log -r '{2009-02-27 09:00:00}':HEAD https://svn.corp.myphotoalbum.com/mpa_gallery  --xml --verbose | /usr/bin/xsltproc $HOME/svn/svn2cl-0.10/svn2cl.xsl - > $HOME/release_notes.gallery.txt
$SVN log -r '{2009-03-11 09:00:00}':HEAD https://svn.corp.myphotoalbum.com/mpa_products --xml --verbose | /usr/bin/xsltproc $HOME/svn/svn2cl-0.10/svn2cl.xsl - > $HOME/release_notes.products.txt
$SVN log -r '{2009-02-27 09:00:00}':HEAD https://svn.corp.myphotoalbum.com/mpa_cart     --xml --verbose | /usr/bin/xsltproc $HOME/svn/svn2cl-0.10/svn2cl.xsl - > $HOME/release_notes.cart.txt
$SVN log -r '{2009-03-11 09:00:00}':HEAD https://svn.corp.myphotoalbum.com/mpa_core     --xml --verbose | /usr/bin/xsltproc $HOME/svn/svn2cl-0.10/svn2cl.xsl - > $HOME/release_notes.core.txt


#/opt/subversion/bin/svn log -r '{2008-10-30 09:00:00}':HEAD https://svn.corp.myphotoalbum.com/mpa_gallery  --xml --verbose | /usr/bin/xsltproc /home/swain/svn/svn2cl-0.10/svn2cl.xsl - > ~/release_notes.gallery.txt

#/opt/subversion/bin/svn log -r '{2008-10-30 09:00:00}':HEAD https://svn.corp.myphotoalbum.com/mpa_products --xml --verbose | /usr/bin/xsltproc /home/swain/svn/svn2cl-0.10/svn2cl.xsl - > ~/release_notes.products.txt

#/opt/subversion/bin/svn log -r '{2008-10-10 09:00:00}':HEAD https://svn.corp.myphotoalbum.com/mpa_cart     --xml --verbose | /usr/bin/xsltproc /home/swain/svn/svn2cl-0.10/svn2cl.xsl - > release_notes.cart.txt
