function [ index ] = OptimAlgorithm( circle , index )
%OPTIMALGORITHM Summary of this function goes here
%   Detailed explanation goes here

while true
    [i,j] = findij(circle,index);
    if i<0
       break;
    end
    temp = flip(index(i+1:j));
    
    index = [index(1:i);temp;index(j+1:end)];
end

end

function [a,b] = findij(circle,index)
n = size(circle,2);
flag = 0;
for i = 1 : n-2 
    for j = i+1 : n-1
        w_ij = calcweight(circle(:,index(i)),circle(:,index(j)),circle(:,1));
        w_ipjp = calcweight(circle(:,index(i+1)),circle(:,index(j+1)),circle(:,1));
        w_ip = calcweight(circle(:,index(i)),circle(:,index(i+1)),circle(:,1));
        w_jp = calcweight(circle(:,index(j)),circle(:,index(j+1)),circle(:,1));
        if  w_ij + w_ipjp < w_ip + w_jp
           a=i;
           b=j;
           flag = 1;
           break;
        end
    end
   if flag == 1
       break;
   end  
end

if flag == 0
a= -1;
b= -1;
end

end

