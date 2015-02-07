function [C,u,v,z] = CircleBoundary(theta,scale )
%CIRCLEBOUNDARY Summary of this function goes here
%   Detailed explanation goes here

r = 0.2*scale;

u = linspace(-1, 1, 50)*scale;
v = linspace(-1, 1, 50)*scale;
[uu,vv] = meshgrid(u,v);

z = uu.^2+vv.^2-r.^2
[C,h]=contour(u, v, z, [0, 0], 'LineWidth', 2);

end

