%Chord length to PCA script
clear
clc
close all 

tic
%Chage directory to the folder with files
%path='/Users/Gong/Documents/Gross_Landfill/10_21_2015';
path='C:\Users\Andrey\Desktop\Theron_presentation\CLD2';

filelist=dir([path,'\*.mat']);

% Load one file to have preallocate GG
load([path,'\',filelist(1).name]);
GG=zeros(length(filelist),900);
rowname=char(zeros(length(filelist),100));
for i=1:length(filelist)
   load([path,'\',filelist(i).name]);
   %Get file names
   rowname(i,1:length(filename))=filename;
   %Create PCA input GG
   GG(i,1:300)=hist(:,1)';
   GG(i,301:600)=hist(:,2)';
   GG(i,601:900)=hist(:,3)';
end

% %% PCA
[PC,Var] = PCAConstruct(GG,length(filelist));

% save PC, Var, rowname

%savepath='/Users/Gong/Documents/LENS/results/Var_72-structure_2pt_PCA';
savepath='C:\Users\Andrey\Desktop\Theron_presentation\CLD2_PCA';
save([savepath,'\metadata'],'rowname');
save([savepath,'\72_2pt_PCA'],'PC');
save([savepath,'\72_2pt_PC_Var'],'Var');
toc

