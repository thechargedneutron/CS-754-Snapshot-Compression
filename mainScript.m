clear all

%% Load images
B = 25;
data_img_size = [320, 240];
downsample_factor= 7;
img = mean(imread('dataset/frames/1.png'), 3);
sample = imresize(img, 1/downsample_factor, 'bilinear');
[r, c] = size(sample);
n = r*c;
%X = zeros(B, data_img_size(1)*data_img_size(2));
for i=1:B
    img = mean(imread(strcat('dataset/frames/',num2str(i), '.png')), 3);
    smallImage = imresize(img, 1/downsample_factor, 'bilinear');
    X((i-1)*n+1:i*n, 1) = smallImage(:)';
end

%% Define Sensing Matrix
D = eye(n);
H = zeros(n, B*n);
for i=1:B
    disp(i)
    H(:, ((i-1)*n + 1) : i*n) = D;
end

%% Compress
y = H*X;

%% Reconstruct
max_iter = 9;
mu = 1e-8;
[X_hat, e] = CbPGD(H, y, mu, max_iter);
