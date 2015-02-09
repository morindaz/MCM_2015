function Show()

load rec

figure;
hold on;
plot(rec.data(:,1),rec.data(:,2),'g-.');
plot(rec.data(:,1),rec.data(:,3),'r+');
plot(rec.data(:,1),rec.data(:,4),'b*');
xlabel('R'); 
ylabel('Time');

for i = 1 : length(rec.pro)
    
    
   t=rec.pro{i};
   figure;
   hold on;
   contour(t.u, t.v, t.z, [0, 0], 'LineWidth', 2);
   
   
   plot(t.rs(1,t.p),t.rs(2,t.p),'r+');
   x1 = t.rs(:,t.p-1);
   x2 = t.rs(:,t.p+1);
   k = (x2(2)-x1(2))/(x2(1)-x1(1));
   line([t.rs(1,t.p) t.rs(1,t.p)+3*t.scale],[t.rs(2,t.p) t.rs(2,t.p)+k*3*t.scale]);
   line([t.rs(1,t.p) t.rs(1,t.p)-3*t.scale],[t.rs(2,t.p) t.rs(2,t.p)-k*3*t.scale]);
   
   for j = 1 : size(t.circle,2)
      mycircle(t.circle(:,j),t.search_radius) ;
   end
   
   axis([-t.scale,t.scale,-t.scale,t.scale]);
   axis equal;
   
   plot(t.circle(1,t.index),t.circle(2,t.index),'c-.','LineWidth',1.6);
   
   axis([-t.scale,t.scale,-t.scale,t.scale]);
   xlabel(['R=' num2str(t.R)]); 
   pause; 
end

end



function mycircle(X,R)
b = R/tan(atan(1));
rectangle('Position',[X(1)-b,X(2)-b,2*b,2*b],'Curvature',[1,1], 'EdgeColor','r')
end