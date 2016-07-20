clear;clc;
files = dir('imgs\*.tif');
for i=1:length(files)
    X = imread(['imgs\',files(i).name]);
    X = rgb2gray(X);
    imwrite(X,['gray\',files(i).name(1:end-4),'.png'],'png');
end