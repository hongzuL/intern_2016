% clear all
% load fisheriris
% X = meas(:,3:4);
% Y = species;
% tabulate(Y)
Mdl = fitcnb(X,Y,...
    'ClassNames',{'setosa','versicolor'})