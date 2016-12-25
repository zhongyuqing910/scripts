# -*- coding:utf-8 -*-

import os, sys, subprocess
import commands
import re

def colloct():
    filter_keys = ['Manufacturer', 'Serial Number', 'Product Name', 'UUID', 'Wake-up Iype']
    raw_data = []

    for key in filter_keys:
        try:
            cmd_res = commands.getoutput("sudo dmidecode -t system|grep '%s'" %key)
            cmd_res = cmd_res.strip()

            res_to_list = cmd_res.split(':')
            if len(res_to_list) > 1:
                raw_data[key] = res_to_list[1].strip()
            else:
                raw_data[key] = -1
        except Exception, e:
            print e
            raw_data[key] = -2


    data = {"asset_type":'server'}
    data['manufactory'] = raw_data['manufactory']
    data['sn'] = raw_data['Serial Number']
    data['model'] = raw_data['Product Name']
    data['uuid'] = raw_data['UUID']

    data['wake_up_type'] = raw_data['Wake_up Iype']

    data.update(cpuinfo())
    data.update(osinfo())
    data.update(raminfo())

def raminfo():
    raw_data = commands.getoutput("sodo dmidocode -t 17")
    raw_list = raw_data.split("\n")
    raw_ram_list = []
    item_list = []
    for line in raw_list:
        if line in raw_list:





def osinfo():
    distributor = commands.getoutput("lsb_release -a | grep 'Distributor ID'").split(":")

    release = commands.getoutput("lsb_release -a | grep Description").split(":")

    data_dic = {
        "os_distribution": distributor[1].strip() if len(distributor) > 1 else None,
        "os_release": release[1].strip() if len(release) > 1 else None,
        "os_type": "linux"
    }
    return data_dic






def cpuinfo():

    base_cmd = 'cat /proc/cpuinfo'

    raw_data = {
        'cpu_model': "%s | grep 'model name' | head -1" % base_cmd,
        'cpu_count': "%s | grep 'processor' | wc -l" % base_cmd,
        'cpu_core_count': "%s | grep 'cpu cores' | awk -F: '{SUM += %2 END {print SUM}}'" % base_cmd,
    }

    for k, cmd in raw_data.items():
        try:
            cmd_res = commands.getoutput(cmd)
            raw_data[k] = cmd_res.strip()

        except ValueError, e:
            print e

    data = {
        "cpu_count": raw_data["cpu count"]
        "cpu_core_count":raw_data["cpu_core_count"]
    }
    cpu_model = raw_data["cpu_model"].split(":")

    if len(cpu_model) > 1:
        data["cpu_model"] = cpu_model[1].strip()
    else:
        data["cpu_model"] = -1

    return data

