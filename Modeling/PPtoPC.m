% Define paths
modelpath = '/Users/Gong/Google Drive/Data/PPtoPCModels/';
pppath = '/Users/Gong/Google Drive/Data/PP/';
savepcpath = '/Users/Gong/Google Drive/Data/PC/';
pcnb = 4;
modelname1 = 'model_PP134567_PC';
modelname2 = '_deg3_ChLOrig_HC_xd75_V7p5W70';
ppname = 'metadata_ChLOrig_HC_xd75_V7p5W70';
savepcname = 'ModelCreatedPCs_ChLOrig_HC_xd75_V7p5W70';

% Loading and initialize
load([pppath,ppname]);
prm = prms{1,1};
PCs = zeros(size(prm,1),pcnb);

% Acquire PC values
for i = 1:pcnb
    load([modelpath,modelname1,num2str(i),modelname2]);
    for j = 1:size(prm,1)
        PCs(j,i)=reg.PolynomialExpression(prm(j,1),prm(j,3),prm(j,4),prm(j,5),prm(j,6),prm(j,7));
    end
end

% Save
save([savepcpath,savepcname],'PCs');
