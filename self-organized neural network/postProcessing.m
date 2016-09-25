function input_features=postProcessing(I,II,V1,V2,V3,V4,V5,V6,level)
%% Dower transformation
    [VX,VY,VZ]=DowerTransformation(I,II,V1,V2,V3,V4,V5,V6);
%     [UTRP_all,TRP_all]=RPs(VX,VY,VZ);
%     figure(3),imagesc(UTRP_all);
%     figure(4),imshow(flip(~TRP_all,1));
    %% Multiscale recurrence analysis
    % wavelet packet decomposition
    [subs_x,subs_y,subs_z]=wpd(VX,VY,VZ,level);
    [row,col]=size(subs_x);
    if col==4
        UTRPs={4};
        TRPs={4};
        input_features=zeros(1,6*4);
        j=0;
        for i=1:4
            % get RPs(UTRP,TRP)
            [UTRP,TRP]=RPs(subs_x{i},subs_y{i},subs_z{i});
            UTRPs{i}=UTRP;
            TRPs{i}=TRP;
%             if i==1
%                 figure(1),plot3(subs_x{i},subs_y{i},subs_z{i});
%                 figure(2),imshow(flip(~TRP,1));
%             end
            % get RQA features
            [RR,DET,LMAX,ENT,LAM,TT]=RQAfeatures(TRP);
            [RR,DET,ENT,L] = Recu_RQA(TRP,0);
%             print1=strcat(num2str(RR),'||',num2str(DET),'||',num2str(ENT));
%             print2=strcat(num2str(RR_alt),'||',num2str(DET_alt),'||',num2str(ENTR_alt));
%             disp('=========================================')
%             disp(print1)
%             disp(print2)
%             disp('=========================================')
            input_features(j+1)=RR;
            input_features(j+2)=DET;
            input_features(j+3)=LMAX;
            input_features(j+4)=ENT;
            input_features(j+5)=LAM;
            input_features(j+6)=TT;
            j=j+6;
        end
    elseif col==8
        UTRPs={8};
        TRPs={8};
        input_features=zeros(1,6*8);
        j=0;
        for i=1:8
            % get RPs(UTRP,TRP)
            [UTRP,TRP]=RPs(subs_x{i},subs_y{i},subs_z{i});
            UTRPs{i}=UTRP;
            TRPs{i}=TRP;
%             if i==1
%                 figure(1),plot3(subs_x{i},subs_y{i},subs_z{i});
%                 figure(2),imshow(flip(~TRP,1));
%             end
            % get RQA features
            [RR,DET,LMAX,ENT,LAM,TT]=RQAfeatures(TRP);
            [RR,DET,ENT,L] = Recu_RQA(TRP,0);
            input_features(j+1)=RR;
            input_features(j+2)=DET;
            input_features(j+3)=LMAX;
            input_features(j+4)=ENT;
            input_features(j+5)=LAM;
            input_features(j+6)=TT;
            j=j+6;
        end
    end 