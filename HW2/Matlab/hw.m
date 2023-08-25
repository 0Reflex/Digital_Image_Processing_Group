% Prompt user to enter filter size and k value
s = input("Enter filter size (odd number): ");
k = input("Enter k value: ");

% Create filter for averaging
filter = ones(s, s) / (s * s);

% Load input image and convert to double
f = im2double(imread("moon.tif"));

% Perform convolution with filter
f_bar = conv2(f, filter, 'same');

% Calculate unsharp mask
g_mask = f - f_bar;

% Calculate sharpened image using highboost filtering
g = (k + 1) * f - k * f_bar;

% Display input and output images side by side
figure;
subplot(1,2,1);
imshow(f);
title("Input Image");
subplot(1,2,2);
imshow(g);
title("Sharpened Image (k=" + k + ")");