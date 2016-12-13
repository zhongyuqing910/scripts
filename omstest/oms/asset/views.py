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
from oms.mysql import db_operate
from oms.models import *
from oms import settings


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
        db = db_operate
        sql = 'select ip from oms_hostlist where id = %s'%(id)
        ret = db.mysql_command(settings.OMS_MYSQL, sql)
    else:
        host_list = HostList()
        print "11"
        print HostList()
        action = 'add'
        page_name = '新增主机'

    if request.method=='GET':
        delete = request.GET.get('delete')
        id = request.GET.get('id')
        if delete:
            Message.object.create(type='host', action='manage', action_ip=ret, content='主机下架')
            host_list = get_object_or_404(HostList, pk=id)
            host_list.delete()
            return HttpResponseRedirect(reverse('hostlist'))

    if request.method == 'POST':
        form = HostListForm(request.POST, instance=host_list)
        operate = request.POST.get('operate')
        if form.is_valid():
            if action == 'add':
                form.save()
                return HttpResponseRedirect(reverse('host_list'))
            if operate:
                if operate == 'update':
                    form.save()
                    Message.objects.create(type='host',action='manage',action_ip=ret,content='主机信息更新')
                    return HttpResponseRedirect(reverse('hostlist'))
                else:
                    pass
    else:
        form = HostListForm(instance=host_list)

    return render_to_response('host_manage.html',
            {"form":form,
             "page_name":page_name,
             "action":action,
             },context_instance=RequestContext(request))


def host_list(request):
    user = request.user
    all_host = HostList.objects.all()
    paginator = Paginator(all_host,10)

    try:
        page = int(request.GET.get('page','1'))
    except ValueError:
        page = 1

    try:
        all_host = paginator.page(page)
    except:
        all_host = paginator.page(paginator.num_pages)

    return render_to_response('host_list.html', {'all_host_list': all_host, 'page': page, 'paginator': paginator})
