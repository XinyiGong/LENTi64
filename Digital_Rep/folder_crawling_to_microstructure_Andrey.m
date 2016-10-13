% LENS PCA script

clear
close all
clc

tic
%declare the homefolder: T20W60 containing D, L, HAZ folders
%filepath='C:\Users\Andrey\Desktop\ME8883_Materials_Informatics\T20W60 files'
filepathmain='E:\MATIN_2015_DATA';
%filepathrt='E:\MATIN_2015_DATA\T5-X-V2-5-';
%save_path='C:\Users\xgong42\Documents\conversion_trbshoot';
save_path='F:\MATIN_2015\matfile_dump';
p=1;
filepathtofol=char(zeros(1,50));
filepathtow=char(zeros(1,60));
filepathtod=char(zeros(1,70));
filepathtol=char(zeros(1,80));
filepathtohaz=char(zeros(1,90));
filepathtodumplevel=char(zeros(1,100));
filepath=char(zeros(1,110));
filename=char(zeros(1,110));

%%%%%%%%%%%%%%%%%p to u all can be removed



filepathtofol=filepathmain;
F=dir(filepathtofol);     %create Struct A with directory names
FSize=StructSize(F);     %obtain number of subfolders
for f=3:FSize
    if F(f).isdir~=1
        continue
    end
    mkdir(save_path,F(f).name);
    filepathtow=[filepathtofol,'\',F(f).name];
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
                            q=strfind(dumplevel(m).name,'R0RU5I');
                            q=size(q);
                            qb=strfind(dumplevel(m).name,'feChAt');
                            qb=size(qb);
                            
                            
                            if (b(1)==1)||(q(1)==1)
                                continue;
                            end
                           

                            filepath=[filepathtodumplevel,'\',dumplevel(m).name];

                            data=read_dump(filepath,[300, 300, 200]); %read&reshape data
                            BWdata=Grain2Boundary(data); %grain boundary segmentation

                 
                            
                            save([save_path,'\',F(f).name,'\',num2str(p)],'BWdata');
                            %save([save_path,'\',num2str(p)],'BWdata');

                            %Clean up the filepath to filename
                            filename=filepath(20:end);
                            c=strfind(filename,'\');
                            filename(c(1))='';
                            for stri=2:length(c)
                                filename(c(stri)-1)='-';
                            end
                            save([save_path,'\',F(f).name,'\',num2str(p)],'filename','-append');
                            p=p+1;  

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
end    
toc

%exeptions found
%E:\MATIN_2015_DATA\T20-X-V10-\W80\D100\L70\HAZ20\.dump.additive4.4.R0RU5I
%E:\MATIN_2015_DATA\T20-X-V15-\W80\D100\L60\HAZ35\.dump.additive4.3.feChAt
