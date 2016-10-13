function [Data,trouble]=read_dump_check(filename,sizeof)

%returns a 300,300,200 Data array and flag=0 on success
%returns flag=1 on failure

delimiterIn = ' ';
headerlinesIn=9;
current=importdata(filename,delimiterIn,headerlinesIn);
grainid=current.data(:,1:2);
[~,I]=sort(grainid(:,1),1);

grainid=grainid(I,:);
a=size(grainid);
    if a(1,1)==18000000
    trouble=0;
    Data=reshape((grainid(:,2)),sizeof);
    else
    trouble=1;
    Data=zeros(300,300,200);
    end
end

