from os import listdir
from os.path import isfile, join
mypath = '/Users/Hongzu/Documents/internship2016/Tools/OurECGdata'
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
good = open('RECORDS-acceptable','w')
bad = open('RECORDS-unacceptable','w')
for i in onlyfiles:
	filename = i.split('.')[0]
	if filename.endswith('1'):
		good.write(filename+'\n')
	elif filename.endswith('2'):
		bad.write(filename+'\n')
	elif filename.endswith('3'):
		bad.write(filename+'\n')
	elif filename.endswith('4'):
		bad.write(filename+'\n')

good.close()
bad.close()