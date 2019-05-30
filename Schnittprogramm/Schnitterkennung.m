vid = VideoReader('Mustererkennung.avi');

f1 = read(vid, 1);
f2 = read(vid, 2);
f3 = read(vid, 300);
ECR(f2, f3)

numberOfFrames = vid.NumberOfFrames;

SAD_values = zeros(numberOfFrames,1);

for i = 2:numberOfFrames
    current_frame = read(vid, i);
    prev_frame = read(vid, i-1);
    S = SAD_YCbCr(prev_frame, current_frame);
    SAD_values(i) = S;
    if S > 15 
        disp(i)
    end
end
stem(SAD_values,':*r')
title('SAD Values')
