%% define the image name
im = imread('image1.jpg');
%% define the number of eigenvalue remain
Neig = 100;

%% newim = double(rgb2gray(im));
[height, width] = size(newim);
[V, D] = eig(newim);
Dmax50 = reshape(D, [height * width, 1]);
Dnew50 = zeros(size(Dmax50));
for i = 1: Neig,
    [M, I] = max(Dmax50);
    Dnew50(I) = Dmax50(I) ;
    Dmax50(I) = 0;
end
newD = reshape(Dnew50, [height, width]);
restore = uint8(V*newD*inv(V));
imshow(restore);