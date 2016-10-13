% LENS PCA script

clear
close all
clc

tic
%declare the homefolder: T20W60 containing D, L, HAZ folders
%filepath='C:\Users\Andrey\Desktop\ME8883_Materials_Informatics\T20W60 files'
filepathrt='E:\MATIN_2015_DATA\T5-X-V2-5-';
save_path='C:\Users\xgong42\Documents\conversion_trbshoot';
p=1;
filepathtow=char(zeros(1,50));
filepathtod=char(zeros(1,60));
filepathtol=char(zeros(1,70));
filepathtohaz=char(zeros(1,80));
filepathtodumplevel=char(zeros(1,90));
filepath=char(zeros(1,100));
filename=char(zeros(1,100));

%%%%%%%%%%%%%%%%%p to u all can be removed
filepathtow=filepathrt;
W=dir(filepathtow);     %create Struct A with directory names
WSize=StructSize(W);     %obtain number of subfolders



for l=3:WSize
    if W(l).isdir~=1
        continue
    end
    filepathtod=[filepathtow,'\',W(l).name];
        D=dir(filepathtod);
        DSize=StructSize(D);

        for j=3:DSize
            if D(j).isdir~=1
                continue
            end
            filepathtol=[filepathtod,'\',D(j).name];
            
            L=dir(filepathtol);    
            LSize=StructSize(L);

            for i=3:LSize
                if L(i).isdir~=1        %ignore .DS_Store files
                    continue
                end
                filepathtohaz=[filepathtol,'\',L(i).name];
                
                HAZ=dir(filepathtohaz);
                HAZSize=StructSize(HAZ);
                
                for k=3:HAZSize
                    if HAZ(k).isdir~=1
                         continue
                    end
                    filepathtodumplevel=[filepathtohaz,'\',HAZ(k).name];
                    
                    dumplevel=dir(filepathtodumplevel);
                    dumplevelsize=StructSize(dumplevel);
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    %%%%%here is the core part!!!!!!!!!!
                    
                    for m=3:dumplevelsize
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
                        
                        %save_file=[num2str(p)]
                        p=p+1;                   
                        save([save_path,'\',num2str(p)],'BWdata');
                        
                        %Clean up the filepath to filename
                        filename=filepath(20:end);
                        c=strfind(filename,'\');
                        filename(c(1))='';
                        for stri=2:length(c)
                            filename(c(stri)-1)='-';
                        end
                        save([save_path,'\',num2str(p)],'filename','-append');
                        
                        
%                         if p==3
%                             return
%                         end
                        
                        
                        break;
                    end
                    %%%%%%%%%%core part end here!!!!!!!
                         
                    
                    
                    
                    
                    
                    
                end
            end 
        end
end
toc