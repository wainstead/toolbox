#!/bin/bash

if [ $# -ne 1 ]; then
        echo "Usage: $0 [dev|stg|prod]"
        exit
fi

MYSQLDUMP='/d0/mysql/mpa/bin/mysqldump --extended-insert=false -S /tmp/mysql.mpa.sock -uroot mpa'
TARGETDIR=/home/swain/public_html/projects/schema

# dump the critical product/category tables out.
$MYSQLDUMP mpa_categories                 | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/mpa_categories.sql                  
$MYSQLDUMP ofs_categories_to_prefix_codes | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/ofs_categories_to_prefix_codes.sql  
$MYSQLDUMP osc_categories                 | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/osc_categories.sql                  
$MYSQLDUMP osc_categories_description     | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/osc_categories_description.sql      
$MYSQLDUMP osc_products_to_categories     | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/osc_products_to_categories.sql      
$MYSQLDUMP mediaclip_products_properties  | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/mediaclip_products_properties.sql   
$MYSQLDUMP mpa_products_groupings         | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/mpa_products_groupings.sql          
$MYSQLDUMP osc_products                   | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/osc_products.sql                    
$MYSQLDUMP osc_products_classes           | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/osc_products_classes.sql            
$MYSQLDUMP osc_products_description       | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/osc_products_description.sql        
$MYSQLDUMP osc_products_properties        | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/osc_products_properties.sql         
$MYSQLDUMP osc_products_to_categories     | grep -v 'Dump completed on'   > $TARGETDIR/products-$1/osc_products_to_categories.sql      

cd $TARGETDIR/products-$1/
/opt/subversion/bin/svn commit -m "updated product tables"
