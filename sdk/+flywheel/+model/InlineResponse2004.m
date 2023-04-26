% InlineResponse2004
%
% InlineResponse2004 Properties:
%    firstname  - First name
%    lastname   - Last name
%    id         - Database ID of a user
%
% InlineResponse2004 Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef InlineResponse2004 < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'firstname', 'lastname', 'id' }, ...
            { 'firstname', 'lastname', '_id' });
    end
    properties(Dependent)
        firstname
        lastname
        id
    end
    methods
        function obj = InlineResponse2004(varargin)
            obj@flywheel.ModelBase(flywheel.model.InlineResponse2004.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'firstname', []);
                addParameter(p, 'lastname', []);
                addParameter(p, 'id', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.firstname)
                    obj.props_('firstname') = p.Results.firstname;
                end
                if ~isempty(p.Results.lastname)
                    obj.props_('lastname') = p.Results.lastname;
                end
                if ~isempty(p.Results.id)
                    obj.props_('_id') = p.Results.id;
                end
            end
        end
        function result = get.firstname(obj)
            if ismethod(obj, 'get_firstname')
                result = obj.get_firstname();
            else
                if isKey(obj.props_, 'firstname')
                    result = obj.props_('firstname');
                else
                    result = [];
                end
            end
        end
        function obj = set.firstname(obj, value)
            obj.props_('firstname') = value;
        end
        function result = get.lastname(obj)
            if ismethod(obj, 'get_lastname')
                result = obj.get_lastname();
            else
                if isKey(obj.props_, 'lastname')
                    result = obj.props_('lastname');
                else
                    result = [];
                end
            end
        end
        function obj = set.lastname(obj, value)
            obj.props_('lastname') = value;
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
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'firstname')
                result('firstname') = flywheel.ModelBase.serializeValue(obj.props_('firstname'), 'char');
            end
            if isKey(obj.props_, 'lastname')
                result('lastname') = flywheel.ModelBase.serializeValue(obj.props_('lastname'), 'char');
            end
            if isKey(obj.props_, '_id')
                result('_id') = flywheel.ModelBase.serializeValue(obj.props_('_id'), 'char');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'firstname')
                result.firstname = obj.props_('firstname');
            else
                result.firstname = [];
            end
            if isKey(obj.props_, 'lastname')
                result.lastname = obj.props_('lastname');
            else
                result.lastname = [];
            end
            if isKey(obj.props_, '_id')
                result.id = obj.props_('_id');
            else
                result.id = [];
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
                if isKey(obj.props_, 'firstname')
                    propList.firstname = obj.props_('firstname');
                else
                    propList.firstname = [];
                end
                if isKey(obj.props_, 'lastname')
                    propList.lastname = obj.props_('lastname');
                else
                    propList.lastname = [];
                end
                if isKey(obj.props_, '_id')
                    propList.id = obj.props_('_id');
                else
                    propList.id = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.InlineResponse2004;
            if isfield(json, 'firstname')
                obj.props_('firstname') = flywheel.ModelBase.deserializeValue(json.firstname, 'char');
            end
            if isfield(json, 'lastname')
                obj.props_('lastname') = flywheel.ModelBase.deserializeValue(json.lastname, 'char');
            end
            if isfield(json, 'x0x5Fid')
                obj.props_('_id') = flywheel.ModelBase.deserializeValue(json.x0x5Fid, 'char');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.InlineResponse2004')
                    obj = flywheel.model.InlineResponse2004(obj);
                end
                if isKey(obj.props_, 'firstname')
                end
                if isKey(obj.props_, 'lastname')
                end
                if isKey(obj.props_, '_id')
                end
            end
        end
    end
end
