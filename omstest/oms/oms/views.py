# -*- coding: utf-8 -*-
from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django import utils
from django.shortcuts import render, HttpResponse,HttpResponseRedirect


def index(request):
    return render_to_response('index.html')

'''
def acc_login(request):
    if request.method == "POST":
        username = request.POST.get('email')
        password = request.POST.get('password')
        user = auth.authenticate(username=username,password=password)
        if user is not None:

            if utils.timezone.now() > user.valid_begin_time and utils.timezone.now() < user.valid_end_tim:
            '''

