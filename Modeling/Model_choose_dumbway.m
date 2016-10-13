ii=1;
min=10.0;
for i1=1:3
    for i2=1:3
        for i3=1:3
            for i4=1:3
                for i5=1:3
                    for i6=1:3
reg2{ii} = MultiPolyRegress2(prm(:,[1 3 5 4 6 7]),PC(:,1),3,[i1 i2 i3 i4 i5 i6],'range');
if min>reg2{ii}.MAE
    min=reg2{ii}.MAE;
    ndx=[i1 i2 i3 i4 i5 i6];
end
    minmx(ii,1:11)=[reg2{ii}.MAE reg2{ii}.RSquare reg2{ii}.CVRSquare reg2{ii}.CVMAE i1 i2 i3 i4 i5 i6 reg2{ii}.flag];
    ii=ii+1;
                    end
                end
            end
        end
    end
end
%%
[~,I]=sort(minmx(:,1));
minmx_sort1=minmx(I,:);
k=find(minmx_sort1(:,11)==0);