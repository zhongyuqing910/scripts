# -*- coding:utf-8 -*-

import json
from django.core.exceptions import ObjectDoesNotExist
from assets import models
from django.utils import timezone


class Asset(object):
    def __init__(self):
        self.request = request
        self.mandatory_fields = ['sn', 'asset_id', 'asset_type']
        self.field_sets = {
            'asset': ['manufactory'],
            'server': ['model', 'cpu_count', 'cpu_core_count', 'cpu_model', 'raid_type', 'os_type', 'os_distribution', 'os_release'],
            'networkdevice':[]
        }
        self.response = {
            'error':[],
            'info':[],
            'warning':[]

        }

    def get_asset_id_by_sn(self):
        data = self.request.POST.get("asset_data")

        response = {}
        if data:
            try:
                data = json.load(data)
                if self.mandatory_chenk(data, only_check_sn = True):
                    response = {'asset_id':self.asset_obj.id}
                else:
                    if hasattr(self, 'waiting_approval'):
                        response = {'needs_aproval': "this is a new asset, needs IT admin's appvoval to create the new asset id"}
                        self.clean_data = data
                        self.save_new_asset_to_appvoval_zone()


    def save_new_asset_to_approval_zone(self):
        asset_sn = self.clean_data.get('sn')
        asset_already_in_approval_zone = models.NewAssetApprovalZone.objects.get_or_create(sn = asset_sn,
                                                                                           data = json.dumps(self.clean_data),
                                                                                           manufactory = self.clean_data.get('manufactory'),
                                                                                           asset_type = self.clean_data.get('asset_type'),
                                                                                           ram_size = self.clean_data.get('ram_size'),
                                                                                           cpu_model = self.clean_data.get('cpu_model'),
                                                                                           cpu_count = self.clean_data.get('cpu_core_count'),
                                                                                           os_distribution = self.clean_data.get('os_distribution'),
                                                                                           os_release = self.clean_data.get('os_release'),
                                                                                           os_type = self.clean_data.get('os_type'),
                                                                                           )
        return True



    def response_msg(self, msg_type, key, msg):
        if msg_type in self.response:
            self.response[msg_type].append({key:msg})
        else:
            raise ValueError


    def mandatory_check(self, data, only_check_sn = False):
        for field in self.mandatory_fields:
            if field not in data:
                self.response_msg('error', 'MandatoryCheckFailed', 'The field [%s] is mandatory and not \
                provided in your reporting data' % field)
        else:
            if self.response['error']:return False

        try:
            if not only_check_sn:
                self.asset_obj = models.Asset.objects.get(id = int(data['asset_id']),sn = data['sn'])
            else:
                self.asset_obj = models.Asset.objects.get(sn = data[sn])
            return True
        except ObjectDoesNotExist as e:
            self.response_msg('error', 'AssetDataInvalid', 'Cannot find asset object in \
            DB by using asset_id [%s] and SN [%s] ' % (data['assetid'], data['sn']))
            self.waiting_appreval = True
            return False


