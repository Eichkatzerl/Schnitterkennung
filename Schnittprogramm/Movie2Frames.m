vid = VideoReader('MustererkennungTestdaten.avi');
i=1;
while hasFrame(vid)
   frame = readFrame(vid); 
   imwrite(frame, strcat('Frames2\frame',num2str(i),'.png'));
   i = i+1;
end