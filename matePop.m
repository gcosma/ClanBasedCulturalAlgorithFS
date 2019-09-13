%
%File name: matePop.m
%
% Programmed by Oloruntoba Oluwabunmi
% Last revised:  Sept 2019
% Reference: Oloruntoba O., Cosma G., Liotta A. (2019). Clan-based CUltural Algorithm for Feature Selection. In:
% IEEE International Conference on Data Minning (ICDM 2019), November 8-11, 2019, Beijing China
% 
% Copyright (c) 2019 Oloruntoba Oluwabunmi<bunmiotoba@gmail.com>.
%
% 
% This script is to perform migration and mating of the clans
% 
% This is an adaptation of the ChangeOperator designed by
% Oloruntoba o. and Coasma G. (2019) Modified Cultural Algorithm for
% Feature Selection of Biomedical Datasets. In: Advances in Intelligent
% Computing.
%% Migration
% generate the mating index 
migIndex = getMigration(migIndv,nPop);
% structure of the offspring
indv.Position  = []; % 
indv.nfeat     = 0;  % the number of features in the individual solution
indv.accuracy  = []; % store the accruracy values for each class
indv.AUCval    = []; % the AUC values of the individual
indv.OPTROCPT  = []; % the TPR and FPR values 
indv.precision = []; % the precion value
indv.recall    = []; % the precion value
indv.F1        = []; % the F1 values 
indv.mse       = []; % define the mean squared error for each class
% create the structure of the offsprings
o1 = repmat(indv,1,1);
o2 = repmat(indv,1,1);

mPerc = 0.10;% mutation percentage 

% randomly select the migrating individuals
for i = 1:subpop
    if (i == 1)
        m = randperm(nPop,migPopT); 
        mig1 = popCA_1(m); 
        m11(i).m = m;
    else if(i==2)
                m = randperm(nPop,migPopT); 
                mig2 = popCA_2(m);  
                m11(i).m = m;
        else if (i==3)
                  m = randperm(nPop,migPopT); 
                  mig3 = popCA_3(m); 
                  m11(i).m = m;
            else if (i==4)
                    m = randperm(nPop,migPopT); 
                    mig4= popCA_4(m);  
                    m11(i).m = m;
                end
            end
        end
    end
end
% % assign to destination populations
i1=0; i2=0; i3=0; i4=0;
for j=1:subpop
    for k=1:migPopT
        if (migIndex(k,j) == 1)
            i1 = i1+1;
            mPop1(1,(i1)) = mig1(k);
        else if (migIndex(k,j) == 2)
                i2 = i2+1;
            mPop2((i2)) = mig2(k);
            else if (migIndex(k,j) == 3) 
                    i3 = i3+1;
                mPop3((i3)) = mig3(k);
                else if (migIndex(k,j) == 4) 
                        i4 = i4+1;
                       mPop4((i4)) = mig4(k);
                    end
                end
            end
        end
    end
end
%% Mating
% % randomly select mating pairs for each population
mate1 = popCA_1(randperm(nPop,min(nPop, size(mPop1,2))));
mate2 = popCA_2(randperm(nPop,min(nPop, size(mPop2,2))));
mate3 = popCA_3(randperm(nPop,min(nPop, size(mPop3,2))));
mate4 = popCA_4(randperm(nPop,min(nPop, size(mPop4,2))));

