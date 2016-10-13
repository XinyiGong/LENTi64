close all
clear
clc

filelist=dir('*.mat');

for fl=1:length(filelist)
    m=matfile(filelist(fl).name,'Writable',true);
    filename=m.filename;
    a=findstr(filename,'\');
    filename(a(1))='';
    for i=2:length(a)
        filename(a(i)-1)='-';
    end
    m.filename=filename;
end