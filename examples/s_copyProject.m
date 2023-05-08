%% Example of copying a project from FW-A to FW-B
%
% The instructions for how to do this are on the FLywheel manual page at
%
%    https://docs.flywheel.io/hc/en-us/articles/360059289793
%

%% API Keys
source      = 'cni.stanford.edu';
sourcekey   = 'cni.flywheel.io:HYsHA7Gs8K9ySHRvsz';
sourceroute = 'fw://cni/Psych204a';

destination        = 'stanfordlabs.flywheel.io';
destinationkey     = 'stanfordlabs.flywheel.io:OQlKDTTTlkZsmDDQi_Pz3r1-_2E1m5D24REuP_3LNggUrwEkMVI1Up3i';
destinationgroup   = 'wandell';
destinationproject = 'Psych204a';

%% Show the fw version
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

