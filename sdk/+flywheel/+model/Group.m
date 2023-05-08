% Group
%
% Group Properties:
%    id                  
%    label                - The group label
%    permissionsTemplate 
%    roles               
%    permissions         
%    created              - Creation time (automatically set)
%    modified             - Last modification time (automatically updated)
%    revision             - An incremental document revision number
%    tags                 - Array of application-specific tags
%    providers           
%    editions            
%
% Group Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef Group < flywheel.ModelBase & flywheel.mixins.GroupMixin
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'id', 'label', 'permissionsTemplate', 'roles', 'permissions', 'created', 'modified', 'revision', 'tags', 'providers', 'editions' }, ...
            { '_id', 'label', 'permissions_template', 'roles', 'permissions', 'created', 'modified', 'revision', 'tags', 'providers', 'editions' });
    end
    properties(Dependent)
        id
        label
        permissionsTemplate
        roles
        permissions
        created
        modified
        revision
        tags
        providers
        editions
    end
    methods
        function obj = Group(varargin)
            obj@flywheel.ModelBase(flywheel.model.Group.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'id', []);
                addParameter(p, 'label', []);
                addParameter(p, 'permissionsTemplate', []);
                addParameter(p, 'roles', []);
                addParameter(p, 'permissions', []);
                addParameter(p, 'created', []);
                addParameter(p, 'modified', []);
                addParameter(p, 'revision', []);
                addParameter(p, 'tags', []);
                addParameter(p, 'providers', []);
                addParameter(p, 'editions', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.id)
                    obj.props_('_id') = p.Results.id;
                end
                if ~isempty(p.Results.label)
                    obj.props_('label') = p.Results.label;
                end
                if ~isempty(p.Results.permissionsTemplate)
                    obj.props_('permissions_template') = p.Results.permissionsTemplate;
                end
                if ~isempty(p.Results.roles)
                    obj.props_('roles') = p.Results.roles;
                end
                if ~isempty(p.Results.permissions)
                    obj.props_('permissions') = p.Results.permissions;
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
                if ~isempty(p.Results.tags)
                    obj.props_('tags') = p.Results.tags;
                end
                if ~isempty(p.Results.providers)
                    obj.props_('providers') = p.Results.providers;
                end
                if ~isempty(p.Results.editions)
                    obj.props_('editions') = p.Results.editions;
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
        function result = get.permissionsTemplate(obj)
            if ismethod(obj, 'get_permissionsTemplate')
                result = obj.get_permissionsTemplate();
            else
                if isKey(obj.props_, 'permissions_template')
                    result = obj.props_('permissions_template');
                else
                    result = [];
                end
            end
        end
        function obj = set.permissionsTemplate(obj, value)
            obj.props_('permissions_template') = value;
        end
        function result = get.roles(obj)
            if ismethod(obj, 'get_roles')
                result = obj.get_roles();
            else
                if isKey(obj.props_, 'roles')
                    result = obj.props_('roles');
                else
                    result = [];
                end
            end
        end
        function obj = set.roles(obj, value)
            obj.props_('roles') = value;
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
        function result = get.providers(obj)
            if ismethod(obj, 'get_providers')
                result = obj.get_providers();
            else
                if isKey(obj.props_, 'providers')
                    result = obj.props_('providers');
                else
                    result = [];
                end
            end
        end
        function obj = set.providers(obj, value)
            obj.props_('providers') = value;
        end
        function result = get.editions(obj)
            if ismethod(obj, 'get_editions')
                result = obj.get_editions();
            else
                if isKey(obj.props_, 'editions')
                    result = obj.props_('editions');
                else
                    result = [];
                end
            end
        end
        function obj = set.editions(obj, value)
            obj.props_('editions') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, '_id')
                result('_id') = flywheel.ModelBase.serializeValue(obj.props_('_id'), 'char');
            end
            if isKey(obj.props_, 'label')
                result('label') = flywheel.ModelBase.serializeValue(obj.props_('label'), 'char');
            end
            if isKey(obj.props_, 'permissions_template')
                result('permissions_template') = flywheel.ModelBase.cellmap(@toJson, obj.props_('permissions_template'));
            end
            if isKey(obj.props_, 'roles')
                result('roles') = flywheel.ModelBase.serializeValue(obj.props_('roles'), 'vector[char]');
            end
            if isKey(obj.props_, 'permissions')
                result('permissions') = flywheel.ModelBase.cellmap(@toJson, obj.props_('permissions'));
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
            if isKey(obj.props_, 'tags')
                result('tags') = flywheel.ModelBase.serializeValue(obj.props_('tags'), 'vector[char]');
            end
            if isKey(obj.props_, 'providers')
                result('providers') = obj.props_('providers').toJson();
            end
            if isKey(obj.props_, 'editions')
                result('editions') = obj.props_('editions').toJson();
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, '_id')
                result.id = obj.props_('_id');
            else
                result.id = [];
            end
            if isKey(obj.props_, 'label')
                result.label = obj.props_('label');
            else
                result.label = [];
            end
            if isKey(obj.props_, 'permissions_template')
                result.permissionsTemplate = flywheel.ModelBase.cellmap(@struct, obj.props_('permissions_template'));
            else
                result.permissionsTemplate = [];
            end
            if isKey(obj.props_, 'roles')
                result.roles = obj.props_('roles');
            else
                result.roles = [];
            end
            if isKey(obj.props_, 'permissions')
                result.permissions = flywheel.ModelBase.cellmap(@struct, obj.props_('permissions'));
            else
                result.permissions = [];
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
            if isKey(obj.props_, 'tags')
                result.tags = obj.props_('tags');
            else
                result.tags = [];
            end
            if isKey(obj.props_, 'providers')
                result.providers = struct(obj.props_('providers'));
            else
                result.providers = [];
            end
            if isKey(obj.props_, 'editions')
                result.editions = struct(obj.props_('editions'));
            else
                result.editions = [];
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
                if isKey(obj.props_, 'label')
                    propList.label = obj.props_('label');
                else
                    propList.label = [];
                end
                if isKey(obj.props_, 'permissions_template')
                    propList.permissionsTemplate = obj.props_('permissions_template');
                else
                    propList.permissionsTemplate = [];
                end
                if isKey(obj.props_, 'roles')
                    propList.roles = obj.props_('roles');
                else
                    propList.roles = [];
                end
                if isKey(obj.props_, 'permissions')
                    propList.permissions = obj.props_('permissions');
                else
                    propList.permissions = [];
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
                if isKey(obj.props_, 'tags')
                    propList.tags = obj.props_('tags');
                else
                    propList.tags = [];
                end
                if isKey(obj.props_, 'providers')
                    propList.providers = obj.props_('providers');
                else
                    propList.providers = [];
                end
                if isKey(obj.props_, 'editions')
                    propList.editions = obj.props_('editions');
                else
                    propList.editions = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.Group;
            if isfield(json, 'x0x5Fid')
                obj.props_('_id') = flywheel.ModelBase.deserializeValue(json.x0x5Fid, 'char');
            end
            if isfield(json, 'label')
                obj.props_('label') = flywheel.ModelBase.deserializeValue(json.label, 'char');
            end
            if isfield(json, 'permissions_template')
                obj.props_('permissions_template') = flywheel.ModelBase.cellmap(@(x) flywheel.model.RolesRoleAssignment.fromJson(x, context), json.permissions_template);
            end
            if isfield(json, 'roles')
                obj.props_('roles') = flywheel.ModelBase.deserializeValue(json.roles, 'vector[char]');
            end
            if isfield(json, 'permissions')
                obj.props_('permissions') = flywheel.ModelBase.cellmap(@(x) flywheel.model.PermissionAccessPermission.fromJson(x, context), json.permissions);
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
            if isfield(json, 'tags')
                obj.props_('tags') = flywheel.ModelBase.deserializeValue(json.tags, 'vector[char]');
            end
            if isfield(json, 'providers')
                obj.props_('providers') = flywheel.model.ProviderLinks.fromJson(json.providers, context);
            end
            if isfield(json, 'editions')
                obj.props_('editions') = flywheel.model.CommonEditions.fromJson(json.editions, context);
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.Group')
                    obj = flywheel.model.Group(obj);
                end
                if isKey(obj.props_, '_id')
                end
                if isKey(obj.props_, 'label')
                end
                if isKey(obj.props_, 'permissions_template')
                    obj.props_('permissions_template') = flywheel.ModelBase.cellmap(@flywheel.model.RolesRoleAssignment.ensureIsInstance, obj.props_('permissions_template'));
                end
                if isKey(obj.props_, 'roles')
                end
                if isKey(obj.props_, 'permissions')
                    obj.props_('permissions') = flywheel.ModelBase.cellmap(@flywheel.model.PermissionAccessPermission.ensureIsInstance, obj.props_('permissions'));
                end
                if isKey(obj.props_, 'created')
                end
                if isKey(obj.props_, 'modified')
                end
                if isKey(obj.props_, 'revision')
                end
                if isKey(obj.props_, 'tags')
                end
                if isKey(obj.props_, 'providers')
                    obj.props_('providers') =  flywheel.model.ProviderLinks.ensureIsInstance(obj.props_('providers'));
                end
                if isKey(obj.props_, 'editions')
                    obj.props_('editions') =  flywheel.model.CommonEditions.ensureIsInstance(obj.props_('editions'));
                end
            end
        end
    end
end
