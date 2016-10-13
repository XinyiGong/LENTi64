% LENS PCA script

%Chage directory to the folder with files
path='/nv/hp22/xgong42/scratch/2pt_data';

filelist=dir([path,'/*.mat']);

% Load one file to have preallocate GG
load([path,'/',filelist(1).name]);
elnum=ceil(numel(data)/2);
GG=zeros(length(filelist),elnum);
rowname=char(zeros(length(filelist),100));

%GG=zeros(length(3),numel(data));
%rowname=char(zeros(length(3),100));

for i=1:length(filelist)
    load([path,'/',num2str(i),'.mat']);
    %Get file names
    %rowname(i,1:3)=filename;
    rowname(i,1:length(filename))=filename;
    GG(i,:)=data(1:elnum);
end

% %% PCA
[PC,Var] = PCAConstruct2(GG,length(filelist));
%[PC,Var] = PCAConstruct2(GG,3);
% save PC, Var, rowname

savepath='/nv/hp22/xgong42/scratch/2pt_reduced_PCA/Tpt_red_PCA_full';
%savepath='C:\Users\Andrey\Google Drive\MATIN 2015\Data\72_PC_VAR';
save([savepath,'/metadata'],'rowname');
save([savepath,'/1799_2pt_PCA'],'PC');
save([savepath,'/1799_2pt_PC_Var'],'Var');
