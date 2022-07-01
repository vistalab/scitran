function info = infoGet(st,container,varargin)
% Get the info associated from a container or a file within a container 
%
% Syntax
%    scitran.infoGet(container,...)
%
% Description
%  Flywheel objects have an associated set of metadata. This method
%  returns the info slot specified by 'infotype'.  There are several
%  possible info types, specified below in the optional key/value
%  input.
%
% Input (required)
%   container - A Flywheel container
%   
% Optional key/value pairs
%   'info type'      - 'info' (default),'tag','note', 'all'
%
% Return
%  info - Returned information field.  Either info, tag or note.
%
% BW, Vistasoft Team, 2017
%
% See also:  scitran.infoSet

% 
% Examples:
%{
  st = scitran('stanfordlabs');
  st.verify;
110023-100_2
  % Search for files
  files = st.search('file',...
      'project label exact','DEMO', ...
      'acquisition label exact','1_1_3Plane_Loc_SSFSE');
  info = st.infoGet(files{1},'container type','file acquisition');
%}
%{
  % Search for session container.  (Not the search result).
  session = st.search('session',...
      'project label exact','Autism Phenome', ...
      'subject code','110023-100_2',...
      'fw',true);
  info = st.infoGet(session{1});
%}
%{
  acquisition = st.search('acquisition',...
      'project label exact','DEMO', ...
      'acquisition label exact','1_1_3Plane_Loc_SSFSE');
  info = st.infoGet(acquisition{1});
%}
%{
  sessions = st.search('session',...
     'project label exact','DEMO');
  sessionID = st.objectParse(sessions{1}); 

  % List acquisitions in that session
  acquisition = st.list('acquisition',sessionID);
  info = st.infoGet(acquisition{1});
%}

%% Parameters

p = inputParser;
varargin = stParamFormat(varargin);
p.addRequired('st',@(x)(isa(x,'scitran')));

% What if this is returned by a search, rather than a container
% itself?  Can't we detect and convert to the container object?
p.addRequired('container');
p.addParameter('infotype','info',@ischar);

p.parse(st,container,varargin{:});

% Different types of info data can be specified
infoType      = p.Results.infotype;

%% Figure out the the container information

containerType = stType(container);
containerID = container.id;

%% Call the right SDK function to get the whole info struct

switch containerType
    case 'project'
        meta = st.fw.getProject(containerID);
    case 'session'
        meta = st.fw.getSession(containerID);
    case 'acquisition'
        meta = st.fw.getAcquisition(containerID);
    case 'collection'
        meta = st.fw.getCollection(containerID);
    case 'analysis'
      meta = obj.fw.getAnalysis(containerID);

      % The 'file' data type is handled a little differently.
    case 'fileentry'
        
        % The file name
        fname = container.name;

        % The ID of the file's parent
        parentContainerID = container.parent.id;

        % Based on the type of the file's parent, make the right call
        switch stType(container.parent)
            case 'project'
                meta = st.fw.getProjectFileInfo(parentContainerID,fname);
            case 'session'
                meta = st.fw.getSessionFileInfo(parentContainerID,fname);
            case 'acquisition'
                meta = st.fw.getAcquisitionFileInfo(parentContainerID,fname);
            case 'collection'
                meta = st.fw.getCollectionFileInfo(parentContainerID,fname);
        end
end

%% If the user asks for something specific, parse the request here

% There are separate methods for Notes and Tags.  I don't think they
% are needed because the information is in the info object.  So, the
% preferred way to get them is infoGet( ...., 'info type','note') ...
% or similar.  
%
% Note:  We could add an 'roi' type.
switch infoType
    case 'info'
        info = meta.info;
    case 'note'
        info = meta.notes;
    case 'tag'
        info = meta.tags;
    case 'classification'
        if ~isequal(containerType,'file')
            error('classification present only for files');
        elseif isfield(meta,'classification')
            info = meta.classification; 
        end
    case 'all'
        info = meta;
    otherwise
        warning('No option for %s.  Returning info (default)\n',infoType);
        info = meta.info;
end

end
