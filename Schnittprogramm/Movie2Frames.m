vid = VideoReader('DBSnippet2.avi');
i=1;
while hasFrame(vid)
   frame = readFrame(vid); 
   imwrite(frame, strcat('DBFrames\frame',num2str(i),'.png'));
   i = i+1;
end