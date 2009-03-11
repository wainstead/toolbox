[ -e /opt/subversion/bin/svn ] && export PATH=/opt/subversion/bin:$PATH

[ -d /opt/mpa_cart/current     ] && cd /opt/mpa_cart/current     && echo -n "cart:     " && svn info | grep URL
[ -d /opt/mpa_core/current     ] && cd /opt/mpa_core/current     && echo -n "core:     " && svn info | grep URL
[ -d /opt/mpa_gallery/current  ] && cd /opt/mpa_gallery/current  && echo -n "gallery:  " && svn info | grep URL
[ -d /opt/mpa_products/current ] && cd /opt/mpa_products/current && echo -n "products: " && svn info | grep URL
[ -d /opt/mpa_signup/current   ] && cd /opt/mpa_signup/current   && echo -n "signup:   " && svn info | grep URL
[ -d /opt/mpa_www/current      ] && cd /opt/mpa_www/current      && echo -n "www:      " && svn info | grep URL