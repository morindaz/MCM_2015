function [ circle ] = GetCircle(Boundary,x,k,radius,theta)

circle = [searchArea(Boundary,x,atan(k),radius,theta)];

t = atan(-1/k);
step = [radius*cos(t)*2 radius*sin(t)*2]';
sx = x + step;
while CalcDis(Boundary,sx)<radius || (mapFeature(sx(1), sx(2))*theta > 0)
   circle = [circle searchArea(Boundary,sx,atan(k),radius,theta)];
   sx = sx + step;
end
sx = x - step;
while CalcDis(Boundary,sx)<radius || (mapFeature(sx(1), sx(2))*theta > 0)
   circle = [circle searchArea(Boundary,sx,atan(k),radius,theta)];
   sx = sx - step;
end

end

function res = searchArea(Boundary,x,t,radius,theta)
   res = x;
   circle(x,radius);
   step = [radius*cos(t)*2 radius*sin(t)*2]';
   sx = x+step;
   while CalcDis(Boundary,sx)<radius || (mapFeature(sx(1), sx(2))*theta > 0)
       circle(sx,radius);
       res = [res sx];
       sx = sx + step;
   end
   
   sx = x - step;
   while CalcDis(Boundary,sx)<radius || (mapFeature(sx(1), sx(2))*theta > 0)
       circle(sx,radius);
       res = [res sx];
       sx = sx - step;
   end
end

function dis = CalcDis(Boundary,x)

X = repmat(x,1,size(Boundary,2));
X = (X - Boundary).^2;
X = sqrt(sum(X));
[dis,index] = min(X);
end

function circle(X,R)
b = R/tan(atan(1));
rectangle('Position',[X(1)-b,X(2)-b,2*b,2*b],'Curvature',[1,1], 'EdgeColor','r')


end