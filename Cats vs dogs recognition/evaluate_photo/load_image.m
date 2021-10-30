function [x] = load_image(filepath)
  
  % we want all the images to be of the same size, so we will
  % resize them using image package from Octave

  row = 300; col = 300; % our default values
  
  image = imread(filepath);
  image = double(image);
  
  image = imresize(image, [row, col]);
  image = round(image);
  
  length_z = size(image, 3);
  x = [];
  
  % if the image has more than 3 channels or it is grayscale

  if (length_z != 3)
    image = mean(image, 3);
    length_z = 1;
  endif

  for i=1:length_z
    channel = load_channel(image(:,:,i));
    x = [x; channel];
  endfor
  
  if (length_z == 1)
    x = [x; x; x];
  endif

  % return the feature vector as a column vector

  x = x';
endfunction
