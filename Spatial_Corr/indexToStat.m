% Chage directory to the folder with files
statloadpath='/Users/Gong/Desktop/LENS/Data/Statistics/CLD2_NE/';
selectloadpath='/Users/Gong/Desktop/LENS/Data/PP/';
savepath = '/Users/Gong/Desktop/LENS/Data/Statistics/';
ggname = 'CLD2_NE_V7p5';
selectdata = 'v7p5ind';

% Initiation
load([selectloadpath,selectdata]);
load([statloadpath,num2str(index{1,1}(1,1)),'.mat']);
GG = zeros(length(index{1,1}),size(hist,1)*size(hist,2));
Mean = zeros(1,size(GG,2));

% Gather Certain Structures
for i=1:length(index{1,1})
    load([statloadpath,num2str(index{1,1}(i,1)),'.mat']);
    GG(i,:)=[hist(:,1)' hist(:,2)' hist(:,3)'];
end

% Get Mean Value for Statistics
for i = 1:size(GG,2)
    Mean(1,i) = mean(GG(:,i));
end

% Save
save([savepath,ggname],'GG');
save([savepath,ggname],'Mean','-append');

