%% Example of copying a project from FW-A to FW-B


%% API Keys
source      = 'cni.stanford.edu';
destination = 'stanfordlabs.flywheel.io';
sourcekey        = 'cni.flywheel.io:HYsHA7Gs8K9ySHRvsz';
destinationkey   = 'stanfordlabs.flywheel.io:OQlKDTTTlkZsmDDQi_Pz3r1-_2E1m5D24REuP_3LNggUrwEkMVI1Up3i';

% Sign in to the destination
cmd = sprintf('fw login %s:%s',destination,destinationkey);
[status, result] = system(cmd);

system('fw status');

% Project on CNI (source):   fw://cni/Psych204a
% Project on SL  (destination):  