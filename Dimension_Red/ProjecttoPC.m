% Define paths and names
statpath = '/Users/Gong/Google Drive/Data/Statistics/';
statname = 'ChLOrig_HC_xd75_V7p5W70';
trainpcpath = '/Users/Gong/Google Drive/Data/PC/';
trainpcname = 'PC_ChLOrig_HC_xd75_V7p5W70';
savepcpath = '/Users/Gong/Google Drive/Data/PC/';
savepcname = 'project_PCs_ChLOrig_HC_xd75_V7p5W70';

% load
load([statpath,statname],'GGs'); % !!!be careful with the order here!!!
GG = GGs{1,1};
load([trainpcpath,trainpcname]);

% Project to PC
PCp = (GG-Mean(ones(1,size(GG,1)),:))*Basis;

% Save
save([savepcpath,savepcname],'PCp');