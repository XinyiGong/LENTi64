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

%GG=zeros(length(3),numel(data));
%rowname=char(zeros(length(3),100));

for i=1:length(filelist)
    load([path,'/',num2str(i),'.mat']);
    %Get file names
    %rowname(i,1:3)=filename;
%     rowname(i,1:length(filename))=filename;
    GG(i,:)=hist(:,1);
end

% %% PCA
[PC,Var] = PCAConstruct2(GG,300);
%[PC,Var] = PCAConstruct(GG,3);
% save PC, Var, rowname

savepath='/Users/Gong/Desktop/matin_results/CLD_PCA_v2';
%savepath='C:\Users\Andrey\Google Drive\MATIN 2015\Data\72_PC_VAR';
% save([savepath,'/metadata'],'rowname');
save([savepath,'/CLD2_E_PCAX'],'PC');
save([savepath,'/CLD2_E_PCAX'],'Var','-append');

