% part 1.2

clc;
tic;

%% preprocess image
% read image and resize it to be able to process it
scale = 10;
I = imread('im2.jpg');
initial_im = I;
I = imresize(I,1/scale);
I = double(I) / 255;

% convert image to grayscale and apply filters to enhance corners
I = rgb2gray(I);

for i = 1:1:size(I,1)
    for j =1 : 1:size(I,2)
        if(I(i,j)<=0.9)
            I(i,j)=0;
        else
            I(i,j)=1;
        end
    end
end

I = imgaussfilt(I,2);

%% myDetectHarrisFeatures
corners = myDetectHarrisFeatures(I);

% Show original image with red squares on the strongest corners
figure
imshow(initial_im)
title('Initial image with corners')
hold on
for i=1:1:length(corners)
%     square with 5x5 pixels is too small for the original image
%     rectangle('Position',[(scale*corners(i,1)-2) (scale*corners(i,2)-2) 5 5],'EdgeColor','r')
   plot(scale*corners(i,1), scale*corners(i,2), 'rs','LineWidth',1)
   hold on
end

toc;