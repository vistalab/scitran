% ContainerFileOutput
%
% ContainerFileOutput Properties:
%    id             
%    name            - The name of the file on disk
%    type            - A descriptive file type (e.g. dicom, image, document, ...)
%    mimetype        - A MIME Content-Type of the file
%    modality        - The type of instrument that originated the file (e.g. MR, CT, ...)
%    classification 
%    tags            - Array of application-specific tags
%    info           
%    origin         
%    hash            - Cryptographic hash of the file
%    created         - Creation time (automatically set)
%    modified        - Last modification time (automatically updated)
%    replaced        - Last replaced time (automatically updated)
%    size            - Size of the file, in bytes
%    infoExists     
%    zipMemberCount  - Number of entries in the zip archive
%
% ContainerFileOutput Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef ContainerFileOutput < flywheel.ModelBase & flywheel.mixins.FileMixin
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'id', 'name', 'type', 'mimetype', 'modality', 'classification', 'tags', 'info', 'origin', 'hash', 'created', 'modified', 'replaced', 'size', 'infoExists', 'zipMemberCount' }, ...
            { '_id', 'name', 'type', 'mimetype', 'modality', 'classification', 'tags', 'info', 'origin', 'hash', 'created', 'modified', 'replaced', 'size', 'info_exists', 'zip_member_count' });
    end
    properties(Dependent)
        id
        name
        type
        mimetype
        modality
        classification
        tags
        info
        origin
        hash
        created
        modified
        replaced
        size
        infoExists
        zipMemberCount
    end
    methods
        function obj = ContainerFileOutput(varargin)
            obj@flywheel.ModelBase(flywheel.model.ContainerFileOutput.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'id', []);
                addParameter(p, 'name', []);
                addParameter(p, 'type', []);
                addParameter(p, 'mimetype', []);
                addParameter(p, 'modality', []);
                addParameter(p, 'classification', []);
                addParameter(p, 'tags', []);
                addParameter(p, 'info', []);
                addParameter(p, 'origin', []);
                addParameter(p, 'hash', []);
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
            obj =  flywheel.model.ContainerFileOutput;
            if isfield(json, 'x0x5Fid')
                obj.props_('_id') = flywheel.ModelBase.deserializeValue(json.x0x5Fid, 'char');
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
                if ~isa(obj, 'flywheel.model.ContainerFileOutput')
                    obj = flywheel.model.ContainerFileOutput(obj);
                end
                if isKey(obj.props_, '_id')
                end
                if isKey(obj.props_, 'name')
                end
                if isKey(obj.props_, 'type')
                end
                if isKey(obj.props_, 'mimetype')
                end
                if isKey(obj.props_, 'modality')
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
