function [UTRP,TRP]=RPs(MDC_ECG_LEAD_VX,MDC_ECG_LEAD_VY,MDC_ECG_LEAD_VZ)
    len=length(MDC_ECG_LEAD_VX);
    UTRP=zeros(len);
    TRP=zeros(len);
    for i=1:len
        xi=[MDC_ECG_LEAD_VX(i) MDC_ECG_LEAD_VY(i) MDC_ECG_LEAD_VZ(i)];
        for j=1:len
            xj=[MDC_ECG_LEAD_VX(j) MDC_ECG_LEAD_VY(j) MDC_ECG_LEAD_VZ(j)];
            UTRP(i,j)=norm(xi-xj);
        end
    end
    threshold=(5/100)*max(max(UTRP));
%     disp(threshold);
    for i=1:len
        for j=1:len
            TRP(i,j)=heaviside(threshold-UTRP(i,j));
        end
    end  
