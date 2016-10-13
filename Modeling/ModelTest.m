PC = zeros(size(data,1),size(data(1).data,1));
for i = 1:size(data,1)
    PC(i,:) = data(i).data;
end

%%
res = stress(:,2);

%%
res = [res;stress(:,2)];

%%
reg=MultiPolyRegress(res,PC(:,1),3,'Range','figure')