% AuthLoginStatus
%
% AuthLoginStatus Properties:
%    origin      
%    userIsAdmin  - Whether or not the user has admin privileges
%    isDevice     - Whether or not the credentials identified a device
%
% AuthLoginStatus Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef AuthLoginStatus < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'origin', 'userIsAdmin', 'isDevice' }, ...
            { 'origin', 'user_is_admin', 'is_device' });
    end
    properties(Dependent)
        origin
        userIsAdmin
        isDevice
    end
    methods
        function obj = AuthLoginStatus(varargin)
            obj@flywheel.ModelBase(flywheel.model.AuthLoginStatus.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'origin', []);
                addParameter(p, 'userIsAdmin', []);
                addParameter(p, 'isDevice', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.origin)
                    obj.props_('origin') = p.Results.origin;
                end
                if ~isempty(p.Results.userIsAdmin)
                    obj.props_('user_is_admin') = p.Results.userIsAdmin;
                end
                if ~isempty(p.Results.isDevice)
                    obj.props_('is_device') = p.Results.isDevice;
                end
            end
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
        function result = get.userIsAdmin(obj)
            if ismethod(obj, 'get_userIsAdmin')
                result = obj.get_userIsAdmin();
            else
                if isKey(obj.props_, 'user_is_admin')
                    result = obj.props_('user_is_admin');
                else
                    result = [];
                end
            end
        end
        function obj = set.userIsAdmin(obj, value)
            obj.props_('user_is_admin') = value;
        end
        function result = get.isDevice(obj)
            if ismethod(obj, 'get_isDevice')
                result = obj.get_isDevice();
            else
                if isKey(obj.props_, 'is_device')
                    result = obj.props_('is_device');
                else
                    result = [];
                end
            end
        end
        function obj = set.isDevice(obj, value)
            obj.props_('is_device') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'origin')
                result('origin') = obj.props_('origin').toJson();
            end
            if isKey(obj.props_, 'user_is_admin')
                result('user_is_admin') = flywheel.ModelBase.serializeValue(obj.props_('user_is_admin'), 'logical');
            end
            if isKey(obj.props_, 'is_device')
                result('is_device') = flywheel.ModelBase.serializeValue(obj.props_('is_device'), 'logical');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'origin')
                result.origin = struct(obj.props_('origin'));
            else
                result.origin = [];
            end
            if isKey(obj.props_, 'user_is_admin')
                result.userIsAdmin = obj.props_('user_is_admin');
            else
                result.userIsAdmin = [];
            end
            if isKey(obj.props_, 'is_device')
                result.isDevice = obj.props_('is_device');
            else
                result.isDevice = [];
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
                if isKey(obj.props_, 'origin')
                    propList.origin = obj.props_('origin');
                else
                    propList.origin = [];
                end
                if isKey(obj.props_, 'user_is_admin')
                    propList.userIsAdmin = obj.props_('user_is_admin');
                else
                    propList.userIsAdmin = [];
                end
                if isKey(obj.props_, 'is_device')
                    propList.isDevice = obj.props_('is_device');
                else
                    propList.isDevice = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.AuthLoginStatus;
            if isfield(json, 'origin')
                obj.props_('origin') = flywheel.model.ReportAccessLogOrigin.fromJson(json.origin, context);
            end
            if isfield(json, 'user_is_admin')
                obj.props_('user_is_admin') = flywheel.ModelBase.deserializeValue(json.user_is_admin, 'logical');
            end
            if isfield(json, 'is_device')
                obj.props_('is_device') = flywheel.ModelBase.deserializeValue(json.is_device, 'logical');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.AuthLoginStatus')
                    obj = flywheel.model.AuthLoginStatus(obj);
                end
                if isKey(obj.props_, 'origin')
                    obj.props_('origin') =  flywheel.model.ReportAccessLogOrigin.ensureIsInstance(obj.props_('origin'));
                end
                if isKey(obj.props_, 'user_is_admin')
                end
                if isKey(obj.props_, 'is_device')
                end
            end
        end
    end
end
