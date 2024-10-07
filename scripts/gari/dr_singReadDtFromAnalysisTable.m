function dt = dr_singReadDtFromAnalysisTable(bdir,subSesList, measurements,...
                                             tool,an,proj,...
                                             pretool_fs,...
                                             pretool_preproc)

% Example inputs to make it work
%{
  % BERTSOLARI
  bdir            = "/export/home/glerma/public/Gari/BERTSOLARI/Nifti";
  subSesList      = fullfile(getenv('pM'),'subSesList_BERTSOLARI.txt');
  proj            = "BERTSO";  

  % KSHIPRA
  bdir            = "/export/home/glerma/public/KSHIPRA/dwibygari/Nifti";
  subSesList      = fullfile(bdir,'subSesList.txt');
  proj            = "KSHIPRA";  

  measurements    = {'fa','ad','cl','curvature','md','rd','torsion','volume'};
  tool            = "rtp-pipeline_4.3.7";
  an              = "01";
  pretool_fs      = {'fs_7.1.1-03d','analysis-01'};
  pretool_preproc = {'rtppreproc_1.1.3','analysis-01'};

% READ AND SAVE IT LOCALLY
dt = dr_singReadDtFromAnalysisTable(bdir,subSesList, measurements,...
                                             tool,an,proj,...
                                             pretool_fs,...
                                             pretool_preproc);
% if ~isfolder(fullfile(stRootPath,'local','tmp'));mkdir(fullfile(stRootPath,'local','tmp'));end
% fname = fullfile(stRootPath,'local','tmp', ...
%                  sprintf('AllV01_AllMeas_%s.mat',proj));
fname = fullfile('/export/home/glerma/public/KSHIPRA/dwibygari', ...
                 sprintf('AllV01_AllMeas_%s.mat',proj));
save(fname, 'dt')
% Convert to CSV (simplify first)
dts=dt(:,{'SubjID','TRT','Struct','fa','ad','cl','curvature','md','rd','torsion','volume'});
dts.SubjID=categorical(dts.SubjID);
writetable(dts,fullfile('/export/home/glerma/public/KSHIPRA/dwibygari','diffusionResults.csv'))



% VISUALIZE RESULTS
close all
subplot(2,1,1)
% plot(dt{dt.Struct=='LeftIFOF' & dt.TRT=='T01','fa'}','r'); hold on;
% plot(dt{dt.Struct=='RightIFOF' & dt.TRT=='T01','fa'}','b')
plot(dt{dt.Struct=='LeftArcuate','fa'}'); hold on;
plot(dt{dt.Struct=='RightArcuate','fa'}')
title('LeftRightArcuate'); xlabel('Profile divisions'); ylabel('FA')

% leg1 = strcat(string(dt.Struct(dt.Struct=='LeftArcuate')), "-", ...
%               dt.SubjID(dt.Struct=='LeftArcuate'), "-", ...
%                string(dt.TRT(dt.Struct=='LeftArcuate')), "-", ...
%               string(dt.AcquMD.scanbValue(dt.Struct=='LeftArcuate')));
% leg2 = strcat(string(dt.Struct(dt.Struct=='RightArcuate')), "-", ...
%               dt.SubjID(dt.Struct=='RightArcuate'), "-", ...
%               string(dt.TRT(dt.Struct=='RightArcuate')), "-", ...
%               string(dt.AcquMD.scanbValue(dt.Struct=='RightArcuate')));
% legend([leg1;leg2])
subplot(2,1,2)
plot(dt{dt.Struct=='LeftArcuate' & dt.TRT=='TEST','fa'}'); hold on;
plot(dt{dt.Struct=='RightArcuate' & dt.TRT=='TEST','fa'}')
title('LeftRightArcuate'); xlabel('Profile divisions'); ylabel('FA')

leg1 = strcat(string(dt.Struct(dt.Struct=='LeftArcuate')), "-", ...
              dt.SubjID(dt.Struct=='LeftArcuate'), "-", ...
              string(dt.TRT(dt.Struct=='LeftArcuate')), "-", ...
              string(dt.AcquMD.scanbValue(dt.Struct=='LeftArcuate')));
leg2 = strcat(string(dt.Struct(dt.Struct=='RightArcuate')), "-", ...
              dt.SubjID(dt.Struct=='RightArcuate'), "-", ...
              string(dt.TRT(dt.Struct=='RightArcuate')), "-", ...
              string(dt.AcquMD.scanbValue(dt.Struct=='RightArcuate')));
legend([leg1;leg2])
%}



%% Check the files are there
t      = readtable(subSesList);
t.sub  = categorical(t.sub);
t.ses  = categorical(t.ses);
t.RUN  = strcmp(t.RUN,'True');
t.anat = strcmp(t.anat,'True');
t.dwi  = strcmp(t.dwi,'True');
t.func = strcmp(t.func,'True');

% Add only the analyses we want
t = t(t.RUN,:);


%% Create the table that we will later populate. 
% This version will be different from the one we already had. 
% This version will include the gearName, gearVersion and measurement columns
% Then we will use other functions to expand afq-pipeline values from the ones
% in freesurfer or others. 

% if measurements is cell, then add them in parallel
if iscell(measurements)
    TableElements = {'SubjID','TRT','Proj','SubjectMD','AcquMD','AnalysisMD', 'Struct'};
    TableElements = [TableElements, measurements];
else
    TableElements = {'SubjID','TRT','Proj','SubjectMD','AcquMD','AnalysisMD', 'measurement', 'Struct', 'Val'};
end
dt            = array2table(NaN(0,length(TableElements)));
dt.Properties.VariableNames = TableElements;

% The profiles sometimes throw some NaN, sometimes in the borders. 
% If it is less than maxNaNsToClean, substitute, otherwise make everything NaN
% and UseIt=false
doNanSubstitution = 1;
maxNaNsToClean    = 5;
interpMethod      = 'spline'; % For NaN substitution using the repnan.m method, default is 'linear'


% What is each columns on the datatable?
%{
'SubjID'     : string with the name of the subject. It is usually unique by project,
               but not in the entire collection
'TRT'        : 'TRAIN': only this session for this subject, 'TEST': this is first
                session but the subject has more, 'RETEST': first repeated
                session, 'RETEST2': other sessions, consequtively
'Proj'       : string with the name of the project
'SubjectMD'  : a datatable with all the subject information on FW.
'AcquMD'     : a datatable with all the acquisition information on FW, columns 
               will vary between T1w and DWI, for example
'AnalysisMD' : a datatable with all the analysis information on FW, columns 
               will vary between gears. 
               Unique analysis = gearName+gearVersion+configParams
'measurement': string with the name of the measurement, for example 'fa', 'md',
               'volume', 'ct', 'T1relaxationTime', ...
'Struct'     : Name of the structure in the case of afq, name of segmentation 
               in the case of FS: 'LeftArcuate', 'aseg', ... 
'Val'        : a value is the combination of subject + acqu + analysis
               a datatable with the actual values.csv downloaded from FW. This
               will be usuarlly a vector. In the case of afq, asociated to a
               structure, in the case of FS, can be the aseg values vector...
'UseIt'      : true/false variable. If all elements of the Val vector are NaN,
               it will be false. It can be useful to include or discard subjects
               with other criteria as well. 
%}


%% Find all the analyses created with the GEAR(and version) and display them for verification
%  This was originally a crawler in dr_readCollection. Now it will fetch the
%  exact analysis and result we want. 
%  Should be MUCH faster

% Dec 2020
% GLU: FW has updated the api, try to make it even faster

tic
for ns=1:height(t)
    
    sub = t{ns,'sub'};
    ses = t{ns,'ses'};
    % Obtain AcquMD
    acquMD = dr_singObtainAcquMD();
    % Obtain all the profile values for all measures
    VALUES = dr_singObtainValues(bdir,tool,an,sub,ses,measurements);
    
    % Now that we have everything, we can start appending it to our big
    % table that will be the output of this query. 
    % FC: make this into an independent function as well
    if iscell(VALUES)
        Structures = VALUES{1}.Properties.VariableNames;
    else
        Structures = VALUES.Properties.VariableNames;
    end
    for fg=1:length(Structures)
        uncleanStr = Structures{fg};
        Structure  = string(regexprep(uncleanStr,'{|}| |_',''));
        % This version is afq centered, so when the data is extracted, the
        % profiles are extracted as a column. When the function is created,
        % I think this should be given as an option. For example, we
        % wouldn't want this for Freesurfer. I am going to leave this
        % working, and then refactor it to allow FS in a more natural way.
        % Right now, we use the datatable in this form to filter structures
        % but usually then we create a flat datatable. Continue thinking
        % about the best way to analyze this. 
        
        
        % To save time, calculate first tract for this subject, then copy
        % all for the rest of calculations
        if fg == 1
            T            = array2table(NaN(1,length(TableElements)));
            T.Properties.VariableNames = TableElements;
            T.SubjID     = string(sub);
            T.Proj       = categorical(string(proj));
            T.TRT        = categorical(string(ses));
            subjMDcols   = {'AGE','GENDER'};
            tmpSubjMD    = array2table(NaN(1,length(subjMDcols)));
            tmpSubjMD.Properties.VariableNames = subjMDcols;
            T.SubjectMD  = tmpSubjMD;
            % T.SubjectMD.info      = struct2table(T.SubjectMD.info, 'AsArray', true);
            % Temporary hack so that all have the same info, I need to use the old
            % method to create the expanded info table:
            
            % We will read info table from an excel file with the metadata
            %{
                infoFields = st.fw.getSession(idGet(thisSession)).subject.info.struct;
                infofnames = fieldnames(infoFields);
                for nf=1:length(subjMDcols)
                    if isempty(infoFields.(infofnames{nf}))
                        infoFields.(infofnames{nf}) = NaN;
                    end
                 if ischar(infoFields.(infofnames{nf}))
                        infoFields.(infofnames{nf}) = string(infoFields.(infofnames{nf}));
                    end
                end

                T.SubjectMD.info      = struct2table(infoFields);
                % T.SubjectMD.info      = [];
            %}
            
            T.AcquMD     = acquMD;
            T.Struct     = categorical(string(Structure));
            T.AnalysisMD = dr_singObtainAnalysisMD(bdir,tool,an,sub,ses,...                                           tool,an,proj,...
                                                   pretool_fs,...
                                                   pretool_preproc,...
                                                   uncleanStr);
            

            % And now, assign the value vectors
            % But, if there are more than 5 NaN-s, convert all to NaN, otherwise
            % fix it
            infoFields = struct();
            infoFields.this = 'this';
            infoFields.that = 'that';
            T.SubjectMD.info      = struct2table(infoFields);
            % TODO : make it a function
            if iscell(measurements)
                for nm = 1:length(measurements)
                    meas     = measurements{nm};
                    TMPVAL   = VALUES{nm};
                    T.(meas) = TMPVAL{:,Structures{fg}}';
                    if doNanSubstitution
                        if sum(isnan(T.(meas)),2) > 0 & sum(isnan(T.(meas)),2) <= maxNaNsToClean
                            % For PCA we need to remove the NaN-s, I use this utility called repnan, which
                            % has several options for NaN substitution. 
                            % There are other options to do PCA without NaN substitution (TODO) 
                            % disp(['WH:' shells{kk} ' ' Structure{fg} ' ' subNamesTRAIN{ii} ': There are ' num2str(NaNSubjects{ii,fg}) ' NaN-s that will be substituted with repnan ' interpMethod ' method'])
                            T.(meas) = repnan(T.(meas)', interpMethod)';  % default in repnan is 'linear'
                        end
                        if sum(isnan(T.(meas)),2) > maxNaNsToClean
                            T.(meas) = NaN(size(T.(meas)));
                        end
                    end
                end
            else
                T.measurement = string(measurements);
                T.Val   = VALUES{:,Structures{fg}}';
                if doNanSubstitution
                    if sum(isnan(T.Val),2) > 0 & sum(isnan(T.Val),2) <= maxNaNsToClean
                        % For PCA we need to remove the NaN-s, I use this utility called repnan, which
                        % has several options for NaN substitution. 
                        % There are other options to do PCA without NaN substitution (TODO) 
                        % disp(['WH:' shells{kk} ' ' Structure{fg} ' ' subNamesTRAIN{ii} ': There are ' num2str(NaNSubjects{ii,fg}) ' NaN-s that will be substituted with repnan ' interpMethod ' method'])
                        T.Val = repnan(T.Val', interpMethod)';  % default in repnan is 'linear'
                    end
                    if sum(isnan(T.Val),2) > maxNaNsToClean
                        T.Val = NaN(size(T.Val));
                    end
                end
            end
            % Add all the structs for this analysis for this session
            if height(dt) == 0
                dt = T;
            else
                % dt = dr_mergeTables({dt, T},{'SubjectMD';'AcquMD';'AnalysisMD'});
                dt = [dt; T];
            end    
        else
            % T is the same for all fiber groups
            T.Struct     = categorical(string(Structure));
            if iscell(measurements)
                for nm = 1:length(measurements)
                    meas     = measurements{nm};
                    TMPVAL   = VALUES{nm};
                    T.(meas) = TMPVAL{:,Structures{fg}}';
                    if doNanSubstitution
                        if sum(isnan(T.(meas)),2) > 0 & sum(isnan(T.(meas)),2) <= maxNaNsToClean
                            % For PCA we need to remove the NaN-s, I use this utility called repnan, which
                            % has several options for NaN substitution. 
                            % There are other options to do PCA without NaN substitution (TODO) 
                            % disp(['WH:' shells{kk} ' ' Structure{fg} ' ' subNamesTRAIN{ii} ': There are ' num2str(NaNSubjects{ii,fg}) ' NaN-s that will be substituted with repnan ' interpMethod ' method'])
                            T.(meas) = repnan(T.(meas)', interpMethod)';  % default in repnan is 'linear'
                        end
                        if sum(isnan(T.(meas)),2) > maxNaNsToClean
                            T.(meas) = NaN(size(T.(meas)));
                        end
                    end
                end
            else
                T.Val   = VALUES{:,Structures{fg}}';
                if doNanSubstitution
                    if sum(isnan(T.Val),2) > 0 & sum(isnan(T.Val),2) <= maxNaNsToClean
                        % For PCA we need to remove the NaN-s, I use this utility called repnan, which
                        % has several options for NaN substitution. 
                        % There are other options to do PCA without NaN substitution (TODO) 
                        % disp(['WH:' shells{kk} ' ' Structure{fg} ' ' subNamesTRAIN{ii} ': There are ' num2str(NaNSubjects{ii,fg}) ' NaN-s that will be substituted with repnan ' interpMethod ' method'])
                        T.Val = repnan(T.Val', interpMethod)';  % default in repnan is 'linear'
                    end
                    if sum(isnan(T.Val),2) > maxNaNsToClean
                        T.Val = NaN(size(T.Val));
                    end
                end
            end
            % Add all the structs for this analysis for this session
            if height(dt) == 0
                dt = T;
            else
                % dt = dr_mergeTables({dt, T},{'SubjectMD';'AcquMD';'AnalysisMD'});
                dt = [dt; T];
            end 
        end
   
    end   
    
end
toc




            
        


%% Fix problems that we might have observed when reading this dt
% dr_fwFileInfoWrite('stanfordlabs', 'tmpCollection')

