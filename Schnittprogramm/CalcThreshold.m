vid = VideoReader('Mustererkennung.avi');

numberOfFrames = vid.NumberOfFrames;
framerate = vid.FrameRate;
SAD_values = zeros(numberOfFrames,1);

cuts = java.util.LinkedList;
nocuts = java.util.LinkedList;

for i = 2:numberOfFrames
    current_frame = read(vid, i);
    prev_frame = read(vid, i-1);
    SAD = SAD_YCbCr(prev_frame, current_frame);
    SAD_values(i) = SAD;
    
    if SAD > 15 
        cuts.add(SAD);
    else
        nocuts.add(SAD);
    end
end

%Java LinkedList to Matlab Matrix 
cuts = cell2mat(cell(cuts.toArray(cuts)));
nocuts = cell2mat(cell(nocuts.toArray(nocuts)));

%Threshold berechnen
S = (min(cuts)+max(noncuts))/2


