function VALUES = dr_singObtainAnalysisMD(bdir,tool,an,sub,ses,...                                           tool,an,proj,...
                                             pretool_fs,...
                                             pretool_preproc,...
                                             uncleanStr)
% Read all the config files that lead to the data

configFS        = fullfile(char(bdir),'derivatives',...
                           char(pretool_fs{1}),char(pretool_fs{2}),'config.json');
configPreproc   = fullfile(char(bdir),'derivatives',...
                           char(pretool_preproc{1}),char(pretool_preproc{2}),...
                           'config.json');
configPipe      = fullfile(char(bdir),'derivatives',...
                           char(tool),['analysis-' char(an)],...
                           'config.json');
tractparamsPipe = fullfile(char(bdir),'derivatives',...
                           char(tool),['analysis-' char(an)],...
                           'tractparams.csv');

% Check that all files exist
if ~isfile(configPipe);error('%s is missing',configPipe);end
if ~isfile(tractparamsPipe);error('%s is missing',tractparamsPipe);end
if ~isfile(configFS);error('%s is missing',configFS);end
if ~isfile(configPreproc);error('%s is missing',configPreproc);end

VALUES = table();
VALUES.anatrois = struct2table(jsonread(configFS).config);
VALUES.preproc  = struct2table(jsonread(configPreproc).config,'AsArray',true);
VALUES.pipeline = struct2table(jsonread(configPipe).config,'AsArray',true);

tmpParams = readtable(tractparamsPipe);
tmpParams.label = categorical(tmpParams.label);
tmpParams = tmpParams(tmpParams.label==uncleanStr,:);
if height(tmpParams)==1
    VALUES.tractparams = tmpParams;
else
    error('Tractparams returned %i rows for Structure %s',...
                                    height(tmpParams),uncleanStr)
end

