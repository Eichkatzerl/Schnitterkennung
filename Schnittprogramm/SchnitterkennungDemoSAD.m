vid = VideoReader('MustererkennungTestdaten2.avi');
txt = "";

numberOfFrames = vid.NumberOfFrames;
framerate = vid.FrameRate;
SAD_values = zeros(numberOfFrames,1);
tic
figure('NumberTitle', 'off', 'Name', 'Schnitterkennung');
for i = 2:numberOfFrames
    current_frame = read(vid, i);
    prev_frame = read(vid, i-1);
    S = SAD_YCbCr(prev_frame, current_frame);
    SAD_values(i) = S;
    
    subplot(1,2,1);
    image(current_frame)

    subplot(1,2,2);
    stem(SAD_values,'*')
    
    Threshold = 13.8359;
    line([0,numberOfFrames],[Threshold,Threshold])
    if S > Threshold 
         txt = txt + sprintf('Schnitt bei %s s nach Frame %s\n',num2str(i/framerate), num2str(i-1));
    end
    title(txt)
    xlabel('Frame')
    ylabel('SAD')
end
toc


