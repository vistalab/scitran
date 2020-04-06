% AnalysisOutput
%
% AnalysisOutput Properties:
%    id             - Unique database ID
%    inputs      
%    files       
%    job         
%    gearInfo    
%    notes       
%    tags         - Array of application-specific tags
%    info        
%    description 
%    label        - Application-specific label
%    parent      
%    parents     
%    created      - Creation time (automatically set)
%    modified     - Last modification time (automatically updated)
%    revision     - An incremental document revision number
%
% AnalysisOutput Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef AnalysisOutput < flywheel.ModelBase & flywheel.mixins.AnalysisMixin
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'id', 'inputs', 'files', 'job', 'gearInfo', 'notes', 'tags', 'info', 'description', 'label', 'parent', 'parents', 'created', 'modified', 'revision' }, ...
            { '_id', 'inputs', 'files', 'job', 'gear_info', 'notes', 'tags', 'info', 'description', 'label', 'parent', 'parents', 'created', 'modified', 'revision' });
    end
    properties(Dependent)
        id
        inputs
        files
        job
        gearInfo
        notes
        tags
        info
        description
        label
        parent
        parents
        created
        modified
        revision
    end
    methods
        function obj = AnalysisOutput(varargin)
            obj@flywheel.ModelBase(flywheel.model.AnalysisOutput.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'id', []);
                addParameter(p, 'inputs', []);
                addParameter(p, 'files', []);
                addParameter(p, 'job', []);
                addParameter(p, 'gearInfo', []);
                addParameter(p, 'notes', []);
                addParameter(p, 'tags', []);
                addParameter(p, 'info', []);
                addParameter(p, 'description', []);
                addParameter(p, 'label', []);
                addParameter(p, 'parent', []);
                addParameter(p, 'parents', []);
                addParameter(p, 'created', []);
                addParameter(p, 'modified', []);
                addParameter(p, 'revision', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.id)
                    obj.props_('_id') = p.Results.id;
                end
                if ~isempty(p.Results.inputs)
                    obj.props_('inputs') = p.Results.inputs;
                end
                if ~isempty(p.Results.files)
                    obj.props_('files') = p.Results.files;
                end
                if ~isempty(p.Results.job)
                    obj.props_('job') = p.Results.job;
                end
                if ~isempty(p.Results.gearInfo)
                    obj.props_('gear_info') = p.Results.gearInfo;
                end
                if ~isempty(p.Results.notes)
                    obj.props_('notes') = p.Results.notes;
                end
                if ~isempty(p.Results.tags)
                    obj.props_('tags') = p.Results.tags;
                end
                if ~isempty(p.Results.info)
                    obj.props_('info') = p.Results.info;
                end
                if ~isempty(p.Results.description)
                    obj.props_('description') = p.Results.description;
                end
                if ~isempty(p.Results.label)
                    obj.props_('label') = p.Results.label;
                end
                if ~isempty(p.Results.parent)
                    obj.props_('parent') = p.Results.parent;
                end
                if ~isempty(p.Results.parents)
                    obj.props_('parents') = p.Results.parents;
                end
                if ~isempty(p.Results.created)
                    obj.props_('created') = p.Results.created;
                end
                if ~isempty(p.Results.modified)
                    obj.props_('modified') = p.Results.modified;
                end
                if ~isempty(p.Results.revision)
                    obj.props_('revision') = p.Results.revision;
                end
            end
        end
        function result = get.id(obj)
            if ismethod(obj, 'get_id')
                result = obj.get_id();
            else
                if isKey(obj.props_, '_id')
                    result = obj.props_('_id');
                else
                    result = [];
                end
            end
        end
        function obj = set.id(obj, value)
            obj.props_('_id') = value;
        end
        function result = get.inputs(obj)
            if ismethod(obj, 'get_inputs')
                result = obj.get_inputs();
            else
                if isKey(obj.props_, 'inputs')
                    result = obj.props_('inputs');
                else
                    result = [];
                end
            end
        end
        function obj = set.inputs(obj, value)
            obj.props_('inputs') = value;
        end
        function result = get.files(obj)
            if ismethod(obj, 'get_files')
                result = obj.get_files();
            else
                if isKey(obj.props_, 'files')
                    result = obj.props_('files');
                else
                    result = [];
                end
            end
        end
        function obj = set.files(obj, value)
            obj.props_('files') = value;
        end
        function result = get.job(obj)
            if ismethod(obj, 'get_job')
                result = obj.get_job();
            else
                if isKey(obj.props_, 'job')
                    result = obj.props_('job');
                else
                    result = [];
                end
            end
        end
        function obj = set.job(obj, value)
            obj.props_('job') = value;
        end
        function result = get.gearInfo(obj)
            if ismethod(obj, 'get_gearInfo')
                result = obj.get_gearInfo();
            else
                if isKey(obj.props_, 'gear_info')
                    result = obj.props_('gear_info');
                else
                    result = [];
                end
            end
        end
        function obj = set.gearInfo(obj, value)
            obj.props_('gear_info') = value;
        end
        function result = get.notes(obj)
            if ismethod(obj, 'get_notes')
                result = obj.get_notes();
            else
                if isKey(obj.props_, 'notes')
                    result = obj.props_('notes');
                else
                    result = [];
                end
            end
        end
        function obj = set.notes(obj, value)
            obj.props_('notes') = value;
        end
        function result = get.tags(obj)
            if ismethod(obj, 'get_tags')
                result = obj.get_tags();
            else
                if isKey(obj.props_, 'tags')
                    result = obj.props_('tags');
                else
                    result = [];
                end
            end
        end
        function obj = set.tags(obj, value)
            obj.props_('tags') = value;
        end
        function result = get.info(obj)
            if ismethod(obj, 'get_info')
                result = obj.get_info();
            else
                if isKey(obj.props_, 'info')
                    result = obj.props_('info');
                else
                    result = [];
                end
            end
        end
        function obj = set.info(obj, value)
            obj.props_('info') = value;
        end
        function result = get.description(obj)
            if ismethod(obj, 'get_description')
                result = obj.get_description();
            else
                if isKey(obj.props_, 'description')
                    result = obj.props_('description');
                else
                    result = [];
                end
            end
        end
        function obj = set.description(obj, value)
            obj.props_('description') = value;
        end
        function result = get.label(obj)
            if ismethod(obj, 'get_label')
                result = obj.get_label();
            else
                if isKey(obj.props_, 'label')
                    result = obj.props_('label');
                else
                    result = [];
                end
            end
        end
        function obj = set.label(obj, value)
            obj.props_('label') = value;
        end
        function result = get.parent(obj)
            if ismethod(obj, 'get_parent')
                result = obj.get_parent();
            else
                if isKey(obj.props_, 'parent')
                    result = obj.props_('parent');
                else
                    result = [];
                end
            end
        end
        function obj = set.parent(obj, value)
            obj.props_('parent') = value;
        end
        function result = get.parents(obj)
            if ismethod(obj, 'get_parents')
                result = obj.get_parents();
            else
                if isKey(obj.props_, 'parents')
                    result = obj.props_('parents');
                else
                    result = [];
                end
            end
        end
        function obj = set.parents(obj, value)
            obj.props_('parents') = value;
        end
        function result = get.created(obj)
            if ismethod(obj, 'get_created')
                result = obj.get_created();
            else
                if isKey(obj.props_, 'created')
                    result = obj.props_('created');
                else
                    result = [];
                end
            end
        end
        function obj = set.created(obj, value)
            obj.props_('created') = value;
        end
        function result = get.modified(obj)
            if ismethod(obj, 'get_modified')
                result = obj.get_modified();
            else
                if isKey(obj.props_, 'modified')
                    result = obj.props_('modified');
                else
                    result = [];
                end
            end
        end
        function obj = set.modified(obj, value)
            obj.props_('modified') = value;
        end
        function result = get.revision(obj)
            if ismethod(obj, 'get_revision')
                result = obj.get_revision();
            else
                if isKey(obj.props_, 'revision')
                    result = obj.props_('revision');
                else
                    result = [];
                end
            end
        end
        function obj = set.revision(obj, value)
            obj.props_('revision') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, '_id')
                result('_id') = flywheel.ModelBase.serializeValue(obj.props_('_id'), 'char');
            end
            if isKey(obj.props_, 'inputs')
                result('inputs') = flywheel.ModelBase.cellmap(@toJson, obj.props_('inputs'));
            end
            if isKey(obj.props_, 'files')
                result('files') = flywheel.ModelBase.cellmap(@toJson, obj.props_('files'));
            end
            if isKey(obj.props_, 'job')
                result('job') = obj.props_('job').toJson();
            end
            if isKey(obj.props_, 'gear_info')
                result('gear_info') = obj.props_('gear_info').toJson();
            end
            if isKey(obj.props_, 'notes')
                result('notes') = flywheel.ModelBase.cellmap(@toJson, obj.props_('notes'));
            end
            if isKey(obj.props_, 'tags')
                result('tags') = flywheel.ModelBase.serializeValue(obj.props_('tags'), 'vector[char]');
            end
            if isKey(obj.props_, 'info')
                result('info') = obj.props_('info').toJson();
            end
            if isKey(obj.props_, 'description')
                result('description') = flywheel.ModelBase.serializeValue(obj.props_('description'), 'char');
            end
            if isKey(obj.props_, 'label')
                result('label') = flywheel.ModelBase.serializeValue(obj.props_('label'), 'char');
            end
            if isKey(obj.props_, 'parent')
                result('parent') = obj.props_('parent').toJson();
            end
            if isKey(obj.props_, 'parents')
                result('parents') = obj.props_('parents').toJson();
            end
            if isKey(obj.props_, 'created')
                result('created') = flywheel.ModelBase.serializeValue(obj.props_('created'), 'datetime');
            end
            if isKey(obj.props_, 'modified')
                result('modified') = flywheel.ModelBase.serializeValue(obj.props_('modified'), 'datetime');
            end
            if isKey(obj.props_, 'revision')
                result('revision') = flywheel.ModelBase.serializeValue(obj.props_('revision'), 'integer');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, '_id')
                result.id = obj.props_('_id');
            else
                result.id = [];
            end
            if isKey(obj.props_, 'inputs')
                result.inputs = flywheel.ModelBase.cellmap(@struct, obj.props_('inputs'));
            else
                result.inputs = [];
            end
            if isKey(obj.props_, 'files')
                result.files = flywheel.ModelBase.cellmap(@struct, obj.props_('files'));
            else
                result.files = [];
            end
            if isKey(obj.props_, 'job')
                result.job = struct(obj.props_('job'));
            else
                result.job = [];
            end
            if isKey(obj.props_, 'gear_info')
                result.gearInfo = struct(obj.props_('gear_info'));
            else
                result.gearInfo = [];
            end
            if isKey(obj.props_, 'notes')
                result.notes = flywheel.ModelBase.cellmap(@struct, obj.props_('notes'));
            else
                result.notes = [];
            end
            if isKey(obj.props_, 'tags')
                result.tags = obj.props_('tags');
            else
                result.tags = [];
            end
            if isKey(obj.props_, 'info')
                result.info = struct(obj.props_('info'));
            else
                result.info = [];
            end
            if isKey(obj.props_, 'description')
                result.description = obj.props_('description');
            else
                result.description = [];
            end
            if isKey(obj.props_, 'label')
                result.label = obj.props_('label');
            else
                result.label = [];
            end
            if isKey(obj.props_, 'parent')
                result.parent = struct(obj.props_('parent'));
            else
                result.parent = [];
            end
            if isKey(obj.props_, 'parents')
                result.parents = struct(obj.props_('parents'));
            else
                result.parents = [];
            end
            if isKey(obj.props_, 'created')
                result.created = obj.props_('created');
            else
                result.created = [];
            end
            if isKey(obj.props_, 'modified')
                result.modified = obj.props_('modified');
            else
                result.modified = [];
            end
            if isKey(obj.props_, 'revision')
                result.revision = obj.props_('revision');
            else
                result.revision = [];
            end
        end
        function result = returnValue(obj)
            result = obj;
        end
    end
    methods(Access = protected)
        function prpgrp = getPropertyGroups(obj)
            if ~isscalar(obj)
                prpgrp = getPropertyGroups@matlab.mixin.CustomDisplay(obj);
            else
                propList = struct;
                if isKey(obj.props_, '_id')
                    propList.id = obj.props_('_id');
                else
                    propList.id = [];
                end
                if isKey(obj.props_, 'inputs')
                    propList.inputs = obj.props_('inputs');
                else
                    propList.inputs = [];
                end
                if isKey(obj.props_, 'files')
                    propList.files = obj.props_('files');
                else
                    propList.files = [];
                end
                if isKey(obj.props_, 'job')
                    propList.job = obj.props_('job');
                else
                    propList.job = [];
                end
                if isKey(obj.props_, 'gear_info')
                    propList.gearInfo = obj.props_('gear_info');
                else
                    propList.gearInfo = [];
                end
                if isKey(obj.props_, 'notes')
                    propList.notes = obj.props_('notes');
                else
                    propList.notes = [];
                end
                if isKey(obj.props_, 'tags')
                    propList.tags = obj.props_('tags');
                else
                    propList.tags = [];
                end
                if isKey(obj.props_, 'info')
                    propList.info = obj.props_('info');
                else
                    propList.info = [];
                end
                if isKey(obj.props_, 'description')
                    propList.description = obj.props_('description');
                else
                    propList.description = [];
                end
                if isKey(obj.props_, 'label')
                    propList.label = obj.props_('label');
                else
                    propList.label = [];
                end
                if isKey(obj.props_, 'parent')
                    propList.parent = obj.props_('parent');
                else
                    propList.parent = [];
                end
                if isKey(obj.props_, 'parents')
                    propList.parents = obj.props_('parents');
                else
                    propList.parents = [];
                end
                if isKey(obj.props_, 'created')
                    propList.created = obj.props_('created');
                else
                    propList.created = [];
                end
                if isKey(obj.props_, 'modified')
                    propList.modified = obj.props_('modified');
                else
                    propList.modified = [];
                end
                if isKey(obj.props_, 'revision')
                    propList.revision = obj.props_('revision');
                else
                    propList.revision = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.AnalysisOutput;
            if isfield(json, 'x0x5Fid')
                obj.props_('_id') = flywheel.ModelBase.deserializeValue(json.x0x5Fid, 'char');
            end
            if isfield(json, 'inputs')
                obj.props_('inputs') = flywheel.ModelBase.cellmap(@(x) flywheel.model.FileEntry.fromJson(x, context), json.inputs);
            end
            if isfield(json, 'files')
                obj.props_('files') = flywheel.ModelBase.cellmap(@(x) flywheel.model.FileEntry.fromJson(x, context), json.files);
            end
            if isfield(json, 'job')
                obj.props_('job') = flywheel.model.Job.fromJson(json.job, context);
            end
            if isfield(json, 'gear_info')
                obj.props_('gear_info') = flywheel.model.GearInfo.fromJson(json.gear_info, context);
            end
            if isfield(json, 'notes')
                obj.props_('notes') = flywheel.ModelBase.cellmap(@(x) flywheel.model.Note.fromJson(x, context), json.notes);
            end
            if isfield(json, 'tags')
                obj.props_('tags') = flywheel.ModelBase.deserializeValue(json.tags, 'vector[char]');
            end
            if isfield(json, 'info')
                obj.props_('info') = flywheel.model.CommonInfo.fromJson(json.info, context);
            end
            if isfield(json, 'description')
                obj.props_('description') = flywheel.ModelBase.deserializeValue(json.description, 'char');
            end
            if isfield(json, 'label')
                obj.props_('label') = flywheel.ModelBase.deserializeValue(json.label, 'char');
            end
            if isfield(json, 'parent')
                obj.props_('parent') = flywheel.model.ContainerReference.fromJson(json.parent, context);
            end
            if isfield(json, 'parents')
                obj.props_('parents') = flywheel.model.ContainerParents.fromJson(json.parents, context);
            end
            if isfield(json, 'created')
                obj.props_('created') = flywheel.ModelBase.deserializeValue(json.created, 'datetime');
            end
            if isfield(json, 'modified')
                obj.props_('modified') = flywheel.ModelBase.deserializeValue(json.modified, 'datetime');
            end
            if isfield(json, 'revision')
                obj.props_('revision') = flywheel.ModelBase.deserializeValue(json.revision, 'integer');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.AnalysisOutput')
                    obj = flywheel.model.AnalysisOutput(obj);
                end
                if isKey(obj.props_, '_id')
                end
                if isKey(obj.props_, 'inputs')
                    obj.props_('inputs') = flywheel.ModelBase.cellmap(@flywheel.model.FileEntry.ensureIsInstance, obj.props_('inputs'));
                end
                if isKey(obj.props_, 'files')
                    obj.props_('files') = flywheel.ModelBase.cellmap(@flywheel.model.FileEntry.ensureIsInstance, obj.props_('files'));
                end
                if isKey(obj.props_, 'job')
                    obj.props_('job') =  flywheel.model.Job.ensureIsInstance(obj.props_('job'));
                end
                if isKey(obj.props_, 'gear_info')
                    obj.props_('gear_info') =  flywheel.model.GearInfo.ensureIsInstance(obj.props_('gear_info'));
                end
                if isKey(obj.props_, 'notes')
                    obj.props_('notes') = flywheel.ModelBase.cellmap(@flywheel.model.Note.ensureIsInstance, obj.props_('notes'));
                end
                if isKey(obj.props_, 'tags')
                end
                if isKey(obj.props_, 'info')
                    obj.props_('info') =  flywheel.model.CommonInfo.ensureIsInstance(obj.props_('info'));
                end
                if isKey(obj.props_, 'description')
                end
                if isKey(obj.props_, 'label')
                end
                if isKey(obj.props_, 'parent')
                    obj.props_('parent') =  flywheel.model.ContainerReference.ensureIsInstance(obj.props_('parent'));
                end
                if isKey(obj.props_, 'parents')
                    obj.props_('parents') =  flywheel.model.ContainerParents.ensureIsInstance(obj.props_('parents'));
                end
                if isKey(obj.props_, 'created')
                end
                if isKey(obj.props_, 'modified')
                end
                if isKey(obj.props_, 'revision')
                end
            end
        end
    end
end
