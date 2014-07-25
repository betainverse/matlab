function [ ratiosMap,sigmasMap ] = parsePeakLists( Yfiles,Nfiles )
% parsePeakLists reads a set of sparky peak list files and produces a set
% of dictionaries mapping peak assignment to peak intensity and
% signal-to-noise ratio for both the yes condition and the no condition.
% The file list order in Yfiles and Nfiles is maintained in the intensity
% and S/N lists, so that they continue to correspond with delay lengths
% maintained in a similar list!
%   This function assumes the peak lists have the following column format:
% Assignment w1 w2 Data_Height S/N
%   Note that Yfiles and Nfiles must have the same length.
%
% Probably should just compute the ratio and sigma directly in here. 
ratiosMap = containers.Map;
sigmasMap = containers.Map;
[firstImap,firstSNmap] = parseListFile(Yfiles(1));
assignments = firstImap.keys
for i=1:length(assignments)
   ratiosMap(char(assignments(i)))=[];
   sigmasMap(char(assignments(i)))=[];
end
for i=1:length(Yfiles)
   % get intensity and S/N values from a pair of files
   [yImap,ySNmap] = parseListFile(Yfiles(i));
   [nImap,nSNmap] = parseListFile(Nfiles(i));
   % check if assignments match those in the first file
   % calculate intensity ratios
   % propagate error from S/Ns
   for a = assignments
       ratio=-1*yImap(char(a))/nImap(char(a));
       sigma=ratio*sqrt((nSNmap(char(a))^-2)+(ySNmap(char(a))^-2));
       ratiosMap(char(a))=[ratiosMap(char(a)) ratio];
       sigmasMap(char(a))=[sigmasMap(char(a)) sigma];
   end

end
end
