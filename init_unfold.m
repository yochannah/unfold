% Init unfold toolbox
fprintf('\nStarting unfold toolbox.\nAdding subfolders and other toolboxes to path...\n')

projectFolder  = fileparts(which('init_unfold.m'));
scriptDir = fullfile(projectFolder,'src');

if ~exist('eeg_checkset','file')
    try
        eeglab redraw
    catch
        warning('%s(): EEGLAB could not be found in your path. Please add it to your path. Otherwise, you should be fine EXCEPT if you want to use uf_epoch() (for massive univariate modeling without overlap correction) which requires EEGLAB.\n',mfilename)
        addpath(fullfile(projectFolder,'lib','eeglab'))
    end
end

addpath(genpath(scriptDir))
addpath(fullfile(projectFolder,'lib','erplab'))
addpath(fullfile(projectFolder,'lib','gramm'))
addpath(fullfile(projectFolder,'lib','lsmr'))
addpath(fullfile(projectFolder,'lib','luong_bruno'))
addpath(fullfile(projectFolder,'lib','cbrewer'))
addpath(fullfile(projectFolder,'lib','ept_TFCE','TFCE','Dependencies'))
addpath(genpath(fullfile(projectFolder,'lib','eegvis','topo_butter')))

addpath(fullfile(projectFolder,'lib','glmnet_matlab'))

if ~exist('gramm','file')
    warning('%s():\ngramm could not be found. Did you run "git submodule update --init" to initialize submodules?\n',mfilename)
end

fprintf('Done.\n')
