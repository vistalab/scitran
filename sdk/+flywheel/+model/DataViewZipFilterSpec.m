% DataViewZipFilterSpec - Specifies filters for zip members.
%
% DataViewZipFilterSpec Properties:
%    value  - The pattern or regular expression to match
%    regex  - Whether or not this filter is a pattern or regular expression match
%    match  - If multiple file matches are encountered, which file to choose. Default is first
%
% DataViewZipFilterSpec Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef DataViewZipFilterSpec < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'value', 'regex', 'match' }, ...
            { 'value', 'regex', 'match' });
    end
    properties(Dependent)
        value
        regex
        match
    end
    methods
        function obj = DataViewZipFilterSpec(varargin)
            obj@flywheel.ModelBase(flywheel.model.DataViewZipFilterSpec.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'value', []);
                addParameter(p, 'regex', []);
                addParameter(p, 'match', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.value)
                    obj.props_('value') = p.Results.value;
                end
                if ~isempty(p.Results.regex)
                    obj.props_('regex') = p.Results.regex;
                end
                if ~isempty(p.Results.match)
                    obj.props_('match') = p.Results.match;
                end
            end
        end
        function result = get.value(obj)
            if ismethod(obj, 'get_value')
                result = obj.get_value();
            else
                if isKey(obj.props_, 'value')
                    result = obj.props_('value');
                else
                    result = [];
                end
            end
        end
        function obj = set.value(obj, value)
            obj.props_('value') = value;
        end
        function result = get.regex(obj)
            if ismethod(obj, 'get_regex')
                result = obj.get_regex();
            else
                if isKey(obj.props_, 'regex')
                    result = obj.props_('regex');
                else
                    result = [];
                end
            end
        end
        function obj = set.regex(obj, value)
            obj.props_('regex') = value;
        end
        function result = get.match(obj)
            if ismethod(obj, 'get_match')
                result = obj.get_match();
            else
                if isKey(obj.props_, 'match')
                    result = obj.props_('match');
                else
                    result = [];
                end
            end
        end
        function obj = set.match(obj, value)
            obj.props_('match') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'value')
                result('value') = flywheel.ModelBase.serializeValue(obj.props_('value'), 'char');
            end
            if isKey(obj.props_, 'regex')
                result('regex') = flywheel.ModelBase.serializeValue(obj.props_('regex'), 'logical');
            end
            if isKey(obj.props_, 'match')
                result('match') = flywheel.ModelBase.serializeValue(obj.props_('match'), 'char');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'value')
                result.value = obj.props_('value');
            else
                result.value = [];
            end
            if isKey(obj.props_, 'regex')
                result.regex = obj.props_('regex');
            else
                result.regex = [];
            end
            if isKey(obj.props_, 'match')
                result.match = obj.props_('match');
            else
                result.match = [];
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
                if isKey(obj.props_, 'value')
                    propList.value = obj.props_('value');
                else
                    propList.value = [];
                end
                if isKey(obj.props_, 'regex')
                    propList.regex = obj.props_('regex');
                else
                    propList.regex = [];
                end
                if isKey(obj.props_, 'match')
                    propList.match = obj.props_('match');
                else
                    propList.match = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.DataViewZipFilterSpec;
            if isfield(json, 'value')
                obj.props_('value') = flywheel.ModelBase.deserializeValue(json.value, 'char');
            end
            if isfield(json, 'regex')
                obj.props_('regex') = flywheel.ModelBase.deserializeValue(json.regex, 'logical');
            end
            if isfield(json, 'match')
                obj.props_('match') = flywheel.ModelBase.deserializeValue(json.match, 'char');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.DataViewZipFilterSpec')
                    obj = flywheel.model.DataViewZipFilterSpec(obj);
                end
                if isKey(obj.props_, 'value')
                end
                if isKey(obj.props_, 'regex')
                end
                if isKey(obj.props_, 'match')
                end
            end
        end
    end
end