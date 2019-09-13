%
%File name: nonMatePop.m
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
% % 
%  This script is  executed during normal year of the CCA. 
%  Evolution occurs within each clan during normal year. 
%  Each individual solution is assessed and the change operator is applied.
%  
%

%  Change Operator: Adapted from Oloruntoba O. and Cosma G.(2019). Cultural 
%  Algorithm for Feature Selection of Biomedical Datasets. In 'Intelligent
%  Computing 2019'. doi: https://doi.org/10.1007/978-3-030-22868-2_13 
% 
%      
        %  if individual is less than best
        lbest = b1.Situational.accuracy;        
        parfor j = 1:nPop
            % sub-population 1
            data  = popCA_1(j);
            if (data.accuracy < lbest)                 
                %apply change operator (flip the values at the gene location)%                 
                 f = randperm(featSize, nChange);
                for i=1:size(f,2)
                   data.Position(f(i)) = mod(( data.Position(f(i)))+1,2);
                end
                f1 = find(data.Position ==1);
                data.nfeat = size(f1,2);
                X1 = X(:,(f1));
                [data.accuracy, data.AUCval,data.mse, ...
                    data.OPTROCPT,data.precision,data.F1,data.recall ] = knn(X1, T );
            end
            popCA_1(j) = data;
        end            
            % % update the belief system
            popCA_1 = SortPop(popCA_1);
            newBeliefs = popCA_1(1:newBeliefNo);
            worst = popCA_1(nPop);
            b1 = UpdateBeliefSystem(b1, newBeliefs, worst, start);
%        
            % % %
%            
        lbest = b2.Situational.accuracy;        
        parfor j = 1:nPop
            
            data = popCA_2(j);
            if (data.accuracy <  lbest)                                
                %apply change operator (flip the values in the gene location)
                f = randperm(featSize, nChange);
                for i=1:size(f,2)
                   data.Position(f(i)) = mod(( data.Position(f(i)))+1,2);
                end
                %re-evaluate individual
                f1 = find(data.Position ==1);
                data.nfeat = size(f1,2);
                X1 = X(:,(f1));
                [data.accuracy,data.AUCval,data.mse, ...
                    data.OPTROCPT, data.precision,data.F1,data.recall] = knn(X1, T );
            end
            popCA_2(j) = data;
        end
            popCA_2 = SortPop(popCA_2);
            newBeliefs = popCA_2(1:newBeliefNo);
            worst = popCA_2(nPop);
            b2 = UpdateBeliefSystem(b2, newBeliefs, worst, start);
%        
            % % %
%            
        lbest = b3.Situational.accuracy;
        parfor j = 1:nPop
            data = popCA_3(j);
            % sub-population 3
            if (data.accuracy <  lbest)                
                %apply change operator (flip the values at the gene location)
                f = randperm(featSize, nChange);
                for i=1:size(f,2)
                   data.Position(f(i)) = mod(( data.Position(f(i)))+1,2);
                end
                %reevaluate individual
                f1 = find(data.Position ==1);
                data.nfeat = size(f1,2);
                X1 = X(:,(f1));
                [data.accuracy,data.AUCval,data.mse, ...
                    data.OPTROCPT,data.precision,data.F1,data.recall] = knn(X1, T );
            end
            popCA_3(j) = data;
        end
            popCA_3 = SortPop(popCA_3);
            newBeliefs = popCA_3(1:newBeliefNo);
            worst = popCA_3(nPop);
            b3 = UpdateBeliefSystem(b3, newBeliefs, worst, start);
%        
            % % %
%             
         lbest = b4.Situational.accuracy;
        parfor j = 1:nPop
            % sub-population 4
            data = popCA_4(j);
            if (data.accuracy < lbest)               
                %apply change operator (flip the values at the gene location)
                f = randperm(featSize, nChange);
                for i=1:size(f,2)
                   data.Position(f(i)) = mod(( data.Position(f(i)))+1,2);
                end
                %reevaluate individual
                f1 = find(data.Position ==1);
                data.nfeat = size(f1,2);
                X1 = X(:,(f1));
                [data.accuracy,data.AUCval,data.mse, ...
                    data.OPTROCPT,data.precision,data.F1,data.recall] = knn(X1, T );
            end
            popCA_4(j) = data;
        end     
               
            popCA_4 = SortPop(popCA_4);
            newBeliefs = popCA_4(1:newBeliefNo);
            worst = popCA_4(nPop);
            b4 = UpdateBeliefSystem(b4, newBeliefs, worst, start);
            
    %% Cleanup
% delete all temporary variables
clear data lbest f1 ;     
clear worst newBeliefs ;