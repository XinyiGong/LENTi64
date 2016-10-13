% Chage directory to the folder with files
statpath='/Users/Gong/Google Drive/Data/Statistics/';
statname = 'ChLOrig_HC_xd75_V7p5W70';
pcpath = '/Users/Gong/Google Drive/Data/PC/';
pcname = 'PC_ChLOrig_HC_xd75_V7p5W70';

% Initiation
load([statpath,statname]);
GG = GGs{1,2};
Mean = zeros(1,size(GG,2));

% PCA
[PC,Var,Basis] = PCAConstruct3(GG,min(size(GG,1),size(GG,2)));

% Get Mean Value for Statistics
for i = 1:size(GG,2)
    Mean(1,i) = mean(GG(:,i));
end

% Save
save([pcpath,pcname],'PC','Var','Basis','Mean');

