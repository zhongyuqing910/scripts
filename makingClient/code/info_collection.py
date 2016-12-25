# -*- coding:utf-8 -*-
from plugins import plugin_api
import json,platform,sys


class InfoCollecttion(object):
    def __init__(self):
        pass

    def get_platform(self):
        os_platform = platform.system()
        return os_platform

    def collect(self):
        os_platform = self.get_platform()
        try:
            func = getattr(self,os_platform)
            info_data = func()
            formatted_data = self.build_report_data(info_data)
            return formatted_data
        except AttributeError,e:
            sys.exit("Error: MadKing doens't support os [%s]" % os_platform)

    def Linux(self):
        sys_info = plugin_api.L