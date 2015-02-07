function [ cost ] = CalcCost( circle , index )
%CALCCOST Summary of this function goes here
%   Detailed explanation goes here

cost = 0;
n = size(index,1);

for i = 2 : n
    cost = cost + calcweight(circle(:,index(i-1)),circle(:,index(i)),circle(:,1));
end


end

