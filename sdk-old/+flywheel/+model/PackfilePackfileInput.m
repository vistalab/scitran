% PackfilePackfileInput
%
% PackfilePackfileInput Properties:
%    type      
%    deidLogId 
%
% PackfilePackfileInput Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef PackfilePackfileInput < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'type', 'deidLogId' }, ...
            { 'type', 'deid_log_id' });
    end
    properties(Dependent)
        type
        deidLogId
    end
    methods
        function obj = PackfilePackfileInput(varargin)
            obj@flywheel.ModelBase(flywheel.model.PackfilePackfileInput.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'type', []);
                addParameter(p, 'deidLogId', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.type)
                    obj.props_('type') = p.Results.type;
                end
                if ~isempty(p.Results.deidLogId)
                    obj.props_('deid_log_id') = p.Results.deidLogId;
                end
            end
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
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'type')
                result('type') = flywheel.ModelBase.serializeValue(obj.props_('type'), 'char');
            end
            if isKey(obj.props_, 'deid_log_id')
                result('deid_log_id') = flywheel.ModelBase.serializeValue(obj.props_('deid_log_id'), 'char');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'type')
                result.type = obj.props_('type');
            else
                result.type = [];
            end
            if isKey(obj.props_, 'deid_log_id')
                result.deidLogId = obj.props_('deid_log_id');
            else
                result.deidLogId = [];
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
                if isKey(obj.props_, 'type')
                    propList.type = obj.props_('type');
                else
                    propList.type = [];
                end
                if isKey(obj.props_, 'deid_log_id')
                    propList.deidLogId = obj.props_('deid_log_id');
                else
                    propList.deidLogId = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.PackfilePackfileInput;
            if isfield(json, 'type')
                obj.props_('type') = flywheel.ModelBase.deserializeValue(json.type, 'char');
            end
            if isfield(json, 'deid_log_id')
                obj.props_('deid_log_id') = flywheel.ModelBase.deserializeValue(json.deid_log_id, 'char');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.PackfilePackfileInput')
                    obj = flywheel.model.PackfilePackfileInput(obj);
                end
                if isKey(obj.props_, 'type')
                end
                if isKey(obj.props_, 'deid_log_id')
                end
            end
        end
    end
end