function [bStruct] = getBeliefStructure()
%
%File name: getBeliefStructure.m
%
%
% Programmed by Oloruntoba Oluwabunmi
% Last revised:  Sept 2019
% Reference: Oloruntoba O., Cosma G., Liotta A. (2019). Clan-based Cultural Algorithm for 
% Feature Selection. In: IEEE International Conference on Data 
% Minning (ICDM 2019), November 8-11, 2019, Beijing China
% 
% 
%  This function returns the structure of a beliefspace
%   
%

 % situational knowledge
Belief.Situational.Position  = []; % 
Belief.Situational.nfeat     = 0;  % the number of features in the individual solution
Belief.Situational.accuracy  = []; % store the accruracy values for each class
Belief.Situational.AUCval    = []; % the AUC values of the individual
Belief.Situational.OPTROCPT  = []; % the TPR and FPR values 
Belief.Situational.precision = []; % the precion value
Belief.Situational.recall    = []; % the precion value
Belief.Situational.F1        = []; % the F1 values 
Belief.Situational.mse       = []; % define the error for each class

  % max
Belief.Normative.Min.Position  = [];
Belief.Normative.Min.nfeat     = 0;
Belief.Normative.Min.accuracy  = [];
Belief.Normative.Min.AUCval    = []; % records the AUC values for the training and test data
Belief.Normative.Min.OPTROCPT  = []; % The TPR and FNR values 
Belief.Normative.Min.precision = []; % the precion value
Belief.Normative.Min.F1        = []; % the F1 values 
Belief.Normative.Min.mse       = []; % records the mean square error of the training and test data
  % min 
Belief.Normative.Max.Position  = [];
Belief.Normative.Max.nfeat     = 0;
Belief.Normative.Max.accuracy  = [];
Belief.Normative.Max.AUCval    = []; % records the AUC values for the training and test data
Belief.Normative.Max.OPTROCPT  = []; % The TPR and FNR values 
Belief.Normative.Min.precision = []; % the precion value
Belief.Normative.Min.F1        = []; % the F1 values 
Belief.Normative.Max.mse       = []; % records the mean square error of the training and test data


bStruct = Belief;

end

