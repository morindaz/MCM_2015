
rec.data = zeros(0,10);
rec.pro = cell(0,1);
%for R = 6:6
for R = 21-logspace(0,log(20)/log(10),30)
scale = R*1.5; %³ß¶È
search_radius = 1 ;%ËÑË÷°ë¾¶
fprintf('%e %e\n',R,scale);
%continue;

axis([-scale,scale,-scale,scale]);
axis equal;

%theta = GetTheta(scale);

theta = [-1; -1; R*R];


[cost rec.pro{end+1}]=myrun( scale,search_radius,theta,R);

rec.data(end+1,:) = [R cost{1} cost{2} cost{3}];

xlabel(['R=' num2str(R)]); 

%F=getframe(gcf);
%imwrite(F.cdata,[num2str(search_radius),'.tif'],'tif');
saveas(gcf,[num2str(R) '.tif'],'tif');

rec.pro{end}.scale = scale;
rec.pro{end}.search_radius = search_radius;
rec.pro{end}.R = R;



end
save rec rec