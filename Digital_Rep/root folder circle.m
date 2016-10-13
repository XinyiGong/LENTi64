clear all;
close all;
filepathrt='E:\MATIN_2015_DATA';
RT=dir(filepathrt);

for rt=3:length(RT)
    
    %Exclude non-folder element
    if RT(rt).isdir~=1
         continue
    end
    
%     Exclude all transformed folders
    a1=strfind(RT(rt).name,'T5-X-V10-');
    a1=size(a1);
    if a1(1)==1
        continue;
    end
    a2=strfind(RT(rt).name,'T5-X-V2-5');
    a2=size(a2);
    if a2(1)==1
        continue;
    end
    a3=strfind(RT(rt).name,'T5-X-V5-');
    a3=size(a3);
    if a3(1)==1
        continue;
    end
    a4=strfind(RT(rt).name,'T5-X-V7-5');
    a4=size(a4);
    if a4(1)==1
        continue;
    end
    
    disp(RT(rt).name);
    
%     %Get the path to next level
%     filepathtow=[filepathtort,'\',RT(rt).name];
%     W=dir(filepathtow);
%     WSize=StructSize(W);
end

