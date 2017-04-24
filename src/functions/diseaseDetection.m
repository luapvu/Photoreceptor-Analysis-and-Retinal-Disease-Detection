function [] = diseaseDetection( img, colLength, rowLength, thresholdValue)
originalImg = img;
[imgCol, imgRow] = size(img); %finding image row and column dimensions 
maxImg = max(max(img)); %finding the brightest image intensity of the image
outputImg = zeros(rowLength, colLength);

numOfColMasks = floor(imgCol/colLength); %calculate how many horizontal masks are needed
numOfRowMasks = floor(imgRow/rowLength); %calculate how many vertical masks are needed

%used to create mask
minX = 1;
minY = 1;
maxX = colLength;
maxY = rowLength;

TotalNumberOfSamples = numOfColMasks*numOfRowMasks; %total number of masks required
photoreceptorCountArr = zeros(TotalNumberOfSamples, 1); %initialize array to hold the count of photoreceptors for each partition
c = 1; %used to index photoreceptorCountArr

for a = 1: numOfRowMasks 
    for b = 1: numOfColMasks
        
            %boundary conditions
            if maxX > imgCol
                maxX = imgCol;
            end

            if maxY > imgRow 
                maxY = imgRow;
            end
            
            %generate the mask out of the image, 
            k = 1; l = 1;
            for i = minX:maxX
                for j = minY:maxY
                    outputImg(k,l) = img(j,i); 
                    l = l+1;
                end
                k = k+1; l = 1;
            end
            photoreceptorCountArr(c) = calculatePhotoreceptorTotal(outputImg, thresholdValue); %calculates the total number of photoreceptors in a given partion mask region
            c = c+1; %increment array counter
            minX = minX + colLength; %increment min and max values for the next partiton
            maxX = maxX + colLength;
        
        
        
    end
                minY = minY + rowLength; %increment min and max values for the next partiton
                maxY = maxY + rowLength;
                
                minX = 1; %reset min and max values since we reached the end of the column, we reset to the begining
                maxX = colLength;

    
end

average = mean(photoreceptorCountArr); %calculate average and standard deviation
std = std2(photoreceptorCountArr);

threshHold = average - 2*std; %threshold based on a normal distribution of photoreceptors

for a = 1:TotalNumberOfSamples
    if photoreceptorCountArr(a) < threshHold %if a partition has less than the threshold amount of photoreceptors, mark as a disease region
       
        
        %calculations used to draw the box around disease regions
        r1 = rem(a,numOfColMasks);
        myMaxX = r1*colLength +1 ;
        myMinx = myMaxX - colLength;
        
        r2 = floor(a/numOfRowMasks)+1;
        myMaxY = r2*rowLength +1;
        myMinY = myMaxY - rowLength;
        
        %boundary conditions
        if myMinx < 1
            myMinx = 1;
        end

        if myMinY < 1
            myMinY = 1;
        end
        
        if myMaxX > imgCol
            myMaxX = imgCol;
        end

        if myMaxY > imgRow 
            myMaxY = imgRow;
        end  

        
        % provide a GUI for the user to see which region is being viewed
        for i = myMinx:myMaxX
            for j = myMinY:myMaxY
                if i == myMinx || i == myMaxX || j == myMinY || j == myMaxY
                    img(j,i) = maxImg*1.5; %draw the mask region for the user to see
                    img(j+1,i+1) = maxImg*1.5; %draw the mask region for the user to see

                end
            end
        end

        
        
        
    end
end

figure;
subplot(1,2,1); printImg(originalImg, 'Input Image');
subplot(1,2,2); printImg(img, 'Possible Disease Regions');


end

