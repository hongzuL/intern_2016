import glob, os

def generateCSV(fileName):
    firstLine="TIME_ABSOLUTE,MDC_ECG_LEAD_I,MDC_ECG_LEAD_II,MDC_ECG_LEAD_III,MDC_ECG_LEAD_AVR,MDC_ECG_LEAD_AVL,MDC_ECG_LEAD_AVF,MDC_ECG_LEAD_V1,MDC_ECG_LEAD_V2,MDC_ECG_LEAD_V3,MDC_ECG_LEAD_V4,MDC_ECG_LEAD_V5,MDC_ECG_LEAD_V6\n"
    fin=open(fileName,'r')
    fileName=fileName.split('.')[0]
    fout=open(fileName+'.csv','w')
    fout.write(firstLine)
    for line in fin:
        fout.write(line)
    fin.close()
    fout.close()
    


if __name__ == "__main__":
    os.chdir("data2/")
    for fileName in glob.glob("*.txt"):
        generateCSV(fileName)
