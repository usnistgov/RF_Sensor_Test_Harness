%% Post analysis
clear;clc;close all;

%% Setup test parameters
test_param.channel_count=11; %number of channels per test
test_param.max_detection_time=60; % maximum detection time (per test)
test_param.test_count=3; 

%% Parse file with truth (note: these are inherently relative)

% Start time should come from here, not detection

% Test values
%{%
timing.radar_truth=duration(0,0,0)*nan(test_param.test_count,test_param.channel_count);
timing.radar_truth(1,11)=duration(0,0,58);
timing.radar_truth(1,7)=duration(0,0,35);
timing.radar_truth(2,4)=duration(0,0,0);
timing.radar_truth(2,5)=duration(0,0,0);
timing.radar_truth(2,9)=duration(0,0,3);
%}

%% Parse file with detection results (note: these are inherently absolute)
test_param.file_detection='X:\Workspace\data\ESC_tester\test.log';
%addpath('X:\Workspace\source\mine\MATLAB\Temp\ESC_Post_Process') % imports ESC_Parse_Radar_Detection_Log_v4_Function
%addpath('X:\Workspace\source\mine\Unsorted\ESC_Post_Process') %import_go_Rx_datetime.m

[ timing.radar_detected_absolute,timing.test_start_time] = ESC_Parse_Radar_Detection_Log_v4_Function( test_param.file_detection,timing.radar_truth,test_param.channel_count,test_param.test_count );

%% Use truth (relative) & detected (absolute) & start_time to determine detection time

%radar_detection_relative=nan(test_param.test_param.test_count,test_param.channel_count);
for this_test_num=1:test_param.test_count
    % Convert absolute detection to relative detection (subtract from start time)
    timing.radar_detection_relative(this_test_num,:)=timing.radar_detected_absolute(this_test_num,:)-timing.test_start_time(this_test_num);
    
    % Determine Latency from relative detection
    timing.radar_detection_time(this_test_num,:)=timing.radar_detection_relative(this_test_num,:)-timing.radar_truth(this_test_num,:);
end

clear this_test_num
%radar_detection_relative(this_test_num,this_channel)=timing.radar_detected_absolute-test_start_time(this_test_num);


%% Analyze results

radar_results.missed_detection=( (isnan(timing.radar_detection_time)) & (not(isnan(timing.radar_truth))) );
radar_results.false_detection=( not((isnan(timing.radar_detection_time))) & (isnan(timing.radar_truth)) );

radar_results.early_detection = timing.radar_detection_time<0;
radar_results.early_detection_count=sum(radar_results.early_detection,2);

radar_results.detect_positive=( (timing.radar_detection_time>0) & (timing.radar_detection_time<test_param.max_detection_time) );
radar_results.detect_slow=( (timing.radar_detection_time>0) & (timing.radar_detection_time>test_param.max_detection_time) );

radar_results.detect_success=radar_results.detect_positive;

radar_results.active_count=sum(not(isnan(timing.radar_truth)),2); % all non-NaNs
radar_results.detected_count_with_early=sum(not(isnan(timing.radar_detection_time)),2); % all non-NaNs
radar_results.detected_count=radar_results.detected_count_with_early-radar_results.early_detection_count; % remove negative numbers


radar_results.detect_positive_count=sum(radar_results.detect_positive,2);
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
for I=1:test_param.test_count    
    needsDetailedOutput = (radar_results.active_count(I)) ~= (sum(radar_results.detect_positive(I,:)));
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

%% Plot Results
% This is a list of hacks to try to visualize the results
% I'm not happy with any of them (hence why they're commented out)
% but left them in as a reference

%{
figure;
    hold on
    set(gca,'YDir','normal','XTick',1:test_param.channel_count,'YTick',1:test_param.test_count,'XLim',[1 test_param.channel_count],'YLim',[1 test_param.test_count],'GridLineStyle','-','XGrid','on','YGrid','on');
    imagesc(1:test_param.channel_count,1:test_param.test_count,seconds(timing.radar_detection_time));
    title('Time to detect radar (latency - in seconds)')
    
    xlabel('channel number')
    ylabel('test number')
    caxis([0, 10*log10(test_param.max_detection_time)]);
    colorbar
    colormap gray
    hold off;

figure;
    hold on
    set(gca,'YDir','normal','XTick',1:test_param.channel_count,'YTick',1:test_param.test_count,'XLim',[1 test_param.channel_count],'YLim',[1 test_param.test_count],'GridLineStyle','-','XGrid','on','YGrid','on');
    imagesc(1:test_param.channel_count,1:test_param.test_count,radar_results.detect_positive);
    title('Positive detections') % includes BOTH early detection & no radar in channel at all
    xlabel('channel number')
    ylabel('test number')
    colorbar
    colormap gray
    hold off;
    
figure;
    hold on
    set(gca,'YDir','normal','XTick',1:test_param.channel_count,'YTick',1:test_param.test_count,'XLim',[1 test_param.channel_count],'YLim',[1 test_param.test_count],'GridLineStyle','-','XGrid','on','YGrid','on');
    imagesc(1:test_param.channel_count,1:test_param.test_count,radar_results.early_detection+radar_results.false_detection);
    title('Positive detections (including no radar)') % includes BOTH early detection & no radar in channel at all
    xlabel('channel number')
    ylabel('test number')
    colorbar
    colormap gray
    hold off;

figure;
    hold on
    set(gca,'YDir','normal','XTick',1:test_param.channel_count,'YTick',1:test_param.test_count,'XLim',[1 test_param.channel_count],'YLim',[1 test_param.test_count],'GridLineStyle','-','XGrid','on','YGrid','on');
    imagesc(1:test_param.channel_count,1:test_param.test_count,radar_results.detect_slow);
    title('Number of SLOW detections (exceeding Threshold)') % includes BOTH early detection & no radar in channel at all
    xlabel('channel number')
    ylabel('test number')
    colorbar
    colormap gray
    hold off;    
    
figure;
    hold on
    set(gca,'YDir','normal','XTick',1:test_param.channel_count,'YTick',1:test_param.test_count,'XLim',[1 test_param.channel_count],'YLim',[1 test_param.test_count],'GridLineStyle','-','XGrid','on','YGrid','on');
    imagesc(1:test_param.channel_count,1:test_param.test_count,radar_results.early_detection);
    title('Number of false detections') % includes BOTH early detection & no radar in channel at all
    xlabel('channel number')
    ylabel('test number')
    colorbar
    colormap gray
    hold off;
%}
