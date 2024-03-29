% ViewerApp
%
% ViewerApp Properties:
%    name        - Unique name of this application
%    url         - URL that points to the location where the application is hosted
%    options     - General properties passed to the application when it connects to Flywheel
%    files       - File types that are associated to this application
%    containers  - Container types that are associated to this application
%
% ViewerApp Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef ViewerApp < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'name', 'url', 'options', 'files', 'containers' }, ...
            { 'name', 'url', 'options', 'files', 'containers' });
    end
    properties(Dependent)
        name
        url
        options
        files
        containers
    end
    methods
        function obj = ViewerApp(varargin)
            obj@flywheel.ModelBase(flywheel.model.ViewerApp.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'name', []);
                addParameter(p, 'url', []);
                addParameter(p, 'options', []);
                addParameter(p, 'files', []);
                addParameter(p, 'containers', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.name)
                    obj.props_('name') = p.Results.name;
                end
                if ~isempty(p.Results.url)
                    obj.props_('url') = p.Results.url;
                end
                if ~isempty(p.Results.options)
                    obj.props_('options') = p.Results.options;
                end
                if ~isempty(p.Results.files)
                    obj.props_('files') = p.Results.files;
                end
                if ~isempty(p.Results.containers)
                    obj.props_('containers') = p.Results.containers;
                end
            end
        end
        function result = get.name(obj)
            if ismethod(obj, 'get_name')
                result = obj.get_name();
            else
                if isKey(obj.props_, 'name')
                    result = obj.props_('name');
                else
                    result = [];
                end
            end
        end
        function obj = set.name(obj, value)
            obj.props_('name') = value;
        end
        function result = get.url(obj)
            if ismethod(obj, 'get_url')
                result = obj.get_url();
            else
                if isKey(obj.props_, 'url')
                    result = obj.props_('url');
                else
                    result = [];
                end
            end
        end
        function obj = set.url(obj, value)
            obj.props_('url') = value;
        end
        function result = get.options(obj)
            if ismethod(obj, 'get_options')
                result = obj.get_options();
            else
                if isKey(obj.props_, 'options')
                    result = obj.props_('options');
                else
                    result = [];
                end
            end
        end
        function obj = set.options(obj, value)
            obj.props_('options') = value;
        end
        function result = get.files(obj)
            if ismethod(obj, 'get_files')
                result = obj.get_files();
            else
                if isKey(obj.props_, 'files')
                    result = obj.props_('files');
                else
                    result = [];
                end
            end
        end
        function obj = set.files(obj, value)
            obj.props_('files') = value;
        end
        function result = get.containers(obj)
            if ismethod(obj, 'get_containers')
                result = obj.get_containers();
            else
                if isKey(obj.props_, 'containers')
                    result = obj.props_('containers');
                else
                    result = [];
                end
            end
        end
        function obj = set.containers(obj, value)
            obj.props_('containers') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, 'name')
                result('name') = flywheel.ModelBase.serializeValue(obj.props_('name'), 'char');
            end
            if isKey(obj.props_, 'url')
                result('url') = flywheel.ModelBase.serializeValue(obj.props_('url'), 'char');
            end
            if isKey(obj.props_, 'options')
                result('options') = flywheel.ModelBase.serializeValue(obj.props_('options'), 'containers.Map');
            end
            if isKey(obj.props_, 'files')
                result('files') = flywheel.ModelBase.serializeValue(obj.props_('files'), 'containers.Map[String, containers.Map]');
            end
            if isKey(obj.props_, 'containers')
                result('containers') = flywheel.ModelBase.serializeValue(obj.props_('containers'), 'containers.Map[String, containers.Map]');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, 'name')
                result.name = obj.props_('name');
            else
                result.name = [];
            end
            if isKey(obj.props_, 'url')
                result.url = obj.props_('url');
            else
                result.url = [];
            end
            if isKey(obj.props_, 'options')
                result.options = obj.props_('options');
            else
                result.options = [];
            end
            if isKey(obj.props_, 'files')
                result.files = obj.props_('files');
            else
                result.files = [];
            end
            if isKey(obj.props_, 'containers')
                result.containers = obj.props_('containers');
            else
                result.containers = [];
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
                if isKey(obj.props_, 'name')
                    propList.name = obj.props_('name');
                else
                    propList.name = [];
                end
                if isKey(obj.props_, 'url')
                    propList.url = obj.props_('url');
                else
                    propList.url = [];
                end
                if isKey(obj.props_, 'options')
                    propList.options = obj.props_('options');
                else
                    propList.options = [];
                end
                if isKey(obj.props_, 'files')
                    propList.files = obj.props_('files');
                else
                    propList.files = [];
                end
                if isKey(obj.props_, 'containers')
                    propList.containers = obj.props_('containers');
                else
                    propList.containers = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.ViewerApp;
            if isfield(json, 'name')
                obj.props_('name') = flywheel.ModelBase.deserializeValue(json.name, 'char');
            end
            if isfield(json, 'url')
                obj.props_('url') = flywheel.ModelBase.deserializeValue(json.url, 'char');
            end
            if isfield(json, 'options')
                obj.props_('options') = flywheel.ModelBase.deserializeValue(json.options, 'containers.Map');
            end
            if isfield(json, 'files')
                obj.props_('files') = flywheel.ModelBase.deserializeValue(json.files, 'containers.Map[String, containers.Map]');
            end
            if isfield(json, 'containers')
                obj.props_('containers') = flywheel.ModelBase.deserializeValue(json.containers, 'containers.Map[String, containers.Map]');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.ViewerApp')
                    obj = flywheel.model.ViewerApp(obj);
                end
                if isKey(obj.props_, 'name')
                end
                if isKey(obj.props_, 'url')
                end
                if isKey(obj.props_, 'options')
                end
                if isKey(obj.props_, 'files')
                end
                if isKey(obj.props_, 'containers')
                end
            end
        end
    end
end
