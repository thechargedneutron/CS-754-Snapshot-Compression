%% Load images
num_images = 51;
img_size = [320, 240];
X = zeros(num_images, img_size(1)*img_size(2));
for i=1:num_images
    img = mean(imread(strcat('dataset/frames/',num2str(i), '.png')), 3);
    smallImage = imresize(img, 1/4, 'bilinear');
    X(i, :) = img(:);
end
disp('HH')
imshow(uint8(smallImage))