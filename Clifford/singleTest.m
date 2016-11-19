function singleTest(input_features)
IiSQI = input_features(:, 1);
IbSQI = input_features(:, 2);
IpSQI = input_features(:, 3);
IsSQI = input_features(:, 4);
IkSQI = input_features(:, 5);
IfSQI = input_features(:, 6);
IIiSQI = input_features(:, 7);
IIbSQI = input_features(:, 8);
IIpSQI = input_features(:, 9);
IIsSQI = input_features(:, 10);
IIkSQI = input_features(:, 11);
IIfSQI = input_features(:, 12);
IIIiSQI = input_features(:, 13);
IIIbSQI = input_features(:, 14);
IIIpSQI = input_features(:, 15);
IIIsSQI = input_features(:, 16);
IIIkSQI = input_features(:, 17);
IIIfSQI = input_features(:, 18);
AVRiSQI = input_features(:, 19);
AVRbSQI = input_features(:, 20);
AVRpSQI = input_features(:, 21);
AVRsSQI = input_features(:, 22);
AVRkSQI = input_features(:, 23);
AVRfSQI = input_features(:, 24);
AVLiSQI = input_features(:, 25);
AVLbSQI = input_features(:, 26);
AVLpSQI = input_features(:, 27);
AVLsSQI = input_features(:, 28);
AVLkSQI = input_features(:, 29);
AVLfSQI = input_features(:, 30);
AVFiSQI = input_features(:, 31);
AVFbSQI = input_features(:, 32);
AVFpSQI = input_features(:, 33);
AVFsSQI = input_features(:, 34);
AVFkSQI = input_features(:, 35);
AVFfSQI = input_features(:, 36);
V1iSQI = input_features(:, 37);
V1bSQI = input_features(:, 38);
V1pSQI = input_features(:, 39);
V1sSQI = input_features(:, 40);
V1kSQI = input_features(:, 41);
V1fSQI = input_features(:, 42);
V2iSQI = input_features(:, 43);
V2bSQI = input_features(:, 44);
V2pSQI = input_features(:, 45);
V2sSQI = input_features(:, 46);
V2kSQI = input_features(:, 47);
V2fSQI = input_features(:, 48);
V3iSQI = input_features(:, 49);
V3bSQI = input_features(:, 50);
V3pSQI = input_features(:, 51);
V3sSQI = input_features(:, 52);
V3kSQI = input_features(:, 53);
V3fSQI = input_features(:, 54);
V4iSQI = input_features(:, 55);
V4bSQI = input_features(:, 56);
V4pSQI = input_features(:, 57);
V4sSQI = input_features(:, 58);
V4kSQI = input_features(:, 59);
V4fSQI = input_features(:, 60);
V5iSQI = input_features(:, 61);
V5bSQI = input_features(:, 62);
V5pSQI = input_features(:, 63);
V5sSQI = input_features(:, 64);
V5kSQI = input_features(:, 65);
V5fSQI = input_features(:, 66);
V6iSQI = input_features(:, 67);
V6bSQI = input_features(:, 68);
V6pSQI = input_features(:, 69);
V6sSQI = input_features(:, 70);
V6kSQI = input_features(:, 71);
V6fSQI = input_features(:, 72);
label = input_features(:, 73);
%testing with 2 classifier approaches
% for approach=1:4
%     if approach==1
        disp('Approach One:')
        disp('==============')
        %test with NB
        inputdata=horzcat(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI);
        testLabel=TestingNB(inputdata);
        disp('Naive Bayes:')
        disp(strcat(num2str(testLabel),'|',num2str(label)));
%         %test with SVM
%         testLabel=TestingSVM(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,approach);
%         disp('Support Vector Machine:')
%         disp(strcat(num2str(testLabel),'|',num2str(label)));
%         %test with LDA
%         testLabel=TestingLDA(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,approach);
%         disp('Linear Discriminant Analysis:')
%         disp(strcat(num2str(testLabel),'|',num2str(label)));
%         %test with MLP
%         disp('Multi-Layer Perceptron neural network:')
%         testLabel=TestingMLP(1,IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,approach);
%         disp(strcat(num2str(testLabel),'|',num2str(label)));
%         disp('==============')
%     elseif approach==2
%         disp('Approach Two:')
%         disp('==============')
%         %test with NB
%         testLabel=TestingNB(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,approach);
%         disp('Naive Bayes:')
%         disp(strcat(num2str(testLabel),'|',num2str(label)));
%     elseif approach==3
%         disp('Approach Three:')
%         disp('==============')
%         %test with NB
%         testLabel=TestingNB(IiSQI,IbSQI,IpSQI,IsSQI,IkSQI,IfSQI,IIiSQI,IIbSQI,IIpSQI,IIsSQI,IIkSQI,IIfSQI,IIIiSQI,IIIbSQI,IIIpSQI,IIIsSQI,IIIkSQI,IIIfSQI,AVRiSQI,AVRbSQI,AVRpSQI,AVRsSQI,AVRkSQI,AVRfSQI,AVLiSQI,AVLbSQI,AVLpSQI,AVLsSQI,AVLkSQI,AVLfSQI,AVFiSQI,AVFbSQI,AVFpSQI,AVFsSQI,AVFkSQI,AVFfSQI,V1iSQI,V1bSQI,V1pSQI,V1sSQI,V1kSQI,V1fSQI,V2iSQI,V2bSQI,V2pSQI,V2sSQI,V2kSQI,V2fSQI,V3iSQI,V3bSQI,V3pSQI,V3sSQI,V3kSQI,V3fSQI,V4iSQI,V4bSQI,V4pSQI,V4sSQI,V4kSQI,V4fSQI,V5iSQI,V5bSQI,V5pSQI,V5sSQI,V5kSQI,V5fSQI,V6iSQI,V6bSQI,V6pSQI,V6sSQI,V6kSQI,V6fSQI,approach);
%         disp('Naive Bayes:')
%         disp(strcat(num2str(testLabel),'|',num2str(label)));
%         disp('==============')
%     %VOTE
%     else
%         disp('Approach VOTE:')
%     end
% end


