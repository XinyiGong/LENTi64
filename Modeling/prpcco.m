% Need to include function 'TwoVectorR'
% Gives Pearson Product-Moment Coefficient between each process
% parameter(each column in the 'prm') and each PC(each column in the 'PC')
% Output: each column corresponds to one PC; each row corresponds to one
% process parameter

function PPMC = prpcco(prm,PC,pcn)

PPMC=zeros(size(prm,2),pcn);
for i=1:pcn
    PPMC(:,i) = TwoVectorR(prm,PC(:,i));   
end