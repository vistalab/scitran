% SearchParentAcquisition
%
% SearchParentAcquisition Properties:
%    label        - Application-specific label
%    info        
%    session      - Unique database ID
%    uid          - A user database ID
%    timestamp   
%    timezone    
%    id           - Unique database ID
%    parents     
%    collections 
%    files       
%    created      - Creation time (automatically set)
%    modified     - Last modification time (automatically updated)
%    revision     - An incremental document revision number
%    infoExists  
%    permissions 
%    notes       
%    tags         - Array of application-specific tags
%    analyses    
%
% SearchParentAcquisition Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef SearchParentAcquisition < flywheel.ModelBase & flywheel.mixins.AcquisitionMixin
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'label', 'info', 'session', 'uid', 'timestamp', 'timezone', 'id', 'parents', 'collections', 'files', 'created', 'modified', 'revision', 'infoExists', 'permissions', 'notes', 'tags', 'analyses' }, ...
            { 'label', 'info', 'session', 'uid', 'timestamp', 'timezone', '_id', 'parents', 'collections', 'files', 'created', 'modified', 'revision', 'info_exists', 'permissions', 'notes', 'tags', 'analyses' });
    end
    properties(Dependent)
        label
        info
        session
        uid
        timestamp
        timezone
        id
        parents
        collections
        files
        created
        modified
        revision
        infoExists
        permissions
        notes
        tags
        analyses
    end
    methods
        function obj = SearchParentAcquisition(varargin)
            obj@flywheel.ModelBase(flywheel.model.SearchParentAcquisition.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'label', []);
                addParameter(p, 'info', []);
                addParameter(p, 'session', []);
                addParameter(p, 'uid', []);
                addParameter(p, 'timestamp', []);
                addParameter(p, 'timezone', []);
                addParameter(p, 'id', []);
                addParameter(p, 'parents', []);
                addParameter(p, 'collections', []);
                addParameter(p, 'files', []);
                addParameter(p, 'created', []);
                addParameter(p, 'modified', []);
                addParameter(p, 'revision', []);
                addParameter(p, 'infoExists', []);
                addParameter(p, 'permissions', []);
                addParameter(p, 'notes', []);
                addParameter(p, 'tags', []);
                addParameter(p, 'analyses', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.label)
                    obj.props_('label') = p.Results.label;
                end
                if ~isempty(p.Results.info)
                    obj.props_('info') = p.Results.info;
                end
                if ~isempty(p.Results.session)
                    obj.props_('session') = p.Results.session;
                end
                if ~isempty(p.Results.uid)
                    obj.props_('uid') = p.Results.uid;
                end
                if ~isempty(p.Results.timestamp)
                    obj.props_('timestamp') = p.Results.timestamp;
                end
                if ~isempty(p.Results.timezone)
                    obj.props_('timezone') = p.Results.timezone;
                end
                if ~isempty(p.Results.id)
                    obj.props_('_id') = p.Results.id;
                end
                if ~isempty(p.Results.parents)
                    obj.props_('parents') = p.Results.parents;
                end
                if ~isempty(p.Results.collections)
                    obj.props_('collections') = p.Results.collections;
                end
                if ~isempty(p.Results.files)
                    obj.props_('files') = p.Results.files;
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
                if ~isempty(p.Results.infoExists)
                    obj.props_('info_exists') = p.Results.infoExists;
                end
                if ~isempty(p.Results.permissions)
                    obj.props_('permissions') = p.Results.permissions;
                end
                if ~isempty(p.Results.notes)
                    obj.props_('notes') = p.Results.notes;
                end
                if ~isempty(p.Results.tags)
                    obj.props_('tags') = p.Results.tags;
                end
                if ~isempty(p.Results.analyses)
                    obj.props_('analyses') = p.Results.analyses;
                end
            end
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
        function result = get.session(obj)
            if ismethod(obj, 'get_session')
                result = obj.get_session();
            else
                if isKey(obj.props_, 'session')
                    result = obj.props_('session');
                else
                    result = [];
                end
            end
        end
        function obj = set.session(obj, value)
            obj.props_('session') = value;
        end
        function result = get.uid(obj)
            if ismethod(obj, 'get_uid')
                result = obj.get_uid();
            else
                if isKey(obj.props_, 'uid')
                    result = obj.props_('uid');
                else
                    result = [];
                end
            end
        end
        function obj = set.uid(obj, value)
            obj.props_('uid') = value;
        end
        function result = get.timestamp(obj)
            if ismethod(obj, 'get_timestamp')
                result = obj.get_timestamp();
            else
                if isKey(obj.props_, 'timestamp')
                    result = obj.props_('timestamp');
                else
                    result = [];
                end
            end
        end
        function obj = set.timestamp(obj, value)
            obj.props_('timestamp') = value;
        end
        function result = get.timezone(obj)
            if ismethod(obj, 'get_timezone')
                result = obj.get_timezone();
            else
                if isKey(obj.props_, 'timezone')
                    result = obj.props_('timezone');
                else
                    result = [];
                end
            end
        end
        function obj = set.timezone(obj, value)
            obj.props_('timezone') = value;
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
        function result = get.collections(obj)
            if ismethod(obj, 'get_collections')
                result = obj.get_collections();
            else
                if isKey(obj.props_, 'collections')
                    result = obj.props_('collections');
                else
                    result = [];
                end
            end
        end
        function obj = set.collections(obj, value)
            obj.props_('collections') = value;
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
        function result = get.infoExists(obj)
            if ismethod(obj, 'get_infoExists')
                result = obj.get_infoExists();
            else
                if isKey(obj.props_, 'info_exists')
                    result = obj.props_('info_exists');
                else
                    result = [];
                end
            end
        end
        function obj = set.infoExists(obj, value)
            obj.props_('info_exists') = value;
        end
        function result = get.permissions(obj)
            if ismethod(obj, 'get_permissions')
                result = obj.get_permissions();
            else
                if isKey(obj.props_, 'permissions')
                    result = obj.props_('permissions');
                else
                    result = [];
                end
            end
        end
        function obj = set.permissions(obj, value)
            obj.props_('permissions') = value;
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
        function result = get.analyses(obj)
            if ismethod(obj, 'get_analyses')
                result = obj.get_analyses();
            else
                if isKey(obj.props_, 'analyses')
                    result = obj.props_('analyses');
                else
                    result = [];
                end
            end
        end
        function obj = set.analyses(obj, value)
            obj.props_('analyses') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'label')
                result('label') = flywheel.ModelBase.serializeValue(obj.props_('label'), 'char');
            end
            if isKey(obj.props_, 'info')
                result('info') = obj.props_('info').toJson();
            end
            if isKey(obj.props_, 'session')
                result('session') = flywheel.ModelBase.serializeValue(obj.props_('session'), 'char');
            end
            if isKey(obj.props_, 'uid')
                result('uid') = flywheel.ModelBase.serializeValue(obj.props_('uid'), 'char');
            end
            if isKey(obj.props_, 'timestamp')
                result('timestamp') = flywheel.ModelBase.serializeValue(obj.props_('timestamp'), 'datetime');
            end
            if isKey(obj.props_, 'timezone')
                result('timezone') = flywheel.ModelBase.serializeValue(obj.props_('timezone'), 'char');
            end
            if isKey(obj.props_, '_id')
                result('_id') = flywheel.ModelBase.serializeValue(obj.props_('_id'), 'char');
            end
            if isKey(obj.props_, 'parents')
                result('parents') = obj.props_('parents').toJson();
            end
            if isKey(obj.props_, 'collections')
                result('collections') = flywheel.ModelBase.serializeValue(obj.props_('collections'), 'vector[char]');
            end
            if isKey(obj.props_, 'files')
                result('files') = flywheel.ModelBase.cellmap(@toJson, obj.props_('files'));
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
            if isKey(obj.props_, 'info_exists')
                result('info_exists') = flywheel.ModelBase.serializeValue(obj.props_('info_exists'), 'logical');
            end
            if isKey(obj.props_, 'permissions')
                result('permissions') = flywheel.ModelBase.cellmap(@toJson, obj.props_('permissions'));
            end
            if isKey(obj.props_, 'notes')
                result('notes') = flywheel.ModelBase.cellmap(@toJson, obj.props_('notes'));
            end
            if isKey(obj.props_, 'tags')
                result('tags') = flywheel.ModelBase.serializeValue(obj.props_('tags'), 'vector[char]');
            end
            if isKey(obj.props_, 'analyses')
                result('analyses') = flywheel.ModelBase.cellmap(@toJson, obj.props_('analyses'));
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'label')
                result.label = obj.props_('label');
            else
                result.label = [];
            end
            if isKey(obj.props_, 'info')
                result.info = struct(obj.props_('info'));
            else
                result.info = [];
            end
            if isKey(obj.props_, 'session')
                result.session = obj.props_('session');
            else
                result.session = [];
            end
            if isKey(obj.props_, 'uid')
                result.uid = obj.props_('uid');
            else
                result.uid = [];
            end
            if isKey(obj.props_, 'timestamp')
                result.timestamp = obj.props_('timestamp');
            else
                result.timestamp = [];
            end
            if isKey(obj.props_, 'timezone')
                result.timezone = obj.props_('timezone');
            else
                result.timezone = [];
            end
            if isKey(obj.props_, '_id')
                result.id = obj.props_('_id');
            else
                result.id = [];
            end
            if isKey(obj.props_, 'parents')
                result.parents = struct(obj.props_('parents'));
            else
                result.parents = [];
            end
            if isKey(obj.props_, 'collections')
                result.collections = obj.props_('collections');
            else
                result.collections = [];
            end
            if isKey(obj.props_, 'files')
                result.files = flywheel.ModelBase.cellmap(@struct, obj.props_('files'));
            else
                result.files = [];
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
            if isKey(obj.props_, 'info_exists')
                result.infoExists = obj.props_('info_exists');
            else
                result.infoExists = [];
            end
            if isKey(obj.props_, 'permissions')
                result.permissions = flywheel.ModelBase.cellmap(@struct, obj.props_('permissions'));
            else
                result.permissions = [];
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
            if isKey(obj.props_, 'analyses')
                result.analyses = flywheel.ModelBase.cellmap(@struct, obj.props_('analyses'));
            else
                result.analyses = [];
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
                if isKey(obj.props_, 'label')
                    propList.label = obj.props_('label');
                else
                    propList.label = [];
                end
                if isKey(obj.props_, 'info')
                    propList.info = obj.props_('info');
                else
                    propList.info = [];
                end
                if isKey(obj.props_, 'session')
                    propList.session = obj.props_('session');
                else
                    propList.session = [];
                end
                if isKey(obj.props_, 'uid')
                    propList.uid = obj.props_('uid');
                else
                    propList.uid = [];
                end
                if isKey(obj.props_, 'timestamp')
                    propList.timestamp = obj.props_('timestamp');
                else
                    propList.timestamp = [];
                end
                if isKey(obj.props_, 'timezone')
                    propList.timezone = obj.props_('timezone');
                else
                    propList.timezone = [];
                end
                if isKey(obj.props_, '_id')
                    propList.id = obj.props_('_id');
                else
                    propList.id = [];
                end
                if isKey(obj.props_, 'parents')
                    propList.parents = obj.props_('parents');
                else
                    propList.parents = [];
                end
                if isKey(obj.props_, 'collections')
                    propList.collections = obj.props_('collections');
                else
                    propList.collections = [];
                end
                if isKey(obj.props_, 'files')
                    propList.files = obj.props_('files');
                else
                    propList.files = [];
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
                if isKey(obj.props_, 'info_exists')
                    propList.infoExists = obj.props_('info_exists');
                else
                    propList.infoExists = [];
                end
                if isKey(obj.props_, 'permissions')
                    propList.permissions = obj.props_('permissions');
                else
                    propList.permissions = [];
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
                if isKey(obj.props_, 'analyses')
                    propList.analyses = obj.props_('analyses');
                else
                    propList.analyses = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.SearchParentAcquisition;
            if isfield(json, 'label')
                obj.props_('label') = flywheel.ModelBase.deserializeValue(json.label, 'char');
            end
            if isfield(json, 'info')
                obj.props_('info') = flywheel.model.CommonInfo.fromJson(json.info, context);
            end
            if isfield(json, 'session')
                obj.props_('session') = flywheel.ModelBase.deserializeValue(json.session, 'char');
            end
            if isfield(json, 'uid')
                obj.props_('uid') = flywheel.ModelBase.deserializeValue(json.uid, 'char');
            end
            if isfield(json, 'timestamp')
                obj.props_('timestamp') = flywheel.ModelBase.deserializeValue(json.timestamp, 'datetime');
            end
            if isfield(json, 'timezone')
                obj.props_('timezone') = flywheel.ModelBase.deserializeValue(json.timezone, 'char');
            end
            if isfield(json, 'x0x5Fid')
                obj.props_('_id') = flywheel.ModelBase.deserializeValue(json.x0x5Fid, 'char');
            end
            if isfield(json, 'parents')
                obj.props_('parents') = flywheel.model.ContainerParents.fromJson(json.parents, context);
            end
            if isfield(json, 'collections')
                obj.props_('collections') = flywheel.ModelBase.deserializeValue(json.collections, 'vector[char]');
            end
            if isfield(json, 'files')
                obj.props_('files') = flywheel.ModelBase.cellmap(@(x) flywheel.model.FileEntry.fromJson(x, context), json.files);
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
            if isfield(json, 'info_exists')
                obj.props_('info_exists') = flywheel.ModelBase.deserializeValue(json.info_exists, 'logical');
            end
            if isfield(json, 'permissions')
                obj.props_('permissions') = flywheel.ModelBase.cellmap(@(x) flywheel.model.RolesBackwardsCompatibleRoleAssignment.fromJson(x, context), json.permissions);
            end
            if isfield(json, 'notes')
                obj.props_('notes') = flywheel.ModelBase.cellmap(@(x) flywheel.model.Note.fromJson(x, context), json.notes);
            end
            if isfield(json, 'tags')
                obj.props_('tags') = flywheel.ModelBase.deserializeValue(json.tags, 'vector[char]');
            end
            if isfield(json, 'analyses')
                obj.props_('analyses') = flywheel.ModelBase.cellmap(@(x) flywheel.model.AnalysisOutput.fromJson(x, context), json.analyses);
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.SearchParentAcquisition')
                    obj = flywheel.model.SearchParentAcquisition(obj);
                end
                if isKey(obj.props_, 'label')
                end
                if isKey(obj.props_, 'info')
                    obj.props_('info') =  flywheel.model.CommonInfo.ensureIsInstance(obj.props_('info'));
                end
                if isKey(obj.props_, 'session')
                end
                if isKey(obj.props_, 'uid')
                end
                if isKey(obj.props_, 'timestamp')
                end
                if isKey(obj.props_, 'timezone')
                end
                if isKey(obj.props_, '_id')
                end
                if isKey(obj.props_, 'parents')
                    obj.props_('parents') =  flywheel.model.ContainerParents.ensureIsInstance(obj.props_('parents'));
                end
                if isKey(obj.props_, 'collections')
                end
                if isKey(obj.props_, 'files')
                    obj.props_('files') = flywheel.ModelBase.cellmap(@flywheel.model.FileEntry.ensureIsInstance, obj.props_('files'));
                end
                if isKey(obj.props_, 'created')
                end
                if isKey(obj.props_, 'modified')
                end
                if isKey(obj.props_, 'revision')
                end
                if isKey(obj.props_, 'info_exists')
                end
                if isKey(obj.props_, 'permissions')
                    obj.props_('permissions') = flywheel.ModelBase.cellmap(@flywheel.model.RolesBackwardsCompatibleRoleAssignment.ensureIsInstance, obj.props_('permissions'));
                end
                if isKey(obj.props_, 'notes')
                    obj.props_('notes') = flywheel.ModelBase.cellmap(@flywheel.model.Note.ensureIsInstance, obj.props_('notes'));
                end
                if isKey(obj.props_, 'tags')
                end
                if isKey(obj.props_, 'analyses')
                    obj.props_('analyses') = flywheel.ModelBase.cellmap(@flywheel.model.AnalysisOutput.ensureIsInstance, obj.props_('analyses'));
                end
            end
        end
    end
end
