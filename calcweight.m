function res = calcweight(x1,x2,orgin)
  res =  sqrt(sum((x1-x2).^2));
  orgin = [0 ;0] ;
  %res = ( sqrt(sum((x1-orgin).^2))+(sqrt(sum((x2-orgin).^2))))*(sqrt(sum((x1-x2).^2)))/2;
end