#!/bin/bash
# dump the critical product/category tables out.
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa mpa_categories                   > /home/swain/tmp/mpa_categories.`date '+%F'`.sql                  
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa ofs_categories_to_prefix_codes   > /home/swain/tmp/ofs_categories_to_prefix_codes.`date '+%F'`.sql  
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa osc_categories                   > /home/swain/tmp/osc_categories.`date '+%F'`.sql                  
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa osc_categories_description       > /home/swain/tmp/osc_categories_description.`date '+%F'`.sql      
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa osc_products_to_categories       > /home/swain/tmp/osc_products_to_categories.`date '+%F'`.sql      
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa mediaclip_products_properties    > /home/swain/tmp/mediaclip_products_properties.`date '+%F'`.sql   
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa mpa_products_groupings           > /home/swain/tmp/mpa_products_groupings.`date '+%F'`.sql          
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa osc_products                     > /home/swain/tmp/osc_products.`date '+%F'`.sql                    
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa osc_products_attributes          > /home/swain/tmp/osc_products_attributes.`date '+%F'`.sql         
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa osc_products_classes             > /home/swain/tmp/osc_products_classes.`date '+%F'`.sql            
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa osc_products_description         > /home/swain/tmp/osc_products_description.`date '+%F'`.sql        
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa osc_products_properties          > /home/swain/tmp/osc_products_properties.`date '+%F'`.sql         
/d0/mysql/mpa/bin/mysqldump -S /tmp/mysql.mpa.sock -uroot mpa osc_products_to_categories       > /home/swain/tmp/osc_products_to_categories.`date '+%F'`.sql      
