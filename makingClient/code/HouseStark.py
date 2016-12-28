# -*- coding:utf-8 -*-

import info_collection
from conf import settings
import urllib,urllib2,sys,os,json,datetime
import api_token

class ArgvHandler(object):
    def __init__(self, argv_list):
        self.argvs = argv_list
        self.parse_argv()

    def parse_argv(self):
        if len(self.argvs) > 1:
            if hasattr(self, self.argvs[1]):
                func = getattr(self, self.argvs[1])
                func()
            else:
                self.help_msg()
        else:
            self.help_msg()

    def help_msg(self):
        msg = '''
        collect_data
        run_forever
        get_asset_id
        report_asset
        '''
        print msg


    def collect_data(self):
        obj = info_collection.InfoCollecttion()
        asset_data = obj.collect()

    def run_forever(self):
        pass

    def __attach_token(self, url_str):

        user = settings.Params['auth']['user']
        token_id = settings.Params['auth']['token']

        md5_token, timestamp = api_token.get_token(user, token_id)
        url_arg_str = "user=%s&timestamp=%s&token=%s" %(user, timestamp, md5_token)


