%this function is used to generate 3 disease images based on the image
%provided. This function requires the mask size used for generating the
%disease along with the photoreceptor image

function [] = diseaseSimulator( img, colLength, rowLength, thresholdValue)
originalImg = img;
disease1Img = img;
disease2Img = img;
disease3Img = img;

[imgCol, imgRow] = size(img); %finding image row and column dimensions 
maxImg = max(max(img)); %finding the brightest image intensity of the image


%create disease image 1
for a = imgCol*0.5-colLength*2:imgCol*0.5+colLength*2
    for b = imgRow*0.5 - rowLength*3: imgRow*0.5 + rowLength*3
        disease1Img(a,b) = 0;
    end
end


%create disease image 2 and 3
for a = imgCol*0.5-colLength:imgCol*0.5+colLength
    for b = imgRow*0.5 - rowLength: imgRow*0.5 + rowLength
        disease2Img(a,b) = 0;
        if mod(b,7) == 0
          disease3Img(b,a) = maxImg*0.2;
        else
          disease3Img(b,a) =0;

        end
    end
end

%adding a second disease region to images 2 and 3
for a = 1:4*colLength
    for b = 1:4*rowLength
        disease2Img(b,a) = 0;
        if mod(b,7) == 0
          disease3Img(b,a) = maxImg*0.2;
        else
          disease3Img(b,a) =0;

        end
    end
end

%adding a third disease region to images 2 and 3
for a = imgCol*0.5-colLength:imgCol*0.5+colLength
    for b = imgRow*0.75 - rowLength*3: imgRow*0.75 + rowLength*3
        disease2Img(b,a) = 0;
        if mod(b,7) == 0
          disease3Img(b,a) = maxImg*0.2;
        else
          disease3Img(b,a) =0;

        end

    end
end


figure;
subplot(1,4,1); printImg(originalImg, 'Input Image');
subplot(1,4,2); printImg(disease1Img, 'Simulation 1 Disease Regions');
subplot(1,4,3); printImg(disease2Img, 'Simulation 2 Disease Regions');
subplot(1,4,4); printImg(disease3Img, 'Simulation 3 Disease Regions');


diseaseDetection( disease1Img, colLength, rowLength, thresholdValue);
diseaseDetection( disease2Img, colLength, rowLength, thresholdValue);
diseaseDetection( disease3Img, colLength, rowLength, thresholdValue);

end

