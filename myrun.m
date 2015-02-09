function [ cost , res ] = myrun( scale,search_radius,theta,R)
%MYRUN Summary of this function goes here
%   Detailed explanation goes here

fprintf('========Begin========\n');

[rs,u,v,z] = plotBoundary(theta,scale); %获取边界
res.u = u;
res.v = v;
res.z = z;
res.rs = rs;
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
    res.p=p;
    plot(rs(1,index),rs(2,index),'r+');
    x1 = rs(:,index-1);
    x2 = rs(:,index+1);
    k = (x2(2)-x1(2))/(x2(1)-x1(1));

    %画切线
    line([rs(1,index) rs(1,index)+3*scale],[rs(2,index) rs(2,index)+k*3*scale]);
    line([rs(1,index) rs(1,index)-3*scale],[rs(2,index) rs(2,index)-k*3*scale]);

    [ circle  ] = GetCircle(rs,rs(:,index),k,search_radius,theta);

    
    
    [myc ks] = divideCircle( circle , rs(:,index) ,k,scale , 3 );
    res.circles = myc;
    res.ks = ks;
    for h = 1 : length(myc)  
        circle = res.circles{h};
        di = sqrt(sum((circle-repmat([0;0],1,size(circle,2))).^2));
        [c,ii] = min(di);

        %选起点
        ii = 1;
        tv = circle(:,ii);
        circle(:,ii) = circle(:,1);
        circle(:,1) = tv;
        plot(circle(1,1),circle(2,1),'b*');

        res.circle = circle;

        axis([-scale,scale,-scale,scale]);

        [ index ] = Prime( circle );
        res.old_index{h} = index;
        cost{h}(1) = CalcCost( circle , index ) ;
        [ index ] = OptimAlgorithm( circle , index );

        res.index{h} = index;

        cost{h}(2) = CalcCost( circle , index ) ;%+ calcweight(circle(:,end),circle(:,1),circle(:,1)) ;
        plot(circle(1,index),circle(2,index),'c-.','LineWidth',1.6);

        cost{h}(3) = 0;
        %su = 0;
        for i = 1 : size(circle,2)
            pos = find(index==i);
            tem = index(1:pos);
             cost{h}(3) =cost{h}(3) + CalcCost( circle , tem );
           % cost(3) =cost(3) + CalcCost( circle , tem )*calcGuass(circle(:,pos),R);
            %su = su + calcGuass(circle(:,pos),R);
        end
       % cost(3) = cost(3) / su;
        cost{h}(3) = cost{h}(3) / size(circle,2);
        %fprintf('%.5f\n',tt/size(circle,2));
        %cost = cost + tt;
    end
end
end

