# -*- coding:utf-8 -*-

import os, sys, platform

if platform.system() == "Windows":
    BASE_DIR = '\\'.jion(os.path.abspath(os.path.dirname(__file__)).split('\\')[:-1])
    print BASE_DIR
else:
    BASE_DIR = '/'.jion(os.path.abspath(os.path.dirname(__file__)).split('/')[:-1])

sys.path.append(BASE_DIR)

from core import HouseStark


if __name__ == '__main__':
    HouseStark.ArgvHandler(sys.argv)