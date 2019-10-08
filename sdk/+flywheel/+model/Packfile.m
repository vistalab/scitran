% Packfile
%
% Packfile Properties:
%    project     
%    session     
%    acquisition 
%    packfile    
%
% Packfile Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef Packfile < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'project', 'session', 'acquisition', 'packfile' }, ...
            { 'project', 'session', 'acquisition', 'packfile' });
    end
    properties(Dependent)
        project
        session
        acquisition
        packfile
    end
    methods
        function obj = Packfile(varargin)
            obj@flywheel.ModelBase(flywheel.model.Packfile.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'project', []);
                addParameter(p, 'session', []);
                addParameter(p, 'acquisition', []);
                addParameter(p, 'packfile', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.project)
                    obj.props_('project') = p.Results.project;
                end
                if ~isempty(p.Results.session)
                    obj.props_('session') = p.Results.session;
                end
                if ~isempty(p.Results.acquisition)
                    obj.props_('acquisition') = p.Results.acquisition;
                end
                if ~isempty(p.Results.packfile)
                    obj.props_('packfile') = p.Results.packfile;
                end
            end
        end
        function result = get.project(obj)
            if ismethod(obj, 'get_project')
                result = obj.get_project();
            else
                if isKey(obj.props_, 'project')
                    result = obj.props_('project');
                else
                    result = [];
                end
            end
        end
        function obj = set.project(obj, value)
            obj.props_('project') = value;
        end
        function result = get.session(obj)
            if ismethod(obj, 'get_session')
                result = obj.get_session();
            else
                if isKey(obj.props_, 'session')
                    result = obj.props_('session');
                else
                    result = [];
                end
            end
        end
        function obj = set.session(obj, value)
            obj.props_('session') = value;
        end
        function result = get.acquisition(obj)
            if ismethod(obj, 'get_acquisition')
                result = obj.get_acquisition();
            else
                if isKey(obj.props_, 'acquisition')
                    result = obj.props_('acquisition');
                else
                    result = [];
                end
            end
        end
        function obj = set.acquisition(obj, value)
            obj.props_('acquisition') = value;
        end
        function result = get.packfile(obj)
            if ismethod(obj, 'get_packfile')
                result = obj.get_packfile();
            else
                if isKey(obj.props_, 'packfile')
                    result = obj.props_('packfile');
                else
                    result = [];
                end
            end
        end
        function obj = set.packfile(obj, value)
            obj.props_('packfile') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'project')
                result('project') = obj.props_('project').toJson();
            end
            if isKey(obj.props_, 'session')
                result('session') = obj.props_('session').toJson();
            end
            if isKey(obj.props_, 'acquisition')
                result('acquisition') = obj.props_('acquisition').toJson();
            end
            if isKey(obj.props_, 'packfile')
                result('packfile') = obj.props_('packfile').toJson();
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'project')
                result.project = struct(obj.props_('project'));
            else
                result.project = [];
            end
            if isKey(obj.props_, 'session')
                result.session = struct(obj.props_('session'));
            else
                result.session = [];
            end
            if isKey(obj.props_, 'acquisition')
                result.acquisition = struct(obj.props_('acquisition'));
            else
                result.acquisition = [];
            end
            if isKey(obj.props_, 'packfile')
                result.packfile = struct(obj.props_('packfile'));
            else
                result.packfile = [];
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
                if isKey(obj.props_, 'project')
                    propList.project = obj.props_('project');
                else
                    propList.project = [];
                end
                if isKey(obj.props_, 'session')
                    propList.session = obj.props_('session');
                else
                    propList.session = [];
                end
                if isKey(obj.props_, 'acquisition')
                    propList.acquisition = obj.props_('acquisition');
                else
                    propList.acquisition = [];
                end
                if isKey(obj.props_, 'packfile')
                    propList.packfile = obj.props_('packfile');
                else
                    propList.packfile = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.Packfile;
            if isfield(json, 'project')
                obj.props_('project') = flywheel.model.PackfileProjectInput.fromJson(json.project, context);
            end
            if isfield(json, 'session')
                obj.props_('session') = flywheel.model.PackfileSessionInput.fromJson(json.session, context);
            end
            if isfield(json, 'acquisition')
                obj.props_('acquisition') = flywheel.model.PackfileAcquisitionInput.fromJson(json.acquisition, context);
            end
            if isfield(json, 'packfile')
                obj.props_('packfile') = flywheel.model.PackfilePackfileInput.fromJson(json.packfile, context);
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.Packfile')
                    obj = flywheel.model.Packfile(obj);
                end
                if isKey(obj.props_, 'project')
                    obj.props_('project') =  flywheel.model.PackfileProjectInput.ensureIsInstance(obj.props_('project'));
                end
                if isKey(obj.props_, 'session')
                    obj.props_('session') =  flywheel.model.PackfileSessionInput.ensureIsInstance(obj.props_('session'));
                end
                if isKey(obj.props_, 'acquisition')
                    obj.props_('acquisition') =  flywheel.model.PackfileAcquisitionInput.ensureIsInstance(obj.props_('acquisition'));
                end
                if isKey(obj.props_, 'packfile')
                    obj.props_('packfile') =  flywheel.model.PackfilePackfileInput.ensureIsInstance(obj.props_('packfile'));
                end
            end
        end
    end
end