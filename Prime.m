function [ index ] = Prime( circle )
%PRIME Summary of this function goes here
%   Detailed explanation goes here
n = size(circle,2);
w = GetWeight(circle);

index = 1; %��һ��Ȧ
w(:,1) = 1e20;
for i = 1 : n-1
    [c,p] = min(w(index(i),:));
    index = [index; p];
    w(:,p) = 1e20;
end
 %index = [index; 1]; %��·

end

