
rec = zeros(0,3);
for search_radius = 0.20:0.05:1;
scale = 1.5; %³ß¶È
%search_radius = 1 ;%ËÑË÷°ë¾¶

axis([-scale,scale,-scale,scale]);
axis equal;

%theta = GetTheta(scale);

theta = [-1; -1; 1];


[cost res]=myrun( scale,search_radius,theta);

rec(end+1,:) = [search_radius cost(1) cost(2)];
cost
xlabel(['radius=' num2str(search_radius)]); 

%F=getframe(gcf);
%imwrite(F.cdata,[num2str(search_radius),'.tif'],'tif');
saveas(gcf,[num2str(search_radius) '.tif'],'tif');
pause;
end