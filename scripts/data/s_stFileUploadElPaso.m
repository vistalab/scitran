%% El Paso uploading experiments


%% Get to the data on My Drive

chdir('/Users/wandell/Google Drive/My Drive/Data/Oral Cancer Screening');
chdir('Velscope');
chdir('ElPaso Study');
chdir('Subject Data');
chdir('Flywheel Subject Data');
chdir('Project')

%% From here it is Project/Subject/Session/Acquisition

subjectDirs = dir('Subject_*');

for ss = 1 % :numel(subjectDirs)
    thisSubject = subjectDirs(ss).name;
    chdir(thisSubject)

    % Write a function ieDirClean to return clean list, without a .
    sessionDirs = dir;
    isDotFile = startsWith({sessionDirs.name},'.');
    sessionDirs = sessionDirs(~isDotFile);
    for sess=1:numel(sessionDirs)
        chdir(sessionDirs(sess).name)
        if ~exist('velscope','dir'), mkdir('velscope'); end
        if ~exist('white','dir'), mkdir('white'); end

        dngFiles = dir('*.dng');
        for ff=1:numel(dngFiles)
            thisFile = dngFiles(ff).name;
            % img = imread(thisFile);
            [img,info] = ieDNGRead('PXL_20230222_175707852.dng','simple info',true,'rgb',true);
            % We should figure out what to do with different
            % orientations.  Then we should put the imrotate into
            % ieDNGRead for the 'rgb' case.
            if info.orientation == 6
                img = imrotate(img,-90);
                imagesc(img); axis image;
            end

            rgb = mean(img,[1 2]);

            % The Velscope files are always very green.  They are
            % bluish, too.
            if rgb(2) > rgb(1)*1.3
                movefile(thisFile,'velscope');
                imwrite(img,'velscope/velscope.png');
            else
                movefile(thisFile,'white');
                imwrite(img,'white.png');
            end
        end
    end
end
