import os
import subprocess
import time

# Change this if you want to monitor a different process
process_name_ep = 'epltdqrs1.exe'
process_name_w = 'wqrs.exe'
# Separate your parameters
start_command = ['C:\Applications\Putty\kitty.exe', '-load', 'MyTunnelSession']
# Sleep time in seconds before checking again
sleep_time = 5
# saved PID list
pids=[]
start_time = time.time()
removal=False
while True:
    # Filter a list of windows process that has stopped responding
    r = os.popen('tasklist /FI "IMAGENAME eq epltdqrs1.exe"').read().strip().split('\n')
    for p in r:
        if p.startswith(process_name_ep):
            print p
            # It's a quick script so just go get the PID of the process
            d = p.split(' ')
            d.pop(0)
            i = d.pop(0)
            while not i:
                i = d.pop(0)                
            if i in pids:
                print 'epltdqrs1.exe stop working'
                #Kill by PID
                k = os.popen('taskkill /F /T /PID %s' % i).read()
                print k   
                pids.remove(i)
                removal=True
            else:
                pids.append(i)
    r = os.popen('tasklist /FI "IMAGENAME eq wqrs.exe"').read().strip().split('\n')
    for p in r:
        if p.startswith(process_name_w):
            print p
            # It's a quick script so just go get the PID of the process
            d = p.split(' ')
            d.pop(0)
            i = d.pop(0)
            while not i:
                i = d.pop(0)                
            if i in pids:
                print 'wqrs.exe stop working'
                #Kill by PID
                k = os.popen('taskkill /F /T /PID %s' % i).read()
                print k   
                pids.remove(i)
                removal=True
            else:
                pids.append(i)   
    if removal:
        pids=[]
        removal=False
        
    print 'Running time: %s' % (time.time()-start_time)
    time.sleep(sleep_time)
