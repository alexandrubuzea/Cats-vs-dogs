% Copyright Buzea Alexandru-Mihai-Iulian

clc; close all; clear;

% introduce the paths for CV examples

disp('Use double quotes when introducing paths !');
cat_path_CV = input('The path for cat cross-validation dataset: ');
dog_path_CV = input('The path for dog cross-validation dataset: ');

% default paths:

if length(cat_path_CV) == 0
  cat_path_CV = "~/Personal\ Projects/Cats\ vs\ dogs\ recognition/cats/CV/";
endif

if length(dog_path_CV) == 0
  dog_path_CV = "~/Personal\ Projects/Cats\ vs\ dogs\ recognition/dogs/CV/";
endif

X_cv = [];
y_cv = [];

% extracting data from the two directories

[X_tmp, y_tmp] = get_data(cat_path_CV);
X_cv = [X_cv; X_tmp];
y_cv = [y_cv; y_tmp];

[X_tmp, y_tmp] = get_data(dog_path_CV);
X_cv = [X_cv; X_tmp];
y_cv = [y_cv; y_tmp];

% shuffle the CV examples

[m_cv n_cv] = size(X_cv);
permutation_cv = randperm(m_cv);
X_cv = X_cv(permutation_cv, :);
y_cv = y_cv(permutation_cv);

save "CV_data.mat" X_cv y_cv