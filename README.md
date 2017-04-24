This program can be used by medical examiners to analyze the quantity of photoreceptors in a given region. This program can also analyze a given photoreceptor image for possible diseases based on low locality of photoreceptors.

Configurations:
1. To specify your own photoreceptor image, please copy the image into the images folder and provide the image name on line 12 of main.m for readImg function.

2. The user must specify a mask height and mask width to determine the area in which photoreceptors will be counted in a given region. This is done in lines 13 and 14 of main.m:  
mHeight = 50;
mWidth = 50

3. If the user would like to use an estimated value of segmentation threshold comment out line 17 of main.m:
"segmentationThreshold = idealThresholdCalc(retinaImg); %uncomment this to use an ideal version of segmentation threshold"

4. If the user would like to use an ideal segmentation threshold please enable line 17 of main.m (uncommented).

5. The user must specify a mask height and mask width to determine the area in which photoreceptors will be counted in a given region. This is done in lines 13 and 14 of main.m:  
mHeight = 50;
mWidth = 50

6. The user must specify a partition size for parsing for disease regions. Based on this partition size the image will be divided and examined for disease regions based on these sizes. The default size is a 25x25 partition. Users can change these values on line 21 and 22 of main.m
disease_mask_height = 25;
disease_mask_width = 25;



Executing the program:
1. To execute the function run the main.m script.
2. Users will be presented a histogram with two peaks. Using the mouse, click on a point slightly before the second peak of the histogram.
3. Users will then be asked to select a region on the photoreceptor image. The medical examiner can pick any region on the image to count the photoreceptors in this region.
 

Further details can be found in the pdf report.
