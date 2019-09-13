function dummy = SortPop( popCA )
%
%File name: SortPop.m
%
%
% Programmed by Oloruntoba Oluwabunmi
% Last revised:  Sept 2019
% Reference: Oloruntoba O., Cosma G., Liotta A. (2019). Clan-based Cultural Algorithm for 
% Feature Selection. In: IEEE International Conference on Data 
% Minning (ICDM 2019), November 8-11, 2019, Beijing China
% 
% 
% Copyright (c) 2019 Oloruntoba Oluwabunmi<bunmiotoba@gmail.com>.
%
%
% This function sorts the population based on the accuracy of the solutions
% The sort is based on the highest accuracy, AUC values and least number of features 
%
%

% % disp('Sorting. Please wait ... ')
% determine the size of the population
    n = size(popCA,1);
    % create a dummy holder
    dummy = popCA;
    %% sort the resultant array based on the accuracy values of class 1
 k = 1;
    % rearrange the original data
    %stop = n-1;
     for i = 1:n-1
        for j=1: (n-i)
            m = j+1;
            % accuracy
            val1 = dummy(j).accuracy(1);
            val2 = dummy(m).accuracy(1);
            % sort in descending order
            if (val2 > val1)
                %swap the data
                t        = dummy(j);
                dummy(j) = dummy(m);
                dummy(m) = t;
            else if (val2 == val1) 
                % if the accuracy values are the same sort based on AUC
                % values
                valA1 = dummy(j).AUCval(1);
                valA2 = dummy(m).AUCval(1);
                if (valA2 > valA1)
                    %swap the data
                    t        = dummy(j);
                    dummy(j) = dummy(m);
                    dummy(m) = t;
                else if (valA2 == valA1)
                    % if accuracy and AUC values are the same, then sort 
                    % based on the least number of features selected
                    valN1 = dummy(j).nfeat;
                    valN2 = dummy(m).nfeat;
                    if (valN2 > valN1)
                         t       = dummy(j);
                        dummy(j) = dummy(m);
                        dummy(m) = t;
                    end
                    end
                end
            end    
        end
    end
 
 
end

