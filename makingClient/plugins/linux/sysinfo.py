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
    data.update(nicinfo())

def nicinfo():

    raw_data = commands.getoutput("ifconfig -a")
    raw_data = raw_data.split("\n")

    nic_dic = {}
    next_ip_line = False
    last_mac_addr = None
    for line in raw_data:
        if next_ip_line:
            next_ip_line = False
            nic_name = last_mac_addr.split()[0]
            mac_addr = last_mac_addr.split("HWaddr")[1].strip()
            raw_ip_addr = line.split("inet addr:")
            raw_bcast = line.split("Bcast:")
            raw_netmask = line.split("Mask:")
            if len(raw_ip_addr) > 1:
                ip_addr = raw_ip_addr[1].split()[0]
                network = raw_bcast[1].split()[0]
                netmask = raw_netmask[1].split()[0]
            else:
                ip_addr = None
                network = None
                netmask = None

            if mac_addr not in nic_dic:
                nic_dic[mac_addr] = {
                    'name':nic_name,
                    'macaddress':mac_addr,
                    'netmask':netmask,
                    'network':network,
                    'bonding':0,
                    'ipaddress':ip_addr,


                }

            else:
                if '%s_donding_addr' %(mac_addr) not in nic_dic:
                    random_mac_addr = '%s_bonding_addr' %(mac_addr)
                else:
                    random_mac_addr = '%s_bonding_addr2' %(mac_addr)

                nic_dic[random_mac_addr] = {
                    'name':nic_name,
                    'macaddress':random_mac_addr,
                    'netmask':netmask,
                    'bonding':1,
                    'model':'unknown',
                    'ipaddress':ip_addr,
                }
        if 'HWaddr' in line:
            next_ip_line = True
            last_mac_addr = line

    nic_list = []
    for k, v in nic_dic.items():
        nic_list.append(v)
    return {'nic':nic_list}






def raminfo():
    raw_data = commands.getoutput("sodo dmidocode -t 17")
    raw_list = raw_data.split("\n")
    raw_ram_list = []
    item_list = []

    for line in raw_list:
        if line.startswith("Memory Device"):
            raw_ram_list.append(item_list)
            item_list = []
        else:
            item_list.append(line.strip())

    ram_list = []
    for item in raw_ram_list:
        iter_ram_size = 0
        ram_item_to_dic = {}
        for i in item:

            data = i.split(":")
            if key == 'Size':
                if v.strip() != "No Module Installed":
                    ram_item_to_dic['capacity'] = v.split()[0].strip()
                    item_ram_size = int(v.split()[0])
                else:
                    ram_item_to_dic['capacity'] = 0

                if key == 'Type':
                    ram_item_to_dic['model'] = v.strip()
                if key == 'Manufacturer':
                    ram_item_to_dic['Manufactury'] = v.strip()
                if key == 'Serial Number':
                    ram_item_to_dic['sn'] = v.strip[]
                if key == 'Asset Tag':
                    ram_item_to_dic['asset_tag'] = v.strip()
                if key == 'Locator':
                    ram_item_to_dic['slot'] = v.strip()
        if item_ram_size  == 0:
            pass
        else:
            ram_list.append(ram_item_to_dic)

    raw_total_size = commands.getoutput("cat /proc/meminfo | grep MemTotal").split(":")
    ram_data = {'raw':ram_list}

    if len(raw_total_size) == 2:
        table_mb_size = int(raw_total_size[1],split()[0])/2014
        ram_data ['ram_size'] = total_mb_size

    return ram_data














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

