N = 20;
index = [15 30 40 50 60 65];

for p = 1:6
fileID = fopen([num2str(index(p)),'pctalpha_input.txt']);
formatSpec = '%.3f %.3f %.3f %.0f %.0f %.0f %.0f %.0f';
k = 0;
input = cell(225,225,225);
while ~feof(fileID)
    k = k+1;
    C = textscan(fileID,formatSpec,N);
    if k == (225*225*225-5)/20+1;
        n = mod(225*225*225,20);
    else
        n = N;
    end
    for i = 1:n
        input{C{1,4}(i,1),C{1,5}(i,1),C{1,6}(i,1)} = [C{1,1}(i,1),C{1,2}(i,1),C{1,3}(i,1),C{1,7}(i,1),C{1,8}(i,1)];
    end
end
fclose(fileID);
save([num2str(index(p)),'pctalpha_input'],'input')
end