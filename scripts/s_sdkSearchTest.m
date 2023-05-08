%% A failure case for Flywheel Client search in the Matlab SDK

%{
I found many failure cases using s_sdkSearch in the
ISETAutoEval20200108 project. 
--------
 session: city1_001
 acquisition: city1_15_43_hdr_thinlens_realisticMat_motion_2020110201928
 file: city1_15_43_hdr_thinlens_realisticMat_motion_2020110201928_depth.dat
%}

%% I open a connection to the Stanfordlabs Flywheel instance
st = scitran('stanfordlabs');

% The st.fw slot in this object is the Flywheel client.

%% Read the project
pname       = 'ISETAutoEval20200108';  % Fails.
project     = st.lookup(sprintf('wandell/%s',pname));
sessions    = project.sessions();

% Find the session
thisSession = stSelect(sessions,'label','city1_001','nocell',true);

% Find the acquisition
acquisitions = thisSession.acquisitions();
thisAcq = stSelect(acquisitions,'label','city1_15_43_hdr_thinlens_realisticMat_motion_2020110201928','nocell',true);

% Find the matching file, to show it exists
files = thisAcq.files;
for ii=1:4
    if isequal('city1_15_43_hdr_thinlens_realisticMat_motion_2020110201928_depth.dat',files{ii}.name)
        match = ii;
    end    
end
fprintf('File name matches this index: %d\n',match);

%% Create the search structure

% Here are the strings for the search
disp(project.label)
disp(files{match}.name)

str = sprintf('file.name = %s AND project.label = %s',files{match}.name,project.label);
srch = struct('structuredQuery', str, 'returnType', 'acquisition');
disp(str)

%% Run the search
result = st.fw.search(srch);

% The return is empty, even though the file and project clearly exist.
% There are many such examples.

%% END