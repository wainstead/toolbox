/opt/subversion/bin/svn log -r '{2008-09-17 09:00:00}':HEAD https://svn.corp.myphotoalbum.com/mpa_gallery  --xml --verbose | /usr/bin/xsltproc /home/swain/svn/svn2cl-0.10/svn2cl.xsl - > release_notes.gallery.txt

/opt/subversion/bin/svn log -r '{2008-09-17 09:00:00}':HEAD https://svn.corp.myphotoalbum.com/mpa_products --xml --verbose | /usr/bin/xsltproc /home/swain/svn/svn2cl-0.10/svn2cl.xsl - > release_notes.products.txt

/opt/subversion/bin/svn log -r '{2008-09-04 09:00:00}':HEAD https://svn.corp.myphotoalbum.com/mpa_cart     --xml --verbose | /usr/bin/xsltproc /home/swain/svn/svn2cl-0.10/svn2cl.xsl - > release_notes.cart.txt
