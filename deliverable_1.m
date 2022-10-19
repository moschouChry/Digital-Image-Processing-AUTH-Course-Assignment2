% part 1.1
clc;
tic;

%% preprocess image
% read image and resize it to be able to process it
scale = 10;
I = imread('im2.jpg');
initial_im = I;
I = imresize(I,1/scale);
I = double(I) / 255;

% convert image to grayscale and apply filters to enhance edges
I = rgb2gray(I);
% gauss filter
I = imgaussfilt(I,0.5);

% threshold
for i = 1:1:size(I,1)
    for j =1 : 1:size(I,2)
        if(I(i,j)<=0.9)
            I(i,j)=0;
        else
            I(i,j)=1;
        end
    end
end


figure
imshow(I)
title('Processed image')

% convert image to binary with edge detector
BW = edge(I,'Sobel');
figure
imshow(BW)
title('Edge detector')

%% myHoughTransform
% Define input for myHoughTransform function
Dtheta = 1*pi/180;
Drho = 1;
n = 40;
[H, L, res] = myHoughTransform(BW,Dtheta,Drho,n);

% Show hough transform and point out the n peaks with red color
D = floor(sqrt(size(BW,1).^2 + size(BW,2).^2));
figure
imshow(H,[],'XData',[-90 90]*pi/180,'YData',[-D D],'InitialMagnification','fit');
title('My hough transform');
xlabel('\theta'),
ylabel('\rho');
axis on;
axis normal; 
hold on;
colormap(gca,pink);
r = L(:,1);
t = L(:,2);
plot(t,r,'s','color','red');
hold off;

%% Show original image with red lines on the strongest edges
figure
imshow(initial_im)
title('Initial image')
hold on
x1 = 1;
x2 = size(initial_im,2);
L(:,1)=scale*L(:,1);
for i = 1:1:length(L)
    y1 = (L(i,1) - x1 * cos(L(i,2))) / sin(L(i,2));
    y2 = (L(i,1) - x2 * cos(L(i,2))) / sin(L(i,2));
    plot([x1,x2],[y1,y2],'r','LineWidth',2);
    hold on
end
hold off

% compute the analogy of res to the original image
analogy = res/(size(BW,1)*size(BW,2));
original_res = analogy * (size(initial_im,1)*size(initial_im,2));
disp('Pixels that do not belong to edges in original image :')
disp(original_res)
toc;