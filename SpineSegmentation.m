clear;
clc;
A = imread('image5.jpg');
A = rgb2gray(A);
B = adapthisteq(A);
C = imgaussfilt(B, 2);  
threshold=90;
figure, imshow(A,[]); 
[y,x] = getpts; 
x = round(x);
y = round(y);
seed = C(x,y);
[rows, cols] = size(C);
D = ones(size(A));
for i = 1:rows
    for j = 1:cols
        pixel = C(i,j);
        difference = abs(seed - pixel);
        if(difference < threshold)
            D(i,j) = pixel;
        end
    end
end
D = uint8(D);
figure, imshow(D)
E = D>=180;
figure, imshow(E)
figure, imshow(im2double(C)+E)
figure, imcontour(D,[190,255])
