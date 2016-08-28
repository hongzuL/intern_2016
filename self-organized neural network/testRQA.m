clear all,
testTRP=zeros(100);
for i=1:100
    testTRP(i,i)=1;
end
for i=1:99
    testTRP(i,i+1)=1;
end
for i=1:30
    testTRP(i,i+30)=1;
end
for i=2:99
    testTRP(i,2)=1;
end
for i=1:99
    testTRP(i,3)=1;
end
[RR,DET,LMAX,ENT,LAM,TT]=RQAfeatures(testTRP);
imshow(testTRP)