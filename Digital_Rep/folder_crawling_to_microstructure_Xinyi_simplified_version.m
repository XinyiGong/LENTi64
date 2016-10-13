%{
LENS PCA script
%}
clear all
close all 
tic
%declare the homefolder: T20W60 containing D, L, HAZ folders
%filepath='C:\Users\Andrey\Desktop\ME8883_Materials_Informatics\T20W60 files'
filepathrt='E:\MATIN_2015_DATA\T5-X-V10-';
save_path='C:\Users\xgong42\Documents\MATIN_struct';
p=217;

filepathtodumplevel=char(zeros(1,50));
filepath=char(zeros(1,60));
filename=char(zeros(1,60));

%%%%%%%%%%%%%%%%%p to u all can be removed
% filepathtow=filepathrt;
% W=dir(filepathtow);     %create Struct A with directory names
% WSize=StructSize(W);     %obtain number of subfolders



for W=60:10:90
    for D=100:25:125
        for L=50:10:70
            for HAZ=5:15:35
                
                w=num2str(W);
                d=num2str(D);
                l=num2str(L);
                haz=num2str(HAZ);
                filepathtodumplevel=[filepathrt,'\W',w,'\D',d,'\L',l,'\HAZ',haz];
                    
                dumplevel=dir(filepathtodumplevel);
                dumplevelsize=StructSize(dumplevel);
                for m=3:6
                        a=strfind(dumplevel(m).name,'dump.additive');
                        a=size(a);
                        if a(1)==0
                            continue;
                        end
                        b=strfind(dumplevel(m).name,'gz');
                        b=size(b);
                        if b(1)==1
                            continue;
                        end
                        
                        filepath=[filepathtodumplevel,'\',dumplevel(m).name];
                    
                        data=read_dump(filepath,[300, 300, 200]); %read&reshape data
                        BWdata=Grain2Boundary(data); %grain boundary segmentation
                        save_file=[save_path,'\',num2str(p)];
                        %save_file=[num2str(p)]                   
                        save(save_file,'BWdata');
                        
                        filename=filepath(20:end);
                        save(save_file,'filename','-append');
                         
                        %{
                        filepath=[filepathtodumplevel,'\',dumplevel(m).name];
                        disp(filepath);
                        disp(p);
                        %}
                        p=p+1;
                        %{
                        if p==3
                            return
                        end
                        
                        %}
                        break;
                end
            end
        end
    end
end

toc