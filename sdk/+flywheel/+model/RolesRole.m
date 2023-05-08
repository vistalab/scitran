% RolesRole
%
% RolesRole Properties:
%    id                   - Unique database ID
%    label                - Application-specific label
%    defaultFlywheelRole 
%    actions             
%    inUse               
%
% RolesRole Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef RolesRole < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'id', 'label', 'defaultFlywheelRole', 'actions', 'inUse' }, ...
            { '_id', 'label', 'default_flywheel_role', 'actions', 'in_use' });
    end
    properties(Dependent)
        id
        label
        defaultFlywheelRole
        actions
        inUse
    end
    methods
        function obj = RolesRole(varargin)
            obj@flywheel.ModelBase(flywheel.model.RolesRole.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'id', []);
                addParameter(p, 'label', []);
                addParameter(p, 'defaultFlywheelRole', []);
                addParameter(p, 'actions', []);
                addParameter(p, 'inUse', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.id)
                    obj.props_('_id') = p.Results.id;
                end
                if ~isempty(p.Results.label)
                    obj.props_('label') = p.Results.label;
                end
                if ~isempty(p.Results.defaultFlywheelRole)
                    obj.props_('default_flywheel_role') = p.Results.defaultFlywheelRole;
                end
                if ~isempty(p.Results.actions)
                    obj.props_('actions') = p.Results.actions;
                end
                if ~isempty(p.Results.inUse)
                    obj.props_('in_use') = p.Results.inUse;
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
        function result = get.defaultFlywheelRole(obj)
            if ismethod(obj, 'get_defaultFlywheelRole')
                result = obj.get_defaultFlywheelRole();
            else
                if isKey(obj.props_, 'default_flywheel_role')
                    result = obj.props_('default_flywheel_role');
                else
                    result = [];
                end
            end
        end
        function obj = set.defaultFlywheelRole(obj, value)
            obj.props_('default_flywheel_role') = value;
        end
        function result = get.actions(obj)
            if ismethod(obj, 'get_actions')
                result = obj.get_actions();
            else
                if isKey(obj.props_, 'actions')
                    result = obj.props_('actions');
                else
                    result = [];
                end
            end
        end
        function obj = set.actions(obj, value)
            obj.props_('actions') = value;
        end
        function result = get.inUse(obj)
            if ismethod(obj, 'get_inUse')
                result = obj.get_inUse();
            else
                if isKey(obj.props_, 'in_use')
                    result = obj.props_('in_use');
                else
                    result = [];
                end
            end
        end
        function obj = set.inUse(obj, value)
            obj.props_('in_use') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, '_id')
                result('_id') = flywheel.ModelBase.serializeValue(obj.props_('_id'), 'char');
            end
            if isKey(obj.props_, 'label')
                result('label') = flywheel.ModelBase.serializeValue(obj.props_('label'), 'char');
            end
            if isKey(obj.props_, 'default_flywheel_role')
                result('default_flywheel_role') = flywheel.ModelBase.serializeValue(obj.props_('default_flywheel_role'), 'char');
            end
            if isKey(obj.props_, 'actions')
                result('actions') = flywheel.ModelBase.serializeValue(obj.props_('actions'), 'vector[char]');
            end
            if isKey(obj.props_, 'in_use')
                result('in_use') = flywheel.ModelBase.serializeValue(obj.props_('in_use'), 'logical');
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
            if isKey(obj.props_, 'default_flywheel_role')
                result.defaultFlywheelRole = obj.props_('default_flywheel_role');
            else
                result.defaultFlywheelRole = [];
            end
            if isKey(obj.props_, 'actions')
                result.actions = obj.props_('actions');
            else
                result.actions = [];
            end
            if isKey(obj.props_, 'in_use')
                result.inUse = obj.props_('in_use');
            else
                result.inUse = [];
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
                if isKey(obj.props_, 'default_flywheel_role')
                    propList.defaultFlywheelRole = obj.props_('default_flywheel_role');
                else
                    propList.defaultFlywheelRole = [];
                end
                if isKey(obj.props_, 'actions')
                    propList.actions = obj.props_('actions');
                else
                    propList.actions = [];
                end
                if isKey(obj.props_, 'in_use')
                    propList.inUse = obj.props_('in_use');
                else
                    propList.inUse = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.RolesRole;
            if isfield(json, 'x0x5Fid')
                obj.props_('_id') = flywheel.ModelBase.deserializeValue(json.x0x5Fid, 'char');
            end
            if isfield(json, 'label')
                obj.props_('label') = flywheel.ModelBase.deserializeValue(json.label, 'char');
            end
            if isfield(json, 'default_flywheel_role')
                obj.props_('default_flywheel_role') = flywheel.ModelBase.deserializeValue(json.default_flywheel_role, 'char');
            end
            if isfield(json, 'actions')
                obj.props_('actions') = flywheel.ModelBase.deserializeValue(json.actions, 'vector[char]');
            end
            if isfield(json, 'in_use')
                obj.props_('in_use') = flywheel.ModelBase.deserializeValue(json.in_use, 'logical');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.RolesRole')
                    obj = flywheel.model.RolesRole(obj);
                end
                if isKey(obj.props_, '_id')
                end
                if isKey(obj.props_, 'label')
                end
                if isKey(obj.props_, 'default_flywheel_role')
                end
                if isKey(obj.props_, 'actions')
                end
                if isKey(obj.props_, 'in_use')
                end
            end
        end
    end
end
