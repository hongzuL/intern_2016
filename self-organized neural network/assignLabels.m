function bool=assignLabels(acceptableLabels_train,unacceptableLabels_train,label)
    acceptableVote=sum(acceptableLabels_train==label);
    unacceptableVote=sum(unacceptableLabels_train==label);
    if acceptableVote>=(acceptableVote+unacceptableVote)/2
        bool=1;
    else 
        bool=0;
    end
%     if acceptableVote>unacceptableVote
%         bool=1;
%     elseif acceptableVote<unacceptableVote
%         bool=0;
%     else
%         % if appear eaqual times make is unacceptable first
%         bool=0;
%     end
