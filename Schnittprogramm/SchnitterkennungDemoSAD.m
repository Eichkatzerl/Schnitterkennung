vid = VideoReader('Mustererkennung.avi');
txt = "";

numberOfFrames = vid.NumberOfFrames;
SAD_values = zeros(numberOfFrames,1);

Cuts = java.util.LinkedList;
CutsIterator = Cuts.listIterator;
NonCuts = java.util.LinkedList;
NonCutsIterator = NonCuts.listIterator;

CutsIterator.add(2)

for i = 2:numberOfFrames
    current_frame = read(vid, i);
    prev_frame = read(vid, i-1);
    S = SAD_YCbCr(prev_frame, current_frame);
    SAD_values(i) = S;
    
    subplot(1,2,1);
    imshow(current_frame)

    subplot(1,2,2);
    stem(SAD_values,'*')
    if S > 15 
         txt = txt + sprintf('Schnitt bei %s s nach Frame %s\n',num2str(i/30), num2str(i-1));
    end
    title(txt)
    xlabel('Frame')
    ylabel('SAD')
end


