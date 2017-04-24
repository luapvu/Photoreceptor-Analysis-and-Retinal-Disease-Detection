%this function asks the user to select a point on an image and returns the
%x and y coordinates of the selected region
function [ x, y ] = getUserCoordinates(img)
    figure; printImg(img, 'Please Select a region: ');
    [x,y] = ginput(1);
    x = uint64(x);
    y = uint64(y);
end

