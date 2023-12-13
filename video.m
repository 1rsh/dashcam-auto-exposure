clc;
clear all;
close all;

videoFile = 'sample.mp4';
videoReader = VideoReader(videoFile);

outputFile = 'output_video.mp4';
videoWriter = VideoWriter(outputFile, 'MPEG-4');
open(videoWriter);

transform = img_transform;

while hasFrame(videoReader)
    frame = readFrame(videoReader);
    
    correctedFrame = transform.cla_histogram_equalisation(frame, [8 8], 0);
    
    writeVideo(videoWriter, correctedFrame);
end

close(videoWriter);

disp('Exposure correction completed.');