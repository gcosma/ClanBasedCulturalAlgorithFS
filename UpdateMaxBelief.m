function [Belief] = UpdateMaxBelief(Belief,b1,b2,b3,b4)
%
%File name: UpdateMaxBelief.m
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
% UPDATEMAXBELIEF function
%  This function performs an update of the Global Belief space.
% 
%

%Situational
if Belief.Situational.accuracy < b1.Situational.accuracy
    Belief.Situational = b1.Situational;
else
    if Belief.Situational.accuracy == b1.Situational.accuracy
        if Belief.Situational.AUCval < b1.Situational.AUCval
            Belief.Situational = b1.Situational;
        else
            if Belief.Situational.AUCval == b1.Situational.AUCval
                if Belief.Situational.nfeat > b1.Situational.nfeat
                     Belief.Situational = b1.Situational;
                end
            end
        end
    end
end  
if Belief.Situational.accuracy < b2.Situational.accuracy
  Belief.Situational = b2.Situational;
else
    if Belief.Situational.accuracy == b2.Situational.accuracy
        if Belief.Situational.AUCval < b2.Situational.AUCval
            Belief.Situational = b2.Situational;
        else
            if Belief.Situational.AUCval == b2.Situational.AUCval
                if Belief.Situational.nfeat > b2.Situational.nfeat
                     Belief.Situational = b2.Situational;
                end
            end
        end
    end
end
if Belief.Situational.accuracy < b3.Situational.accuracy
    Belief.Situational = b3.Situational;
else
    if Belief.Situational.accuracy == b3.Situational.accuracy
        if Belief.Situational.AUCval < b3.Situational.AUCval
            Belief.Situational = b3.Situational;
        else
            if Belief.Situational.AUCval == b3.Situational.AUCval
                if Belief.Situational.nfeat > b3.Situational.nfeat
                     Belief.Situational = b3.Situational;
                end
            end
        end
    end
end 
if Belief.Situational.accuracy < b4.Situational.accuracy
   Belief.Situational = b4.Situational;
else
    if Belief.Situational.accuracy == b4.Situational.accuracy
        if Belief.Situational.AUCval < b4.Situational.AUCval
            Belief.Situational = b4.Situational;
        else
            if Belief.Situational.AUCval == b4.Situational.AUCval
                if Belief.Situational.nfeat > b4.Situational.nfeat
                     Belief.Situational = b4.Situational;
                end
            end
        end
    end
end           
%Normative Max
if Belief.Normative.Max.accuracy < b1.Normative.Max.accuracy
    Belief.Normative.Max = b1.Normative.Max;
else
    if Belief.Normative.Max.accuracy == b1.Normative.Max.accuracy
        if Belief.Normative.Max.AUCval < b1.Normative.Max.AUCval
            Belief.Normative.Max = b1.Normative.Max;
        else
            if Belief.Normative.Max.AUCval == b1.Normative.Max.AUCval
                if Belief.Normative.Max.nfeat > b1.Normative.Max.nfeat
                     Belief.Normative.Max = b1.Normative.Max;
                end
            end
        end
    end
end  
if Belief.Normative.Max.accuracy < b2.Normative.Max.accuracy
  Belief.Normative.Max = b2.Normative.Max;
else
    if Belief.Normative.Max.accuracy == b2.Normative.Max.accuracy
        if Belief.Normative.Max.AUCval < b2.Normative.Max.AUCval
            Belief.Normative.Max = b2.Normative.Max;
        else
            if Belief.Normative.Max.AUCval == b2.Normative.Max.AUCval
                if Belief.Normative.Max.nfeat > b2.Normative.Max.nfeat
                     Belief.Normative.Max = b2.Normative.Max;
                end
            end
        end
    end
end
if Belief.Normative.Max.accuracy < b3.Normative.Max.accuracy
    Belief.Normative.Max = b3.Normative.Max;
else
    if Belief.Normative.Max.accuracy == b3.Normative.Max.accuracy
        if Belief.Normative.Max.AUCval < b3.Normative.Max.AUCval
            Belief.Normative.Max = b3.Normative.Max;
        else
            if Belief.Normative.Max.AUCval == b3.Normative.Max.AUCval
                if Belief.Normative.Max.nfeat > b3.Normative.Max.nfeat
                     Belief.Normative.Max = b3.Normative.Max;
                end
            end
        end
    end
end 
if Belief.Normative.Max.accuracy < b4.Normative.Max.accuracy
   Belief.Normative.Max = b4.Normative.Max;
else
    if Belief.Normative.Max.accuracy == b4.Normative.Max.accuracy
        if Belief.Normative.Max.AUCval < b4.Normative.Max.AUCval
            Belief.Normative.Max = b4.Normative.Max;
        else
            if Belief.Normative.Max.AUCval == b4.Normative.Max.AUCval
                if Belief.Normative.Max.nfeat > b4.Normative.Max.nfeat
                     Belief.Normative.Max = b4.Normative.Max;
                end
            end
        end
    end
end 
%Normative Min
if Belief.Normative.Min.accuracy > b1.Normative.Min.accuracy
    Belief.Normative.Min = b1.Normative.Min;
end  
if Belief.Normative.Min.accuracy  > b2.Normative.Min.accuracy
  Belief.Normative.Min = b2.Normative.Min;
end
if Belief.Normative.Min.accuracy > b3.Normative.Min.accuracy
    Belief.Normative.Min = b3.Normative.Min;
end 
if Belief.Normative.Min.accuracy > b4.Normative.Min.accuracy
   Belief.Normative.Min = b4.Normative.Min;
end 


end

