

import wmi

ip = "192.168.33.29"
user = "administrator"
password = "IIS12esxi"

print "Establishing connection to %s" %ip
conn = wmi.WMI(computer=ip, user=user, password=password)

'''
for process in conn.Win32_Process():
    print process.ProcessId, process.Name

'''

filename =r"D:\auto_fabu\test.bat"
cmd_callbat = r"cmd /c call %s" %filename


process_id, result = conn.Win32_Process.Create(CommandLine=cmd_callbat)

if result == 0:
    print "Process started successfully: %d" % process_id

print process_id, result






