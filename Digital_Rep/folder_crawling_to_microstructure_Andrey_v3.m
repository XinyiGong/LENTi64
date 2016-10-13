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
save_path='F:\MATIN_2015\matfile_dump_5';
corrupt_files='F:\MATIN_2015\corrupt';
p=726;
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
for f=13:FSize
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
                            v(m-2)=dumplevel(m).bytes;
                        end
                            [Y,I]=max(v);

                            filepath=[filepathtodumplevel,'\',dumplevel(I+2).name];
                            clear v;
                            [data,trouble]=read_dump_check(filepath,[300, 300, 200]); %read&reshape data
                            if trouble==0                            
                                BWdata=Grain2Boundary(data); %grain boundary segmentation
                            else
                                mkdir(corrupt_files,F(f).name);
                                save([corrupt_files,'\',F(f).name,'\',num2str(p)],'filepath');
                                break;
                            end
                 
                            
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


                            %break;
                        %%%%%%%%%%core part end here!!!!!!!







                    end
                end 
            end
    end
end    
toc

%Trouble files
%E:\MATIN_2015_DATA\T20-X-V2-5-\W70\D125\L60\HAZ5\dump.additive4.13

%Hard trouble:
%E:\MATIN_2015_DATA\T35-X-V10-\W60\D100\L50\HAZ20\dump.additive4.4

% Elapsed time is 32299.402390 seconds. 15 folders

