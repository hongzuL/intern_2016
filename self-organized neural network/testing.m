clear
load('TrainingData.mat')
R=10;
test_acceptable_array=acceptable_array; %get test data
test_unacceptable_array=unacceptable_array;
temp_alabel_train=[];
temp_ulabel_train=[];
temp_alabel_test=[];
temp_ulabel_test=[];
for l=1:R
    unacceptable_array = datasample(unacceptable_array,acceptable_count,'Replace',true);
    [temp_acceptableLabels_train,temp_unacceptableLabels_train,temp_acceptableLabels_test,temp_unacceptableLabels_test]=SOMcluster(acceptable_array,unacceptable_array,test_acceptable_array,test_unacceptable_array);
    temp_alabel_train=[temp_alabel_train;temp_acceptableLabels_train'];
    temp_ulabel_train=[temp_ulabel_train;temp_unacceptableLabels_train'];
    temp_alabel_test=[temp_alabel_test;temp_acceptableLabels_test'];
    temp_ulabel_test=[temp_ulabel_test;temp_unacceptableLabels_test'];
end
acceptableLabels_train=zeros(length(temp_acceptableLabels_train),1);
unacceptableLabels_train=zeros(length(temp_unacceptableLabels_train),1);
acceptableLabels_test=zeros(length(temp_acceptableLabels_test),1);
unacceptableLabels_test=zeros(length(temp_unacceptableLabels_test),1);
for h=1:length(acceptableLabels_train)
    acceptableLabels_train(h)=mode(temp_alabel_train(:,h));     
end
for g=1:length(unacceptableLabels_train)
    unacceptableLabels_train(g)=mode(temp_ulabel_train(:,g));
end
for e=1:length(acceptableLabels_test)
    acceptableLabels_test(e)=mode(temp_alabel_test(:,e));     
end
for f=1:length(unacceptableLabels_test)
    unacceptableLabels_test(f)=mode(temp_ulabel_test(:,f));
end
[SEN,SPE,CR]=TestingResult(acceptableLabels_train,unacceptableLabels_train,acceptableLabels_test,unacceptableLabels_test,trueUnacceptable_count,falseUnacceptable_count);
