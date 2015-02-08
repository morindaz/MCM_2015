
rec.data = zeros(0,4);
rec.pro = cell(0,1);
for R = 20-logspace(0,log(20),30)
scale = R*1.5; %³ß¶È
search_radius = 1 ;%ËÑË÷°ë¾¶



axis([-scale,scale,-scale,scale]);
axis equal;

%theta = GetTheta(scale);

theta = [-1; -1; R*R];


[cost rec.pro{end+1}]=myrun( scale,search_radius,theta);

rec.data(end+1,:) = [search_radius cost];
cost
xlabel(['R=' num2str(R)]); 

%F=getframe(gcf);
%imwrite(F.cdata,[num2str(search_radius),'.tif'],'tif');
saveas(gcf,[num2str(R) '.tif'],'tif');

rec.pro{end}.scale = scale;
rec.pro{end}.search_radius = search_radius;
rec.pro{end}.R = R;

pause
end
save rec rec