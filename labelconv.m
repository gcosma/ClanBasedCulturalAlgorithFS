function [binlabels2]=labelconv(labels)
% This function is to  to convert the target vector to binarised format 
% 2 =[0 1 0 0 0 0 0 0 0 0 ]
% nc = number of classes
%
%  (c) Georgina Cosma <gcosmaresearch@outlook.com>

labels=single(labels);
if min(labels)==0
labels2=labels+1;
else
    labels2=labels;
end

[m,n]=size(labels2);
nc=max(labels); %determined the mumber of classes
binlabels2=zeros(m,nc); %empty bin matrix
for i=1:m
    c=labels2(i);
    binlabels2(i,c)=1;
end 
end