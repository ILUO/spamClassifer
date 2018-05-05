
%% Initialization
clear ; close all; clc


% Extract Features
fprintf('\nstart.\n');
dataPath = './myDataset/';  
geneTxt(strcat(dataPath,'Spam/'),'processedSpam');
geneTxt(strcat(dataPath,'Ham/'),'processedHam');
