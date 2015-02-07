function out = mapFeature(X1, X2)
%{
degree = 3;

out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

%}
out = [ X1.^2   X2.^2 ones(size(X1,1),1)];

end