function SAD = SAD_YCbCr(IMG1,IMG2)
IMG1=int16(rgb2ycbcr(IMG1));
IMG2=int16(rgb2ycbcr(IMG2));
SAD = sum(reshape(abs(IMG1(:,:,1) - IMG2(:,:,1)),[],1))/numel(IMG1);
end

