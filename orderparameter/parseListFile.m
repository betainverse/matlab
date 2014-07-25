function [IntensityMap,SNmap] = parseListFile(filename)
% parseListFile parses a single sparky peaklist file into a pair of
% dictionaries. 
%   This function assumes the following peak list column format with a 
% one-line header:
% Assignment w1 w2 Data_Height S/N
% With this column format, this function produces a pair of dictionaries,
% keyed by assignment and giving Data_Height and S/N, respectively. 
    fid = fopen(char(filename),'r');
    T = textscan(fid,'%s%f%f%f%f', 'HeaderLines',1);
    fclose(fid);
    col1 = T{1};
    col4 = T{4};
    col5 = T{5};
    IntensityMap = containers.Map(col1,col4);
    SNmap = containers.Map(col1,col5);
end
