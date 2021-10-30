function [Theta] = initialize_weights(epsilon, rows, cols)
  % initializing the weights for our neural ntwork so that the mean
  % value of weights to be 0

  Theta = 2 * epsilon * rand(rows, cols) - epsilon;
endfunction
