% VersionOutput
%
% VersionOutput Properties:
%    id       
%    database 
%    release  
%
% VersionOutput Methods:
%    toJson - Convert the object to a Map that can be encoded to json
%    struct - Convert the object to a struct
    classdef VersionOutput < flywheel.ModelBase
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties (Constant)
        propertyMap = containers.Map({ 'id', 'database', 'release' }, ...
            { '_id', 'database', 'release' });
    end
    properties(Dependent)
        id
        database
        release
    end
    methods
        function obj = VersionOutput(varargin)
            obj@flywheel.ModelBase(flywheel.model.VersionOutput.propertyMap);

            % Allow empty object creation
            if length(varargin)
                p = inputParser;
                addParameter(p, 'id', []);
                addParameter(p, 'database', []);
                addParameter(p, 'release', []);

                parse(p, varargin{:});

                if ~isempty(p.Results.id)
                    obj.props_('_id') = p.Results.id;
                end
                if ~isempty(p.Results.database)
                    obj.props_('database') = p.Results.database;
                end
                if ~isempty(p.Results.release)
                    obj.props_('release') = p.Results.release;
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
        function result = get.database(obj)
            if ismethod(obj, 'get_database')
                result = obj.get_database();
            else
                if isKey(obj.props_, 'database')
                    result = obj.props_('database');
                else
                    result = [];
                end
            end
        end
        function obj = set.database(obj, value)
            obj.props_('database') = value;
        end
        function result = get.release(obj)
            if ismethod(obj, 'get_release')
                result = obj.get_release();
            else
                if isKey(obj.props_, 'release')
                    result = obj.props_('release');
                else
                    result = [];
                end
            end
        end
        function obj = set.release(obj, value)
            obj.props_('release') = value;
        end
        function result = toJson(obj)
            result = containers.Map;
            if isKey(obj.props_, '_id')
                result('_id') = flywheel.ModelBase.serializeValue(obj.props_('_id'), 'char');
            end
            if isKey(obj.props_, 'database')
                result('database') = flywheel.ModelBase.serializeValue(obj.props_('database'), 'integer');
            end
            if isKey(obj.props_, 'release')
                result('release') = flywheel.ModelBase.serializeValue(obj.props_('release'), 'char');
            end
        end
        function result = struct(obj)
            result = struct;

            if isKey(obj.props_, '_id')
                result.id = obj.props_('_id');
            else
                result.id = [];
            end
            if isKey(obj.props_, 'database')
                result.database = obj.props_('database');
            else
                result.database = [];
            end
            if isKey(obj.props_, 'release')
                result.release = obj.props_('release');
            else
                result.release = [];
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
                if isKey(obj.props_, 'database')
                    propList.database = obj.props_('database');
                else
                    propList.database = [];
                end
                if isKey(obj.props_, 'release')
                    propList.release = obj.props_('release');
                else
                    propList.release = [];
                end
                prpgrp = matlab.mixin.util.PropertyGroup(propList);
            end
        end
    end
    methods(Static)
        function obj = fromJson(json, context)
            obj =  flywheel.model.VersionOutput;
            if isfield(json, 'x0x5Fid')
                obj.props_('_id') = flywheel.ModelBase.deserializeValue(json.x0x5Fid, 'char');
            end
            if isfield(json, 'database')
                obj.props_('database') = flywheel.ModelBase.deserializeValue(json.database, 'integer');
            end
            if isfield(json, 'release')
                obj.props_('release') = flywheel.ModelBase.deserializeValue(json.release, 'char');
            end
            if isprop(obj, 'context_')
                obj.setContext_(context);
            end
        end
        function obj = ensureIsInstance(obj)
            if ~isempty(obj)
                % Realistically, we only convert structs
                if ~isa(obj, 'flywheel.model.VersionOutput')
                    obj = flywheel.model.VersionOutput(obj);
                end
                if isKey(obj.props_, '_id')
                end
                if isKey(obj.props_, 'database')
                end
                if isKey(obj.props_, 'release')
                end
            end
        end
    end
end
