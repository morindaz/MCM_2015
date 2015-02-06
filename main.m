axis equal;
scale = 10; %尺度
search_radius = 1 ;%搜索半径

axis([-scale,scale,-scale,scale]);
axis equal;

theta = GetTheta(scale);

hold on;
rs = plotBoundary(theta,scale); %获取边界

index = 10;
plot(rs(1,index),rs(2,index),'r+');

%计算切线斜率
x1 = rs(:,index-1);
x2 = rs(:,index+1);
k = (x2(2)-x1(2))/(x2(1)-x1(1));

%画切线
line([rs(1,index) rs(1,index)+3*scale],[rs(2,index) rs(2,index)+k*3*scale]);
line([rs(1,index) rs(1,index)-3*scale],[rs(2,index) rs(2,index)-k*3*scale]);


[ circle ] = GetCircle(rs,rs(:,index),k,search_radius,theta);


axis([-scale,scale,-scale,scale]);