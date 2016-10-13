clear
clc
close all
checkpath='C:\Users\xgong42\Documents\MATIN_struct';
filelist2=dir([checkpath,'\*.mat']);
 
level=1;
name=cell(5,1);
name{1,1}='T20-X-V10-';
name{2,1}='W60';
name{3,1}='D100';
name{4,1}='L60';
name{5,1}='HAZ35';

findname='';
if level
    for lv=1:level
        if lv==1
            findname=name{1,1};
        elseif lv==2
            findname=[findname,name{lv,1}];
        else
            findname=[findname,'-',name{lv,1}];
       end
    end
end

targetmatfilename={};
for fl2=1:length(filelist2)
            load([checkpath,'\',filelist2(fl2).name],'filename');
            a=strfind(filename,findname);
            if ~isempty(a)
                
                targetmatfilename=[targetmatfilename; filelist2(fl2).name];
            end
end
        