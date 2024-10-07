function dr_fwDownloadFileFromSession(varargin)

%{
serverName = 'stanfordlabs';
% collectionName = 'CompRepCheck';
collectionName = 'BCBL_BERTSO';
fileNameContains = 'afq_';
% downloadBase = '/sni-storage/kalanit/biac2/kgs/projects/NFA_tasks/data_mrAuto';
downloadBase = '/bcbl/home/public/Gari/BERTSOLARI/Nifti'

    dr_fwDownloadFileFromSession('serverName',serverName, ...
                                  'collectionName',collectionName, ...
                                  'fileNameContains', fileNameContains, ...
                                  'downloadBase', downloadBase, ...
                                  'unzipFile', false, ...
                                  'showSessions', false)
%}

%% Read parameters/create defaults            
p = inputParser;
p.addParameter('serverName'           , 'stanfordlabs' , @ischar);
p.addParameter('collectionName'       , 'tmpCollection', @ischar);
p.addParameter('fileNameContains'     , 'afq_'         , @ischar);
p.addParameter('downloadBase'         , '/tmp'         , @ischar);
p.addParameter('unzipFile'            , false          , @islogical);
p.addParameter('showSessions'         , false          , @islogical);
p.parse(varargin{:});
            
serverName           = p.Results.serverName;
collectionName       = p.Results.collectionName;
fileNameContains     = p.Results.fileNameContains;
downloadBase         = p.Results.downloadBase;
unzipFile            = p.Results.unzipFile;
showSessions         = p.Results.showSessions;


%% 1.- CONNECT (server & collection)
st = scitran(serverName);   
st.verify

% Connect to the collection, verify it and show the number of sessions for verification
% FC: obtain collection ID from the collection name
collectionID = '';
collections  = st.fw.getAllCollections();
for nc=1:length(collections)
    if strcmp(collections{nc}.label, collectionName)
        collectionID = collections{nc}.id;
    end
end

if isempty(collectionID)
    error(sprintf('Collection %s could not be found on the server %s (verify permissions or the collection name).', collectionName, serverName))
else
    thisCollection        = st.fw.getCollection(collectionID);
    sessionsInCollection  = st.fw.getCollectionSessions(idGet(thisCollection));
    fprintf('There are %i sessions in the collection %s (server %s).\n', length(sessionsInCollection), collectionName, serverName)
    if showSessions
        for ns=1:length(sessionsInCollection)
        thisSession = st.fw.getSession(idGet(sessionsInCollection{ns}));
        % Get info for the project the session belong to
        thisProject = st.fw.getProject(thisSession.project);
        fprintf('(%d) %s >> %s (%s)\n', ns, thisProject.label, thisSession.subject.code, thisSession.label)
        end
    end
end

%% Download the files


% This is in stanfordlabs.flywheel.io
% If sthg is not going right for a subject, it will add it here
for ns=1:length(sessionsInCollection)
    % Get info for the session
    thisSession = st.fw.getSession(idGet(sessionsInCollection{ns}));
    % Get info for the project the session belong to
    thisProject = st.fw.getProject(thisSession.project);
    fprintf('(%d) Session: %s >> %s (Session: %s)\n', ns, thisProject.label, thisSession.subject.code, thisSession.label)
    
    
    % Obtain the T1w and dwi acquisitions
    acqus = st.list('acquisition', idGet(thisSession));
    T1wacqu = [];
    dwiacqu = [];
    for na=1:length(acqus)
        acqu = st.fw.getAcquisition(idGet(acqus{na}));
        if strcmp(acqu.label,'T1w'); T1wacqu=acqu;end
        if strcmp(acqu.label,'DWI'); dwiacqu=acqu;end
    end
    
    % Obtain the files themselves
    
    sub = strrep(thisSession.subject.code,'_','');
    ses = 'T01';
    
    
    % ANATOMICAL
    T1wFile = dr_fwFileName(T1wacqu, 'T1w.nii.gz');
    anatDownloadDir = fullfile(downloadBase, ['sub-' sub], ...
                               ['ses-' ses],'anat');
    T1wfname = ['sub-' sub '_ses-' ses '_T1w.nii.gz']; 
    % Create folder if it does not exist
    if ~exist(anatDownloadDir,'dir'); mkdir(anatDownloadDir);end
    % % Download the files 
    if ~isfile(fullfile(anatDownloadDir,T1wfname))
        st.fw.downloadFileFromAcquisition(T1wacqu.id, T1wFile, ...
                                     fullfile(anatDownloadDir,T1wfname));
    end
    
    
    
    % DWI
    dwiDownloadDir = fullfile(downloadBase,['sub-' sub],['ses-' ses],'dwi');
    if ~exist(dwiDownloadDir,'dir'); mkdir(dwiDownloadDir);end
    % DWI
    dwiFile = dr_fwFileName(dwiacqu, 'nii.gz');
    dwifname = ['sub-' sub '_ses-' ses '_acq-AP_dwi.nii.gz']; 
    if ~isfile(fullfile(dwiDownloadDir,dwifname))
        st.fw.downloadFileFromAcquisition(dwiacqu.id, dwiFile, fullfile(dwiDownloadDir,dwifname));
    end
    % BVAL
    bvalFile = dr_fwFileName(dwiacqu, 'bval');
    bvalfname = ['sub-' sub '_ses-' ses '_acq-AP_dwi.bval']; 
    if ~isfile(fullfile(dwiDownloadDir,bvalfname))
        st.fw.downloadFileFromAcquisition(dwiacqu.id, bvalFile,fullfile(dwiDownloadDir,bvalfname));
    end
    % BVEC
    bvecFile = dr_fwFileName(dwiacqu, 'bvec');
    bvecfname = ['sub-' sub '_ses-' ses '_acq-AP_dwi.bvec'];
    if ~isfile(fullfile(dwiDownloadDir,bvecfname))
        st.fw.downloadFileFromAcquisition(dwiacqu.id,bvecFile',fullfile(dwiDownloadDir,bvecfname));
    end
        
end  % for
end  % function

