function Data=read_dump(filename,sizeof)

delimiterIn = ' ';
headerlinesIn=9;
current=importdata(filename,delimiterIn,headerlinesIn);
grainid=current.data(:,1:2);
[~,I]=sort(grainid(:,1),1);

grainid=grainid(I,:);
a=size(grainid)
Data=reshape((grainid(:,2)),sizeof);
end

