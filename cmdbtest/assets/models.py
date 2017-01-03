from django.db import models

# Create your models here.

class Asset(models.Model):

    asset_type_choices = (
        ('server', u'服务器'),
        ('networkdevice', u'网络设备'),
        ('storagedevice', u'存储设备'),
        ('securitydevice', u'安全设备'),
        ('securitydevice', u'机房设备'),
        # ('switch', u'交换机'),
        # ('router', u'路由器'),
        # ('firewall', u'防火墙'),
        # ('storage', u'存储设备'),
        # ('NLB', u'NetScaler'),
        # ('wireless', u'无线AP'),
        ('software', u'软件资产'),
        #('others', u'其它类'),
    )
    asset_type = models.CharField(choices=asset_type_choices,max_length=64, default='server')
    name = models.CharField(max_length=64,unique=True)
    sn = models.CharField(u'资产SN号',max_length=128, unique=True)
    manufactory = models.ForeignKey('Manufactory',verbose_name=u'制造商',null=True, blank=True)
    #model = models.ForeignKey('ProductModel', verbose_name=u'型号')
    #model = models.CharField(u'型号',max_length=128,null=True, blank=True )

    management_ip = models.GenericIPAddressField(u'管理IP',blank=True,null=True)

    contract = models.ForeignKey('Contract', verbose_name=u'合同',null=True, blank=True)
    trade_date = models.DateField(u'购买时间',null=True, blank=True)
    expire_date = models.DateField(u'过保修期',null=True, blank=True)
    price = models.FloatField(u'价格',null=True, blank=True)
    business_unit = models.ForeignKey('BusinessUnit', verbose_name=u'所属业务线',null=True, blank=True)
    tags = models.ManyToManyField('Tag' ,blank=True)
    admin = models.ForeignKey('UserProfile', verbose_name=u'资产管理员',null=True, blank=True)
    idc = models.ForeignKey('IDC', verbose_name=u'IDC机房',null=True, blank=True)

    status_choices = ((0,'在线'),
                      (1,'已下线'),
                      (2,'未知'),
                      (3,'故障'),
                      (4,'备用'),
                      )
    status = models.SmallIntegerField(choices=status_choices,default=0)
    #status = models.ForeignKey('Status', verbose_name = u'设备状态',default=1)
    #Configuration = models.OneToOneField('Configuration',verbose_name='配置管理',blank=True,null=True)

    memo = models.TextField(u'备注', null=True, blank=True)
    create_date = models.DateTimeField(blank=True, auto_now_add=True)
    update_date = models.DateTimeField(blank=True, auto_now=True)
    class Meta:
        verbose_name = '资产总表'
        verbose_name_plural = "资产总表"
    def __str__(self):
        return '<id:%s name:%s>'  %(self.id,self.name )


class NewAssetApprovalZone(models.Model):
    sn = models.CharField(u'资产SN号',max_length=128, unique=True)
    asset_type_choices = (
        ('server', u'服务器'),
        ('switch', u'交换机'),
        ('router', u'路由器'),
        ('firewall', u'防火墙'),
        ('storage', u'存储设备'),
        ('NLB', u'NetScaler'),
        ('wireless', u'无线AP'),
        ('software', u'软件资产'),
        ('others', u'其它类'),
    )
    asset_type = models.CharField(choices=asset_type_choices,max_length=64,blank=True,null=True)
    manufactory = models.CharField(max_length=64,blank=True,null=True)
    model = models.CharField(max_length=128,blank=True,null=True)
    ram_size = models.IntegerField(blank=True,null=True)
    cpu_model = models.CharField(max_length=128,blank=True,null=True)
    cpu_count = models.IntegerField(blank=True,null=True)
    cpu_core_count = models.IntegerField(blank=True,null=True)
    os_distribution =  models.CharField(max_length=64,blank=True,null=True)
    os_type =  models.CharField(max_length=64,blank=True,null=True)
    os_release =  models.CharField(max_length=64,blank=True,null=True)
    data = models.TextField(u'资产数据')
    date = models.DateTimeField(u'汇报日期',auto_now_add=True)
    approved = models.BooleanField(u'已批准',default=False)
    approved_by = models.ForeignKey('UserProfile',verbose_name=u'批准人',blank=True,null=True)
    approved_date = models.DateTimeField(u'批准日期',blank=True,null=True)

    def __str__(self):
        return self.sn
    class Meta:
        verbose_name = '新上线待批准资产'
        verbose_name_plural = "新上线待批准资产"

