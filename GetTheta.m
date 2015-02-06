function [ theta ] = GetTheta(scale)

X = [ ];
y = [ ]';
for k = 0.1 :0.1: 0.4
    X =[X; k k;k -k;-k k;-k -k;0 k*1.4;0,-k*1.4;-k*1.4,0;k*1.4 0];
    y =[y;1 ;1 ;1; 1;1;1;1;1];
end
for k = 0.6 :0.1: 0.9
    X =[X; k k;k -k;-k k;-k -k;0 k;0,-k;-k,0;k 0];
    y =[y;0 ;0 ;0; 0;0;0;0;0];
end


X = X*scale;

X = mapFeature(X(:,1), X(:,2));

initial_theta = zeros(size(X, 2), 1);
lambda = 0.8;

options = optimset('GradObj', 'on', 'MaxIter', 100);
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunction(t, X, y, lambda)), initial_theta, options);


end

