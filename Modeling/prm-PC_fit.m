close all
clear
clc

filepath='/Users/Gong/Documents/LENS/results/Plot_72-structure_2pt_PCA';
pcafilename='72pt_PC.mat';
prmfilename='parameter.mat';

load([filepath,'/',pcafilename]);
load([filepath,'/',prmfilename]);
reg=MultiPolyRegress(prm,PC(:,1),3,'Range','figure') % Gives you your fit.