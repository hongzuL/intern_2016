function [RR,DET,LMAX,ENT,LAM,TT]=RQAfeatures(TRP)
    RR=0;DET=0;LMAX=0;ENT=0;LAM=0;TT=0;
    % calculate RR
    len=length(TRP(1,:));
    rp_sum=0;
    for i=1:len
        for j=1:len
            rp_sum=rp_sum+TRP(i,j);
        end
    end
    RR=(1/len^2)*rp_sum;
    % calculate DET and LMAX
    if rp_sum==0
        DET=0;
    else
        diagonals=[];
        diagonal_num=0;
        lmin=2;
        LMAX=0;
        l=1;
        diagonal_sum=0;
        for i=1:len-1
            for j=1:len-1
                if TRP(i,j)==1
                    if i~=j
                        if i==1 || j==1 %this is the start of a diagonal
                            m=i+1;
                            n=j+1;
                            while 1
                                if m>len || n>len
                                    break;
                                end
                                if TRP(m,n)==0
                                    break;
                                end
                                if TRP(m,n)==1
                                    l=l+1;
                                    m=m+1;
                                    n=n+1;
                                end
                            end
                        else
                            if TRP(i-1,j-1)==0
                                m=i+1;
                                n=j+1;
                                while 1
                                    if m>len || n>len
                                        break;
                                    end
                                    if TRP(m,n)==0
                                        break;
                                    end
                                    if TRP(m,n)==1
                                        l=l+1;
                                        m=m+1;
                                        n=n+1;
                                    end
                                end
                            end
                        end
                    end
                end
                if l>=lmin
                    diagonal_sum=diagonal_sum+l;
                    diagonal_num=diagonal_num+1;
                    diagonals=[diagonals l];
                    if l>LMAX
                        LMAX=l; 
                    end
                    l=1;
                end
            end
        end
        DET=diagonal_sum/rp_sum;
        diagonals=sort(diagonals);
    end
    % calculate ENT
    ENT=0;
    if rp_sum==0
        ENT=0;
    elseif diagonal_num==0
        ENT=0;
    else
        [count,lines]=hist(diagonals,unique(diagonals));
        for i=1:length(lines)
            pl=count(i)/diagonal_num;
            if pl~=0
                ENT=ENT+pl*log(pl);
            end
        end
    end
    ENT=-ENT;
    % calculate LAM & TT
    if rp_sum==0
        LAM=0;
        TT=0;
    else
        vertical_num=0;
        vertical_sum=0;
        vmin=2;
        v=0;     
        for i=1:len
            for j=1:len
                if TRP(i,j)==1
                    v=v+1;
                else
                    if v>=vmin
                        vertical_num=vertical_num+1;
                        vertical_sum=vertical_sum+v;
                    end
                    v=0;
                end
            end
        end
        LAM=vertical_sum/rp_sum;
        if vertical_num==0
            TT=0;
        else
            TT=vertical_sum/vertical_num;
        end
    end
