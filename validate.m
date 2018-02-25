predictedLabels = classify(trainedCNN,validImgs);

idx = randi(3000,[1 36]);
figure
for i = 1:numel(idx)
    subplot(6,6,i)
    I = readimage(validImgs,idx(i));
    label = predictedLabels(idx(i));
    imshow(I)
    title(char(label))
end