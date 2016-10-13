% LENS PCA script
% clear
clc
close all
tic
%Chage directory to the folder with files
path='/Users/Gong/Desktop/matin_results/CLD2_NE';
savepath='/Users/Gong/Desktop/matin_results/truncated_CLD_PCA';
% filelist=dir([path,'/*.mat']);

% Load one file to preallocate GG
load([path,'/',num2str(prmindex(1)),'.mat']);
GG=zeros(length(prmindex),900);
% rowname=char(zeros(length(filelist),100));

%GG=zeros(length(3),numel(data));
%rowname=char(zeros(length(3),100));

for i=1:length(prmindex)
    load([path,'/',num2str(prmindex(i)),'.mat']);
    %Get file names
    %rowname(i,1:3)=filename;
%     rowname(i,1:length(filename))=filename;
    GG(i,:)=[hist(:,1)' hist(:,2)' hist(:,3)'];
end

% %% PCA
[PC,Var] = PCAConstruct2(GG,900);
%[PC,Var] = PCAConstruct(GG,3);
% save PC, Var, rowname

savepath='/Users/Gong/Desktop/matin_results/truncated_CLD_PCA';
%savepath='C:\Users\Andrey\Google Drive\MATIN 2015\Data\72_PC_VAR';
% save([savepath,'/metadata4'],'rowname');
save([savepath,'/CLD2_NE_PCAXYZ'],'PC');
save([savepath,'/CLD2_NE_PCAXYZ'],'Var','-append');

