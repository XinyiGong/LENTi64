clear
clc
close all
namepath='E:\MATIN_2015_DATA';
checkpath='C:\Users\xgong42\Documents\MATIN_struct';
level=1;
name=cell(5,1);
name{1,1}='T5-X-V2-5-';
name{2,1}='W60';
name{3,1}='D100';
name{4,1}='L50';
name{5,1}='HAZ20';


trblist=zeros(500,1);
lst=0;
findname='';
if level
    for lv=1:level
        namepath=[namepath,'\',name{lv,1}];
        if lv==1
            findname=name{1,1};
        elseif lv==2
            findname=[findname,name{lv,1}];
        else
            findname=[findname,'-',name{lv,1}];
       end
    end
end
    filelist1=dir(namepath);
    stat=cell(length(filelist1),2);
    filelist2=dir([checkpath,'\*.mat']);
    
    for fl=1:length(filelist1)
        if level<=1
            nfindname=[findname,filelist1(fl).name];
        else
            nfindname=[findname,'-',filelist1(fl).name];
        end
        stat{fl,1}=nfindname;
        cnt=0;
        for fl2=1:length(filelist2)
            load([checkpath,'\',filelist2(fl2).name],'filename');
            a=strfind(filename,nfindname);
            if ~isempty(a)
                cnt=cnt+1;
                lst=lst+1;
                trblist(lst,1)=str2num(filelist2(fl2).name(1:end-4));
            end
        end
        stat{fl,2}=cnt;
    end