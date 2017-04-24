
%this function requires a photoreceptor image, an x and y coordinate
%specified by the user, and the mask size (column length and row length) specified by the user 
%this function will output a subset of the image based on the mask size and
%x and y coordinate centered around a pixel. It will display the region
%selected in an outlined white box. 
function [ outputImg ] = maskRegion( img, x, y, colLength, rowLength)

[imgCol, imgRow] = size(img); %finding image row and column dimensions 
maxImg = max(max(img)); %finding the brightest image intensity of the image
outputImg = zeros(rowLength, colLength);

%used to create mask
centerX = floor(colLength /2);
centerY = floor(rowLength /2);
minX = x-centerX;
minY = y-centerY;
maxX = x+ colLength - centerX -1;
maxY = y+ rowLength - centerY -1;

%conditional statements to check in case user selects a region around the
%edge of the image in which the mask would be undefined
if minX < 1
    minX = 1;
end

if minY < 1
    minY = 1;
end

if maxX > imgCol
    maxX = imgCol;
end

if maxY > imgRow 
    maxY = imgRow;
end



%generate the mask out of the image, 
k = 1;
l = 1;
for i = minX:maxX
    for j = minY:maxY
        outputImg(k,l) = img(j,i); 
        l = l+1;
    end
    k = k+1;
    l = 1;
end

% provide a GUI for the user to see which region is being viewed
for i = minX:maxX
    for j = minY:maxY
        if i == minX || i == maxX || j == minY || j == maxY
            img(j,i) = maxImg*1.5; %draw the mask region for the user to see
            img(j+1,i+1) = maxImg*1.5; %draw the mask region for the user to see

        end
    end
end


%display to the user the mask region corresponding to the original image.
subplot(1,3,1); printImg(img, 'Selected Mask Region');

end

