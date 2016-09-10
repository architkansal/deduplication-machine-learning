from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^home/',views.home, name='home'),
    url(r'^attrib',views.attrib,name='attrib'),
    url(r'^index/',views.index, name='index'),
    url(r'^/get_data',views.get_data, name='index'),
    url(r'^dedupe_app/m',views.m, name='m'),
    url(r'^dedupe_app/received',views.got_it),
    url(r'^dedupe_app/console_own_iter',views.console_own_iter),
]
