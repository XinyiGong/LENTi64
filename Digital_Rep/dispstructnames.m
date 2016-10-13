% This function display structure names in a certain folder: 
% Input should be:
%   type:string
%   meaning:the input path to which the folder that you try to get the filenames from;
% Note: this function only deal with structure saved in .mat file and the variable name must be 'filename'!

function []=dispstructnames(inputpath)

if isempty(inputpath)
else
    if ~ischar(inputpath)
      error('Inputpath must be a string')
    end
end

%Get file list
filelist=dir([inputpath,'\*.mat']);%%%%%%%%%%%%%If have to read other type of file should change this
if isempty(filelist)
    error('Empty folder')
end

for fl=1:length(filelist)
    load([inputpath,'\',filelist(fl).name],'filename');
    disp(filename)
end

