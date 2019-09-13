function [migPop] = getMigration(migIndv,nPop)
%
%File name: getMigration.m
%
% Programmed by Oloruntoba Oluwabunmi
% Last revised:  Sept 2019
% Reference: Oloruntoba O., Cosma G., Liotta A. (2019). Clan-based CUltural Algorithm for Feature Selection. In:
% IEEE International Conference on Data Minning (ICDM 2019), November 8-11, 2019, Beijing China
% 
% Copyright (c) 2019 Oloruntoba Oluwabunmi<bunmiotoba@gmail.com>.
%
% 
% Function to determine the migration destination of individuals for each
% sub-populations
% The migrating population is randomly assigned such that the destination 
% population is not the same as the originating population 
%
%

nIndv = floor(nPop*migIndv);
numPop  = 4;
migPop = zeros(nIndv,numPop);
for i=1:nIndv  % column
    for j=1:numPop 
        if (j == 1)    % originates from sub-population 1
            randomCheck = 1;
            while (randomCheck == 1)
                randomCheck = round(mod(2 + ((rand()*10)*2),4));
                if (randomCheck <= 0) 
                    randomCheck = 1;
                end
            end
            migPop(i,j) = randomCheck;
        else
            if (j == 2)   % originates from sub-population 2
                randomCheck = 2; 
                while ((randomCheck) == 2) 
                   randomCheck = round(mod(1 + ((rand()*10)+(2/3)),4));
                   if (randomCheck <= 0) 
                       randomCheck = 2;
                   end
                end
                 migPop(i,j) = (randomCheck);
            else
                if (j== 3)   % originates from sub-population 3
                    randomCheck = 3;
                    while ((round(randomCheck) == 3)   )
                       randomCheck = round(mod(1 +(rand()* 10),4));
                       if (randomCheck <= 0) 
                            randomCheck = 3;
                       end
                    end
                    migPop(i,j) = round(randomCheck);
                else
                    if (j == 4)   % originates from sub-population 4
                        randomCheck = 4;
                    while ((round(randomCheck) == 4)   ) 
                        randomCheck = round(mod((1+(rand()*10)*2),4));
                        if (randomCheck <= 0) 
                            randomCheck = 4;
                       end
                        migPop(i,j) = round(randomCheck);
                    end
                end
            end
        end             
    end
end


end

