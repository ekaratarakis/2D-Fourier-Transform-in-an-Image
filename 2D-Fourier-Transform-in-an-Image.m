clc
close all
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 1

[I,map] = imread('tools.bmp');

ftI = abs(fftshift(fft2(I)));

figure(1)
imshow(ftI, map);
title('Image Fourier Transform magnitude.');
axis off;

c=255/max(max(log(1+ftI)));
A = c*log(1+ftI);

figure(2)
colormap(map);
image(A);
title('New image of Fourier Transform magnitude in grayscale.');
axis off;

figure(3)
colormap(map);
colormap(jet);
image(A);
title('New image of Fourier Transform magnitude with different colors.');
axis off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 2

[W,mapw] = imread('windmill.bmp');

ftW = abs(fftshift(fft2(W)));

figure(4)
colormap(mapw);
image(ftW);
title('Image Fourier Transform magnitude.');

c=255/max(max(log(1+ftW)));
A = c*log(1+ftW);

figure(5)
colormap(gray);
image(A);
title('New image of Fourier Transform magnitude in grayscale.');
axis off;

figure(6)
colormap(mapw);
colormap(jet);
image(A);
title('New image of Fourier Transform magnitude with different colors.');
axis off;

BW = edge(W,'sobel');
figure(7)
imshow(BW);
title('Detected edges of the image.');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 3

A = zeros(256,256);
B = zeros(256,256);

A((256/2-5):(256/2+5),(256/2-5):(256/2+5))=255;
B((256/2-15):(256/2+15),(256/2-15):(256/2+15))=255;

figure(8);
subplot(1,2,1);
imshow(A);
title('Image with 10x10px rectangle at the center.')

subplot(1,2,2);
imshow(B);
title('Image with 30x30px rectangle at the center.')

ftA = abs(fftshift(fft2(A)));

figure(9);
colormap(map);
subplot(2,2,1)
image(ftA);
title('Non-Colormapped image with 10x10px rectangle at the center.');

c=255/max(max(log(1+ftA)));
D1 = c*log(1+ftA);

colormap(map);
subplot(2,2,2)
image(D1);
title('Colormapped image with 10x10px rectangle at the center.');

ftB = abs(fftshift(fft2(B)));

colormap(map);
subplot(2,2,3)
image(ftB);
title('Non-Colormapped image with 30x30px rectangle at the center.');

c=255/max(max(log(1+ftB)));
D2 = c*log(1+ftB);

colormap(map);
subplot(2,2,4)
image(D2);
title('Colormapped image with 30x30px rectangle at the center.');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 4

Arot = imrotate(A,45);
Brot = imrotate(B,45);

figure(10);
subplot(1,2,1)
imshow(Arot);
title('Rotated image with 10x10px rectangle at the center.')
subplot(1,2,2)
imshow(Brot);
title('Rotated image with 30x30px rectangle at the center.')

ftArot = abs(fftshift(fft2(Arot)));

figure(11);
colormap(map);
subplot(2,2,1)
image(ftArot);
title('Non-Colormapped rotated image with 10x10px rectangle at the center.');

c=255/max(max(log(1+ftArot)));
D1rot = c*log(1+ftArot);

colormap(map);
subplot(2,2,2)
image(D1rot);
title('Colormapped rotated image with 10x10px rectangle at the center.');

ftBrot = abs(fftshift(fft2(Brot)));

colormap(map);
subplot(2,2,3)
image(ftBrot);
title('Non-Colormapped rotated image with 30x30px rectangle at the center.');

c=255/max(max(log(1+ftBrot)));
D2rot = c*log(1+ftBrot);

colormap(map);
subplot(2,2,4)
image(D2rot);
title('Colormapped rotated image with 30x30px rectangle at the center.');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 5

A2 = zeros(256,256);
B2 = zeros(256,256);

A2((256/4-5):(256/4+5),(256/4-5):(256/4+5))=255;
B2((256/4-15):(256/4+15),(256/4-15):(256/4+15))=255;

figure(12);
subplot(1,2,1)
imshow(A2);
title('Image with 10x10px relocated rectangle.')
subplot(1,2,2)
imshow(B2);
title('Image with 30x30px relocated rectangle.')

ftA2 = abs(fftshift(fft2(A2)));

figure(13);
colormap(map);
subplot(2,2,1);
image(ftA2);
title('Non-Colormapped image with 10x10px relocated rectangle.');

c=255/max(max(log(1+ftA2)));
D3 = c*log(1+ftA2);

colormap(map);
subplot(2,2,2);
image(D3);
title('Colormapped image with 10x10px relocated rectangle.');

ftB2 = abs(fftshift(fft2(B2)));

colormap(map);
subplot(2,2,3);
image(ftB2);
title('Non-Colormapped image with 30x30px relocated rectangle.');

c=255/max(max(log(1+ftB2)));
D4 = c*log(1+ftB2);

colormap(map);
subplot(2,2,4);
image(D4);
title('Colormapped image with 30x30px relocated rectangle.');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 6

Inew = histeq(I);

figure(14);
imshow(Inew);
title('Image after histogram equalization.');

ftInew = abs(fftshift(fft2(Inew)));

c=255/max(max(log(1+ftInew)));
t = c*log(1+ftInew);

figure(15);
colormap(map);
colormap(jet);
image(t);
title('Spectrum after histogram equalization.');