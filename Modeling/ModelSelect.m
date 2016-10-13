function reg = ModelSelect(Data,R,PW,varargin)

% Arrange Input Argument
sortcri = 'MAE';
degswitch = 'degsoff';
if nargin > 3
    for ii=1:length(varargin)
        if strcmp(varargin{ii},'RSquare') == 1
            sortcri = 'RSquare';
        end
        if isnumeric(varargin{ii}) == 1
            degswitch = 'degson';
            degs = varargin{ii};
        end
    end
end

% Get all combinations of power terms
choice={};
if strcmp(degswitch,'degson') == 1
    for i=1:size(Data,2)
        choice={choice{:},[0:degs(i)]};
    end
    PW=max(degs);
else
    for i=1:size(Data,2)
        choice={choice{:},[0:PW]};
    end
end
cb=allcomb(choice{:});
cb=cb(2:size(cb,1),:); % eliminate the combination of all zero powers

% Run MultipolyRegression
expinf=zeros(size(cb,1),5);
for ii=1:size(cb,1)
    reg2= MultiPolyRegress2(Data,R,PW,cb(ii,:),'range');
    expinf(ii,:)=[reg2.MAE reg2.RSquare reg2.CVMAE reg2.CVRSquare reg2.flag];
end

% Find the optimized model
if strcmp(sortcri,'MAE') == 1
    st = 1;
elseif strcmp(sortcri,'RSquare') == 1
    st = 2;
end
[~,I]=sort(expinf(:,st));
expinf=expinf(I,:);
cb=cb(I,:);
k=find(expinf(:,5)==0,1);
reg=MultiPolyRegress2(Data,R,PW,cb(k,:),'range');
reg(:).PowerMaximum=cb(k,:);