vocabList = [1];
vocabCount = [1];
path = './myDataset/spam/';  
list = dir(path);  
fileNum = size(list,1);  
fprintf('fileNum: %d\n',fileNum);  
  
% 遍历文件夹下的所有文件，因为dir获得的文件还包括. 和.. 所以i从3开始
for i = 3:fileNum,  
    filename = [path list(i).name];  
    email_contents = readFile(filename);  
    fprintf('%s\n',filename);  
    eContents = myProcessEmail(email_contents);  
    fid = fopen(strcat('./spam/spam',int2str(i),'.txt'),'wt');  
    fprintf(fid,'%s\n',eContents);
    fclose(fid);   
    % processed_contents = strtrim(eContents);  

    % fprintf('-----------size of processed_contents----------\n%d\n',length(processed_contents));  
    % fprintf('----------processed email----------\n');  
      
    % split_contents = regexp(processed_contents,'\s','split');     
      
  
    % for i = 1:length(split_contents),  
    %     isExist = 0;  
    %     for z = 1:length(vocabCount),  
    %         if strcmp(vocabList(2*z-1),split_contents(i))==1  
    %             vocabCount(z) = vocabCount(z)+1;  
    %             isExist = 1;  
    %             break;  
    %         end;  
    %     end;  
    %     if isExist == 0,  
    %         vocabList = [vocabList,' ',split_contents(i)];  
    %         vocabCount = [vocabCount 1];  
    %     end;  
          
    % end;      
  
    %fprintf('---------vocabList----------\n');   
    %disp(vocabList);  
    %fprintf('---------vocabCount----------\n');  
    %disp(vocabCount);  
          
  
    %fprintf('length of split words: %d\n', length(split_contents));  
    %fprintf('length of vocabList: %d\n', length(vocabList));  
    %fprintf('length of vocabCount: %d\n', length(vocabCount));  
    %fprintf('press enter to continue\n');  
  
end;  
  
  
% fprintf('----------build ordered list----------\n');  
% choosenList = ['1'];  
% for i = 1:length(vocabCount)  
%     if vocabCount(i) >= 100  
%         choosenList = [choosenList,' ',vocabList(2*i-1)];  
%     end;  
% end;  
  
  
% % 排序  
% choosenList = sort(choosenList);  
  
% % 去掉空格  
% spaceCount = 0;  
% for i = 1:length(choosenList),  
%     if strcmp(choosenList(i),' ')==1,  
%         spaceCount = spaceCount + 1;  
%     end;  
% end;  
% choosenList  = choosenList(:,(spaceCount+1:end));  
  
  
  
% fid = fopen('vocabn.txt','wt');  

% for i = 1:length(choosenList),  
%     fprintf(fid,'%d %s\n',i,choosenList{1,i});  
% end;  

% fclose(fid);  