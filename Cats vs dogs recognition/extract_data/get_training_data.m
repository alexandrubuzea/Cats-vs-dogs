% Copyright Buzea Alexandru-Mihai-Iulian

clc; close all; clear;

% We need to introduce paths where are our training examples
disp('Use double quotes when introducing paths !');
cat_path = input('The path for cat training dataset: ');
dog_path = input('The path for dog training dataset: ');

% These are the default paths, if no paths are introduced.
% (These are the paths to the directories on my system, so you should
% introduce the desired paths on your system)

if length(cat_path) == 0
  cat_path = "~/Personal\ Projects/Cats\ vs\ dogs\ recognition/cats/training/";
endif

if length(dog_path) == 0
  dog_path = "~/Personal\ Projects/Cats\ vs\ dogs\ recognition/dogs/training/";
endif

X = []; % feature matrix
y = []; % label vector: 0 for cats, 1 for dogs

% We need to resize all images at the same dimensions, that's why we
% chose to resize all images as square images.
 
[X_tmp y_tmp] = get_data(cat_path);
X = [X; X_tmp];
y = [y; y_tmp];

[X_tmp, y_tmp] = get_data(dog_path);
X = [X; X_tmp];
y = [y; y_tmp];

[m, n] = size(X);

permutation = randperm(m);
X = X(permutation, :);
y = y(permutation);

save "training_data.mat" X y;