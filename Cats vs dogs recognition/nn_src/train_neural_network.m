% Copyright Buzea Alexandru-Mihai-Iulian

% training a neural network with one hidden layer

clc; close all; clear;

% loading the data and the cross-validation data

load ../extract_data/training_data.mat;
load ../extract_data/CV_data.mat;

[m, n] = size(X);
[m_cv n_cv] = size(X_cv);

k = 40;

epsilon = 1e-2;

% initializing of the two matrices

Theta_1 = initialize_weights(epsilon, k, n + 1);
Theta_2 = initialize_weights(epsilon, 1, k + 1);

initial_theta = [Theta_1(:); Theta_2(:)];

% we have over 30000 parameters in our network, so a large number
% of steps is required

max_steps = 2000;

options = optimset('GradObj', 'on', 'MaxIter', max_steps);

% this value for lambda was chosen in order to have a reasonable
% performance gap between training vs CV data prediction

lambda = 40;

% optimizing our function using Conjugate Gradient

cf = @(theta)cost_function(theta, X, y, lambda);
[optimal_theta cost] = fmincg(cf, initial_theta, options);

% evaluating the performance on training set

pred = forward_propagation(optimal_theta, X);
pred = round(pred);
accuracy = 1 - (sum(abs(pred - y')) / m);
   
disp(['Accuracy on training set: ', num2str(round(accuracy * 100)), '%']);

% evaluating the performance on CV set

pred_cv = forward_propagation(optimal_theta, X_cv);
pred_cv = round(pred_cv);
   
accuracy_cv = 1 - (sum(abs(pred_cv - y_cv')) / m_cv);
   
disp(['Accuracy on CV set: ', num2str(round(accuracy_cv * 100)), '%']);

% save the obtained parameter optimal_theta for further use

save "parameters.mat" optimal_theta
