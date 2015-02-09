function Show()

load rec

figure;
hold on;
plot(rec.data(:,1),max([rec.data(:,2) rec.data(:,5) rec.data(:,8)],[],2),'g-.');
plot(rec.data(:,1),max([rec.data(:,3) rec.data(:,6) rec.data(:,9)],[],2),'r+');
plot(rec.data(:,1),max([rec.data(:,4) rec.data(:,7) rec.data(:,10)],[],2),'b*');
xlabel('R'); 
ylabel('Time');
legend('Max(改良前)','Max(改良后路径)','Max(E(t))');
for i = 1 : length(rec.pro)
    
    
   t=rec.pro{i};
   figure;
   hold on;
   contour(t.u, t.v, t.z, [0, 0], 'LineWidth', 2);
   
   
   plot(t.rs(1,t.p),t.rs(2,t.p),'r+');
   plot(t.circle(1,1),t.circle(2,1),'b*');
   x1 = t.rs(:,t.p-1);
   x2 = t.rs(:,t.p+1);
   k = (x2(2)-x1(2))/(x2(1)-x1(1));
   line([t.rs(1,t.p) t.rs(1,t.p)+3*t.scale],[t.rs(2,t.p) t.rs(2,t.p)+k*3*t.scale]);
   line([t.rs(1,t.p) t.rs(1,t.p)-3*t.scale],[t.rs(2,t.p) t.rs(2,t.p)-k*3*t.scale]);
   
  
   
   axis([-t.scale,t.scale,-t.scale,t.scale]);
   axis equal;
for c = 1 : length(t.circles)   
    for j = 1 : size(t.circles{c},2)
      mycircle(t.circles{c}(:,j),t.search_radius) ;
    end
    if c>1
       line([t.rs(1,t.p) t.rs(1,t.p)+3*t.scale],[t.rs(2,t.p) t.rs(2,t.p)+t.ks(c-1)*3*t.scale]);
       line([t.rs(1,t.p) t.rs(1,t.p)-3*t.scale],[t.rs(2,t.p) t.rs(2,t.p)-t.ks(c-1)*3*t.scale]);
    end
    
   plot(t.circles{c}(1,t.index{c}),t.circles{c}(2,t.index{c}),'c-.','LineWidth',1.6);
   
   
  
   
end
   axis([-t.scale,t.scale,-t.scale,t.scale]);
   xlabel(['R=' num2str(t.R)],'FontSize',12); 
   pause; 
end

end



function mycircle(X,R)
b = R/tan(atan(1));
rectangle('Position',[X(1)-b,X(2)-b,2*b,2*b],'Curvature',[1,1], 'EdgeColor','r')
end