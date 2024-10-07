function VALUES = dr_singObtainValues(bdir,tool,an,sub,ses,measurements)
%DR_FWOBTAINVALUES Summary of this function goes here

% Now obtain the data itself (for example, for afq it coudl be fa
% profiles)
% FC: create a function that gives this value to be included in the
% dt, validates that exists, etc. 

if ~iscell(measurements)
    measurements = {measurements};
end

for nm=1:length(measurements)
    measurement = measurements{nm};
    fileName = ['RTP_' measurement '.csv'];
    fileURL  = fullfile(char(bdir),'derivatives',char(tool),...
                        ['analysis-' char(an)],...
                        ['sub-' char(sub)],['ses-' char(ses)],...
                        'output',fileName);
    VALS{nm} = [];
    if ~isempty(fileURL)
        VALS{nm} = readtable(fileURL);
    else
         disp([fileName ' not found.'])
    end
end



if nm==1
    VALUES = VALS{1};
else
    VALUES = VALS;
end
    


end

