%% Search examples
%
% Testing the search feature and exploring different cases
%
%

%%
st = scitran('stanfordlabs');

%% Read the project
project = st.lookup('wandell/ISETAutoEval20200108');
sessions = project.sessions();
subjects = project.subjects();

%%  Get a large pile of acquisitions.

thisSession = sessions{1};
acquisitions = thisSession.acquisitions();


%%
