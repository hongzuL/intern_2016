function [IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label]=bootstrapingData(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,label)
    acceptableCount=sum(label==1);    
    unacceptableCount=sum(label==-1);
    %% resample
    % I II III
    IiSQI=resampleingData(IiSQI,acceptableCount,unacceptableCount,label);
    IbSQI=resampleingData(IbSQI,acceptableCount,unacceptableCount,label);
    IpSQI=resampleingData(IpSQI,acceptableCount,unacceptableCount,label);
    IsSQI=resampleingData(IsSQI,acceptableCount,unacceptableCount,label);
    IkSQI=resampleingData(IkSQI,acceptableCount,unacceptableCount,label);
    IfSQI=resampleingData(IfSQI,acceptableCount,unacceptableCount,label);
    IIiSQI=resampleingData(IIiSQI,acceptableCount,unacceptableCount,label);
    IIbSQI=resampleingData(IIbSQI,acceptableCount,unacceptableCount,label);
    IIpSQI=resampleingData(IIpSQI,acceptableCount,unacceptableCount,label);
    IIsSQI=resampleingData(IIsSQI,acceptableCount,unacceptableCount,label);
    IIkSQI=resampleingData(IIkSQI,acceptableCount,unacceptableCount,label);
    IIfSQI=resampleingData(IIfSQI,acceptableCount,unacceptableCount,label);
    IIIiSQI=resampleingData(IIIiSQI,acceptableCount,unacceptableCount,label);
    IIIbSQI=resampleingData(IIIbSQI,acceptableCount,unacceptableCount,label);
    IIIpSQI=resampleingData(IIIpSQI,acceptableCount,unacceptableCount,label);
    IIIsSQI=resampleingData(IIIsSQI,acceptableCount,unacceptableCount,label);
    IIIkSQI=resampleingData(IIIkSQI,acceptableCount,unacceptableCount,label);
    IIIfSQI=resampleingData(IIIfSQI,acceptableCount,unacceptableCount,label);
    % AVR AVL AVF
    AVRiSQI=resampleingData(AVRiSQI,acceptableCount,unacceptableCount,label);
    AVRbSQI=resampleingData(AVRbSQI,acceptableCount,unacceptableCount,label);
    AVRpSQI=resampleingData(AVRpSQI,acceptableCount,unacceptableCount,label);
    AVRsSQI=resampleingData(AVRsSQI,acceptableCount,unacceptableCount,label);
    AVRkSQI=resampleingData(AVRkSQI,acceptableCount,unacceptableCount,label);
    AVRfSQI=resampleingData(AVRfSQI,acceptableCount,unacceptableCount,label);
    AVLiSQI=resampleingData(AVLiSQI,acceptableCount,unacceptableCount,label);
    AVLbSQI=resampleingData(AVLbSQI,acceptableCount,unacceptableCount,label);
    AVLpSQI=resampleingData(AVLpSQI,acceptableCount,unacceptableCount,label);
    AVLsSQI=resampleingData(AVLsSQI,acceptableCount,unacceptableCount,label);
    AVLkSQI=resampleingData(AVLkSQI,acceptableCount,unacceptableCount,label);
    AVLfSQI=resampleingData(AVLfSQI,acceptableCount,unacceptableCount,label);
    AVFiSQI=resampleingData(AVFiSQI,acceptableCount,unacceptableCount,label);
    AVFbSQI=resampleingData(AVFbSQI,acceptableCount,unacceptableCount,label);
    AVFpSQI=resampleingData(AVFpSQI,acceptableCount,unacceptableCount,label);
    AVFsSQI=resampleingData(AVFsSQI,acceptableCount,unacceptableCount,label);
    AVFkSQI=resampleingData(AVFkSQI,acceptableCount,unacceptableCount,label);
    AVFfSQI=resampleingData(AVFfSQI,acceptableCount,unacceptableCount,label);
    % V1 V2 V3 V4 V5 V6
    V1iSQI=resampleingData(V1iSQI,acceptableCount,unacceptableCount,label);
    V1bSQI=resampleingData(V1bSQI,acceptableCount,unacceptableCount,label);
    V1pSQI=resampleingData(V1pSQI,acceptableCount,unacceptableCount,label);
    V1sSQI=resampleingData(V1sSQI,acceptableCount,unacceptableCount,label);
    V1kSQI=resampleingData(V1kSQI,acceptableCount,unacceptableCount,label);
    V1fSQI=resampleingData(V1fSQI,acceptableCount,unacceptableCount,label);
    V2iSQI=resampleingData(V2iSQI,acceptableCount,unacceptableCount,label);
    V2bSQI=resampleingData(V2bSQI,acceptableCount,unacceptableCount,label);
    V2pSQI=resampleingData(V2pSQI,acceptableCount,unacceptableCount,label);
    V2sSQI=resampleingData(V2sSQI,acceptableCount,unacceptableCount,label);
    V2kSQI=resampleingData(V2kSQI,acceptableCount,unacceptableCount,label);
    V2fSQI=resampleingData(V2fSQI,acceptableCount,unacceptableCount,label);
    V3iSQI=resampleingData(V3iSQI,acceptableCount,unacceptableCount,label);
    V3bSQI=resampleingData(V3bSQI,acceptableCount,unacceptableCount,label);
    V3pSQI=resampleingData(V3pSQI,acceptableCount,unacceptableCount,label);
    V3sSQI=resampleingData(V3sSQI,acceptableCount,unacceptableCount,label);
    V3kSQI=resampleingData(V3kSQI,acceptableCount,unacceptableCount,label);
    V3fSQI=resampleingData(V3fSQI,acceptableCount,unacceptableCount,label);
    V4iSQI=resampleingData(V4iSQI,acceptableCount,unacceptableCount,label);
    V4bSQI=resampleingData(V4bSQI,acceptableCount,unacceptableCount,label);
    V4pSQI=resampleingData(V4pSQI,acceptableCount,unacceptableCount,label);
    V4sSQI=resampleingData(V4sSQI,acceptableCount,unacceptableCount,label);
    V4kSQI=resampleingData(V4kSQI,acceptableCount,unacceptableCount,label);
    V4fSQI=resampleingData(V4fSQI,acceptableCount,unacceptableCount,label);
    V5iSQI=resampleingData(V5iSQI,acceptableCount,unacceptableCount,label);
    V5bSQI=resampleingData(V5bSQI,acceptableCount,unacceptableCount,label);
    V5pSQI=resampleingData(V5pSQI,acceptableCount,unacceptableCount,label);
    V5sSQI=resampleingData(V5sSQI,acceptableCount,unacceptableCount,label);
    V5kSQI=resampleingData(V5kSQI,acceptableCount,unacceptableCount,label);
    V5fSQI=resampleingData(V5fSQI,acceptableCount,unacceptableCount,label);
    V6iSQI=resampleingData(V6iSQI,acceptableCount,unacceptableCount,label);
    V6bSQI=resampleingData(V6bSQI,acceptableCount,unacceptableCount,label);
    V6pSQI=resampleingData(V6pSQI,acceptableCount,unacceptableCount,label);
    V6sSQI=resampleingData(V6sSQI,acceptableCount,unacceptableCount,label);
    V6kSQI=resampleingData(V6kSQI,acceptableCount,unacceptableCount,label);
    V6fSQI=resampleingData(V6fSQI,acceptableCount,unacceptableCount,label);
    %% get new label
    if(acceptableCount>unacceptableCount)
        %acceptable record more than unacceptable record, duplicate
        %unacceptable array
        Alabel=ones(acceptableCount,1);
        Ulabel=(-1)*ones(acceptableCount,1);
    elseif(acceptableCount<unacceptableCount)
        %accpetable record less than unacceptable record, duplicate
        %acceptable array
        Alabel=ones(unacceptableCount,1);
        Ulabel=(-1)*ones(unacceptableCount,1);
    else
        Alabel=ones(acceptableCount,1);
        Ulabel=(-1)*ones(unacceptableCount,1);
        %do nothing
    end
    label=vertcat(Alabel,Ulabel);
    