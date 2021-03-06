% SearchAcquisitionResponse - Fields for acquisition search response
%
% SearchAcquisitionResponse Properties:
%    id         - Unique database ID
%    label      - Application-specific label
%    timestamp 
%    created    - Creation time (automatically set)
%
% SearchAcquisitionResponse Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef SearchAcquisitionResponse < flywheel.ModelBase & flywheel.mixins.AcquisitionMixin
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'id', 'label', 'timestamp', 'created' }, ...
            { '_id', 'label', 'timestamp', 'created' });
    end
    properties(Dependent)
        id
        label
        timestamp
        created
    end
    methods
        function obj = SearchAcquisitionResponse(varargin)
            obj@flywheel.ModelBase(flywheel.model.SearchAcquisitionResponse.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'id', []);
                addParameter(p, 'label', []);
                addParameter(p, 'timestamp', []);
                addParameter(p, 'created', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.id)
                    obj.props_('_id') = p.Results.id;
                end
                if ~isempty(p.Results.label)
                    obj.props_('label') = p.Results.label;
                end
                if ~isempty(p.Results.timestamp)
                    obj.props_('timestamp') = p.Results.timestamp;
                end
                if ~isempty(p.Results.created)
                    obj.props_('created') = p.Results.created;
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
        function result = get.timestamp(obj)
            if ismethod(obj, 'get_timestamp')
                result = obj.get_timestamp();
            else
                if isKey(obj.props_, 'timestamp')
                    result = obj.props_('timestamp');
                else
                    result = [];
                end
            end
        end
        function obj = set.timestamp(obj, value)
            obj.props_('timestamp') = value;
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
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, '_id')
                result('_id') = flywheel.ModelBase.serializeValue(obj.props_('_id'), 'char');
            end
            if isKey(obj.props_, 'label')
                result('label') = flywheel.ModelBase.serializeValue(obj.props_('label'), 'char');
            end
            if isKey(obj.props_, 'timestamp')
                result('timestamp') = flywheel.ModelBase.serializeValue(obj.props_('timestamp'), 'datetime');
            end
            if isKey(obj.props_, 'created')
                result('created') = flywheel.ModelBase.serializeValue(obj.props_('created'), 'datetime');
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
            if isKey(obj.props_, 'timestamp')
                result.timestamp = obj.props_('timestamp');
            else
                result.timestamp = [];
            end
            if isKey(obj.props_, 'created')
                result.created = obj.props_('created');
            else
                result.created = [];
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
                if isKey(obj.props_, 'timestamp')
                    propList.timestamp = obj.props_('timestamp');
                else
                    propList.timestamp = [];
                end
                if isKey(obj.props_, 'created')
                    propList.created = obj.props_('created');
                else
                    propList.created = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.SearchAcquisitionResponse;
            if isfield(json, 'x0x5Fid')
                obj.props_('_id') = flywheel.ModelBase.deserializeValue(json.x0x5Fid, 'char');
            end
            if isfield(json, 'label')
                obj.props_('label') = flywheel.ModelBase.deserializeValue(json.label, 'char');
            end
            if isfield(json, 'timestamp')
                obj.props_('timestamp') = flywheel.ModelBase.deserializeValue(json.timestamp, 'datetime');
            end
            if isfield(json, 'created')
                obj.props_('created') = flywheel.ModelBase.deserializeValue(json.created, 'datetime');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.SearchAcquisitionResponse')
                    obj = flywheel.model.SearchAcquisitionResponse(obj);
                end
                if isKey(obj.props_, '_id')
                end
                if isKey(obj.props_, 'label')
                end
                if isKey(obj.props_, 'timestamp')
                end
                if isKey(obj.props_, 'created')
                end
            end
        end
    end
end
