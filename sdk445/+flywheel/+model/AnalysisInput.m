% AnalysisInput - Analysis input for creating ad-hoc analyses
%
% AnalysisInput Properties:
%    inputs       - The set of inputs that this analysis is based on
%    description 
%    label        - Application-specific label
%    job         
%
% AnalysisInput Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef AnalysisInput < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'inputs', 'description', 'label', 'job' }, ...
            { 'inputs', 'description', 'label', 'job' });
    end
    properties(Dependent)
        inputs
        description
        label
        job
    end
    methods
        function obj = AnalysisInput(varargin)
            obj@flywheel.ModelBase(flywheel.model.AnalysisInput.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'inputs', []);
                addParameter(p, 'description', []);
                addParameter(p, 'label', []);
                addParameter(p, 'job', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.inputs)
                    obj.props_('inputs') = p.Results.inputs;
                end
                if ~isempty(p.Results.description)
                    obj.props_('description') = p.Results.description;
                end
                if ~isempty(p.Results.label)
                    obj.props_('label') = p.Results.label;
                end
                if ~isempty(p.Results.job)
                    obj.props_('job') = p.Results.job;
                end
            end
        end
        function result = get.inputs(obj)
            if ismethod(obj, 'get_inputs')
                result = obj.get_inputs();
            else
                if isKey(obj.props_, 'inputs')
                    result = obj.props_('inputs');
                else
                    result = [];
                end
            end
        end
        function obj = set.inputs(obj, value)
            obj.props_('inputs') = value;
        end
        function result = get.description(obj)
            if ismethod(obj, 'get_description')
                result = obj.get_description();
            else
                if isKey(obj.props_, 'description')
                    result = obj.props_('description');
                else
                    result = [];
                end
            end
        end
        function obj = set.description(obj, value)
            obj.props_('description') = value;
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
        function result = get.job(obj)
            if ismethod(obj, 'get_job')
                result = obj.get_job();
            else
                if isKey(obj.props_, 'job')
                    result = obj.props_('job');
                else
                    result = [];
                end
            end
        end
        function obj = set.job(obj, value)
            obj.props_('job') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'inputs')
                result('inputs') = flywheel.ModelBase.cellmap(@toJson, obj.props_('inputs'));
            end
            if isKey(obj.props_, 'description')
                result('description') = flywheel.ModelBase.serializeValue(obj.props_('description'), 'char');
            end
            if isKey(obj.props_, 'label')
                result('label') = flywheel.ModelBase.serializeValue(obj.props_('label'), 'char');
            end
            if isKey(obj.props_, 'job')
                result('job') = obj.props_('job').toJson();
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'inputs')
                result.inputs = flywheel.ModelBase.cellmap(@struct, obj.props_('inputs'));
            else
                result.inputs = [];
            end
            if isKey(obj.props_, 'description')
                result.description = obj.props_('description');
            else
                result.description = [];
            end
            if isKey(obj.props_, 'label')
                result.label = obj.props_('label');
            else
                result.label = [];
            end
            if isKey(obj.props_, 'job')
                result.job = struct(obj.props_('job'));
            else
                result.job = [];
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
                if isKey(obj.props_, 'inputs')
                    propList.inputs = obj.props_('inputs');
                else
                    propList.inputs = [];
                end
                if isKey(obj.props_, 'description')
                    propList.description = obj.props_('description');
                else
                    propList.description = [];
                end
                if isKey(obj.props_, 'label')
                    propList.label = obj.props_('label');
                else
                    propList.label = [];
                end
                if isKey(obj.props_, 'job')
                    propList.job = obj.props_('job');
                else
                    propList.job = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.AnalysisInput;
            if isfield(json, 'inputs')
                obj.props_('inputs') = flywheel.ModelBase.cellmap(@(x) flywheel.model.FileReference.fromJson(x, context), json.inputs);
            end
            if isfield(json, 'description')
                obj.props_('description') = flywheel.ModelBase.deserializeValue(json.description, 'char');
            end
            if isfield(json, 'label')
                obj.props_('label') = flywheel.ModelBase.deserializeValue(json.label, 'char');
            end
            if isfield(json, 'job')
                obj.props_('job') = flywheel.model.Job.fromJson(json.job, context);
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.AnalysisInput')
                    obj = flywheel.model.AnalysisInput(obj);
                end
                if isKey(obj.props_, 'inputs')
                    obj.props_('inputs') = flywheel.ModelBase.cellmap(@flywheel.model.FileReference.ensureIsInstance, obj.props_('inputs'));
                end
                if isKey(obj.props_, 'description')
                end
                if isKey(obj.props_, 'label')
                end
                if isKey(obj.props_, 'job')
                    obj.props_('job') =  flywheel.model.Job.ensureIsInstance(obj.props_('job'));
                end
            end
        end
    end
end
