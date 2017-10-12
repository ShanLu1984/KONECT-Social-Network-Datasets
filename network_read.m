% This funciton is used to read joint degree infomation from the source
% data

clc;
clear;
close all;

N = 1000000;

% node_size = 46952;
% dataset = 'out.FACEBOOK-WOSN-WALL';

% node_size = 2987535;
% dataset = 'out.wiki_talk_en';

 
% node_size = 2302925;
% dataset = 'out.flickr-growth';


% node_size = 1138499;
% dataset = 'out.youtube-links';


% node_size = 875713;
% dataset = 'out.web-Google';


% node_size = 4847571;
% dataset = 'out.soc-LiveJournal1';

format = '%s %s %*[^\n]';
degrees = zeros(node_size,2);
fileID = fopen(dataset,'r');

% read data
while ~feof(fileID)
    tic;
    data = textscan(fileID,format,N,'HeaderLines',2);
    clear out_node in_node;
    out_node = data{1,1};
    in_node = data{1,2};
    clear data;
    
    size_edge = size(out_node,1);
    for i = 1:size_edge
        out = str2double(out_node{i});
        in = str2double(in_node{i});
        
        degrees(out,1) = degrees(out,1) + 1;
        degrees(in,2) = degrees(in,2) + 1;
    end
    
    toc;
end

fclose(fileID);

% save data
save('degrees.mat','degrees');
