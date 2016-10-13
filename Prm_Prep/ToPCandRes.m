PC = zeros(size(data,1),size(data(1).data,1));
for i = 1:size(data,1)
    PC(i,:) = data(i).data';
end

%%
index = [15 30 40 50 60 65];
% res = zeros(18,10);
for p = 1:6
    data = importdata([num2str(index(p)),'pctalpha_avgstrs_strn_output.txt']);
    res(p+12,:) = data(2:2:20,3)';
end