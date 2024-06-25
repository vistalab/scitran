%% El Paso uploading experiments
%
%  The upload is a few lines at the top.
%
%  At the bottom we have the code that figures out where the files
%  are, arranges them and creates PNGs with the right orientation
%

%% 


%% We placed the data
%
% We created the more complete directory tree.
% We converted the DNG to PNG so we could visualize in Flywheel
% (Maybe we should implement a Gear that converts DNG to JPG or PNG)
%

%% Get to the data on My Drive

chdir('/Users/wandell/Google Drive/My Drive/Data/Oral Cancer Screening');
chdir('Velscope');
chdir('ElPaso Study');
chdir('Subject Data');
chdir('Flywheel Subject Data');
chdir('Project')

%% From here it is Project/Subject/Session/Acquisition

curDir = pwd;

subjectDirs = dir('Subject_*');
for ss = 1:numel(subjectDirs)
    thisSubject = subjectDirs(ss).name;
    chdir(thisSubject)

    % Write a function ieDirClean to return clean list, without a .
    sessionDirs = dir;
    isDotFile   = startsWith({sessionDirs.name},'.');
    sessionDirs = sessionDirs(~isDotFile);

    for sess=1:numel(sessionDirs)
        chdir(sessionDirs(sess).name)
        if ~exist('velscope','dir'), mkdir('velscope'); end
        if ~exist('white','dir'), mkdir('white'); end

        dngFiles = dir('*.dng');
        for ff=1:numel(dngFiles)
            thisFile = dngFiles(ff).name;
            % img = imread(thisFile);
            [img,info] = ieDNGRead(thisFile,'simple info',true,'rgb',true);

            %{
            thisFile = 'PXL_20240124_215627195.dng';
            [img,info] = ieDNGRead(thisFile,'simple info',true,'rgb',true);
            imagesc(img); axis image;
            %}

            % We should figure out what to do with different
            % orientations.  Then we should put the imrotate into
            % ieDNGRead for the 'rgb' case.
            if info.orientation == 6
                img = imrotate(img,90);
                img = fliplr(img);
            elseif info.orientation == 3
                % Do nothing?  Again?
            elseif info.orientation == 1
                % Do nothing
            end

            rgb = mean(img,[1 2]);

            % The Velscope files are always very green.  They are
            % bluish, too.
            if rgb(2) > rgb(1)*1.3
                movefile(thisFile,'velscope');
                imwrite(img,'velscope/velscope.png');
            else
                movefile(thisFile,'white');
                imwrite(img,'white/white.png');
            end
        end
    end
    chdir(curDir);
end

%%

chdir('/Users/wandell/Google Drive/My Drive/Data/Oral Cancer Screening');
chdir('Velscope');
chdir('ElPaso Study');
chdir('Subject Data');
chdir('Flywheel Subject Data');
chdir('Project copy')

%%  Determine the orientations.  Then we will see what to do.
clear orientationData;

subjectDirs = dir('Subject_*');
cnt = 1;

curDir = pwd;
for ss = 1:numel(subjectDirs)
    thisSubject = subjectDirs(ss).name;
    chdir(thisSubject)

    % Write a function ieDirClean to return clean list, without a .
    sessionDirs = dir;
    isDotFile   = startsWith({sessionDirs.name},'.');
    sessionDirs = sessionDirs(~isDotFile);

    for sess=1:numel(sessionDirs)
        thisSession = sessionDirs(sess).name;
        chdir(thisSession)
        % if ~exist('velscope','dir'), mkdir('velscope'); end
        % if ~exist('white','dir'), mkdir('white'); end

        dngFiles = dir('*.dng');
        for ff=1:numel(dngFiles)
            thisFile = dngFiles(ff).name;
            % img = imread(thisFile);
            [img,info] = ieDNGRead(thisFile,'simple info',true,'rgb',true);
            % We should figure out what to do with different
            % orientations.  Then we should put the imrotate into
            % ieDNGRead for the 'rgb' case.
            orientationData(cnt).subject = thisSubject;
            orientationData(cnt).session = thisSession;
            orientationData(cnt).file = thisFile; %#ok<*SAGROW>
            orientationData(cnt).orientation = info.orientation;
            cnt = cnt + 1;
        end
    end
    chdir(curDir);
end