
scale = 20; %�߶�
search_radius = 1 ;%�����뾶

axis([-scale,scale,-scale,scale]);
axis equal;

theta = GetTheta(scale);




myrun( scale,search_radius,theta)