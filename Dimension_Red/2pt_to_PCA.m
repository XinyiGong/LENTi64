% LENS PCA script

tic
%Chage directory to the folder with files
path='/nv/hp22/xgong42/scratch/2pt_data';

filelist=dir([path,'/*.mat']);

% Load one file to have preallocate GG
load([path,'/',filelist(1).name]);
GG=zeros(length(filelist),numel(data));
rowname=char(zeros(length(filelist),100));

%GG=zeros(length(3),numel(data));
%rowname=char(zeros(length(3),100));

for i=1:length(filelist)
    load([path,'/',filelist(i).name]);
    
    %Get file names
    %rowname(i,1:3)=filename;
    rowname(i,1:length(filename))=filename;
    for j=1:size(data,1)
        for k=1:size(data,2)
            
            %Set starting point of each segment
            l=(k-1)*size(data,2)+(j-1)*size(data,2)*size(data,1);
            
            %Give value to input of PCA
            GG(i,l+1:l+size(data,3))=data(j,k,:);
        end
    end
end

% %% PCA
[PC,Var] = PCAConstruct(GG,length(filelist));
%[PC,Var] = PCAConstruct(GG,3);
% save PC, Var, rowname

savepath='/nv/hp22/xgong42/scratch/2pt_PCA_data';
%savepath='C:\Users\Andrey\Google Drive\MATIN 2015\Data\72_PC_VAR';
save([savepath,'/metadata'],'rowname');
save([savepath,'/72_2pt_PCA'],'PC');
save([savepath,'/72_2pt_PC_Var'],'Var');

