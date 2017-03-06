function [trueUnacceptable_count,falseUnacceptable_count,temp_training,temp_testing]=TrainingDataProcessNBalance(filename)
    load(filename);
    [trueUnacceptable_count,falseUnacceptable_count]=straightLineErr(straigtLine_name,acceptableRecords);
    acceptable_count=0;
    unacceptable_count=0;
    acceptable_array=[];
    unacceptable_array=[];
    percent=1;
    test_acceptable_array=[];
    test_unacceptable_array=[];
    for i=1:temp_count
        curr_row=temp(i,:);
        if i<=percent*temp_count %get training set
            if curr_row(length(curr_row))==1
                acceptable_count=acceptable_count+1;
                acceptable_array=[acceptable_array;curr_row(1:length(curr_row)-1)];       
            else
                unacceptable_count=unacceptable_count+1;
                unacceptable_array=[unacceptable_array;curr_row(1:length(curr_row)-1)];  
            end
        else %get testing set
            if curr_row(length(curr_row))==1
                acceptable_count=acceptable_count+1;
                test_acceptable_array=[test_acceptable_array;curr_row(1:length(curr_row)-1)];       
            else
                unacceptable_count=unacceptable_count+1;
                test_unacceptable_array=[test_unacceptable_array;curr_row(1:length(curr_row)-1)];  
            end
        end
    end
    %balance data
    unacceptable_array = datasample(unacceptable_array,length(acceptable_array(:,1)),'Replace',true);
    acceptable_array = horzcat(acceptable_array,ones(length(acceptable_array(:,1)),1));
    unacceptable_array = horzcat(unacceptable_array,zeros(length(unacceptable_array),1)-1);
    temp_training=vertcat(acceptable_array,unacceptable_array);
    test_acceptable_array = horzcat(test_acceptable_array,ones(length(test_acceptable_array),1));
    test_unacceptable_array = horzcat(test_unacceptable_array,zeros(length(test_unacceptable_array),1)-1);
    temp_testing = vertcat(test_acceptable_array,test_unacceptable_array);