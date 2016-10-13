load('C:\Users\xgong42\Documents\LENS\Data\PC\CLD2_NE_PCAXYZ_noW70');
load('C:\Users\xgong42\Documents\LENS\Data\PP\metadata_noW70');
savepath='C:\Users\xgong42\Documents\LENS\Data\PPtoPCModels\';
modelname='model_PP134567_PC1_deg3_CLD2_NE_PCAXYZ_noW70';
% Choose the degrees you want to try
degs=[0 1 2 3];
% Specify the highest degree
deg=3;

% Choose column number(PP or PC in our case) you want to use for fitting the model
% !!! SENSITIVE to ORDER!!!
cn=[1 3 4 5 6 7];

% Choose column number(PC or PP in our case) you want to fit
fcn=1;




choice={};
for i=1:length(cn)
    choice={choice{:},degs};
end

cb=allcomb(choice{:});

%eliminate the all zero combination
cb=cb(2:size(cb,1),:);

expinf=zeros(size(cb,1),5);
for ii=1:size(cb,1)
    reg2= MultiPolyRegress2(prm(:,cn),PC(:,fcn),deg,cb(ii,:),'range');
    expinf(ii,:)=[reg2.MAE reg2.RSquare reg2.CVMAE reg2.CVRSquare reg2.flag];
end
%
[~,I]=sort(expinf(:,1));
expinf=expinf(I,:);
cb=cb(I,:);
k=find(expinf(:,5)==0,1);
reg=MultiPolyRegress2(prm(:,cn),PC(:,fcn),deg,cb(k,:),'range');
save([savepath,modelname],'reg');
% expinf(k,:);
% cb(k,:);
% % savepath='/nv/hp22/xgong42/scratch/CLD_model_hardsplit';
% % save([savepath,'/noW70modelselect-PP134567-PC1-deg3'],'expinf');
% % save([savepath,'/noW70modelselect-PP134567-PC1-deg3'],'cb','-append');
% % save([savepath,'/noW70modelselect-PP134567-PC1-deg3'],'k','-append');