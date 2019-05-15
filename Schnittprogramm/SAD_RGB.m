function SAD = SAD_RGB(IMG1,IMG2)
IMG1=int16(IMG1);
IMG2=int16(IMG2);
SAD_R = sum(reshape(abs(IMG1(:,:,1) - IMG2(:,:,1)),[],1));
SAD_G = sum(reshape(abs(IMG1(:,:,2) - IMG2(:,:,2)),[],1));
SAD_B = sum(reshape(abs(IMG1(:,:,3) - IMG2(:,:,3)),[],1));
SAD = (SAD_R + SAD_G + SAD_B)/(3*numel(IMG1));
end

