%This is the training for self face detection.
%Loads the augmented images as an Image datastore.
%Changes the last layers of the inception to make the binary
%classification.

%Author: Shehan Caldera

%Folder containing images
imDir = 'C:\Users\Shehan Caldera\Pictures\deepID data\Augmented';

%Matlab image datastore for all images
img_data = imageDatastore(imDir,'IncludeSubfolders',true,'LabelSource','foldernames');

%Splitting images for training and testing in random order
[trainImgs,validImgs] = splitEachLabel(img_data,0.7,'randomized');

%Show a sample of training images
numTrainImgs = numel(trainImgs.Labels);
idx = randperm(numTrainImgs,16);
figure
for i = 1:16
    subplot(4,4,i)
    I = readimage(trainImgs,idx(i));
    imshow(I)
end

%Select the neural network
deep_net = alexnet;

%Last few layers needs fine-tuning
pretarainedInceptionNet = deep_net.Layers(1:end-3);

numLabels = numel(categories(trainImgs.Labels));
fineTunedInception = [
    pretarainedInceptionNet
    fullyConnectedLayer(numLabels,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];

%Training Options, Uses SGDM
miniBatchSize = 10;
numIterationsPerEpoch = floor(numel(trainImgs.Labels)/miniBatchSize);
trainOptions = trainingOptions('sgdm',...
    'MiniBatchSize',miniBatchSize,...
    'MaxEpochs',4,...
    'InitialLearnRate',1e-4,...
    'Verbose',false,...
    'Plots','training-progress',...
    'ValidationData',validImgs,...
    'ValidationFrequency',numIterationsPerEpoch);

trainedCNN = trainNetwork(trainImgs,fineTunedInception,trainOptions);



