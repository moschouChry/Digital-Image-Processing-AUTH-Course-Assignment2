% part 1.3

clc;
tic;

%% preprocess image
% read image and resize it to be able to process it
scale = 4;
I = imread('im2.jpg');
I = imresize(I,1/scale);
I = double(I) / 255;

%% myImgRotation
% Define rotation angle
angle = 45*pi/180;
rotImg = myImgRotation(I, angle);

figure
imshow(rotImg)
title(['Rotated image by ',num2str(angle),' rads counterclockwise'])

toc;