function [indv] = regeneratePop(indv,belief,X,T)
% 
%
%File name: regeneratePop.m
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
% This function recreates the individual solution based on the information in the belief space.
% 
% 

    % %generate individual based on the situational values
    f = find(belief.Situational.Position == 1);   
    t = zeros(1,size(indv.Position,2));
    t(f) = 1;
    indv.Position = t;
    indv.nfeat = size(find(indv.Position == 1),2);
    f1 = find(indv.Position ==1);
    X1 = X(:,(f1));
    % evaluate th solution created
    [indv.accuracy,indv.AUCval,indv.mse, ...
         indv.OPTROCPT,indv.precision,indv.F1,indv.recall] = knn(X1, T );    
end

