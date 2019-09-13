%
%File name: CCA.m
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
% 
%% The Clan-Based Cultural Algorithm, CCA
% The CCA algorithm is an adaptation of the Cultural Algorithm to model 
% clan-based social  interactions. 
% It is designed for feature selection.
% 
% This model uses a parallel for-loop to leverage multiprocessors 
% 
%
%
%
%% clear the workspace
 clc; clear; close all;
%% Algorithm Parameters 

disp('  ')
disp('Loading data ... ')

% % Load the data
preprocess_data;

nLoop = 1; % number of repeats
for loop = 1:nLoop

% % % define the structure of an individual solution
indv.Position  = []; % 
indv.nfeat     = 0;  % the number of features in the individual solution
indv.accuracy  = []; % store the accruracy values for each class
indv.AUCval    = []; % the AUC values of the individual
indv.OPTROCPT  = []; % the TPR and FPR values 
indv.precision = []; % the precion value
indv.recall    = []; % the precion value
indv.F1         = []; % the F1 values 
indv.mse       = []; % define the error matrix 

% % % define the structure of a Belief space
Belief = getBeliefStructure();
subpop = 4; % % % number of sub populations 
nsub = 1; 
% define the parameters for the belief space for each subpopulations or
% clans
bSubRatio     = 0.3 ; % 30% of the total population are considerd for adoption into the beliefspace
bGlobalRatio  = 0.3;  % defines the percentage of population the global influence affects in each clan
bGlobalYears = 10; % define the number of years for global influence to affect the society

% % create the population placeholders
nPop = 30; % population number 
% % create the  subpopulations
pop = repmat(indv,nPop,1);
popCA_1 = repmat(pop, 1,nsub);
popCA_2 = repmat(pop, 1,nsub);
popCA_3 = repmat(pop, 1,nsub);
popCA_4 = repmat(pop, 1,nsub);
% % create the beliefs for each subpopulation 
b1 = getBeliefStructure();
b2 = getBeliefStructure();
b3 = getBeliefStructure();
b4 = getBeliefStructure();

% % define the parameters
rno = 100000; % random number

nGen = round(((rno/nPop)/((nsub*4*2))*0.52)); % define the total number of generations 
featSize    = size(X,2); %% sizeof the features 
newBeliefNo = round(nPop*bSubRatio);
cProb = 0.2; % probability of change
nChange  = round(cProb*featSize); % number of features changed
% % migration parameters
migGen =  2;  % % % migration generation
migIndv = 0.5; % percentage of  migrating individuals
migPopT = floor(nPop*migIndv); % total number of migrating individuals

%% Populate the System 
 disp('Generating the population. Please wait ... ')
   % population 1
%         disp('Pop 1')
    parfor j=1:nPop
        % populate the individual with sample selection of the features.   
        popCA_1(j) = createIndv(X,T);
    end
    % population 2
%         disp('Pop 2')
    parfor j=1:nPop 
        % populate the individual with sample selection of the features.   
        popCA_2(j) = createIndv(X,T);
    end
     % population 3  
%         disp('Pop 3')
    parfor j=1:nPop
        % populate the individual with sample selection of the features.   
       popCA_3(j) = createIndv(X,T);
    end
    % population 4
%         disp('Pop 4')
    parfor j=1:nPop 
        % populate the individual with sample selection of the features.   
        popCA_4(j) = createIndv(X,T);
    end
   
% populate beliefs for each subpopulations    
    % sort the population
    popCA_1 = SortPop(popCA_1);
    popCA_2 = SortPop(popCA_2);
    popCA_3 = SortPop(popCA_3);
    popCA_4 = SortPop(popCA_4);
   % select the top number of beliefs
   start = true; % algorithm is still at the initialisation state
   % subpopulation 1
   newBeliefs = popCA_1(1:newBeliefNo);
   worst = popCA_1(nPop);
   b1 = UpdateBeliefSystem(b1, newBeliefs, worst, start );
    % subpopulation 2
   newBeliefs = popCA_2(1:newBeliefNo);
   worst = popCA_2(nPop);
   b2 = UpdateBeliefSystem(b2, newBeliefs, worst, start );
    % subpopulation 3
   newBeliefs = popCA_3(1:newBeliefNo);
   worst = popCA_3(nPop);
   b3 = UpdateBeliefSystem(b3, newBeliefs, worst, start );
    % subpopulation 4
   newBeliefs = popCA_4(1:newBeliefNo);
   worst = popCA_4(nPop);
   b4 = UpdateBeliefSystem(b4, newBeliefs, worst, start );
 % populate the global belief system
   Belief = getMaxBelief(b1,b2,b3,b4); 
   disp('Beliefs populated')
   % toc
 %% The Algorithm  
  disp('Starting Algorithm ...   ')
  
tic; % Start the timer.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n = 1: nGen
  start = false; 
   % global belief affects a percentage of the population after every 
   % ''bGlobalYears'' years
     if (mod(n,bGlobalYears) == 0) 
       gBelief; %% execute scripts
   else   
       if (mod(n,migGen)~= 0) %% not migration year    
            nonMatePop; %% standard change operator is applied and evolution occurs within each clan 
       else        
            matePop; %% perform migration and mating
       end
    end  % % % end migration
  
    % populate the global belief system
   Belief = UpdateMaxBelief(Belief,b1,b2,b3,b4);    
   % % display the output to screem
   disp(strcat('Loop=',num2str(loop),',gen=#',num2str(n),' - Acc:',num2str(Belief.Situational.accuracy),...
   '; AUC:',num2str(Belief.Situational.AUCval),'; nFeat:',num2str(Belief.Situational.nfeat),...
   '; Prec:',num2str(Belief.Situational.precision),'; F1:', num2str(Belief.Situational.F1),...
   '; Rec:',num2str(Belief.Situational.recall),...
   '; FPR:',num2str(Belief.Situational.OPTROCPT(1)),'; TPR:',num2str(Belief.Situational.OPTROCPT(2)), ...
   '; Error:', num2str(Belief.Situational.mse)))  
   
BEST(loop,1) = Belief.Situational;
  
end

%% define and save  the result to file
dataset = 'dataset';
filename = strcat('CCA_',dataset,'-',num2str(nLoop));
save(strcat(filename,'.mat'));

% write results to file
BEST = struct2table(BEST);
writetable(BEST, strcat(filename,'.csv'));
 
 
 
end
 
