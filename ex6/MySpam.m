load('TrainDataset');

fprintf('\nTraining GaussianKernel SVM (Spam Classification)\n')
fprintf('(this may take 1 to 2 minutes) ...\n')
X = XTrain(1:4000,:);
y= yTrain(1:4000,:);
XTest = XTrain(4001:,:);
yTest = yTrain(4001:,:);
C = 0.1;
model = svmTrain(XTrain, yTrain, C, @gaussianKernel);


%gaussianKernel

load('CVDataset')

p1 = svmPredict(model,XTrain);
fprintf('Training Accuracy on TrainingSet: %f\n', mean(double(p1 == yTrain)) * 100);

p = svmPredict(model, XCV);
fprintf('Training Accuracy on TestingSet: %f\n', mean(double(p == yCV)) * 100);