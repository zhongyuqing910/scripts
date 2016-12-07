# -*- coding: utf-8 -*-
from django import forms
from asset.models import *


class HostListForm(forms.ModelForm):
    class Meta:
        model = HostList
        field = '__all__'
        widgets = {
            'ip': forms.TextInput(attrs={'class': 'from-control'}),
            'hostname': forms.TextInput(attrs={'class': 'form-control'}),
            'product': forms.TextInput(attrs={'class': 'form-control'}),
            'application': forms.TextInput(attrs={'class': 'form-control'}),
            'idc_jg': forms.TextInput(attrs={'class': 'form-control'}),
            'status': forms.TextInput(attrs={'class': 'form-control'}),
        }


class NetworkAssetForm(forms.ModelForm):
    class Meta:
        model = NetworkAsset
        fields = '__all__'
        widgets = {
          'ip': forms.TextInput(attrs={'class': 'form-control'}),
          'hostname': forms.TextInput(attrs={'class': 'form-control'}),
          'manufacturer': forms.TextInput(attrs={'class': 'form-control'}),
          'productname': forms.TextInput(attrs={'class': 'form-control'}),
          'idc_jg': forms.TextInput(attrs={'class': 'form-control'}),
          'service_tag': forms.TextInput(attrs={'class': 'form-control'}),
          'remark': forms.TextInput(attrs={'class': 'form-control'}),
        }


class IdcAssetForm(forms.ModelForm):
    class Meta:
        model = IdcAsset
        fields = '__all__'
        widgets = {
          'idc_name': forms.TextInput(attrs={'class': 'form-control'}),
          'idc_type': forms.TextInput(attrs={'class': 'form-control'}),
          'idc_location': forms.TextInput(attrs={'class': 'form-control'}),
          'contract_date': forms.TextInput(attrs={'class': 'form-control'}),
          'idc_contacts': forms.TextInput(attrs={'class': 'form-control'}),
          'remark': forms.TextInput(attrs={'class': 'form-control'}),
        }
