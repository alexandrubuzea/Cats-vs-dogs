function [J gradient] = cost_function(theta, X, y, lambda)
  [m, n] = size(X);
  
  % getting the weights

  [Theta_1 Theta_2] = roll_parameters(theta, n);
  
  % perform forward propagation

  a_1 = [ones(1, m); X'];
  z_2 = Theta_1 * a_1;
  a_2 = [ones(1, m); sigmoid(z_2)];
  z_3 = Theta_2 * a_2;
  a_3 = sigmoid(z_3); % our predictions
  
  % compute errors and perform backpropagation
  
  delta_3 = a_3 - y';
  delta_2 = (Theta_2' * delta_3) .* a_2 .* (1 - a_2);
  delta_2 = delta_2(2:end, :);
  
  % compute unregularized gradients

  Theta_grad_2 = 1 / m * delta_3 * a_2';
  Theta_grad_1 = 1 / m * delta_2 * a_1';
  
  % cost function + regularization
  J = -1 / m * sum(y' .* log(a_3) + (1 - y') .* log(1 - a_3));
  J += lambda / (2 * m) * sum(Theta_1(:, 2:end)(:) .^ 2);
  J += lambda / (2 * m) * sum(Theta_2(:, 2:end)(:) .^ 2);
  
  % add regularization term to the computed gradients

  Theta_grad_2(:, 2:end) += lambda / m * Theta_2(:, 2:end);
  Theta_grad_1(:, 2:end) += lambda / m * Theta_1(:, 2:end);

  % unrolling parameters into the final gradient
  gradient = [Theta_grad_1(:); Theta_grad_2(:)];

endfunction
