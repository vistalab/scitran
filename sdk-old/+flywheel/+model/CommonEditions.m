% CommonEditions
%
% CommonEditions Properties:
%    lab 
%
% CommonEditions Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef CommonEditions < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'lab' }, ...
            { 'lab' });
    end
    properties(Dependent)
        lab
    end
    methods
        function obj = CommonEditions(varargin)
            obj@flywheel.ModelBase(flywheel.model.CommonEditions.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'lab', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.lab)
                    obj.props_('lab') = p.Results.lab;
                end
            end
        end
        function result = get.lab(obj)
            if ismethod(obj, 'get_lab')
                result = obj.get_lab();
            else
                if isKey(obj.props_, 'lab')
                    result = obj.props_('lab');
                else
                    result = [];
                end
            end
        end
        function obj = set.lab(obj, value)
            obj.props_('lab') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'lab')
                result('lab') = flywheel.ModelBase.serializeValue(obj.props_('lab'), 'logical');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'lab')
                result.lab = obj.props_('lab');
            else
                result.lab = [];
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
                if isKey(obj.props_, 'lab')
                    propList.lab = obj.props_('lab');
                else
                    propList.lab = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.CommonEditions;
            if isfield(json, 'lab')
                obj.props_('lab') = flywheel.ModelBase.deserializeValue(json.lab, 'logical');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.CommonEditions')
                    obj = flywheel.model.CommonEditions(obj);
                end
                if isKey(obj.props_, 'lab')
                end
            end
        end
    end
end