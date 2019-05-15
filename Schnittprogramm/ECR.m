function ECR = ECR(IMG1, IMG2)

IMG1 = rgb2gray(IMG1);
IMG2 = rgb2gray(IMG2);

edge1 = edge(IMG1, 'canny');
edge2 = edge(IMG1, 'canny');

sharedEdges = (edge1 & edge2);

ECR = sum(reshape(sharedEdges,[],1));

end

