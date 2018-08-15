%no longer using Instruction sent
% modified from X:\Workspace\source\mine\MATLAB\Temp\ESC_Post_Process\ESC_Post_Process_main_v4.m
% Reads in log provided by ESC Test Harness (python)

% previous version:
% X:\Workspace\source\mine\MATLAB\Temp\ESC_Post_Process\ESC_Parse_Log_struct_v01.m

%TODO:
% clear up class
% doesn't handle multiple reports on same frequency
% lots of error checking

clear;
clc;
%%
addpath('X:\Workspace\source\mine\MATLAB\Temp\ESC_Post_Process\'); %for Class_ESC_Test_v04
addpath('X:\Workspace\source\mine\MATLAB\Functions'); % for vector_from_index

%% Setup test parameters
test_param.channel_count=11; %number of channels per test
test_param.max_detection_time=60; % maximum detection time (per test)
test_param.test_count=3; %default
test_param.channel_freq=3550e6; %requency of lowest channel (in Hz)
test_param.channel_BW=10e6; %requency of lowest channel (in Hz)
%log_filepath='X:\Workspace\data\ESC_tester\Sample_LogFile_ESC_TestHarness.txt';
%log_filepath='X:\Workspace\data\ESC_tester\ESC-Test_20180521-112156.log';

%log_fullfile='X:\Workspace\data\ESC_tester\ESC-Test_20180608-170205.log';
%log_fullfile = 'X:\Workspace\data\ESC_tester\ESC-Test_DEBUG.log';
log_filepath = 'X:\Workspace\data\ESC_tester\';
log_filename = 'ESC-Test_20180612-110403.log';
log_fullfile = fullfile(log_filepath,log_filename);


%% Read Logfile (gets start/stop times)
%{%
ESCTest = Class_ESC_Test_v05(); %create ESC Test Class
ESCTest = ESCTest.read_ESC_Logfile(log_fullfile); % read logfile
%fprintf('%d test were detected in logfile\n',length(ESCTest.ESC_test_valid));
%}

%% Modify Test Parameters
test_param.test_count=length(ESCTest.ESC_test_valid); 

%% Get radar truth for files
[timing.radar_truth,~] = ESCTest.ESC_LUT_for_all_files(test_param);

% adjust reported radar timing to be relative
timing.radar_detection_relative=seconds(NaN(test_param.test_count,test_param.channel_count));

for I=1:test_param.test_count
    for II=1:ESCTest.ESC_test_valid(I).radar_detection_count
        this_channel = ESCTest.ESC_test_valid(I).radar_detection_channel{II};
        this_latency = ESCTest.ESC_test_valid(I).radar_detection_time - ESCTest.ESC_test_valid(I).start_time;
        timing.radar_detection_relative(I,this_channel) = this_latency;
    end
end

%% 
timing.radar_detection_time = timing.radar_detection_relative - timing.radar_truth;

%% Analyze results
[radar_results,err]=ESCTest.ESC_Analyze_Results(timing,test_param);

%% Print out Cumulative Results
fprintf('\nTest Specs\n')
fprintf('Tests run: %d\n',test_param.test_count)
fprintf('Channels (per test): %d\n',test_param.channel_count)
fprintf('Required detection time: %s\n',duration(0,0,test_param.max_detection_time))

fprintf('\nTest Results (Cumulative)\n')
fprintf('Active radar count: %d\n',sum(radar_results.active_count))
fprintf('------------------------------\n')
fprintf('Missed radar detections: %d\n',sum(sum(radar_results.missed_detection)))
fprintf('False radar detections (possible early detection): %d\n',sum(sum(radar_results.early_detection)))
fprintf('False radar detections (no radar): %d\n',sum(sum(radar_results.false_detection)))
fprintf('Detected radar count: %d\n',sum(radar_results.detected_count))
fprintf('------------------------------\n')
fprintf('Detected radar count (NOT within detection time): %d\n',sum(sum(radar_results.detect_slow)))
fprintf('Detected radar count (within detection time): %d\n',sum(sum(radar_results.detect_positive)))

%% Print out of Results (per test)
% TODO: needsDetailedOutput should be more robust
%{%
needsDetailedOutput1 = (radar_results.active_count(:)) ~= (sum(radar_results.detect_positive,2));
needsDetailedOutput2 = sum(radar_results.missed_detection,2)>0;
needsDetailedOutput3 = sum(radar_results.false_detection,2)>0;

for I=1:test_param.test_count    
    needsDetailedOutput = needsDetailedOutput1(I) || needsDetailedOutput2(I) || needsDetailedOutput3(I);
    if needsDetailedOutput
        fprintf('\n\n\n\nTest Results (Test #%d)\n',I)
        fprintf('Active radar count: %d\n',radar_results.active_count(I))
        fprintf('------------------------------\n')
        fprintf('Missed radar detections: %d\n',sum(radar_results.missed_detection(I,:)))
        fprintf('False radar detections (possible early detection): %d\n',sum(radar_results.early_detection(I,:)))
        fprintf('False radar detections (no radar): %d\n',sum(radar_results.false_detection(I,:)))
        fprintf('Detected radar count: %d\n',sum(radar_results.detected_count(I)))
        fprintf('------------------------------\n')
        fprintf('Detected radar count (NOT within detection time): %d\n',sum(radar_results.detect_slow(I,:)))
        fprintf('Detected radar count (within detection time): %d\n',sum(radar_results.detect_positive(I,:)))
    end
end
%}
%% Table of Results
T_timing.detection_time=array2table(timing.radar_detection_time);
T_timing.detection_relative=array2table(timing.radar_detection_relative);
T_timing.radar_truth=array2table(timing.radar_truth);