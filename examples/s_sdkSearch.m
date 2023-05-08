%% Search examples
%
% Testing the search feature and exploring different cases
%
%

%%
st = scitran('stanfordlabs');

%% Read the project
% pname = 'ISETAutoEval20200108';  % Fails.
pname = 'CameraEval20190626';  % So far, all files were found.
project = st.lookup(sprintf('wandell/%s',pname));

% We check the renderings only; the scenes acquisitions are not sorted and
% the acquisitions are too many
subjects = project.subjects();
renderings = stSelect(subjects,'label','renderings','nocell',true);
allSessions = renderings.sessions();
fprintf('%d sessions for the renderings subject.\n',numel(allSessions));

thisLabel = 'city2';
sessions = stSelect(allSessions,'label',thisLabel,'contains',true);
fprintf('%d sessions with label %s.\n',numel(sessions),thisLabel);

%% We might loop through some sessions with files, looking to find the acquisition and session

eCount = 0;
for ss=1:numel(sessions)
    thisSession = sessions{ss};
    disp(thisSession.label)
    acquisitions = thisSession.acquisitions();
    fprintf('%d acquisitions\n',numel(acquisitions));
    
    fprintf('Session (%d)\n',ss)
    % For each acquisition
    for aa = 1:numel(acquisitions)
        thisAcquisition = acquisitions{aa};

        % For each file
        for ff=1:numel(thisAcquisition.files)
            fname = thisAcquisition.files{ff}.name;
            str = sprintf('file.name = %s AND project.label = %s',fname,pname);
            srch = struct('structuredQuery', str, 'returnType', 'acquisition');
            % disp(srch);
            result = st.fw.search(srch);
            if isempty(result) 
                warning('Empty result on session %d acq %d file %d',ss, aa,ff);
                eCount = eCount + 1;
            elseif ~isequal(result{1}.acquisition.label, thisAcquisition.label)
                warning('Wrong acquisiton label on acq %d file %d',aa,ff);
                eCount = eCount + 1;
            else
                fprintf('%d ',length(fname));
                if ~mod(aa,20), fprintf('\n'); end
            end
        end
        if eCount > 10, break; end
    end
    fprintf('\n');  
    if eCount > 10, break; end
end

%% Search for a specific file

fname = 'city1_11:43_v6.4_f17.79left_o270.00_2019626205140_depth.dat';
str = sprintf('file.name = %s AND project.label = %s',fname,pname);
srch = struct('structuredQuery', str, 'returnType', 'acquisition');
result = st.fw.search(srch);

