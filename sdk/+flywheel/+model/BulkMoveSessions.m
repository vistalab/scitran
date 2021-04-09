% BulkMoveSessions
%
% BulkMoveSessions Properties:
%    destinationContainerType  - The type of destination container
%    sources                   - Array of continer Ids that you would like to bulk move
%    destinations              - Array with a single continer Id of the destination container's Id
%    conflictMode              - How to handle conflicts. Required even if no conflicts are found
%
% BulkMoveSessions Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef BulkMoveSessions < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'destinationContainerType', 'sources', 'destinations', 'conflictMode' }, ...
            { 'destination_container_type', 'sources', 'destinations', 'conflict_mode' });
    end
    properties(Dependent)
        destinationContainerType
        sources
        destinations
        conflictMode
    end
    methods
        function obj = BulkMoveSessions(varargin)
            obj@flywheel.ModelBase(flywheel.model.BulkMoveSessions.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'destinationContainerType', []);
                addParameter(p, 'sources', []);
                addParameter(p, 'destinations', []);
                addParameter(p, 'conflictMode', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.destinationContainerType)
                    obj.props_('destination_container_type') = p.Results.destinationContainerType;
                end
                if ~isempty(p.Results.sources)
                    obj.props_('sources') = p.Results.sources;
                end
                if ~isempty(p.Results.destinations)
                    obj.props_('destinations') = p.Results.destinations;
                end
                if ~isempty(p.Results.conflictMode)
                    obj.props_('conflict_mode') = p.Results.conflictMode;
                end
            end
        end
        function result = get.destinationContainerType(obj)
            if ismethod(obj, 'get_destinationContainerType')
                result = obj.get_destinationContainerType();
            else
                if isKey(obj.props_, 'destination_container_type')
                    result = obj.props_('destination_container_type');
                else
                    result = [];
                end
            end
        end
        function obj = set.destinationContainerType(obj, value)
            obj.props_('destination_container_type') = value;
        end
        function result = get.sources(obj)
            if ismethod(obj, 'get_sources')
                result = obj.get_sources();
            else
                if isKey(obj.props_, 'sources')
                    result = obj.props_('sources');
                else
                    result = [];
                end
            end
        end
        function obj = set.sources(obj, value)
            obj.props_('sources') = value;
        end
        function result = get.destinations(obj)
            if ismethod(obj, 'get_destinations')
                result = obj.get_destinations();
            else
                if isKey(obj.props_, 'destinations')
                    result = obj.props_('destinations');
                else
                    result = [];
                end
            end
        end
        function obj = set.destinations(obj, value)
            obj.props_('destinations') = value;
        end
        function result = get.conflictMode(obj)
            if ismethod(obj, 'get_conflictMode')
                result = obj.get_conflictMode();
            else
                if isKey(obj.props_, 'conflict_mode')
                    result = obj.props_('conflict_mode');
                else
                    result = [];
                end
            end
        end
        function obj = set.conflictMode(obj, value)
            obj.props_('conflict_mode') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'destination_container_type')
                result('destination_container_type') = flywheel.ModelBase.serializeValue(obj.props_('destination_container_type'), 'char');
            end
            if isKey(obj.props_, 'sources')
                result('sources') = flywheel.ModelBase.serializeValue(obj.props_('sources'), 'vector[char]');
            end
            if isKey(obj.props_, 'destinations')
                result('destinations') = flywheel.ModelBase.serializeValue(obj.props_('destinations'), 'vector[char]');
            end
            if isKey(obj.props_, 'conflict_mode')
                result('conflict_mode') = flywheel.ModelBase.serializeValue(obj.props_('conflict_mode'), 'char');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'destination_container_type')
                result.destinationContainerType = obj.props_('destination_container_type');
            else
                result.destinationContainerType = [];
            end
            if isKey(obj.props_, 'sources')
                result.sources = obj.props_('sources');
            else
                result.sources = [];
            end
            if isKey(obj.props_, 'destinations')
                result.destinations = obj.props_('destinations');
            else
                result.destinations = [];
            end
            if isKey(obj.props_, 'conflict_mode')
                result.conflictMode = obj.props_('conflict_mode');
            else
                result.conflictMode = [];
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
                if isKey(obj.props_, 'destination_container_type')
                    propList.destinationContainerType = obj.props_('destination_container_type');
                else
                    propList.destinationContainerType = [];
                end
                if isKey(obj.props_, 'sources')
                    propList.sources = obj.props_('sources');
                else
                    propList.sources = [];
                end
                if isKey(obj.props_, 'destinations')
                    propList.destinations = obj.props_('destinations');
                else
                    propList.destinations = [];
                end
                if isKey(obj.props_, 'conflict_mode')
                    propList.conflictMode = obj.props_('conflict_mode');
                else
                    propList.conflictMode = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.BulkMoveSessions;
            if isfield(json, 'destination_container_type')
                obj.props_('destination_container_type') = flywheel.ModelBase.deserializeValue(json.destination_container_type, 'char');
            end
            if isfield(json, 'sources')
                obj.props_('sources') = flywheel.ModelBase.deserializeValue(json.sources, 'vector[char]');
            end
            if isfield(json, 'destinations')
                obj.props_('destinations') = flywheel.ModelBase.deserializeValue(json.destinations, 'vector[char]');
            end
            if isfield(json, 'conflict_mode')
                obj.props_('conflict_mode') = flywheel.ModelBase.deserializeValue(json.conflict_mode, 'char');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.BulkMoveSessions')
                    obj = flywheel.model.BulkMoveSessions(obj);
                end
                if isKey(obj.props_, 'destination_container_type')
                end
                if isKey(obj.props_, 'sources')
                end
                if isKey(obj.props_, 'destinations')
                end
                if isKey(obj.props_, 'conflict_mode')
                end
            end
        end
    end
end