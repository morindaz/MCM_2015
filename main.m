
scale = 1;

theta = GetTheta(scale);

hold on;
rs = plotBoundary(theta,scale); %��ȡ�߽�

index = 10;
plot(rs(1,index),rs(2,index),'r+');

%��������б��
x1 = rs(:,index-1);
x2 = rs(:,index+1);
k = (x2(2)-x1(2))/(x2(1)-x1(1));

%������
line([rs(1,index) rs(1,index)+300],[rs(2,index) rs(2,index)+k*300]);
line([rs(1,index) rs(1,index)-300],[rs(2,index) rs(2,index)-k*300]);