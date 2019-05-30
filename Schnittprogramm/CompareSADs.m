vid = VideoReader('Mustererkennung.avi');

numberOfFrames = vid.NumberOfFrames;
framerate = vid.FrameRate;
SAD_YCbCr_values = zeros(numberOfFrames,1);
SAD_Gray_values = zeros(numberOfFrames,1);
SAD_RGB_values = zeros(numberOfFrames,1);
tic
for i = 2:numberOfFrames
    current_frame = read(vid, i);
    prev_frame = read(vid, i-1);
    S = SAD_YCbCr(prev_frame, current_frame);
    SAD_YCbCr_values(i) = S;
    S = SAD_Gray(prev_frame, current_frame);
    SAD_Gray_values(i) = S;
    S = SAD_RGB(prev_frame, current_frame);
    SAD_RGB_values(i) = S;
end
toc

subplot(1,3,1);
stem(SAD_YCbCr_values,'*')
title('SAD YCbCr Komponente')
xlabel('Frame')
ylabel('SAD')
subplot(1,3,2);
stem(SAD_Gray_values,'*')
title('SAD Graustufenbild')
xlabel('Frame')
ylabel('SAD')
subplot(1,3,3);
stem(SAD_RGB_values,'*')
title('SAD RGB gemittelt')
xlabel('Frame')
ylabel('SAD')

figure
stem(SAD_YCbCr_values,'*')
Threshold = 13.8359;
line([0,numberOfFrames],[Threshold,Threshold])
title('SAD values')
xlabel('Frame')
ylabel('SAD')