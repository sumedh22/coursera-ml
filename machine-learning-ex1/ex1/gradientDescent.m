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