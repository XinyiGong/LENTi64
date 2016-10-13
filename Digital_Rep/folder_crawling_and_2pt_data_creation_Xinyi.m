%{
LENS PCA script
%}
clear all
close all 
tic
%declare the homefolder: T20W60 containing D, L, HAZ folders
%filepath='C:\Users\Andrey\Desktop\ME8883_Materials_Informatics\T20W60 files'
filepathrt='C:\Users\xgong42\Documents\some_SPPARKS_folders\T5-X-V2-5-';
%save_path='F:\MATIN_2015\10_21_2015';
save_path='C:\Users\xgong42\Documents\MATIN_test_10-25-2015';
p=1;
q=0;
r=0;
s=0;
t=0;
u=0;
filepathtow=char(zeros(1,50));
filepathtod=char(zeros(1,60));
filepathtol=char(zeros(1,70));
filepathtohaz=char(zeros(1,80));
filepathtodumplevel=char(zeros(1,90));
filepath=char(zeros(1,100));

%%%%%%%%%%%%%%%%%p to u all can be removed
filepathtow=filepathrt;
W=dir(filepathtow);     %create Struct A with directory names
WSize=StructSize(W);     %obtain number of subfolders



for l=3:WSize
    if W(l).isdir~=1
        continue
    end
    filepathtod=[filepathtow,'\',W(l).name];
    q=q+1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        D=dir(filepathtod);
        DSize=StructSize(D);

        for j=3:DSize
            if D(j).isdir~=1
                continue
            end
            filepathtol=[filepathtod,'\',D(j).name];
            r=r+1;%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            L=dir(filepathtol);    
            LSize=StructSize(L);

            for i=3:LSize
                if L(i).isdir~=1        %ignore .DS_Store files
                    continue
                end
                filepathtohaz=[filepathtol,'\',L(i).name];
                s=s+1;%%%%%%%%%%%%%%%%%%%%%%%
                
                HAZ=dir(filepathtohaz);
                HAZSize=StructSize(HAZ);
                
                for k=3:HAZSize
                    if HAZ(k).isdir~=1
                         continue
                    end
                    filepathtodumplevel=[filepathtohaz,'\',HAZ(k).name];
                    t=t+1;%%%%%%%%%%%%%%%%%%%%%%
                    
                    dumplevel=dir(filepathtodumplevel);
                    dumplevelsize=StructSize(dumplevel);
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    %%%%%here is the core part!!!!!!!!!!
                    
                    for m=1:dumplevelsize
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
                        u=u+1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    
                        data=read_dump(filepath,[300, 300, 200]); %read&reshape data
                        BWdata=Grain2Boundary(data); %grain boundary segmentation
                        data=noob2ptauto(BWdata,0); %preform 2pt statistics
                        %imagesc(data(:,:,100))
                        save_file=[save_path,'\',num2str(p)];
                        %save_file=[num2str(p)]                   
                        save(save_file,'data');
                        save(save_file,'filepath','-append');
                        
                        %{
                        filepath=[filepathtodumplevel,'\',dumplevel(m).name];
                        disp(filepath);
                        %}
                        disp(p);
                        p=p+1;
                        if p==3
                            return
                        end
                        
                        break;
                    end
                    %%%%%%%%%%core part end here!!!!!!!
                         
                    
                    
                    
                    
                    
                    
                end
            end
        end
end
toc
%dump.additive4.4
