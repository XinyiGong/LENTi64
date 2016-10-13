function GG=noob2ptauto(Data,isperiodic)
% Default Cutoff
cutoff=(ceil((min(size(Data)))/2));

if isperiodic == 1 
    % Periodic
    GG=CorrMaster('full','auto',cutoff,double(Data));
    BB=numel(Data);
    GG=GG./BB;
elseif isperiodic == 0  
    % Non-Periodic
    GG=CorrMaster('full','auto',cutoff,padarray(double(Data),[cutoff cutoff cutoff],0,'both'));
    BB=CorrMaster('full','auto',cutoff,padarray(ones(size(Data)),[cutoff cutoff cutoff],0,'both'));
    GG=GG./BB;
end


