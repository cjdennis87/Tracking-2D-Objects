clear;

load im30; %loads image

figure(2); %displays and formats display of image
clf;
imshow(im30);
hold on;
axis on;

[c r] = imfindcircles(im30, [15 65], 'Sensitivity', 0.8, 'edgethreshold', 0.05);
viscircles(c, r);

distmat = zeros(4, 4);

for i = 1:4 %this loop creates the distance matrix
    for j = 1:4
        distmat(i, j) = (sqrt(((c(i, 1) - c(j, 1))^2 + (c(i, 2) - c(j, 2))^2)))/221; %221 is the number of pixels per foot
    end
end

minDist = distmat(1, 2);
maxDist = 0;

for i = 1:4 %this loop finds the min and max values
    for j = 1:4
        if distmat(i, j) > maxDist
            maxDist = distmat(i, j);
        end
        if distmat(i, j) < minDist && distmat(i, j) ~= 0
            minDist = distmat(i, j);
        end
    end
end


distmat %displays the distance matrix
maxDist
minDist
