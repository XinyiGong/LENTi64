function r = TwoVectorR(PC,R)
% Calculates Pearson Product Moment Coefficient between two vectors for each column of PC and R. 
% Not necessarily takes PC as argument, can take the expanded space from SpaceCortex for instance.
n=length(R);
r=zeros(size(PC,2),1);
for i=1:size(PC,2)
    X1=PC(:,i);
    r(i)=(1/(n-1))*(sum(zscore(X1).*zscore(R)));
end
end

