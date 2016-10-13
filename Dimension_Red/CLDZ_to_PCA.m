% LENS PCA script
clear
clc
close all
tic
%Chage directory to the folder with files
path='/Users/Gong/Desktop/matin_results/CLD2_E';

filelist=dir([path,'/*.mat']);

% Load one file to preallocate GG
load([path,'/',filelist(1).name]);
GG=zeros(length(filelist),300);
% rowname=char(zeros(length(filelist),100));



for i=1:length(filelist)
    load([path,'/',num2str(i),'.mat']);
    %Get file names
%     rowname(i,1:length(filename))=filename;
    GG(i,:)=hist(:,3);
end

% %% PCA
[PC,Var] = PCAConstruct2(GG,300);
% save PC, Var, rowname

savepath='/Users/Gong/Desktop/matin_results/CLD_PCA_v2';
% save([savepath,'/metadata'],'rowname');
save([savepath,'/CLD2_E_PCAZ'],'PC');
save([savepath,'/CLD2_E_PCAZ'],'Var','-append');

