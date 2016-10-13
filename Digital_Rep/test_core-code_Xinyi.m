filepath=['C:\Users\xgong42\Documents\some_SPPARKS_folders\T5-X-V2-5-\W60\D100\L50\HAZ20\dump.additive4.13'];
data=read_dump(filepath,[300, 300, 200]); %read&reshape data
BWdata=Grain2Boundary(data); %grain boundary segmentation
data=noob2ptauto(BWdata,0); %preform 2pt statistics
%imagesc(data(:,:,100))
save_file=[save_path,'\',num2str(p)];
%save_file=[num2str(p)]                   
save(save_file,'data');
save(save_file,'filepath','-append');