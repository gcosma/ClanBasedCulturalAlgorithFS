%
%File name: preprocess_data.m
%
%
% Programmed by Oloruntoba Oluwabunmi
% Last revised:  Sept 2019
% Reference: Oloruntoba O., Cosma G., Liotta A. (2019). Clan-based Cultural Algorithm for 
% Feature Selection. In: IEEE International Conference on Data 
% Minning (ICDM 2019), November 8-11, 2019, Beijing China
% 
% Copyright (c) 2019 Oloruntoba Oluwabunmi<bunmiotoba@gmail.com>.
%
% 
% Script to process the datasets to be used. 
% This script is called at the start of the program. 
%  All data preprocessing is performed here before the CCA algorithm starts
%
% 
% As a sample, the MATLAB humanactivity sample dataset is used.  


%% load the data
load humanactivity.mat; 
X = feat;
T = actid;
% remove all unnecessary data variables
clearvars featlabels feat Description actnames actid;

