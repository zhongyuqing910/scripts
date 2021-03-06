# -*- coding: utf-8 -*-
from django.conf.urls import include, url,patterns
from django.contrib import admin
admin.autodiscover()

#import views
from asset.views import *
from oms.views import *


urlpatterns = patterns('',

    # Examples:
    # url(r'^$', 'oms.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^asset/host_list/$', host_list, name='host_list'),
    url(r'^asset/add_host/$', host_list_manage, name='add_host'),
    url(r'^asset/host_delete/$', host_list_manage, name='delete_host'),

    #url(r'^asset/host_manage/$', index, name='host_manage'),
    url(r'^$', index, name='index'),
    #url(r'^login/$', acc_login,name='acc_login')
    url(r'^accounts/',include('users.urls'))


)
