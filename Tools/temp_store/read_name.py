from os import listdir
from os.path import isfile, join
mypath = '/Users/Hongzu/Desktop/temp_store/'
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
good = open('goodFile.txt','w')
bad = open('badFile.txt','w')
for i in onlyfiles:
	filename = i.split('.')[0]
	if filename.endswith('1'):
		good.write(filename+'\n')
	else:
		bad.write(filename+'\n')



good.close()
bad.close()