function geneTxt(dataPath,folderName)
list = dir(dataPath);  
fileNum = size(list,1);  
fprintf('fileNum: %d\n',fileNum);  
  
% 遍历文件夹下的所有文件，因为dir获得的文件还包括. 和.. 所以i从3开始
for i = 3:fileNum,  
    filename = [dataPath list(i).name];  
    email_contents = readFile(filename);  
    fprintf('%s\n',filename);  
    eContents = myProcessEmail(email_contents);  
    fid = fopen(strcat('./myDataset/',folderName,'/',int2str(i),'.txt'),'wt');  
    fprintf(fid,'%s\n',eContents);
    fclose(fid);   
end;