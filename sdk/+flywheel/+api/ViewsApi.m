% ViewsApi - Data view operations
%
% ViewsApi Properties:
%    apiClient - ApiClient instance
%
% ViewsApi Methods
%    addView                 - Add a new data view
%    deleteView              - Delete a data view
%    evaluateView            - Execute a view, returning data in the preferred format.
%    evaluateViewAdhoc       - Execute an ad-hoc view, returning data in the preferred format.
%    getView                 - Return the view identified by ViewId
%    getViewColumns          - Return a list of all known column aliases for use in data views
%    getViews                - Return a list of all views belonging to container
%    modifyView              - Update the view identified by ViewId
%    saveViewDataToContainer - Execute a view, saving data to the target container / file
classdef ViewsApi < handle
    % NOTE: This file is auto generated by the swagger code generator program.
    % Do not edit the file manually.
    properties
        apiClient
        context_
    end
    methods
        function obj = ViewsApi(apiClient, context)
            obj.apiClient = apiClient;
            obj.context_ = context;
        end

        function [returnData, resp] = addView(obj, containerId, body, varargin)
            % Add a new data view
            % containerId (char):The ID of the container, one of user, group or project. Use \"site\" as containerId to save or get a site data view.
            % body (DataView)
            % returns: [CollectionNewOutput, resp]

            x__inp = inputParser;
            x__inp.StructExpand = false;
            addRequired(x__inp, 'containerId');
            addRequired(x__inp, 'body');
            addParameter(x__inp, 'DumpResponseData', false);
            parse(x__inp, containerId, body, varargin{:});

            % Path parameters
            pathParams = {};
            if ~isempty(x__inp.Results.containerId)
                pathParams = [pathParams, 'ContainerId', x__inp.Results.containerId];
            end

            % Query parameters
            queryParams = {};

            % Header parameters
            headers = {};

            % Form parameters
            formParams = {};
            files = {};

            % Body (as JSON)
            body = flywheel.model.DataView.ensureIsInstance(x__inp.Results.body);
            body = flywheel.ApiClient.encodeJson(body.toJson());

            resp = obj.apiClient.callApi('POST', '/containers/{ContainerId}/views', ...
                pathParams, queryParams, headers, body, formParams, files);

            status = resp.getStatusCode();

            switch num2str(status)
                case '200'
                    if x__inp.Results.DumpResponseData
                        x__respData = resp.getBodyAsString();
                        disp(x__respData);
                    end
                    json = flywheel.ApiClient.getResponseJson(resp);
                    returnData = flywheel.model.CollectionNewOutput.fromJson(json, obj.context_);
                    if ~isempty(returnData)
                        returnData = returnData.returnValue();
                    end
                otherwise
                    returnData = [];
            end
        end

        function [returnData, resp] = deleteView(obj, viewId, varargin)
            % Delete a data view
            % viewId (char):The ID of the view
            % returns: [InlineResponse2002, resp]

            x__inp = inputParser;
            x__inp.StructExpand = false;
            addRequired(x__inp, 'viewId');
            addParameter(x__inp, 'DumpResponseData', false);
            parse(x__inp, viewId, varargin{:});

            % Path parameters
            pathParams = {};
            if ~isempty(x__inp.Results.viewId)
                pathParams = [pathParams, 'ViewId', x__inp.Results.viewId];
            end

            % Query parameters
            queryParams = {};

            % Header parameters
            headers = {};

            % Form parameters
            formParams = {};
            files = {};

            % Body (as JSON)
            body = {};

            resp = obj.apiClient.callApi('DELETE', '/views/{ViewId}', ...
                pathParams, queryParams, headers, body, formParams, files);

            status = resp.getStatusCode();

            switch num2str(status)
                case '200'
                    if x__inp.Results.DumpResponseData
                        x__respData = resp.getBodyAsString();
                        disp(x__respData);
                    end
                    json = flywheel.ApiClient.getResponseJson(resp);
                    returnData = flywheel.model.InlineResponse2002.fromJson(json, obj.context_);
                    if ~isempty(returnData)
                        returnData = returnData.returnValue();
                    end
                otherwise
                    returnData = [];
            end
        end

        function [returnData, resp] = evaluateView(obj, viewId, containerId, varargin)
            % Execute a view, returning data in the preferred format.
            % viewId (char):The ID of the view
            % containerId (char):The target container for view execution
            % format (char)
            % filter (char):An optional filter expression
            % skip (integer):The optional number of rows to skip
            % limit (integer):The optional max number of rows to return
            % returns: [none, resp]

            x__inp = inputParser;
            x__inp.StructExpand = false;
            addRequired(x__inp, 'viewId');
            addRequired(x__inp, 'containerId');
            addParameter(x__inp, 'format', []);
            addParameter(x__inp, 'filter', []);
            addParameter(x__inp, 'skip', []);
            addParameter(x__inp, 'limit', []);
            addParameter(x__inp, 'DumpResponseData', false);
            parse(x__inp, viewId, containerId, varargin{:});

            % Path parameters
            pathParams = {};
            if ~isempty(x__inp.Results.viewId)
                pathParams = [pathParams, 'ViewId', x__inp.Results.viewId];
            end

            % Query parameters
            queryParams = {};
            if ~isempty(x__inp.Results.containerId)
                queryParams = [queryParams, 'containerId', flywheel.ApiClient.castParam(x__inp.Results.containerId, 'char')];
            end
            if ~isempty(x__inp.Results.format)
                queryParams = [queryParams, 'format', flywheel.ApiClient.castParam(x__inp.Results.format, 'char')];
            end
            if ~isempty(x__inp.Results.filter)
                queryParams = [queryParams, 'filter', flywheel.ApiClient.castParam(x__inp.Results.filter, 'char')];
            end
            if ~isempty(x__inp.Results.skip)
                queryParams = [queryParams, 'skip', flywheel.ApiClient.castParam(x__inp.Results.skip, 'integer')];
            end
            if ~isempty(x__inp.Results.limit)
                queryParams = [queryParams, 'limit', flywheel.ApiClient.castParam(x__inp.Results.limit, 'integer')];
            end

            % Header parameters
            headers = {};

            % Form parameters
            formParams = {};
            files = {};

            % Body (as JSON)
            body = {};

            resp = obj.apiClient.callApi('GET', '/views/{ViewId}/data', ...
                pathParams, queryParams, headers, body, formParams, files);

            status = resp.getStatusCode();

            switch num2str(status)
                otherwise
                    returnData = [];
            end
        end

        function [returnData, resp] = evaluateViewAdhoc(obj, containerId, body, varargin)
            % Execute an ad-hoc view, returning data in the preferred format.
            % containerId (char):The target container for view execution
            % body (DataView)
            % format (char)
            % filter (char):An optional filter expression
            % skip (integer):The optional number of rows to skip
            % limit (integer):The optional max number of rows to return
            % returns: [none, resp]

            x__inp = inputParser;
            x__inp.StructExpand = false;
            addRequired(x__inp, 'containerId');
            addRequired(x__inp, 'body');
            addParameter(x__inp, 'format', []);
            addParameter(x__inp, 'filter', []);
            addParameter(x__inp, 'skip', []);
            addParameter(x__inp, 'limit', []);
            addParameter(x__inp, 'DumpResponseData', false);
            parse(x__inp, containerId, body, varargin{:});

            % Path parameters
            pathParams = {};

            % Query parameters
            queryParams = {};
            if ~isempty(x__inp.Results.containerId)
                queryParams = [queryParams, 'containerId', flywheel.ApiClient.castParam(x__inp.Results.containerId, 'char')];
            end
            if ~isempty(x__inp.Results.format)
                queryParams = [queryParams, 'format', flywheel.ApiClient.castParam(x__inp.Results.format, 'char')];
            end
            if ~isempty(x__inp.Results.filter)
                queryParams = [queryParams, 'filter', flywheel.ApiClient.castParam(x__inp.Results.filter, 'char')];
            end
            if ~isempty(x__inp.Results.skip)
                queryParams = [queryParams, 'skip', flywheel.ApiClient.castParam(x__inp.Results.skip, 'integer')];
            end
            if ~isempty(x__inp.Results.limit)
                queryParams = [queryParams, 'limit', flywheel.ApiClient.castParam(x__inp.Results.limit, 'integer')];
            end

            % Header parameters
            headers = {};

            % Form parameters
            formParams = {};
            files = {};

            % Body (as JSON)
            body = flywheel.model.DataView.ensureIsInstance(x__inp.Results.body);
            body = flywheel.ApiClient.encodeJson(body.toJson());

            resp = obj.apiClient.callApi('POST', '/views/data', ...
                pathParams, queryParams, headers, body, formParams, files);

            status = resp.getStatusCode();

            switch num2str(status)
                otherwise
                    returnData = [];
            end
        end

        function [returnData, resp] = getView(obj, viewId, varargin)
            % Return the view identified by ViewId
            % viewId (char):The ID of the view
            % returns: [DataView, resp]

            x__inp = inputParser;
            x__inp.StructExpand = false;
            addRequired(x__inp, 'viewId');
            addParameter(x__inp, 'DumpResponseData', false);
            parse(x__inp, viewId, varargin{:});

            % Path parameters
            pathParams = {};
            if ~isempty(x__inp.Results.viewId)
                pathParams = [pathParams, 'ViewId', x__inp.Results.viewId];
            end

            % Query parameters
            queryParams = {};

            % Header parameters
            headers = {};

            % Form parameters
            formParams = {};
            files = {};

            % Body (as JSON)
            body = {};

            resp = obj.apiClient.callApi('GET', '/views/{ViewId}', ...
                pathParams, queryParams, headers, body, formParams, files);

            status = resp.getStatusCode();

            switch num2str(status)
                case '200'
                    if x__inp.Results.DumpResponseData
                        x__respData = resp.getBodyAsString();
                        disp(x__respData);
                    end
                    json = flywheel.ApiClient.getResponseJson(resp);
                    returnData = flywheel.model.DataView.fromJson(json, obj.context_);
                    if ~isempty(returnData)
                        returnData = returnData.returnValue();
                    end
                otherwise
                    returnData = [];
            end
        end

        function [returnData, resp] = getViewColumns(obj, varargin)
            % Return a list of all known column aliases for use in data views
            % returns: [vector[DataViewColumnAlias], resp]

            x__inp = inputParser;
            x__inp.StructExpand = false;
            addParameter(x__inp, 'DumpResponseData', false);
            parse(x__inp, varargin{:});

            % Path parameters
            pathParams = {};

            % Query parameters
            queryParams = {};

            % Header parameters
            headers = {};

            % Form parameters
            formParams = {};
            files = {};

            % Body (as JSON)
            body = {};

            resp = obj.apiClient.callApi('GET', '/views/columns', ...
                pathParams, queryParams, headers, body, formParams, files);

            status = resp.getStatusCode();

            switch num2str(status)
                case '200'
                    if x__inp.Results.DumpResponseData
                        x__respData = resp.getBodyAsString();
                        disp(x__respData);
                    end
                    json = flywheel.ApiClient.getResponseJson(resp);
                    returnData = flywheel.ModelBase.cellmap(@(x) flywheel.model.DataViewColumnAlias.fromJson(x, obj.context_), json);
                otherwise
                    returnData = [];
            end
        end

        function [returnData, resp] = getViews(obj, containerId, varargin)
            % Return a list of all views belonging to container
            % containerId (char):The ID of the container, one of user, group or project. Use \"site\" as containerId to save or get a site data view.
            % returns: [vector[DataView], resp]

            x__inp = inputParser;
            x__inp.StructExpand = false;
            addRequired(x__inp, 'containerId');
            addParameter(x__inp, 'DumpResponseData', false);
            parse(x__inp, containerId, varargin{:});

            % Path parameters
            pathParams = {};
            if ~isempty(x__inp.Results.containerId)
                pathParams = [pathParams, 'ContainerId', x__inp.Results.containerId];
            end

            % Query parameters
            queryParams = {};

            % Header parameters
            headers = {};

            % Form parameters
            formParams = {};
            files = {};

            % Body (as JSON)
            body = {};

            resp = obj.apiClient.callApi('GET', '/containers/{ContainerId}/views', ...
                pathParams, queryParams, headers, body, formParams, files);

            status = resp.getStatusCode();

            switch num2str(status)
                case '200'
                    if x__inp.Results.DumpResponseData
                        x__respData = resp.getBodyAsString();
                        disp(x__respData);
                    end
                    json = flywheel.ApiClient.getResponseJson(resp);
                    returnData = flywheel.ModelBase.cellmap(@(x) flywheel.model.DataView.fromJson(x, obj.context_), json);
                otherwise
                    returnData = [];
            end
        end

        function [returnData, resp] = modifyView(obj, viewId, body, varargin)
            % Update the view identified by ViewId
            % viewId (char):The ID of the view
            % body (DataView)
            % returns: [InlineResponse200, resp]

            x__inp = inputParser;
            x__inp.StructExpand = false;
            addRequired(x__inp, 'viewId');
            addRequired(x__inp, 'body');
            addParameter(x__inp, 'DumpResponseData', false);
            parse(x__inp, viewId, body, varargin{:});

            % Path parameters
            pathParams = {};
            if ~isempty(x__inp.Results.viewId)
                pathParams = [pathParams, 'ViewId', x__inp.Results.viewId];
            end

            % Query parameters
            queryParams = {};

            % Header parameters
            headers = {};

            % Form parameters
            formParams = {};
            files = {};

            % Body (as JSON)
            body = flywheel.model.DataView.ensureIsInstance(x__inp.Results.body);
            body = flywheel.ApiClient.encodeJson(body.toJson());

            resp = obj.apiClient.callApi('PUT', '/views/{ViewId}', ...
                pathParams, queryParams, headers, body, formParams, files);

            status = resp.getStatusCode();

            switch num2str(status)
                case '200'
                    if x__inp.Results.DumpResponseData
                        x__respData = resp.getBodyAsString();
                        disp(x__respData);
                    end
                    json = flywheel.ApiClient.getResponseJson(resp);
                    returnData = flywheel.model.InlineResponse200.fromJson(json, obj.context_);
                    if ~isempty(returnData)
                        returnData = returnData.returnValue();
                    end
                otherwise
                    returnData = [];
            end
        end

        function [returnData, resp] = saveViewDataToContainer(obj, containerId, body, varargin)
            % Execute a view, saving data to the target container / file
            % containerId (char):The target container for view execution
            % body (DataViewSaveDataViewInput)
            % format (char)
            % filter (char):An optional filter expression
            % skip (integer):The optional number of rows to skip
            % limit (integer):The optional max number of rows to return
            % returns: [none, resp]

            x__inp = inputParser;
            x__inp.StructExpand = false;
            addRequired(x__inp, 'containerId');
            addRequired(x__inp, 'body');
            addParameter(x__inp, 'format', []);
            addParameter(x__inp, 'filter', []);
            addParameter(x__inp, 'skip', []);
            addParameter(x__inp, 'limit', []);
            addParameter(x__inp, 'DumpResponseData', false);
            parse(x__inp, containerId, body, varargin{:});

            % Path parameters
            pathParams = {};

            % Query parameters
            queryParams = {};
            if ~isempty(x__inp.Results.containerId)
                queryParams = [queryParams, 'containerId', flywheel.ApiClient.castParam(x__inp.Results.containerId, 'char')];
            end
            if ~isempty(x__inp.Results.format)
                queryParams = [queryParams, 'format', flywheel.ApiClient.castParam(x__inp.Results.format, 'char')];
            end
            if ~isempty(x__inp.Results.filter)
                queryParams = [queryParams, 'filter', flywheel.ApiClient.castParam(x__inp.Results.filter, 'char')];
            end
            if ~isempty(x__inp.Results.skip)
                queryParams = [queryParams, 'skip', flywheel.ApiClient.castParam(x__inp.Results.skip, 'integer')];
            end
            if ~isempty(x__inp.Results.limit)
                queryParams = [queryParams, 'limit', flywheel.ApiClient.castParam(x__inp.Results.limit, 'integer')];
            end

            % Header parameters
            headers = {};

            % Form parameters
            formParams = {};
            files = {};

            % Body (as JSON)
            body = flywheel.model.DataViewSaveDataViewInput.ensureIsInstance(x__inp.Results.body);
            body = flywheel.ApiClient.encodeJson(body.toJson());

            resp = obj.apiClient.callApi('POST', '/views/save', ...
                pathParams, queryParams, headers, body, formParams, files);

            status = resp.getStatusCode();

            switch num2str(status)
                otherwise
                    returnData = [];
            end
        end

    end
end
