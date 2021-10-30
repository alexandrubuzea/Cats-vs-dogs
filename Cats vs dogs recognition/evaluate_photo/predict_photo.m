function y = predict_photo(filepath)
  x = load_image(filepath);
  
  load ../nn_src/parameters.mat;
  y = round(forward_propagation(optimal_theta, x));
  
  if y == 0
    disp(['The photo shows a cat.']);
  else
    disp(['The photo shows a dog.']);
  endif
endfunction
