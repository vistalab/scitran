% ContainerUidcheck - Input for checking the existence of UIDs
%
% ContainerUidcheck Properties:
%    sessions      - A list of UIDs
%    acquisitions  - A list of UIDs
%    projectId     - Unique database ID
%    projectIds    - A list of Project IDs
%
% ContainerUidcheck Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef ContainerUidcheck < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'sessions', 'acquisitions', 'projectId', 'projectIds' }, ...
            { 'sessions', 'acquisitions', 'project_id', 'project_ids' });
    end
    properties(Dependent)
        sessions
        acquisitions
        projectId
        projectIds
    end
    methods
        function obj = ContainerUidcheck(varargin)
            obj@flywheel.ModelBase(flywheel.model.ContainerUidcheck.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'sessions', []);
                addParameter(p, 'acquisitions', []);
                addParameter(p, 'projectId', []);
                addParameter(p, 'projectIds', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.sessions)
                    obj.props_('sessions') = p.Results.sessions;
                end
                if ~isempty(p.Results.acquisitions)
                    obj.props_('acquisitions') = p.Results.acquisitions;
                end
                if ~isempty(p.Results.projectId)
                    obj.props_('project_id') = p.Results.projectId;
                end
                if ~isempty(p.Results.projectIds)
                    obj.props_('project_ids') = p.Results.projectIds;
                end
            end
        end
        function result = get.sessions(obj)
            if ismethod(obj, 'get_sessions')
                result = obj.get_sessions();
            else
                if isKey(obj.props_, 'sessions')
                    result = obj.props_('sessions');
                else
                    result = [];
                end
            end
        end
        function obj = set.sessions(obj, value)
            obj.props_('sessions') = value;
        end
        function result = get.acquisitions(obj)
            if ismethod(obj, 'get_acquisitions')
                result = obj.get_acquisitions();
            else
                if isKey(obj.props_, 'acquisitions')
                    result = obj.props_('acquisitions');
                else
                    result = [];
                end
            end
        end
        function obj = set.acquisitions(obj, value)
            obj.props_('acquisitions') = value;
        end
        function result = get.projectId(obj)
            if ismethod(obj, 'get_projectId')
                result = obj.get_projectId();
            else
                if isKey(obj.props_, 'project_id')
                    result = obj.props_('project_id');
                else
                    result = [];
                end
            end
        end
        function obj = set.projectId(obj, value)
            obj.props_('project_id') = value;
        end
        function result = get.projectIds(obj)
            if ismethod(obj, 'get_projectIds')
                result = obj.get_projectIds();
            else
                if isKey(obj.props_, 'project_ids')
                    result = obj.props_('project_ids');
                else
                    result = [];
                end
            end
        end
        function obj = set.projectIds(obj, value)
            obj.props_('project_ids') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'sessions')
                result('sessions') = flywheel.ModelBase.serializeValue(obj.props_('sessions'), 'vector[char]');
            end
            if isKey(obj.props_, 'acquisitions')
                result('acquisitions') = flywheel.ModelBase.serializeValue(obj.props_('acquisitions'), 'vector[char]');
            end
            if isKey(obj.props_, 'project_id')
                result('project_id') = flywheel.ModelBase.serializeValue(obj.props_('project_id'), 'char');
            end
            if isKey(obj.props_, 'project_ids')
                result('project_ids') = flywheel.ModelBase.serializeValue(obj.props_('project_ids'), 'vector[char]');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'sessions')
                result.sessions = obj.props_('sessions');
            else
                result.sessions = [];
            end
            if isKey(obj.props_, 'acquisitions')
                result.acquisitions = obj.props_('acquisitions');
            else
                result.acquisitions = [];
            end
            if isKey(obj.props_, 'project_id')
                result.projectId = obj.props_('project_id');
            else
                result.projectId = [];
            end
            if isKey(obj.props_, 'project_ids')
                result.projectIds = obj.props_('project_ids');
            else
                result.projectIds = [];
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
                if isKey(obj.props_, 'sessions')
                    propList.sessions = obj.props_('sessions');
                else
                    propList.sessions = [];
                end
                if isKey(obj.props_, 'acquisitions')
                    propList.acquisitions = obj.props_('acquisitions');
                else
                    propList.acquisitions = [];
                end
                if isKey(obj.props_, 'project_id')
                    propList.projectId = obj.props_('project_id');
                else
                    propList.projectId = [];
                end
                if isKey(obj.props_, 'project_ids')
                    propList.projectIds = obj.props_('project_ids');
                else
                    propList.projectIds = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.ContainerUidcheck;
            if isfield(json, 'sessions')
                obj.props_('sessions') = flywheel.ModelBase.deserializeValue(json.sessions, 'vector[char]');
            end
            if isfield(json, 'acquisitions')
                obj.props_('acquisitions') = flywheel.ModelBase.deserializeValue(json.acquisitions, 'vector[char]');
            end
            if isfield(json, 'project_id')
                obj.props_('project_id') = flywheel.ModelBase.deserializeValue(json.project_id, 'char');
            end
            if isfield(json, 'project_ids')
                obj.props_('project_ids') = flywheel.ModelBase.deserializeValue(json.project_ids, 'vector[char]');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.ContainerUidcheck')
                    obj = flywheel.model.ContainerUidcheck(obj);
                end
                if isKey(obj.props_, 'sessions')
                end
                if isKey(obj.props_, 'acquisitions')
                end
                if isKey(obj.props_, 'project_id')
                end
                if isKey(obj.props_, 'project_ids')
                end
            end
        end
    end
end
