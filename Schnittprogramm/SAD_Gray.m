function SAD = SAD_Gray(IMG1,IMG2)
IMG1=int16(rgb2gray(IMG1));
IMG2=int16(rgb2gray(IMG2));
SAD = sum(reshape(abs(IMG1(:,:) - IMG2(:,:)),[],1))/numel(IMG1);
end



