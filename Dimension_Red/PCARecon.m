function RecStat = PCARecon(PC,Basis,Mean,varargin)

% Arrange Input Variables
nb = size(PC,2);
if nargin > 3
    if isnumeric(varargin{1}) == 1
        nb = varargin{1};
    end
end

% Reconstruct
RecStat = PC(:,1:nb)*Basis(:,1:nb)';
for i=1:size(RecStat,2)
    RecStat(:,i) = RecStat(:,i)+Mean(1,i);
end