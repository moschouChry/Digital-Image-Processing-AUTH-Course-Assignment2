function [H , L, res ] = myHoughTransform(img_binary, Dtheta, Drho ,n )

%% Initialize res equal to all pixels of image 
im_size = size(img_binary);
res = im_size(1)*im_size(2);

%% Create dtheta and drho space
dtheta = (-90*pi/180:Dtheta:90*pi/180);
% Diagonal of the image
D = floor(sqrt((im_size(1)).^2 + (im_size(2)).^2));
drho = -D:Drho:D;

%% Find binary image's non zero pixels
[y,x] = find(img_binary);
y = y - 1;
x = x - 1;

%% Allocate memory for Hough array and rho
cell_r = cell(1,numel(x));
H = zeros(numel(drho),numel(dtheta));

%% Calculate the Hough Transform
for i = 1:numel(x)
    % for every dtheta compute all rho for level i
    cell_r{i} = x(i).*cos(dtheta) + y(i).*sin(dtheta);
    for j = 1:numel(cell_r{i})
        % map rho values from 0 to 2*D and to the appropriate level
        cell_r{i}(j) = floor((cell_r{i}(j)+D)/Drho)+1;
        H(cell_r{i}(j),j) = H(cell_r{i}(j),j) + 1; 
    end
end

%% Find the highest values of H array and create L array
% L's first column contains the values of r
% L's second column contains the values of theta
temp = H(:);
temp = sort(temp,'descend');
% highValues contains the n highest values of H
highValues = temp(1:n);
L = zeros(n,2);
h_size = size(H);
for k = 1:1:length(highValues)
    for i = 1:1:h_size(1)
        for j = 1:1:h_size(2)
            if(H(i,j)==highValues(k))
                % extract from res the pixels equal to highValues(k)
                res = res - H(i,j);
                L(k,1)=drho(i);
                L(k,2)=dtheta(j);
            end
        end
    end
end

end

