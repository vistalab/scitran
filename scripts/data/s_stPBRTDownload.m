%% s_stPBRTDownload
%
% Dealing with Flywheel downloads and scitran for the graphics.
%
% Download examples:
%    JSON file from a projects
%    Analysis output file
%
% See also
%  

%% Open up the scitran object

st = scitran('stanfordlabs');
st.verify;

%% Download and read a small JSON file

acqInfo  = st.search('acquisition',...
    'project label exact','CameraEval20190626',...
    'session label exact','city2', ...
    'subject label','renderings',...
    'acquisition label exact','city2_14:58_v12.6_f209.08right_o270.00_201962792132');
id = idGet(acqInfo{1},'data type','acquisition');
tarFileName = st.containerDownload(acqInfo{1});
untar(tarFileName);

tarFileName2 = st.containerDownload('acquisition',id);



fName = st.fileDownload(file{1});
s = jsonread(fName);
disp(s)

% Clean up
delete(fName);

%% Download an obj file from the FreeSurfer recon -all analysis

analysis = st.search('analysis',...
    'project label exact', 'Brain Beats',...
    'session label exact','20180319_1232', ...
    'summary',true);

fprintf('** Analysis:\nlabel: %s\nid: %s\n', ...
    analysis{1}.analysis.label,analysis{1}.analysis.id);

%% 
fName = fullfile(stRootPath,'local','lh.pial.obj');
st.fileDownload('lh.pial.obj',...
    'container id',analysis{1}.analysis.id,...
    'container type','analysis', ...
    'destination',fName);

if exist(fName,'file'), fprintf('File downloaded to %s\n',fName); end

fprintf('Deleting %s\n',fName)
delete(fName);

%%
