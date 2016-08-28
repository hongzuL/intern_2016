function [VX,VY,VZ]=DowerTransformation(I,II,V1,V2,V3,V4,V5,V6)
    Dinv=[-0.172 -0.074 0.122 0.231 0.239 0.194 0.156 -0.010;
    0.057 -0.019 -0.106 -0.022 0.041 0.048 -0.227 0.887;
    -0.229 -0.310 -0.246 -0.063 0.055 0.108 0.022 0.102];
    len=length(I);
    VX=zeros(len,1);
    VY=zeros(len,1);
    VZ=zeros(len,1);
    for i=1:len
        ECG=[I(i);II(i);V1(i);V2(i);V3(i);V4(i);V5(i);V6(i)];
        % Dower transformation
        VCG=Dinv*ECG;
        VX(i)=VCG(1);
        VY(i)=VCG(2);
        VZ(i)=VCG(3);
    end