function [predictions] = forward_propagation(theta, X)
  [m, n] = size(X);
  
  [Theta_1 Theta_2] = roll_parameters(theta, n);
  
  % get the activations - forward propagation

  a_1 = [ones(1, m); X'];
  z_2 = Theta_1 * a_1;
  a_2 = [ones(1, m); sigmoid(z_2)];
  z_3 = Theta_2 * a_2;
  a_3 = sigmoid(z_3);

  predictions = a_3;

endfunction
