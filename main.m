
scale = 1;

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
line([rs(1,index) rs(1,index)+300],[rs(2,index) rs(2,index)+k*300]);
line([rs(1,index) rs(1,index)-300],[rs(2,index) rs(2,index)-k*300]);
