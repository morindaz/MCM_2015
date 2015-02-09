function [ circles ,ks] = divideCircle( circle , X ,k,scale , num )
%DIVIDECIRCLE Summary of this function goes here
%   Detailed explanation goes here
N = size(circle,2)/num;
ang = atan(k)+pi;
pre = 0;
for i = 1 : num -1
    l = ang; r = ang+pi;
    while abs(r-l)>1e-2
       mid = (l+r)/2;
      
       index = getcnt(circle , X ,tan(mid),scale);
       if sum(index)<= N*i
           l = mid;
       else
           r = mid;
       end
    end
    tt = logical(index - pre);
    tt(1) = 1;
    circles{i} = circle(:,tt);
    l = (l+r)/2;
    ks(i) = tan(l);
    line([X(1) X(1)+3*scale],[X(2) X(2)+tan(l)*3*scale]);
    line([X(1) X(1)-3*scale],[X(2) X(2)-tan(l)*3*scale]);
    pre = index;
end
   tt = logical(1 - pre);
   tt(1) = 1;
   circles{num} = circle(:,tt);
end

function [index] = getcnt(circle , X ,k,scale)

%X = X + scale;
%circle = circle + scale;

b  = X(2)-X(1)*k;
res = circle'*[k ;-1] + b;
index = (res*([-scale -scale]*[k;-1] +b ))>=0;
end

