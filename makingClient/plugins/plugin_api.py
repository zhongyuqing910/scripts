# -*- coding:utf-8 -*-

from linux import sysinfo


def linuxsysinfo():

    return sysinfo.colloct()


def windowssysinfo():
    from windows import sysinfo as win_sysinfo
    return win_sysinfo.collect()