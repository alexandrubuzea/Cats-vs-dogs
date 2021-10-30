function [X, y] = get_data(directory_path)
  list = dir(directory_path);
  num = length(list);
  
  X = [];
  y = [];
  
  % we will assume that the given directory contains only
  % images (with appropriate names, such as cat(sth).jpg)
  % and directories (which will be excluded).

  for i=1:num
    if list(i).isdir == 1
      continue;
    endif
    
    filename = list(i).name;
    filepath = [directory_path, filename];
    x = load_image(filepath);
    X = [X; x];
    
    if length(strfind(filename, 'cat')) >= 1
      y = [y; 0];
    endif
    
    if length(strfind(filename, 'dog')) >= 1
      y = [y; 1];
    endif
    
    disp(['Another one !', num2str(i)]);
  endfor
  
endfunction
