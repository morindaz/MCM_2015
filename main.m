
scale = 20; %³ß¶È
search_radius = 1 ;%ËÑË÷°ë¾¶

axis([-scale,scale,-scale,scale]);
axis equal;

theta = GetTheta(scale);




myrun( scale,search_radius,theta)