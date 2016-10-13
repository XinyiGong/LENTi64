function res = test(a,b,varargin)

res=a*b;
if nargin > 2
    if strcmp(varargin{1},'plus1') == 1
        res=res+1;
    else
        res='What the fuck are you saying?';
    end
end
