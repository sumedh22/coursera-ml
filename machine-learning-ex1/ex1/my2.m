clear ; close all; clc
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);


%Normalize features
function [X_norm, mu, sigma] = featureNormalize(X)
  X_norm = X;
  [n,m]=size(X);
  for i=1:m
    mu = mean(X(:,i));
    X_norm(:,i) = X_norm(:,i) - mu;
    sigma = std(X(:,i));
    X_norm(:,i) = X_norm(:,i) /sigma;
  end
end


[X mu sigma] = featureNormalize(X);

X = [ones(m, 1) X];

alpha = 0.01;
num_iters = 400;
theta = zeros(3, 1);

function J = computeCostMulti(X, y, theta)
  m = length(y); % number of training examples
  J = ((X*theta-y).'*(X*theta-y))/m;
end


function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
[n,m]=size(X);
J_history = zeros(num_iters, 1);
A= (alpha / m);
temp = zeros(m, 1);
for iter = 1:num_iters
    for i=1:m
      temp(i) = theta(i) - A*sum((X*theta - y).*X(:,i));
    end
    for i=1:m
      theta = temp;
    end
    J_history(iter) = computeCostMulti(X, y, theta);

end
end


theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);
theta
function [theta] = normalEqn(X, y)
theta = inv(X.'*X)*X.'*y;
end

[theta]=normalEqn(X, y);
theta


