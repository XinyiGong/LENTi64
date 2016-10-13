index = [15 30 40 50 60 65];

for p = 1:6
load([num2str(index(p)),'pctalpha_input.txt']);

phase = zeros(225,225,225);
for i = 1:225
    for j = 1:225
        for k = 1:225
            phase(k,j,i) = input{k,j,i}(5);
        end
    end
end

[hist,edgeFraction]=ChordLength_TwoPhase(phase);

save([num2str(index(p)),'pctalpha_ChLD'],'hist','edgeFraction')
end