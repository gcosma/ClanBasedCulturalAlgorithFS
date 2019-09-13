function [b] = getMaxBelief(b1,b2,b3,b4)
%
%File name: getMaxBelief.m
%
% Programmed by Oloruntoba Oluwabunmi
% Last revised:  Sept 2019
% Reference: Oloruntoba O., Cosma G., Liotta A. (2019). Clan-based CUltural Algorithm for Feature Selection. In:
% IEEE International Conference on Data Minning (ICDM 2019), November 8-11, 2019, Beijing China
% 
% Copyright (c) 2019 Oloruntoba Oluwabunmi<bunmiotoba@gmail.com>.
%
%  This  function returns the best solution of all the beliefspaces
% in the society. The best solution is used to update the Global
% beliefspace .
%
%   

% define  placeholders
dummy = getBeliefStructure(); 
maxS = dummy.Situational;
maxN = dummy.Normative.Max;
minN = dummy.Normative.Min;

if (b1.Situational.accuracy > b2.Situational.accuracy)
    if (b1.Situational.accuracy > b3.Situational.accuracy)
        if (b1.Situational.accuracy > b4.Situational.accuracy)
            maxS = b1.Situational;
        else
            maxS = b1.Situational;
        end    
    end
else
    if (b2.Situational.accuracy > b3.Situational.accuracy)
       if (b2.Situational.accuracy > b4.Situational.accuracy)
           maxS = b2.Situational;
       else 
           maxS = b4.Situational;
       end    
    else
        if (b3.Situational.accuracy > b4.Situational.accuracy)
         maxS = b3.Situational;
        else
         maxS = b4.Situational;
        end
    end
end
% Nomative max
if (b1.Normative.Max.accuracy > b2.Normative.Max.accuracy)
    if (b1.Normative.Max.accuracy > b3.Normative.Max.accuracy)
        if (b1.Normative.Max.accuracy > b4.Normative.Max.accuracy)
            maxN = b1.Normative.Max;
        else
            maxN = b1.Normative.Max;
        end    
    end
else
    if (b2.Normative.Max.accuracy > b3.Normative.Max.accuracy)
       if (b2.Normative.Max.accuracy > b4.Normative.Max.accuracy)
           maxN = b2.Normative.Max;
       else 
           maxN = b4.Normative.Max;
       end    
    else
        if (b3.Normative.Max.accuracy > b4.Normative.Max.accuracy)
         maxN = b3.Normative.Max;
        else
         maxN = b4.Normative.Max;
        end
    end
end
%Normative Min
ba1 = b1.Normative.Min.accuracy;
ba2 = b2.Normative.Min.accuracy;
ba3 = b3.Normative.Min.accuracy;
ba4 = b4.Normative.Min.accuracy;


if ((-1*ba1) >  (-1*ba2))
    if ((-1*ba1)  >  (-1*ba3))
        if ((-1*ba1)  >  (-1*ba4))
            minN = b1.Normative.Min;
        else
            minN = b4.Normative.Min;
        end
    else 
        if ((-1*ba3)  >  (-1*ba4))
             minN = b3.Normative.Min;
        else
             minN = b4.Normative.Min;
        end
    end 
else 
    if ((-1*ba2)  >  (-1*ba3))
        if ((-1*ba2)  >  (-1*ba4))
          minN = b2.Normative.Min;
        else
             minN = b4.Normative.Min;  
        end
    else
        if ((-1*ba3)  >  (-1*ba4))
             minN = b3.Normative.Min;
        else
             minN = b4.Normative.Min;
        end
    end
end
        
        

 b.Situational = maxS;
 b.Normative.Max = maxN;
 b.Normative.Min = minN;
end

