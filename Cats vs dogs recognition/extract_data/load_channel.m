function channel = load_channel(image)
  [m, n] = size(image);
  length = 256;
  
  % using a number of counters in order to create the RGB histogram

  channel = zeros(length, 1);
  for i = 1:length
    channel(i) = sum(image(:) == (i - 1));
  endfor
  channel /= (m * n / length);
endfunction
