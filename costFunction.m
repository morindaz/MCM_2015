function [J, grad] = costFunction(theta, X, y, lambda)


% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));



h =1./(1+exp(-(X*theta)));
n = size(theta,1);
J = sum(-y'*log(h)-(ones(m,1)-y)'*log(1-h))./m;
J = J + lambda/(2*m)*theta(2:n)'*theta(2:n);

grad = (((h-y)'*X)./m)'+lambda./m*theta;
grad(1) =  grad(1) - lambda./m*theta(1);

% =============================================================

end
