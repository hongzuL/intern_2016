for i=1:25
    if assignLabels(acceptableLabels_train,unacceptableLabels_train,i)==1
        disp(i)
    end
end