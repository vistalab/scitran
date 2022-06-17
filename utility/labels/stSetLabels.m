function fname = stSetLabels(project,dtype,varargin)
% Create a JSON file of labels
%
% Synopsis
%    fname = stSetLabels(dtype,varargin)
%
% Description:
%    We read the mat-file with the label information.  We then write
%    out the JSON file. Finally, we upload the JSON file to the
%    project.  We upload the file twice.  Once with the specific type
%    in the filename and once with the default file name, used by the
%    OHIF viewer.
%
% Input
%   dtype - Which label collection
%     {'cortex','oct','fundus'}
%
% Optional key/val parameters
%   N/A
%
% Output
%   fname - output JSON file.  Stored by default in the local directory.
%
% Description
%   For now, the labels are stored in the top part of this function.  At
%   some point in time we will put the labels elsewhere.
%
%   This function writes out the labels into ohif_config_XXX.json files.
%   We will upload them, with the proper name, to the ga.ce project.
%
% See also
%   s_fwoLabels, s_stCreateLabels
%

% Examples:
%{
  st = scitran('stanfordlabs');
  thisProject = st.lookup('wandell/achiasma');
  fname = stSetLabels(thisProject,'cortex');
%}


%% Parse
varargin = mrvParamFormat(varargin);

p = inputParser;
p.addRequired('project',@(x)(isa(x,'flywheel.model.ResolverProjectNode')));
p.addRequired('dtype',@ischar);
p.addParameter('viewer','modern',@(x)(ismember(x,{'legacy','modern'})));
p.parse(project,dtype,varargin{:});

viewer = p.Results.viewer;


%% Set up the parameters

switch mrvParamFormat(dtype)

    case 'oct'
        fname = 'ohif_config_oct.json';
        load('stLabels.mat','oct');
        allLabels = oct.labels;
        allValues = oct.values;
        % lst = oct.common;

    case 'fundus'
        fname = 'ohif_config_fundus.json';
        load('stLabels.mat','fundus');
        allLabels = fundus.labels;
        allValues = fundus.values;
        % lst = fundus.common;

    case 'cortex'
        fname = 'ohif_config_cortex.json';
        load('stLabels.mat','cortex');
        allLabels = cortex.labels;
        allValues = cortex.values;
        % lst = cortex.common;

    otherwise
        error('Unknown data type %s\n',dtype);
end


%% Build the json file

switch viewer

    case 'modern'

        for ii=1:numel(allLabels)
            info.labels(ii).label = allLabels{ii};
            info.labels(ii).value = allValues{ii};
        end

        % Write
        fname = fullfile(stRootPath,'local',fname);
        jsonwrite(fname,info);

        %{
    case 'legacy'

        % Probably should be deleted
        fname = ['legacy_',fname];

        % Build the common labels
        commonLabels = cell(numel(lst),1);
        commonValues = cell(numel(lst),1);
        for ii=1:numel(lst)
            commonLabels{ii} = allLabels{lst(ii)};
            commonValues{ii} = allValues{lst(ii)};
        end

        % Create the info struct for the project
        %   info.labels.commonLabels. ...
        %   info.labels.labels. ...

        % This is uploaded as an info field to the project
        for ii=1:numel(commonLabels)
            info.labels.commonLabels(ii).label = commonLabels{ii};
            info.labels.commonLabels(ii).value = commonValues{ii};
        end

        for ii=1:numel(allLabels)
            info.labels.labels(ii).label = allLabels{ii};
            info.labels.labels(ii).value = allValues{ii};
        end

        fname = fullfile(ophRootPath,'local',fname);
        jsonwrite(fname,info);
        %}

    otherwise
        error('Unknown viewer type %s\',viewer);
end

% Store the named file
project.uploadFile(fname);
fprintf('Uploaded the named file:  %s\n',fname)

% Make the named file the default file for the project
ohifFile = fullfile(stRootPath,'local','ohif_config.json');
copyfile(fname,ohifFile);
project.uploadFile(ohifFile);
fprintf('Uploaded the named file as the default:  %s\n',ohifFile);

end

