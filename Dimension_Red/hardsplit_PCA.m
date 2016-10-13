% Chage directory to the folder with files
loadpath='/Users/Gong/Desktop/LENS/matin_results/CLD2_NE/';
savepath = '/Users/Gong/Desktop/LENS/matin_results/CLD_PCA_hardsplit/';
pcname = 'CLD2_NE_PCAXYZ_noW70';
selectdata = 'w70ind';

% Initiation
load([savepath,selectdata]);
load([loadpath,num2str(index{1,2}(1,1)),'.mat']);
GG = zeros(length(index{1,2}),size(hist,1)*size(hist,2));
Mean = zeros(1,size(GG,2));

% Reshape Input for PCAConstruction
for i=1:length(index{1,2})
    load([loadpath,num2str(index{1,2}(i,1)),'.mat']);
    GG(i,:)=[hist(:,1)' hist(:,2)' hist(:,3)'];
end

% PCA
[PC,Var,Basis] = PCAConstruct3(GG,min(length(index{1,2}),size(hist,1)*size(hist,2)));

% Get Mean Value for Statistics
for i = 1:size(GG,2)
    Mean(1,i) = mean(GG(:,i));
end

% Save
save([savepath,pcname],'PC');
save([savepath,pcname],'Var','-append');
save([savepath,pcname],'Basis','-append');
save([savepath,pcname],'Mean','-append');

