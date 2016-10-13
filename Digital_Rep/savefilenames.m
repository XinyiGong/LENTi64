% This function save filenames in a certain folder: 
% 1st input should be:
%   type:string
%   meaning:the input path to which the folder that you try to get the filenames from;
% 2nd input should be:
%   type:string
%   meaning:the output path to which you want to save the names
% 3nd input should be:
%     type:integer
%     meaning: 1 if you want to save as excel file
function [listlength]=savefilenames(inputpath,outputpath,isexcel)


if ~ischar(inputpath)
    error('Inputpath must be a string')
end

if ~ischar(outputpath)
    error('Outputpath must be a string')
end



%Get file list
filelist=dir(inputpath);

if isempty(filelist)
    error('Empty folder')
end

% %Get the longest name
% lgth=length(filelist(1).name);
% if length(filelist)>1
%     for fl=2:length(filelist)
%         if lgth<length(filelist(fl).name)
%             lgth=length(filelist(fl).name);
%         end
%     end
% end

%Preallocate variables
% namelist=char(zeros(length(filelist),lgth));
namelist=cell(length(filelist),1);
for fl=1:length(filelist)
%     namelist(fl,1:length(filelist(fl).name))=filelist(fl).name;
    namelist{fl}=filelist(fl).name;
end

if isempty(outputpath)
    save('names','namelist');
elseif isexcel==1
    xlswrite([outputpath,'\names.xlsx'],namelist,1,'A1');
else 
    save([outputpath,'\names'],'namelist');
end
listlength=length(filelist);
