function [PC,Var,M,Basis]=PCAConstruct(Data,Rank)
M = mean(Data,1);
Data = Data-M;
[U, S, Basis] = pca(Data, Rank);
PC=U*S;
Var=S.^2;
Var=diag(Var);
Var=Var./sum(Var);