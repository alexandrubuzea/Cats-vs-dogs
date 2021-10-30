function [Theta_1 Theta_2] = roll_parameters(theta, n)
  k = 40;
  
  % getting the matrices in order to perform forward propagation

  Theta_1 = reshape(theta(1:(k * (n + 1))), k, n + 1);
  Theta_2 = reshape(theta((k * (n + 1) + 1):end), 1, k + 1);

endfunction
