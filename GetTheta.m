function [ theta ] = GetTheta(scale)

X = [ 0.2 0.2; -0.2 0.2 ; 0.2 -0.2;-0.2 -0.2; 0.6 0.5; -0.6 0.6;0.6 -0.6;-0.6 -0.6];
y = [ 1  1 1 1 0 0 0 0]';

X = X*scale;

X = mapFeature(X(:,1), X(:,2));

initial_theta = zeros(size(X, 2), 1);
lambda = 0.01;

options = optimset('GradObj', 'on', 'MaxIter', 10);
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunction(t, X, y, lambda)), initial_theta, options);


end

