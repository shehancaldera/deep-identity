validImg = 'checkImg.jpg';
novelImg = 'novelImg.jpg';
otherImg = 'otherImg.jpg';
leo = 'leo.jpg';

img = imread(novelImg);
img = imresize(img,[227 227]);
figure()
imshow(img);
label = classify(trainedCNN,img)