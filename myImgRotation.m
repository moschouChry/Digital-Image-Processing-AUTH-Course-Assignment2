 function rotImg = myImgRotation(img, angle)

% Compute img's dimensions
dimensions=size(img);
yDim = dimensions(1,1);
xDim = dimensions(1,2);

% Rotation matrix
Trot = [cos(angle),-sin(angle);sin(angle),cos(angle)];

%Find the center location for rotation operation
center = [xDim/2;yDim/2];

%% Compute the new dimensions
corners = [0,0,xDim,xDim;0,yDim,0,yDim];
corners(1,:) = corners(1,:)-center(1);
corners(2,:) = corners(2,:)-center(2);
corners_rot = Trot*corners;

min_x = min(corners_rot(1,:));
max_x = max(corners_rot(1,:));
min_y = min(corners_rot(2,:));
max_y = max(corners_rot(2,:));

new_dimensions(1) = floor(max_x-min_x) + 1;
new_dimensions(2) = floor(max_y-min_y) + 1;

%% Compute pixels to map to the original image

[xB ,yB] = meshgrid(1:new_dimensions(1),1:new_dimensions(2));

xA = cos(angle)*(xB + min_x)-sin(angle)*(yB + min_y)+center(1);
yA = sin(angle)*(xB + min_x)+cos(angle)*(yB + min_y)+center(2);

%% Compute rotated image with bilinear interpollation
if length(dimensions) == 3 % RGB image
    rotImg(:,:,1)=interp2(img(:,:,1), xA,yA,'linear');
    rotImg(:,:,2)=interp2(img(:,:,2), xA,yA,'linear');
    rotImg(:,:,3)=interp2(img(:,:,3), xA,yA,'linear');
else % Gray-scale image
    rotImg=interp2(img, xA,yA,'linear');
end

%% Add black pixels
rotImg(isnan(rotImg)) = 0;

end

