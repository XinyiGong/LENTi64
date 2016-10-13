clear all
clc
loadpath=['/nv/hp22/xgong42/scratch/GB_data'];
savepath=['/nv/hp22/xgong42/results'];

load(loadpath,'/1.mat');
save([savepath,'/test_PACE'],'BWdata');