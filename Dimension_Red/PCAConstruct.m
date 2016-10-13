function [PC,Var]=PCAConstruct(Data,Rank)
M=repmat(mean(Data,1),size(Data,1),1);
Data=Data-M;
[U S ~] = pca(Data, Rank);
PC=U*S;
Var=S^2;
Var=diag(Var);
Var=Var./sum(Var);