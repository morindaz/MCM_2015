function res = calcweight(x1,x2,orgin)
  res =  sqrt(sum((x1-x2).^2));
<<<<<<< HEAD
  orgin = [0 ;0] ;
  %res = ( sqrt(sum((x1-orgin).^2))+(sqrt(sum((x2-orgin).^2))))*(sqrt(sum((x1-x2).^2)))/2;
=======
   
   %res = ( sqrt(sum((x1-orgin).^2))+(sqrt(sum((x2-orgin).^2))))*(sqrt(sum((x1-x2).^2)))/2;
>>>>>>> parent of 93ecfc4... Model 2 测试
end