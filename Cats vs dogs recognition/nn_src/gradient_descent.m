function [theta J] = gradient_descent(X, y, initial_theta, lr, lambda, max_steps)
  m = size(X, 1);

  % an example of Gradient Descent algorithm (not recommended to use this
  % code over CG, because it will converge very slowly)

  theta = initial_theta;
  for i = 1:max_steps
    [J grad] = cost_function(theta, X, y, lambda);

    % learning rate changes over time in order to accelerate convergence
    ler = lr / (5000 + 0.8 * i);
    theta = theta - ler / m * grad;
    err = norm(grad);
    if err < 1e-5
      return;
    endif
  endfor

endfunction
