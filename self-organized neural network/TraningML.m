clear
filename = 'tempData_16-Aug-2017level3.mat';
[trueUnacceptable_count,falseUnacceptable_count,temp_training,temp_testing]=TrainingDataProcessNBalance(filename);
TrainingLDA(temp_training);
TrainingMLP(temp_training);
TrainingNB(temp_training);
TrainingSVM(temp_training);