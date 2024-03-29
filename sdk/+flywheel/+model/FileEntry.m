% FileEntry - A file description
%
% FileEntry Properties:
%    id             
%    fileId          - Unique database ID
%    version         - Version of the file
%    name            - The name of the file on disk
%    type            - A descriptive file type (e.g. dicom, image, document, ...)
%    mimetype        - A MIME Content-Type of the file
%    modality        - The type of instrument that originated the file (e.g. MR, CT, ...)
%    deidLogId       - The UUID of the de-id log
%    classification 
%    tags            - Array of application-specific tags
%    info           
%    origin         
%    hash            - Cryptographic hash of the file
%    parents        
%    parentRef      
%    providerId      - Unique database ID
%    created         - Creation time (automatically set)
%    modified        - Last modification time (automatically updated)
%    replaced        - Last replaced time (automatically updated)
%    size            - Size of the file, in bytes
%    infoExists     
%    zipMemberCount  - Number of entries in the zip archive
%
% FileEntry Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef FileEntry < flywheel.ModelBase & flywheel.mixins.FileMixin
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'id', 'fileId', 'version', 'name', 'type', 'mimetype', 'modality', 'deidLogId', 'classification', 'tags', 'info', 'origin', 'hash', 'parents', 'parentRef', 'providerId', 'created', 'modified', 'replaced', 'size', 'infoExists', 'zipMemberCount' }, ...
            { '_id', 'file_id', 'version', 'name', 'type', 'mimetype', 'modality', 'deid_log_id', 'classification', 'tags', 'info', 'origin', 'hash', 'parents', 'parent_ref', 'provider_id', 'created', 'modified', 'replaced', 'size', 'info_exists', 'zip_member_count' });
    end
    properties(Dependent)
        id
        fileId
        version
        name
        type
        mimetype
        modality
        deidLogId
        classification
        tags
        info
        origin
        hash
        parents
        parentRef
        providerId
        created
        modified
        replaced
        size
        infoExists
        zipMemberCount
    end
    methods
        function obj = FileEntry(varargin)
            obj@flywheel.ModelBase(flywheel.model.FileEntry.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'id', []);
                addParameter(p, 'fileId', []);
                addParameter(p, 'version', []);
                addParameter(p, 'name', []);
                addParameter(p, 'type', []);
                addParameter(p, 'mimetype', []);
                addParameter(p, 'modality', []);
                addParameter(p, 'deidLogId', []);
                addParameter(p, 'classification', []);
                addParameter(p, 'tags', []);
                addParameter(p, 'info', []);
                addParameter(p, 'origin', []);
                addParameter(p, 'hash', []);
                addParameter(p, 'parents', []);
                addParameter(p, 'parentRef', []);
                addParameter(p, 'providerId', []);
                addParameter(p, 'created', []);
                addParameter(p, 'modified', []);
                addParameter(p, 'replaced', []);
                addParameter(p, 'size', []);
                addParameter(p, 'infoExists', []);
                addParameter(p, 'zipMemberCount', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.id)
                    obj.props_('_id') = p.Results.id;
                end
                if ~isempty(p.Results.fileId)
                    obj.props_('file_id') = p.Results.fileId;
                end
                if ~isempty(p.Results.version)
                    obj.props_('version') = p.Results.version;
                end
                if ~isempty(p.Results.name)
                    obj.props_('name') = p.Results.name;
                end
                if ~isempty(p.Results.type)
                    obj.props_('type') = p.Results.type;
                end
                if ~isempty(p.Results.mimetype)
                    obj.props_('mimetype') = p.Results.mimetype;
                end
                if ~isempty(p.Results.modality)
                    obj.props_('modality') = p.Results.modality;
                end
                if ~isempty(p.Results.deidLogId)
                    obj.props_('deid_log_id') = p.Results.deidLogId;
                end
                if ~isempty(p.Results.classification)
                    obj.props_('classification') = p.Results.classification;
                end
                if ~isempty(p.Results.tags)
                    obj.props_('tags') = p.Results.tags;
                end
                if ~isempty(p.Results.info)
                    obj.props_('info') = p.Results.info;
                end
                if ~isempty(p.Results.origin)
                    obj.props_('origin') = p.Results.origin;
                end
                if ~isempty(p.Results.hash)
                    obj.props_('hash') = p.Results.hash;
                end
                if ~isempty(p.Results.parents)
                    obj.props_('parents') = p.Results.parents;
                end
                if ~isempty(p.Results.parentRef)
                    obj.props_('parent_ref') = p.Results.parentRef;
                end
                if ~isempty(p.Results.providerId)
                    obj.props_('provider_id') = p.Results.providerId;
                end
                if ~isempty(p.Results.created)
                    obj.props_('created') = p.Results.created;
                end
                if ~isempty(p.Results.modified)
                    obj.props_('modified') = p.Results.modified;
                end
                if ~isempty(p.Results.replaced)
                    obj.props_('replaced') = p.Results.replaced;
                end
                if ~isempty(p.Results.size)
                    obj.props_('size') = p.Results.size;
                end
                if ~isempty(p.Results.infoExists)
                    obj.props_('info_exists') = p.Results.infoExists;
                end
                if ~isempty(p.Results.zipMemberCount)
                    obj.props_('zip_member_count') = p.Results.zipMemberCount;
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
        function result = get.fileId(obj)
            if ismethod(obj, 'get_fileId')
                result = obj.get_fileId();
            else
                if isKey(obj.props_, 'file_id')
                    result = obj.props_('file_id');
                else
                    result = [];
                end
            end
        end
        function obj = set.fileId(obj, value)
            obj.props_('file_id') = value;
        end
        function result = get.version(obj)
            if ismethod(obj, 'get_version')
                result = obj.get_version();
            else
                if isKey(obj.props_, 'version')
                    result = obj.props_('version');
                else
                    result = [];
                end
            end
        end
        function obj = set.version(obj, value)
            obj.props_('version') = value;
        end
        function result = get.name(obj)
            if ismethod(obj, 'get_name')
                result = obj.get_name();
            else
                if isKey(obj.props_, 'name')
                    result = obj.props_('name');
                else
                    result = [];
                end
            end
        end
        function obj = set.name(obj, value)
            obj.props_('name') = value;
        end
        function result = get.type(obj)
            if ismethod(obj, 'get_type')
                result = obj.get_type();
            else
                if isKey(obj.props_, 'type')
                    result = obj.props_('type');
                else
                    result = [];
                end
            end
        end
        function obj = set.type(obj, value)
            obj.props_('type') = value;
        end
        function result = get.mimetype(obj)
            if ismethod(obj, 'get_mimetype')
                result = obj.get_mimetype();
            else
                if isKey(obj.props_, 'mimetype')
                    result = obj.props_('mimetype');
                else
                    result = [];
                end
            end
        end
        function obj = set.mimetype(obj, value)
            obj.props_('mimetype') = value;
        end
        function result = get.modality(obj)
            if ismethod(obj, 'get_modality')
                result = obj.get_modality();
            else
                if isKey(obj.props_, 'modality')
                    result = obj.props_('modality');
                else
                    result = [];
                end
            end
        end
        function obj = set.modality(obj, value)
            obj.props_('modality') = value;
        end
        function result = get.deidLogId(obj)
            if ismethod(obj, 'get_deidLogId')
                result = obj.get_deidLogId();
            else
                if isKey(obj.props_, 'deid_log_id')
                    result = obj.props_('deid_log_id');
                else
                    result = [];
                end
            end
        end
        function obj = set.deidLogId(obj, value)
            obj.props_('deid_log_id') = value;
        end
        function result = get.classification(obj)
            if ismethod(obj, 'get_classification')
                result = obj.get_classification();
            else
                if isKey(obj.props_, 'classification')
                    result = obj.props_('classification');
                else
                    result = [];
                end
            end
        end
        function obj = set.classification(obj, value)
            obj.props_('classification') = value;
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
        function result = get.origin(obj)
            if ismethod(obj, 'get_origin')
                result = obj.get_origin();
            else
                if isKey(obj.props_, 'origin')
                    result = obj.props_('origin');
                else
                    result = [];
                end
            end
        end
        function obj = set.origin(obj, value)
            obj.props_('origin') = value;
        end
        function result = get.hash(obj)
            if ismethod(obj, 'get_hash')
                result = obj.get_hash();
            else
                if isKey(obj.props_, 'hash')
                    result = obj.props_('hash');
                else
                    result = [];
                end
            end
        end
        function obj = set.hash(obj, value)
            obj.props_('hash') = value;
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
        function result = get.parentRef(obj)
            if ismethod(obj, 'get_parentRef')
                result = obj.get_parentRef();
            else
                if isKey(obj.props_, 'parent_ref')
                    result = obj.props_('parent_ref');
                else
                    result = [];
                end
            end
        end
        function obj = set.parentRef(obj, value)
            obj.props_('parent_ref') = value;
        end
        function result = get.providerId(obj)
            if ismethod(obj, 'get_providerId')
                result = obj.get_providerId();
            else
                if isKey(obj.props_, 'provider_id')
                    result = obj.props_('provider_id');
                else
                    result = [];
                end
            end
        end
        function obj = set.providerId(obj, value)
            obj.props_('provider_id') = value;
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
        function result = get.replaced(obj)
            if ismethod(obj, 'get_replaced')
                result = obj.get_replaced();
            else
                if isKey(obj.props_, 'replaced')
                    result = obj.props_('replaced');
                else
                    result = [];
                end
            end
        end
        function obj = set.replaced(obj, value)
            obj.props_('replaced') = value;
        end
        function result = get.size(obj)
            if ismethod(obj, 'get_size')
                result = obj.get_size();
            else
                if isKey(obj.props_, 'size')
                    result = obj.props_('size');
                else
                    result = [];
                end
            end
        end
        function obj = set.size(obj, value)
            obj.props_('size') = value;
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
        function result = get.zipMemberCount(obj)
            if ismethod(obj, 'get_zipMemberCount')
                result = obj.get_zipMemberCount();
            else
                if isKey(obj.props_, 'zip_member_count')
                    result = obj.props_('zip_member_count');
                else
                    result = [];
                end
            end
        end
        function obj = set.zipMemberCount(obj, value)
            obj.props_('zip_member_count') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, '_id')
                result('_id') = flywheel.ModelBase.serializeValue(obj.props_('_id'), 'char');
            end
            if isKey(obj.props_, 'file_id')
                result('file_id') = flywheel.ModelBase.serializeValue(obj.props_('file_id'), 'char');
            end
            if isKey(obj.props_, 'version')
                result('version') = flywheel.ModelBase.serializeValue(obj.props_('version'), 'integer');
            end
            if isKey(obj.props_, 'name')
                result('name') = flywheel.ModelBase.serializeValue(obj.props_('name'), 'char');
            end
            if isKey(obj.props_, 'type')
                result('type') = flywheel.ModelBase.serializeValue(obj.props_('type'), 'char');
            end
            if isKey(obj.props_, 'mimetype')
                result('mimetype') = flywheel.ModelBase.serializeValue(obj.props_('mimetype'), 'char');
            end
            if isKey(obj.props_, 'modality')
                result('modality') = flywheel.ModelBase.serializeValue(obj.props_('modality'), 'char');
            end
            if isKey(obj.props_, 'deid_log_id')
                result('deid_log_id') = flywheel.ModelBase.serializeValue(obj.props_('deid_log_id'), 'char');
            end
            if isKey(obj.props_, 'classification')
                result('classification') = obj.props_('classification').toJson();
            end
            if isKey(obj.props_, 'tags')
                result('tags') = flywheel.ModelBase.serializeValue(obj.props_('tags'), 'vector[char]');
            end
            if isKey(obj.props_, 'info')
                result('info') = obj.props_('info').toJson();
            end
            if isKey(obj.props_, 'origin')
                result('origin') = obj.props_('origin').toJson();
            end
            if isKey(obj.props_, 'hash')
                result('hash') = flywheel.ModelBase.serializeValue(obj.props_('hash'), 'char');
            end
            if isKey(obj.props_, 'parents')
                result('parents') = obj.props_('parents').toJson();
            end
            if isKey(obj.props_, 'parent_ref')
                result('parent_ref') = obj.props_('parent_ref').toJson();
            end
            if isKey(obj.props_, 'provider_id')
                result('provider_id') = flywheel.ModelBase.serializeValue(obj.props_('provider_id'), 'char');
            end
            if isKey(obj.props_, 'created')
                result('created') = flywheel.ModelBase.serializeValue(obj.props_('created'), 'datetime');
            end
            if isKey(obj.props_, 'modified')
                result('modified') = flywheel.ModelBase.serializeValue(obj.props_('modified'), 'datetime');
            end
            if isKey(obj.props_, 'replaced')
                result('replaced') = flywheel.ModelBase.serializeValue(obj.props_('replaced'), 'datetime');
            end
            if isKey(obj.props_, 'size')
                result('size') = flywheel.ModelBase.serializeValue(obj.props_('size'), 'integer');
            end
            if isKey(obj.props_, 'info_exists')
                result('info_exists') = flywheel.ModelBase.serializeValue(obj.props_('info_exists'), 'logical');
            end
            if isKey(obj.props_, 'zip_member_count')
                result('zip_member_count') = flywheel.ModelBase.serializeValue(obj.props_('zip_member_count'), 'integer');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, '_id')
                result.id = obj.props_('_id');
            else
                result.id = [];
            end
            if isKey(obj.props_, 'file_id')
                result.fileId = obj.props_('file_id');
            else
                result.fileId = [];
            end
            if isKey(obj.props_, 'version')
                result.version = obj.props_('version');
            else
                result.version = [];
            end
            if isKey(obj.props_, 'name')
                result.name = obj.props_('name');
            else
                result.name = [];
            end
            if isKey(obj.props_, 'type')
                result.type = obj.props_('type');
            else
                result.type = [];
            end
            if isKey(obj.props_, 'mimetype')
                result.mimetype = obj.props_('mimetype');
            else
                result.mimetype = [];
            end
            if isKey(obj.props_, 'modality')
                result.modality = obj.props_('modality');
            else
                result.modality = [];
            end
            if isKey(obj.props_, 'deid_log_id')
                result.deidLogId = obj.props_('deid_log_id');
            else
                result.deidLogId = [];
            end
            if isKey(obj.props_, 'classification')
                result.classification = struct(obj.props_('classification'));
            else
                result.classification = [];
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
            if isKey(obj.props_, 'origin')
                result.origin = struct(obj.props_('origin'));
            else
                result.origin = [];
            end
            if isKey(obj.props_, 'hash')
                result.hash = obj.props_('hash');
            else
                result.hash = [];
            end
            if isKey(obj.props_, 'parents')
                result.parents = struct(obj.props_('parents'));
            else
                result.parents = [];
            end
            if isKey(obj.props_, 'parent_ref')
                result.parentRef = struct(obj.props_('parent_ref'));
            else
                result.parentRef = [];
            end
            if isKey(obj.props_, 'provider_id')
                result.providerId = obj.props_('provider_id');
            else
                result.providerId = [];
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
            if isKey(obj.props_, 'replaced')
                result.replaced = obj.props_('replaced');
            else
                result.replaced = [];
            end
            if isKey(obj.props_, 'size')
                result.size = obj.props_('size');
            else
                result.size = [];
            end
            if isKey(obj.props_, 'info_exists')
                result.infoExists = obj.props_('info_exists');
            else
                result.infoExists = [];
            end
            if isKey(obj.props_, 'zip_member_count')
                result.zipMemberCount = obj.props_('zip_member_count');
            else
                result.zipMemberCount = [];
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
                if isKey(obj.props_, 'file_id')
                    propList.fileId = obj.props_('file_id');
                else
                    propList.fileId = [];
                end
                if isKey(obj.props_, 'version')
                    propList.version = obj.props_('version');
                else
                    propList.version = [];
                end
                if isKey(obj.props_, 'name')
                    propList.name = obj.props_('name');
                else
                    propList.name = [];
                end
                if isKey(obj.props_, 'type')
                    propList.type = obj.props_('type');
                else
                    propList.type = [];
                end
                if isKey(obj.props_, 'mimetype')
                    propList.mimetype = obj.props_('mimetype');
                else
                    propList.mimetype = [];
                end
                if isKey(obj.props_, 'modality')
                    propList.modality = obj.props_('modality');
                else
                    propList.modality = [];
                end
                if isKey(obj.props_, 'deid_log_id')
                    propList.deidLogId = obj.props_('deid_log_id');
                else
                    propList.deidLogId = [];
                end
                if isKey(obj.props_, 'classification')
                    propList.classification = obj.props_('classification');
                else
                    propList.classification = [];
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
                if isKey(obj.props_, 'origin')
                    propList.origin = obj.props_('origin');
                else
                    propList.origin = [];
                end
                if isKey(obj.props_, 'hash')
                    propList.hash = obj.props_('hash');
                else
                    propList.hash = [];
                end
                if isKey(obj.props_, 'parents')
                    propList.parents = obj.props_('parents');
                else
                    propList.parents = [];
                end
                if isKey(obj.props_, 'parent_ref')
                    propList.parentRef = obj.props_('parent_ref');
                else
                    propList.parentRef = [];
                end
                if isKey(obj.props_, 'provider_id')
                    propList.providerId = obj.props_('provider_id');
                else
                    propList.providerId = [];
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
                if isKey(obj.props_, 'replaced')
                    propList.replaced = obj.props_('replaced');
                else
                    propList.replaced = [];
                end
                if isKey(obj.props_, 'size')
                    propList.size = obj.props_('size');
                else
                    propList.size = [];
                end
                if isKey(obj.props_, 'info_exists')
                    propList.infoExists = obj.props_('info_exists');
                else
                    propList.infoExists = [];
                end
                if isKey(obj.props_, 'zip_member_count')
                    propList.zipMemberCount = obj.props_('zip_member_count');
                else
                    propList.zipMemberCount = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.FileEntry;
            if isfield(json, 'x0x5Fid')
                obj.props_('_id') = flywheel.ModelBase.deserializeValue(json.x0x5Fid, 'char');
            end
            if isfield(json, 'file_id')
                obj.props_('file_id') = flywheel.ModelBase.deserializeValue(json.file_id, 'char');
            end
            if isfield(json, 'version')
                obj.props_('version') = flywheel.ModelBase.deserializeValue(json.version, 'integer');
            end
            if isfield(json, 'name')
                obj.props_('name') = flywheel.ModelBase.deserializeValue(json.name, 'char');
            end
            if isfield(json, 'type')
                obj.props_('type') = flywheel.ModelBase.deserializeValue(json.type, 'char');
            end
            if isfield(json, 'mimetype')
                obj.props_('mimetype') = flywheel.ModelBase.deserializeValue(json.mimetype, 'char');
            end
            if isfield(json, 'modality')
                obj.props_('modality') = flywheel.ModelBase.deserializeValue(json.modality, 'char');
            end
            if isfield(json, 'deid_log_id')
                obj.props_('deid_log_id') = flywheel.ModelBase.deserializeValue(json.deid_log_id, 'char');
            end
            if isfield(json, 'classification')
                obj.props_('classification') = flywheel.model.CommonClassification.fromJson(json.classification, context);
            end
            if isfield(json, 'tags')
                obj.props_('tags') = flywheel.ModelBase.deserializeValue(json.tags, 'vector[char]');
            end
            if isfield(json, 'info')
                obj.props_('info') = flywheel.model.CommonInfo.fromJson(json.info, context);
            end
            if isfield(json, 'origin')
                obj.props_('origin') = flywheel.model.FileOrigin.fromJson(json.origin, context);
            end
            if isfield(json, 'hash')
                obj.props_('hash') = flywheel.ModelBase.deserializeValue(json.hash, 'char');
            end
            if isfield(json, 'parents')
                obj.props_('parents') = flywheel.model.ContainerParents.fromJson(json.parents, context);
            end
            if isfield(json, 'parent_ref')
                obj.props_('parent_ref') = flywheel.model.ContainerReference.fromJson(json.parent_ref, context);
            end
            if isfield(json, 'provider_id')
                obj.props_('provider_id') = flywheel.ModelBase.deserializeValue(json.provider_id, 'char');
            end
            if isfield(json, 'created')
                obj.props_('created') = flywheel.ModelBase.deserializeValue(json.created, 'datetime');
            end
            if isfield(json, 'modified')
                obj.props_('modified') = flywheel.ModelBase.deserializeValue(json.modified, 'datetime');
            end
            if isfield(json, 'replaced')
                obj.props_('replaced') = flywheel.ModelBase.deserializeValue(json.replaced, 'datetime');
            end
            if isfield(json, 'size')
                obj.props_('size') = flywheel.ModelBase.deserializeValue(json.size, 'integer');
            end
            if isfield(json, 'info_exists')
                obj.props_('info_exists') = flywheel.ModelBase.deserializeValue(json.info_exists, 'logical');
            end
            if isfield(json, 'zip_member_count')
                obj.props_('zip_member_count') = flywheel.ModelBase.deserializeValue(json.zip_member_count, 'integer');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.FileEntry')
                    obj = flywheel.model.FileEntry(obj);
                end
                if isKey(obj.props_, '_id')
                end
                if isKey(obj.props_, 'file_id')
                end
                if isKey(obj.props_, 'version')
                end
                if isKey(obj.props_, 'name')
                end
                if isKey(obj.props_, 'type')
                end
                if isKey(obj.props_, 'mimetype')
                end
                if isKey(obj.props_, 'modality')
                end
                if isKey(obj.props_, 'deid_log_id')
                end
                if isKey(obj.props_, 'classification')
                    obj.props_('classification') =  flywheel.model.CommonClassification.ensureIsInstance(obj.props_('classification'));
                end
                if isKey(obj.props_, 'tags')
                end
                if isKey(obj.props_, 'info')
                    obj.props_('info') =  flywheel.model.CommonInfo.ensureIsInstance(obj.props_('info'));
                end
                if isKey(obj.props_, 'origin')
                    obj.props_('origin') =  flywheel.model.FileOrigin.ensureIsInstance(obj.props_('origin'));
                end
                if isKey(obj.props_, 'hash')
                end
                if isKey(obj.props_, 'parents')
                    obj.props_('parents') =  flywheel.model.ContainerParents.ensureIsInstance(obj.props_('parents'));
                end
                if isKey(obj.props_, 'parent_ref')
                    obj.props_('parent_ref') =  flywheel.model.ContainerReference.ensureIsInstance(obj.props_('parent_ref'));
                end
                if isKey(obj.props_, 'provider_id')
                end
                if isKey(obj.props_, 'created')
                end
                if isKey(obj.props_, 'modified')
                end
                if isKey(obj.props_, 'replaced')
                end
                if isKey(obj.props_, 'size')
                end
                if isKey(obj.props_, 'info_exists')
                end
                if isKey(obj.props_, 'zip_member_count')
                end
            end
        end
    end
end
