%The first feature of this program is to ask the user to select any region
%on a photoreceptor image. Our program will then count how many
%photoreceptors exist in this region's mask based on the mask height and
%mask width specified in main.m configurations

function [ total ] = countPhotoreceptors(retinaImg, mWidth, mHeight, thresholdValue)
[x,y] = getUserCoordinates(retinaImg); %asks for user input to select a region to count photoreceptors
imgRegion = maskRegion(retinaImg, x, y, mWidth, mHeight); %creates the mask region to count the photoreceptors
total = segmentAndCount(imgRegion, thresholdValue); % counts the number of photoreceptors in the specified region

end

