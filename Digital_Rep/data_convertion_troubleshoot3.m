clear
clc
close all
cd('C:\Users\xgong42\Documents\GitHub\LENS\codes\our_version');
namepath='E:\MATIN_2015_DATA';
savepath='C:\Users\xgong42\Documents\name';
level=5;
name=cell(5,1);
name{1,1}='T5-X-V7-5-';
name{2,1}='W90';
name{3,1}='D125';
name{4,1}='L70';
name{5,1}='HAZ5';


if level
    for lv=1:level
        namepath=[namepath,'\',name{lv,1}];
    end
end
    namepath=[namepath,'\','dump.additive4.5'];
    data=read_dump(namepath,[300, 300, 200]); %read&reshape data
    BWdata=Grain2Boundary(data); %grain boundary segmentation
                        
                        %save_file=[num2str(p)]                   
                        save([savepath,'\check'],'BWdata');
                        
                        %Clean up the filepath to filename
                        filename=namepath(20:end);
                        c=strfind(filename,'\');
                        filename(c(1))='';
                        for stri=2:length(c)
                            filename(c(stri)-1)='-';
                        end
                        save([savepath,'\check'],'filename','-append');
 