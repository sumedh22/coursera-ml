clear ; close all; clc
data = load('ex1data1.txt');
X= data(:,1);
y = data(:, 2);
m = length(y); 

%1. plot data
function plotData(x,y)
figure;
plot(x, y, 'rx', 'MarkerSize', 10); % Plot the data
ylabel('Profit in $10,000s'); % Set the y??axis label
xlabel('Population of City in 10,000s'); % Set the x??axis label
end

%plotData(X,y);
%2. computing cost function
X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters



function J = computeCost(x, y ,theta)
  J=sum((x*theta - y).^2) / (2*length(y));
end

computeCost(X, y, theta)

%3. gradient descent
function [theta, J_history] = gradient(x, y, theta, alpha, num_iters)
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
A= (alpha / m);
for iter = 1:num_iters
  temp1 = theta(1) - A*sum((x*theta - y).*x(:,1));
  temp2 = theta(2) - A*sum((x*theta - y).*x(:,2));

  theta(1)=temp1;
  theta(2)=temp2; 
  J_history(iter) = computeCost(x, y, theta);
end
end

% Some gradient descent settings
iterations = 1500;
alpha = 0.01;

theta = gradient(X, y,theta, alpha, iterations);
theta



