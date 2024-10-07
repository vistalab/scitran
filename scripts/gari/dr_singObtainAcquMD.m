function acquMD = dr_singObtainAcquMD()
%DR_FWOBTAINACQUMD Summary of this function goes here
%   Detailed explanation goes here

% For now, return NaNs, in the future, read the header info

%{
    Now we need to find the files used in this analysis, and the
    acquisition parameters. Usually this could be solved with the gear
    type, but for example in HCP is not the case, as we have splitted
    the original values into b1000-b2000-b3000. This means that from
    the GEAR we have to go back to the acquisitions files and obtain
    the parameters. 
    What are we interested in? All, but make a list here, since the
    HCP data has no dicom headers...
    - scanAcquSiteName: 'StanfordCNI', 'BCBL', 'HCP'...
    - scanVendorName: 'Siemens', 'GE'...
    - scanModel: 'trio', 'prisma',...
    - scanTeslas: '1.5', '3', '4', '7', ...
    - scanSeqName: 'MPRAGE', 'ME-MPRAGE', 'SPGRE', ...
    - scanbValue: '1000', '2000', '2500', ...
    - scanNumDirs: '30', '60', '96', ...
    - ...
    - ... (if there is a default in FS load it)
    FC: make this into an independent function as well
       - If there is only one file, read all the params
       - If there is more than one, select by the type. 
       - Ideal: same set of params always, if there is none add
         manually of by config/function. e.g. if HCP: obtain from here
%}

% BUG: if I have the id of the input file, I should get its
% parameters right?
% Workaround: find the file parameters using the filename
% FC: make this into a function that will give parameters with use
%     cases and all (so, there will be HCP use case, for example)
% function [acquMD_dt_row] = acquMD_get(thisAnalysis)


        
        % The function should return a datatable:
        acquMD = table();
        if isempty(acquMD)
            % warning('No acquMD found, added NaN acquMD and added the session to the tmpCollection, so that the info can be updated.')
            tmp    = load(fullfile(stRootPath,'scripts','gari','DATA','defaults','acquMD999.mat'));
            % Delete the vars with problems
            tmp.acquMD999 = rmfield(tmp.acquMD999, 'ImageOrientationPatientDICOM');
            tmp.acquMD999 = rmfield(tmp.acquMD999, 'ImageType');
            acquMD = struct2table(tmp.acquMD999, 'AsArray', true);
            
        end

        
        % Here we could include other checks, for example making
        % sure that 0 is 0 and not 0<100, or that 2000 is not
        % 990>1100, but in our case we needed to do that in the
        % previous step before inputing to afq-pipeline. dtiInit is
        % going to fail if there is not a single bValue. We are
        % going to leave it with minimum checks at the moment. 
        %{
        bvalzeros   = bval(bval==0);
        bvalnozeros = bval(bval > 100);
        bvalnozeros  = 100 * round(bvalnozeros/100);
        scanDirs    = length(bvalnozeros);
        scanbValue  = unique(bvalnozeros);
        assert(isequal(length(bval), length(bvalnozeros)+length(bvalzeros)), ...
            'bval file: not possible to separate zero and non zero values.')
        if length(scanbValue) > 1
%            error('There are more than 1 bValues in the .bval file.')
        elseif length(scanbValue) == 0
            error('There are no b values in the .bval file.')
        end

        % Add it to the datatable row
        acquMD.scanDirs   = scanDirs;
        acquMD.scanbValue = scanbValue;
        %}
        acquMD.scanDirs   = 99;
        acquMD.scanbValue = 9999;







end

