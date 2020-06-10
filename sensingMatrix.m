%% Define Sensing Matrix

%Using Identity matrix for now, can be changed to any diagonal matrix for now
B = 51;
img_size = [64, 64];
D = eye(img_size(1)*img_size(2));
H = zeros(size(D, 1), B*size(D, 1));
for i=1:B
    H(:, ((i-1)*size(D, 2) + 1) : i*size(D, 2)) = D;
end