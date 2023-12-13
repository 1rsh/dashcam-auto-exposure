clc;
clear all;
close all;

im_path = fullfile('sample.jpg');

img = imread(im_path);

transform = img_transform;

% processed = transform.histogram_equalisation(img, 1);

processed = transform.cla_histogram_equalisation(img, [8 8], 1);