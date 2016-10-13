function [PC,Var]=PCAConstruct2(Data,Rank)
%% Data is p by d, where p is the number of data points, d is the number of dimensions (each row is a data point)
M=mean(Data,1);

for i=1:size(Data,1)
    Data(i,:)=Data(i,:)-M;
end

[U S ~] = pca(Data, Rank);
PC=U*S;
Var=S^2;
Var=diag(Var);
Var=Var./sum(Var);