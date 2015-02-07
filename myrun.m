function [ cost , res ] = myrun( scale,search_radius,theta)
%MYRUN Summary of this function goes here
%   Detailed explanation goes here

fprintf('========Begin========\n');
cost = [0 0];
[rs,u,v,z] = plotBoundary(theta,scale); %获取边界
%[rs,u,v,z] = CircleBoundary(theta,scale); %获取边界
%for p = 2 : size(rs,2)-1
for p = 14:14
    fprintf('%d\n',p);
    close all;
    axis equal;
    hold on;
    
    contour(u, v, z, [0, 0], 'LineWidth', 2);
    
    %计算切线斜率
    index = p;
    plot(rs(1,index),rs(2,index),'r+');
    x1 = rs(:,index-1);
    x2 = rs(:,index+1);
    k = (x2(2)-x1(2))/(x2(1)-x1(1));

    %画切线
    line([rs(1,index) rs(1,index)+3*scale],[rs(2,index) rs(2,index)+k*3*scale]);
    line([rs(1,index) rs(1,index)-3*scale],[rs(2,index) rs(2,index)-k*3*scale]);

    [ circle ] = GetCircle(rs,rs(:,index),k,search_radius,theta);

    axis([-scale,scale,-scale,scale]);

    [ index ] = Prime( circle );

    [ index ] = OptimAlgorithm( circle , index );

    cost(1) = CalcCost( circle , index ) + calcweight(circle(:,end),circle(:,1)) ;
    plot(circle(1,index),circle(2,index),'c-');

    %tt = 0;
    for i = 1 : size(circle,2)
        pos = find(index==i);
        tem = index(1:pos);
        res(1,i) = CalcCost( circle , tem );
        cost(2) =cost(2) + CalcCost( circle , tem );
    end
    cost(2) = cost(2) / size(circle,2);
    %fprintf('%.5f\n',tt/size(circle,2));
    %cost = cost + tt;
    pause(0.5);
end
end

