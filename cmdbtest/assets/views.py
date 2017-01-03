# -*- coding:utf-8  -*-
from django.shortcuts import render
from django.shortcuts import HttpResponse
from assets import core, models, asset_handle, admin
import json
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.core.exceptions import ObjectDoesNotExist
from assets import tables
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from assets.dashboard import AssetDashboard

# Create your views here.

@login_required
def index(request):
    return render(request, 'index.html')

@csrf_exempt
@utils.token_required
def asset_report(request):
    print (request.GET)

    if request.method == 'POST':
        ass_handler = core.Asset(request)
        print ("----asset data  valid:")
        ass_handler.data_inject()

        return HttpResponse(json.dumps(ass_handler.response))
    return HttpResponse('--test--')

@csrf_exempt
def asset_with_no_asset_id(request):
    if request.method == 'POST':
        ass_handler = core.Asset(request)
        res = ass_handler.get_asset_id_by_sn()





