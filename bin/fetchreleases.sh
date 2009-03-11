[ -e /opt/subversion/bin/svn ] && export PATH=/opt/subversion/bin:$PATH

[ -d /opt/mpa_cart/current     ] && cd /opt/mpa_cart/current     && echo -n "cart:     " && svn info | grep URL | awk -F/ '{print $NF}'
[ -d /opt/mpa_core/current     ] && cd /opt/mpa_core/current     && echo -n "core:     " && svn info | grep URL | awk -F/ '{print $NF}'
[ -d /opt/mpa_gallery/current  ] && cd /opt/mpa_gallery/current  && echo -n "gallery:  " && svn info | grep URL | awk -F/ '{print $NF}'
[ -d /opt/mpa_products/current ] && cd /opt/mpa_products/current && echo -n "products: " && svn info | grep URL | awk -F/ '{print $NF}'
[ -d /opt/mpa                  ] && cd /opt/mpa                  && echo -n "signup:   " && svn info | grep URL | awk -F/ '{print $NF}'
[ -d /opt/mpa_www              ] && cd /opt/mpa_www              && echo -n "www:      " && svn info | grep URL | awk -F/ '{print $NF}'