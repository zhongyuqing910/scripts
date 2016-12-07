from django.conf.urls import include, url
from django.contrib import admin
admin.autodiscover()

#import views
from asset.views import *




urlpatterns = patterns(
    # Examples:
    # url(r'^$', 'oms.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^asset/host_list/$', host_list, name='host_list'),
    url(r'^asset/add_host/$', host_list_manage, name='add_host')

)
