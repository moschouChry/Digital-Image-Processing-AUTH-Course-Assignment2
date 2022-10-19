function corners = myDetectHarrisFeatures(I)

% define threshold, sigma for gauss filter and k parameter for R
threshold = 0.002;
sigma = 1;
k = 0.04;

% Allocate enough memory for corners array
im_size = size(I);
corners = zeros(im_size(1)*im_size(2),2);

%% Calculate the gradient using masks
% Defining the Row and Column Filter (Sobel Operator)
row_fil = [ -1 0 1;-2 0 2;-1 0 1];
colum_fil = [1 2 1; 0 0 0; -1 -2 -1];

G_x = conv2(I, row_fil);
G_y = conv2(I, colum_fil);
G_xy = G_x.*G_y;  
G_x = G_x.^2;
G_y = G_y.^2;

%% Apply gaussian filter to gradients
G_x = imgaussfilt(G_x,sigma);
G_y = imgaussfilt(G_y,sigma);
G_xy = imgaussfilt(G_xy,sigma);

%% Compute R and detect values higher than threshold
det = (G_x.*G_y - G_xy.^2);
trace = G_x + G_y;
R = (det - k*((trace).^2));
m = 1; 
for i = 1:1:size(I,1)
    for j = 1:1:size(I,2)
        if(R(i,j)>threshold)
             corners(m,1) = j;
             corners(m,2) = i;
             m = m+1;
        end
    end
end

%% Reform corners to contain only the corner pixels
corners = corners(1:m-1,1:2);

end