% % perform crossover using multi-point crossover
%
nCrpt = 3; % 3-point crossover
% subpopulation 1
    crpt = sort(randperm(featSize, nCrpt)); % randomly select the crossover point
    index = 1;
    mT = size(mate1,1);
    for i = 1:mT  % perform crossover
        p1 = mate1(i); 
        p2 = mPop1(i);
        a1 = [p1.Position(1,(1:crpt(1,1))),p2.Position(1,(crpt(1,1)+1:(crpt(1,2)))),...
                p1.Position(1,(crpt(1,2)+1:(crpt(1,3)))),p1.Position(1,(crpt(1,3)+1:featSize))];
        a2 = [p2.Position(1,(1:crpt(1,1))),p1.Position(1,(crpt(1,1)+1:(crpt(1,2)))),...
                p2.Position(1,(crpt(1,2)+1:(crpt(1,3)))),p1.Position(1,(crpt(1,3)+1:featSize))];
        o1.Position = a1;
        o2.Position = a2;
        o1.nfeat = size(find(o1.Position == 1),2);
        o2.nfeat = size(find(o2.Position == 1),2);
        % When no features are selected
        if o1.nfeat == 0
            o1.accuracy = 0;
            o1.AUCval   = 0;
            o1.OPTROCPT = 0;
        else
            %assess the offsprings
            X1 = X(:,(find(o1.Position ==1)));
            [o1.accuracy,o1.AUCval,o1.mse, ...
                    o1.OPTROCPT,o1.precision,o1.F1,o1.recall] = knn(X1, T );
        end
        % When no features are selected
        if o2.nfeat == 0
            o2.accuracy = 0;
            o2.AUCval   = 0;
            o2.OPTROCPT = 0;
        else            
            X1 = X(:,(find(o2.Position ==1)));
            [o2.accuracy,o2.AUCval,o2.mse, ...
                    o2.OPTROCPT,o2.precision,o2.F1,o2.recall] = knn(X1, T );
        end
        off1(index,1)    = o1;
        off1(index+1,1)  = o2;
        index = index+2;
    end
    % mutation 
    mutPop1 = off1(randperm(size(off1,1),round(mPerc * size(off1,1))));
    parfor i = 1:size(mutPop1,1)
        f = randperm(featSize, round((featSize*mPerc)));
        mutPop1(i).Position(f) = 0;
        %reassess 
        X1 = X(:,(find(mutPop1(i).Position ==1)));
        [mutPop1(i).accuracy,mutPop1(i).AUCval,mutPop1(i).mse, ...
             mutPop1(i).OPTROCPT,mutPop1(i).precision,mutPop1(i).F1,mutPop1(i).recall] = knn(X1, T );
    end
    % merge all the solutions and sort 
    sol1 = SortPop([popCA_1;off1;mutPop1]);
    popCA_1 = sol1(1:30,1);  % select the top solutions  
    
    % % subpopulation 2
    index = 1;
    mT = size(mate2,1);
    for i = 1:mT
        p1 = mate2(i); 
        p2 = mPop2(i);
        a1 = [p1.Position(1,(1:crpt(1))),p2.Position(1,(crpt(1)+1:(crpt(2)))),...
            p1.Position(1,(crpt(2)+1:(crpt(3)))),p2.Position(1,(crpt(3)+1:featSize))];
        a2 = [p2.Position(1,(1:crpt(1))),p1.Position(1,(crpt(1)+1:(crpt(2)))),...
            p2.Position(1,(crpt(2)+1:(crpt(3)))),...
            p1.Position(1,(crpt(3)+1:featSize))];
        o1.Position = a1;
        o2.Position = a2;
        % When no features are selected
        if o1.nfeat == 0
           o1.accuracy = 0;
           o1.AUCval=0;
           o1.OPTROCPT = 0;
        else            
            %assess the offsprings
            X1 = X(:,(find(o1.Position ==1)));
            [o1.accuracy,o1.AUCval,o1.mse, ...
                        o1.OPTROCPT,o1.precision,o1.F1,o1.recall] = knn(X1, T );
        end
        % When no features are selected
        if o2.nfeat == 0
            o2.accuracy = 0;
            o2.AUCval   = 0;
            o2.OPTROCPT = 0;
        else            
            X1 = X(:,(find(o2.Position ==1)));
            [o2.accuracy,o2.AUCval,o2.mse, ...
                    o2.OPTROCPT,o2.precision,o2.F1,o2.recall] = knn(X1, T );
        end
        off2(index,1)    = o1;
        off2(index+1,1)  = o2;
        index = index+2;
    end
    % mutation 
    mutPop2 = off2(randperm(size(off2,1),round(mPerc * size(off2,1))));
    parfor i = 1:size(mutPop2,1)
        f = randperm(featSize, round((featSize*mPerc)));
        mutPop2(i).Position(f) = 0;
        %reassess 
        X1 = X(:,(find(mutPop2(i).Position ==1)));
        [mutPop2(i).accuracy,mutPop2(i).AUCval,mutPop2(i).mse, ...
                    mutPop2(i).OPTROCPT,mutPop2(i).precision,mutPop2(i).F1,mutPop2(i).recall] = knn(X1, T );
    end
    % merge  all the solutions
    sol2 = SortPop([popCA_2;off2;mutPop2]);
    popCA_2 = sol2(1:30,1);  % select the top solutions  
    
    % % subpop 3
    index = 1;
    mT = size(mate3,1);    
    for i = 1:size(mate3,1)
        p1 = mate3(i); 
        p2 = mPop3(i);        
        a1 = [p1.Position(1,(1:crpt(1))),p2.Position(1,(crpt(1)+1:(crpt(2)))),p1.Position(1,(crpt(2)+1:(crpt(3)))),p2.Position(1,(crpt(3)+1:featSize))];
        a2 = [p2.Position(1,(1:crpt(1))),p1.Position(1,(crpt(1)+1:(crpt(2)))),p2.Position(1,(crpt(2)+1:(crpt(3)))),p1.Position(1,(crpt(3)+1:featSize))];
         o1.Position = a1;
        o2.Position = a2;
        % When no features are selected
        if o1.nfeat == 0
            o1.accuracy = 0;
            o1.AUCval=0;
            o1.OPTROCPT = 0;            
        else  
            %assess the offsprings
            X1 = X(:,(find(o1.Position ==1)));
            [o1.accuracy,o1.AUCval,o1.mse, ...
                        o1.OPTROCPT,o1.precision,o1.F1,o1.recall] = knn(X1, T );
        end
        % When no features are selected
        if o2.nfeat == 0
            o2.accuracy = 0;
            o2.AUCval=0;
            o2.OPTROCPT = 0;
        else 
            X1 = X(:,(find(o2.Position ==1)));
            [o2.accuracy,o2.AUCval,o2.mse, ...
                        o2.OPTROCPT,o2.precision,o2.F1,o2.recall] = knn(X1, T );
        end
        off3(index,1)    = o1;
        off3(index+1,1)  = o2;
        index = index+2;
    end
    % mutation 
    mutPop3 = off3(randperm(size(off3,1),round(mPerc * size(off3,1))));
    parfor i = 1:size(mutPop3,1)
        f = randperm(featSize, round((featSize*mPerc)));
        mutPop3(i).Position(f) = 0;
        %reassess 
        X1 = X(:,(find(mutPop3(i).Position ==1)));
        [mutPop3(i).accuracy,mutPop3(i).AUCval,mutPop3(i).mse, ...
                    mutPop3(i).OPTROCPT,mutPop3(i).precision,mutPop3(i).F1,mutPop3(i).recall] = knn(X1, T );
    end
    % merge the all solutions
    sol3 = SortPop([popCA_3;off3;mutPop3]);
    popCA_3 = sol3(1:30,1);  % select the top solutions  
    
    % % subpop 4
    index = 1;
        mT = size(mate4,1);
    for i = 1:size(mate4,2)
        p1 = mate4(i); 
        p2 = mPop4(i);
        a1 = [p1.Position(1,(1:crpt(1))),p2.Position(1,(crpt(1)+1:(crpt(2)))),p1.Position(1,(crpt(2)+1:(crpt(3)))),p2.Position(1,(crpt(3)+1:featSize))];
        a2 = [p2.Position(1,(1:crpt(1))),p1.Position(1,(crpt(1)+1:(crpt(2)))),p2.Position(1,(crpt(2)+1:(crpt(3)))),p1.Position(1,(crpt(3)+1:featSize))];
        o1.Position = a1;
        o2.Position = a2;
        % When no features are selected
        if o1.nfeat == 0
            o1.accuracy = 0;
            o1.AUCval=0;
            o1.OPTROCPT = 0;
        else 
            %assess the offsprings
            X1 = X(:,(find(o1.Position ==1)));
            [o1.accuracy,o1.AUCval,o1.mse, ...
                        o1.OPTROCPT,o1.precision,o1.F1,o1.recall] = knn(X1, T );
        end
        % When no features are selected
        if o2.nfeat == 0
            o2.accuracy = 0;
            o2.AUCval=0;
            o2.OPTROCPT = 0;
        else  
            X1 = X(:,(find(o2.Position ==1)));
            [o2.accuracy,o2.AUCval,o2.mse, ...
                   o2.OPTROCPT,o2.precision,o2.F1,o2.recall] = knn(X1, T );
        end
        off4(index,1)    = o1;
        off4(index+1,1)  = o2;
        index = index+2;
    end
    % mutation 
    mutPop4 = off4(randperm(size(off4,1),round(mPerc * size(off4,1))));
    parfor i = 1:size(mutPop4,1)
        f = randperm(featSize, round((featSize*mPerc)));
        mutPop4(i).Position(f) = 0;
        %reassess 
        X1 = X(:,(find(mutPop4(i).Position ==1)));
        [mutPop4(i).accuracy,mutPop4(i).AUCval,mutPop4(i).mse, ...
                    mutPop4(i).OPTROCPT,mutPop4(i).precision,mutPop4(i).F1,mutPop4(i).recall] = knn(X1, T );
    end
    % merge the all solutions
    sol4 = SortPop([popCA_4;off4;mutPop4]);
    popCA_4 = sol4(1:30,1);  % select the top solutions  

%%%%%%%%%%%%%%%%%%%%

%% Cleanup
% delete all temporary variables
clear sol1 sol2 sol3 sol4;
clear p1 p2 o1 o2 a1 a2 mT index crpt;
clear off1  off2  off3 off4 ;
clear mate1 mate2 mate3 mate4;
