function [ w ] = GetWeight( circle )
%GETWEIGHT Summary of this function goes here
%   Detailed explanation goes here
n = size(circle,2);
w = zeros(n,n);

for i = 1 : n
    for j = 1 : n
       w(i,j) = calcweight(circle(:,i),circle(:,j));    
    end
    
end

end

