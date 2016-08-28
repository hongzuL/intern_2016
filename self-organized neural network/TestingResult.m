function [SEN,SPE,CR]=TestingResult(acceptableLabels_train,unacceptableLabels_train,acceptableLabels_test,unacceptableLabels_test,trueUnacceptable_count,falseUnacceptable_count)
    tp=0;
    tn=0;
    fp=0;
    fn=0;
    for m=1:length(acceptableLabels_test)
        acceptableRecord=assignLabels(acceptableLabels_train,unacceptableLabels_train,acceptableLabels_test(m));
        if acceptableRecord==1
            tp=tp+1;
        else
            fn=fn+1;
        end
    end
    for n=1:length(unacceptableLabels_test)
        acceptableRecord=assignLabels(acceptableLabels_train,unacceptableLabels_train,unacceptableLabels_test(n));
        if acceptableRecord==1
            fp=fp+1;
        else
            tn=tn+1;
        end
    end
    disp('tp:')
    disp(tp)
    disp('tn:')
    disp(tn)
    disp('fp:')
    disp(fp)
    disp('fn:')
    disp(fn)
    SEN=tp/(tp+fn);
    SPE=tn/(tn+fp);
    CR=(tp+tn)/(tp+tn+fp+fn);
    disp('sensitivity:')
    disp(SEN);
    disp('specificity:')
    disp(SPE);
    disp('correct rate:')
    disp(CR);
%     SEN(i)=tp/(tp+fn);
%     SPE(i)=tn/(tn+fp);
%     CR(i)=(tp+tn)/(tp+tn+fp+fn);
% end
% disp('sensitivity:')
% disp(mean(SEN));
% disp('specificity:')
% disp(mean(SPE));
% disp('correct rate:')
% disp(mean(CR));