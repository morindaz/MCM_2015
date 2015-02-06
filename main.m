axis equal;
scale = 15; %�߶�
search_radius = 1 ;%�����뾶

axis([-scale,scale,-scale,scale]);
axis equal;

theta = GetTheta(scale);

hold on;
rs = plotBoundary(theta,scale); %��ȡ�߽�

index = 12;
plot(rs(1,index),rs(2,index),'r+');

%��������б��
x1 = rs(:,index-1);
x2 = rs(:,index+1);
k = (x2(2)-x1(2))/(x2(1)-x1(1));

%������
line([rs(1,index) rs(1,index)+3*scale],[rs(2,index) rs(2,index)+k*3*scale]);
line([rs(1,index) rs(1,index)-3*scale],[rs(2,index) rs(2,index)-k*3*scale]);


[ circle ] = GetCircle(rs,rs(:,index),k,search_radius,theta);

axis([-scale,scale,-scale,scale]);

[ index ] = Prime( circle );
[ index ] = OptimAlgorithm( circle , index );

plot(circle(1,index),circle(2,index),'c-');
CalcCost( circle , index )