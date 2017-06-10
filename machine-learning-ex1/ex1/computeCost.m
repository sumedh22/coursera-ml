function J = computeCost(x, y ,theta)
  J=sum((x*theta - y).^2) / (2*length(y));
end