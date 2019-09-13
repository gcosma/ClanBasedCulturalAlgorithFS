%
%File name: gBelief.m
%
%
% Programmed by Oloruntoba Oluwabunmi
% Last revised:  Sept 2019
% Reference: Oloruntoba O., Cosma G., Liotta A. (2019). Clan-based Cultural Algorithm for 
% Feature Selection. In: IEEE International Conference on Data 
% Minning (ICDM 2019), November 8-11, 2019, Beijing China
% 
% 
% This script is executed during the Global year. 
% New solutions are created across all clans based on the baset solution in
% the Global beliefspace
%   
% 
%


% disp('executing  gBelief script .... ')
% % select a certain percentage to impact
bPop  = (nPop*bGlobalRatio);
bPop1 = popCA_1(randperm(nPop,bPop));
bPop2 = popCA_2(randperm(nPop,bPop));
bPop3 = popCA_3(randperm(nPop,bPop));
bPop4 = popCA_4(randperm(nPop,bPop));

% global impact
   % sub-population 1
   gbest =  Belief.Situational.accuracy;
    parfor j = 1:size(bPop1,2)
        bdata = bPop1(j);
            if (bdata.accuracy < gbest)
                % create new solution based on the global best 
                bdata = regeneratePop(bdata,Belief,X,T); 
            end
           bPop1(j) = bdata;
    end
    bPop1 = SortPop([popCA_1; bPop1]);
    % select the best 
    popCA_1 = bPop1(1:30,1);
    % update local belief    
    start      = false;
    newBeliefs = popCA_1(1:newBeliefNo);
    worst      = popCA_1(nPop);
    b1         = UpdateBeliefSystem(b1, newBeliefs, worst, start );    
    % % % 
   % sub-population 2
    parfor j = 1:size(bPop2,2)
        bdata = bPop2(j);
            if (bdata.accuracy <  gbest)
                % create new solution based on the global best 
                bdata = regeneratePop(bdata,Belief,X,T);               
            end 
          bPop2(j) = bdata;   
    end
    bPop2 = SortPop([popCA_2; bPop2]);
    % select the best 
    popCA_2 = bPop2(1:30,1);
    % update local belief    
    start      = false;
    newBeliefs = popCA_2(1:newBeliefNo);
    worst      = popCA_2(nPop);
    b2         = UpdateBeliefSystem(b2, newBeliefs, worst, start );    
    % % % 
    % sub-population 3
    for j = 1:size(bPop3,2)
            bdata = bPop3(j) ;
            if (bdata.accuracy <  gbest )
                % create new solution based on the global best 
                bdata = regeneratePop(bdata,Belief,X,T);                 
            end  
            bdata = bPop3(j);
    end
    bPop4 = SortPop([popCA_4; bPop4]);
    % select the best 
    popCA_4 = bPop4(1:30,1);
    % update local belief    
    start      = false;
    newBeliefs = popCA_4(1:newBeliefNo);
    worst      = popCA_4(nPop);
    b4         = UpdateBeliefSystem(b4, newBeliefs, worst, start );    
    % % % 
   % sub-population 4
    parfor j = 1:size(bPop4,2)
            bdata = bPop4(j);
            if (bdata.accuracy <  gbest )
                % create new solution based on the global best 
                bdata = regeneratePop(bdata,Belief,X,T);              
            end  
           bPop4(j)= bdata ; 
    end
    bPop4 = SortPop([popCA_4; bPop4]);
    % select the best 
    popCA_4 = bPop4(1:30,1);
    % update local belief    
    start      = false;
    newBeliefs = popCA_4(1:newBeliefNo);
    worst      = popCA_4(nPop);
    b4         = UpdateBeliefSystem(b4, newBeliefs, worst, start );    
    % % % 