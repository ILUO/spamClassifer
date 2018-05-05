function [X,y] = geneFeatures(dataPath,spamPath,hamPath)

spamPath = strcat(dataPath,spamPath);
hamPath = strcat(dataPath,hamPath);

spamList = dir(spamPath);
hamList = dir(hamPath);  
spamFileNum = size(spamList,1);  
hamFileNum = size(hamList,1); 
spamX = zeros(spamFileNum,2001);
hamX = zeros(hamFileNum,2001);

for i = 3:spamFileNum,  
    fprintf('%d\n',i);
    filename = [spamPath spamList(i).name];  
    email_contents = readFile(filename);  
    word_indices  = processEmail(email_contents);
    features      = emailFeatures(word_indices);
    spamX(i,:) = [features' 1];
end;



for i = 3:hamFileNum,  
    fprintf('%d\n',i);
    filename = [hamPath hamList(i).name];  
    email_contents = readFile(filename);  
    word_indices  = processEmail(email_contents);
    features      = emailFeatures(word_indices);
    hamX(i,:) = [features' 0];
end;

X = [hamX;spamX];
rowrank = randperm(size(X, 1));
Xy = X(rowrank, :)
X = Xy(:,1:2000);
y = Xy(:,2001);