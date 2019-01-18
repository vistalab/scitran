% BatchJobsProposalInput
%
% BatchJobsProposalInput Properties:
%    jobs 
%
% BatchJobsProposalInput Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef BatchJobsProposalInput < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'jobs' }, ...
            { 'jobs' });
    end
    properties(Dependent)
        jobs
    end
    methods
        function obj = BatchJobsProposalInput(varargin)
            obj@flywheel.ModelBase(flywheel.model.BatchJobsProposalInput.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'jobs', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.jobs)
                    obj.props_('jobs') = p.Results.jobs;
                end
            end
        end
        function result = get.jobs(obj)
            if ismethod(obj, 'get_jobs')
                result = obj.get_jobs();
            else
                if isKey(obj.props_, 'jobs')
                    result = obj.props_('jobs');
                else
                    result = [];
                end
            end
        end
        function obj = set.jobs(obj, value)
            obj.props_('jobs') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'jobs')
                result('jobs') = flywheel.ModelBase.cellmap(@toJson, obj.props_('jobs'));
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'jobs')
                result.jobs = flywheel.ModelBase.cellmap(@struct, obj.props_('jobs'));
            else
                result.jobs = [];
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
                if isKey(obj.props_, 'jobs')
                    propList.jobs = obj.props_('jobs');
                else
                    propList.jobs = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.BatchJobsProposalInput;
            if isfield(json, 'jobs')
                obj.props_('jobs') = flywheel.ModelBase.cellmap(@(x) flywheel.model.Job.fromJson(x, context), json.jobs);
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.BatchJobsProposalInput')
                    obj = flywheel.model.BatchJobsProposalInput(obj);
                end
                if isKey(obj.props_, 'jobs')
                    obj.props_('jobs') = flywheel.ModelBase.cellmap(@flywheel.model.Job.ensureIsInstance, obj.props_('jobs'));
                end
            end
        end
    end
end
