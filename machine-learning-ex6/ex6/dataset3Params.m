function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


i = 0.01;
j = 0.01;
erro = 100000;
erro_aux = 0;
while(i <= 30),

  while(j <= 30),
  
    model = svmTrain(X, y, i, @(x1, x2) gaussianKernel(x1, x2, j));
    predictions = svmPredict(model, Xval);
    erro_aux = mean(double(predictions ~= yval));
    if(erro_aux < erro),
      erro = erro_aux;
      C = i;
      sigma = j;
    endif
    j = j*3;
    if j == 0.09,
      j = 0.1;
    endif
    if j == 0.9,
      j = 1;
    endif
    if j == 9,
      j = 10;
    endif
    
  endwhile
  j = 0.01;
  i = i*3;
  if i == 0.09,
    i = 0.1;
  endif
  if i == 0.9,
    i = 1;
  endif
  if i == 9,
    i = 10;
  endif
  
endwhile




% =========================================================================

end
