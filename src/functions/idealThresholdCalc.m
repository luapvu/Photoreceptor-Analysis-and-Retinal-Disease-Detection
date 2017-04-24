%This function will print the histogram of intensity values of  a given
%image to a user. The user will need to click on a the histogram right
%before the second peak to set the threshold value. Using this function,
%doctors can select ideal threshold values.
function [ thresholdValue ] = idealThresholdCalc(img)
    h = imhist(img); %generate histogram of image
    figure;
    subplot(2,1,1); printImg(img, 'Input Image');
    subplot(2,1,2); plot(h); title('Please select a threshold value (value before second peak)');
    [intensityValue, quantity] = ginput(1); %ask user to select threshold value on the histogram
    thresholdValue = intensityValue /256; %the intensity value must be divided by the total number of pixel intensities which range from 0 - 255 or 256 pixel values.
end

