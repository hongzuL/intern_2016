clear
load('TrainingData.mat')
R=10;
test_acceptable_array=acceptable_array; %get test data
test_unacceptable_array=unacceptable_array;
temp_alabel_test=[];
temp_ulabel_test=[];
for l=1:R
    [temp_acceptableLabels_test,temp_unacceptableLabels_test]=SOMValidate(test_acceptable_array,test_unacceptable_array,net);
    temp_alabel_test=[temp_alabel_test;temp_acceptableLabels_test'];
    temp_ulabel_test=[temp_ulabel_test;temp_unacceptableLabels_test'];
end
acceptableLabels_test=zeros(length(temp_acceptableLabels_test),1);
unacceptableLabels_test=zeros(length(temp_unacceptableLabels_test),1);
for e=1:length(acceptableLabels_test)
    acceptableLabels_test(e)=mode(temp_alabel_test(:,e));     
end
for f=1:length(unacceptableLabels_test)
    unacceptableLabels_test(f)=mode(temp_ulabel_test(:,f));
end
[SEN,SPE,CR]=TestingResult(acceptableLabels,unacceptableLabels,acceptableLabels_test,unacceptableLabels_test,trueUnacceptable_count,falseUnacceptable_count);
