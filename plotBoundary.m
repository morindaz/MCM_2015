function [C,u,v,z] = plotBoundary(theta,scale)

u = linspace(-1, 1, 50)*scale;
v = linspace(-1, 1, 50)*scale;

z = zeros(length(u), length(v));

for i = 1:length(u)
    for j = 1:length(v)
        z(i,j) = mapFeature(u(i), v(j))*theta;
    end
end
z = z'; 
[C,h]=contour(u, v, z, [0, 0], 'LineWidth', 2);

end
