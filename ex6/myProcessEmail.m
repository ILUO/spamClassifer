function contents = myProcessEmail(email_contents)  
  
  
contents = [];  
  
% load vocabulary  
vocabList = getVocabList();  
  
fprintf('\n==== Processing Email ====\n\n');  
  
% 去掉邮件头  
hdrstart = strfind(email_contents,([char(10) char(10)]));  
email_contents = email_contents(hdrstart(1):end);  
  
  
% 改为小写  
email_contents = lower(email_contents);  
  
% 去掉html  
email_contents = regexprep(email_contents,'<[^<>]+>',' ');  
  
% 处理数字  
email_contents = regexprep(email_contents,'[0-9]+', 'number');  
  
% 处理网址  
email_contents = regexprep(email_contents,'(http|https)://[^\s]*', 'httpaddr');  
  
% 处理邮箱地址  
email_contents = regexprep(email_contents,'[^\s]+@[^\s]+', 'emailaddr');  
  
% 处理$  
email_contents = regexprep(email_contents,'[$]+','dollar');  
  
while ~isempty(email_contents)  
    [str, email_contents] = strtok(email_contents,[' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);  
  
    str = regexprep(str, '[^a-zA-Z0-9]', '');  
  
    try str = porterStemmer(strtrim(str));  
    catch str = '';continue;  
    end;  
  
    if length(str)<1  
        continue;  
    end;  
      
    contents = [contents,' ',str];  
  
    % for z = 1:length(vocabList),  
    %   if strcmp(str,vocabList(z))==1  
    %       word_indices = [word_indices;z];  
    %  
    %   end;  
    %end;  
  
end;  
  
