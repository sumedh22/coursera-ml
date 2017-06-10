clear ; close all; clc

data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);
[m, n] = size(X);
initial_theta = zeros(n + 1, 1);
X = [ones(m, 1) X];

[cost, grad] = costFunction(initial_theta, X, y)