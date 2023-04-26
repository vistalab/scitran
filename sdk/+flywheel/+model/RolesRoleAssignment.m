% RolesRoleAssignment
%
% RolesRoleAssignment Properties:
%    id       - Database ID of a user
%    roleIds 
%
% RolesRoleAssignment Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef RolesRoleAssignment < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'id', 'roleIds' }, ...
            { '_id', 'role_ids' });
    end
    properties(Dependent)
        id
        roleIds
    end
    methods
        function obj = RolesRoleAssignment(varargin)
            obj@flywheel.ModelBase(flywheel.model.RolesRoleAssignment.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'id', []);
                addParameter(p, 'roleIds', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.id)
                    obj.props_('_id') = p.Results.id;
                end
                if ~isempty(p.Results.roleIds)
                    obj.props_('role_ids') = p.Results.roleIds;
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
        function result = get.roleIds(obj)
            if ismethod(obj, 'get_roleIds')
                result = obj.get_roleIds();
            else
                if isKey(obj.props_, 'role_ids')
                    result = obj.props_('role_ids');
                else
                    result = [];
                end
            end
        end
        function obj = set.roleIds(obj, value)
            obj.props_('role_ids') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, '_id')
                result('_id') = flywheel.ModelBase.serializeValue(obj.props_('_id'), 'char');
            end
            if isKey(obj.props_, 'role_ids')
                result('role_ids') = flywheel.ModelBase.serializeValue(obj.props_('role_ids'), 'vector[char]');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, '_id')
                result.id = obj.props_('_id');
            else
                result.id = [];
            end
            if isKey(obj.props_, 'role_ids')
                result.roleIds = obj.props_('role_ids');
            else
                result.roleIds = [];
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
                if isKey(obj.props_, 'role_ids')
                    propList.roleIds = obj.props_('role_ids');
                else
                    propList.roleIds = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.RolesRoleAssignment;
            if isfield(json, 'x0x5Fid')
                obj.props_('_id') = flywheel.ModelBase.deserializeValue(json.x0x5Fid, 'char');
            end
            if isfield(json, 'role_ids')
                obj.props_('role_ids') = flywheel.ModelBase.deserializeValue(json.role_ids, 'vector[char]');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.RolesRoleAssignment')
                    obj = flywheel.model.RolesRoleAssignment(obj);
                end
                if isKey(obj.props_, '_id')
                end
                if isKey(obj.props_, 'role_ids')
                end
            end
        end
    end
end
