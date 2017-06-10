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