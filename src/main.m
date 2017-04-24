close all;
clear all;
addpath(genpath('functions'));
addpath(genpath('../Images'));

%-------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------
%Configurations


%Counting photoreceptors of a specific region configurations
retinaImg = readImg('18_45_10-_47_PR_avgOctVol_dB.tif');
mHeight = 50;
mWidth = 50;

segmentationThreshold = 0.25; %uncomment this to use an estimated version of segmentation threshold
segmentationThreshold = idealThresholdCalc(retinaImg); %uncomment this to use an ideal version of segmentation threshold


%Disease detection configurations
disease_mask_height = 25;
disease_mask_width = 25;
%-------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------






%-------------------------------------------------------------------------------------
%Begining of Program
%-------------------------------------------------------------------------------------

% Allow a doctor to select a specific region of the OCT image to count how many photo receptors exist 
%is a mask region as defined in above configurations
PhotoreceptorCount = countPhotoreceptors(retinaImg, mWidth, mHeight, segmentationThreshold);

% Allow a doctor to input an OCT photoreceptor image and instantly
% determine if there are any regions of interest which could have retina
% damage
diseaseDetection(retinaImg, disease_mask_width, disease_mask_height, segmentationThreshold);

%The below function simulates various diseases with damaged retinas. Used
%to prove the accuracy of the diseaseDetection algorithm
diseaseSimulator(retinaImg, disease_mask_width, disease_mask_height, segmentationThreshold);

%-------------------------------------------------------------------------------------
%End
%-------------------------------------------------------------------------------------
