# -*- coding: utf-8 -8-
from django.shortcuts import render
from django.http import HttpResponseRedirect,HttpResponse
from django.template import RequestContext
from  django.shortcuts import render_to_response, get_object_or_404
from django.core.urlresolvers import reverse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from asset.form import *
from asset.models import *
from oms.mysql import dp_operate
from oms.models import *
from oms import settings
import requests


# Create your views here.


def host_list_manage(request, id=None):
    """
    Manage Host List
    """
    user = request.user
    if id:
        host_list = get_object_or_404()
        action = 'edit'
        page_name = '编辑主机'
