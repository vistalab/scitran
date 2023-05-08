%% Example of copying a project from FW-A to FW-B
%
% Copy of the eMRI data on CNI to Stanfordlabs.  Maybe.
%
% The instructions for how to do this are on the FLywheel manual page at
%
%    https://docs.flywheel.io/hc/en-us/articles/360059289793
%
%
% Make sure fw is on your path
%
%   setenv('PATH', [getenv('PATH') ':/usr/local/bin']);

%% API Keys
%
% Odd that the sourcekey has cni.flywheel.io but the destinationkey does
% not.
source      = 'cni.stanford.edu';
sourcekey   = 'cni.flywheel.io:HYsHA7Gs8K9ySHRvsz';
sourceroute = 'fw://jlg/DIANA';

destination        = 'stanfordlabs.flywheel.io';
destinationkey     = 'OQlKDTTTlkZsmDDQi_Pz3r1-_2E1m5D24REuP_3LNggUrwEkMVI1Up3i';
destinationgroup   = 'wandell';
destinationproject = 'eMRI';

%% Show the fw version
% The system command is returning an error on my home computer, 
%
%    zsh:1: command not found
%  
% Why?

[s,r] = system('fw version');
disp(r(1:(end-5)))

%% Sign in to the destination
cmd = sprintf('fw login %s:%s',destination,destinationkey);
[s, r] = system(cmd);

% Verify login status
[s,r] = system('fw status');
disp(r(1:(end-5)))

%% Build the command
cmd = sprintf('fw ingest project --group %s --project %s %s %s',destinationgroup,destinationproject,sourceroute,sourcekey);

fprintf('Copy and paste this command into a terminal window\n');
disp(cmd)

% We need to get the question returned and answer yes.  I am not sure how.
%
%  [s,r] = system(cmd);

% Project on CNI (source):   fw://cni/Psych204a
% Project on SL  (destination):  

