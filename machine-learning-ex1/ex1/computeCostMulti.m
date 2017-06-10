function J = computeCostMulti(X, y, theta)
  m = length(y); % number of training examples
  J = ((X*theta-y).'*(X*theta-y))/m;
end