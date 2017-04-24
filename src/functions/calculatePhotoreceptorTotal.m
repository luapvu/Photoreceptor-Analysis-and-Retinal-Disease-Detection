%this function is identical to countPhotoreceptors.m except it does not
%print any images out. This is ideal to use for itterative calls over
%multiple regions such as in disease detection. For simple single region
%counting, use the countPhotoreceptors.m

function  [ TotalPhotoreceptors ] = calculatePhotoreceptorTotal( img, p )


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
end

