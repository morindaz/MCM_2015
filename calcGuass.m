function Z = calcGuass(XX,R)
X = XX(1,:);
Y = XX(2,:);
[X,Y]=meshgrid(X,Y);
t = (R/3).^2;
m1=0;m2=0;n1=t;n2=t;%%m1��m2Ϊ��ֵ,n1��n2Ϊ����
r = 0;
Z=(1/(2*pi*n1*n2*sqrt(1-r^2)))*exp((-1/2*(1-r^2))*((X-m1).^2/n1^2-2*r*(X-m1).*(Y-m2)/2*n1*n2+(Y-m2).^2/n2.^2));%%��ά��̬�ֲ�,Ҳ���Ǹ�˹�ֲ�
end
