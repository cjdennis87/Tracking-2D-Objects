clear;
v = VideoReader('wiffleBalls.MOV');

figure(1);
prevFrame = read(v, 1);
[cPrev, rPrev] = imfindcircles(prevFrame, [15 65], 'Sensitivity', 0.82, 'edgethreshold', 0.03);
distmat = zeros(4, 4, v.NumberOfFrames);
imshow(prevFrame);
title(1);
viscircles(cPrev, rPrev);
errorframes = []

for f = 2:v.NumberOfFrames
    curFrame = read(v, f);
    [cCur, rCur] = imfindcircles(curFrame, [15 65], 'Sensitivity', 0.82, 'edgethreshold', 0.03);
    figure(1);
    hold on;
    imshow(curFrame);
    title(f);
    viscircles(cCur, rCur);
    if size(rCur) ~= 4
        errorframes = [errorframes f];
    end
    for i = 1:4
        for j = 1:4
            distmat(i, j, f) = (sqrt(((cCur(i, 1) - cPrev(j, 1))^2 + (cCur(i, 2) - cPrev(j, 2))^2)))/221;
        end
    end
    cPrev = cCur;
    rPrev = rCur;
end
