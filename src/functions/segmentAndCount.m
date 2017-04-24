%This segmentation method takes the photoreceptor image and parses the
%image based on a threshold value. We first check for the brightest pixel
%in the image and set the threshold value to a user defined percentage
%threshold. For exameple, if a user wanted to set the threshold as 50% of
%the largest intesntiy value, they must percent = 50.

function  [ TotalPhotoreceptors ] = segmentAndCount( img, p )


[col,row] = size(img); %finding image row and column dimensions 
maxImg = max(max(img)); %finding the brightest image intensity of the image
threshhold = maxImg*p; %we define a photorecepter to have at least half the intensity value of the max
segmentedImg = img; %define segmentedImg to have the same MxN dimensions as the original image

for i = 1:col*row %checks every pixel in the image, if it larger than the threshold then we assume it is a rod or cone of a photoreceptor
    if(segmentedImg(i) >= threshhold)
        segmentedImg(i) = 1;
        %TotalPhotoreceptors = TotalPhotoreceptors+1; % keep track of how many photoreceptor pixels there are
        
    else %if it has a lower value, we assume it is not a receptor so we set the pixel to black
        segmentedImg(i) = 0;
    end
end


connectivityMap = bwconncomp(segmentedImg,4); %counting the connected regions (photoreceptors) using 4-connected neighborhood
TotalPhotoreceptors = connectivityMap.NumObjects;

%display both images for inspection
str = sprintf('Photoreceptor Count =  %d', TotalPhotoreceptors);
subplot(1,3,2); printImg(img, 'Photo Receptor Region');
subplot(1,3,3); printImg(segmentedImg, str);

end

