data = importdata('50pctalpha_avgstrs_strn_output.txt.txt');
% stress = zeros(6,2);
for i = 1:size(data,1)
    if data(i,1) == 0.2
        stress(4,:) = [50 data(i,3)];
        break
    end
end

%%
save stress stress
