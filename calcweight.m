function res = calcweight(x1,x2,orgin)
  %res =  sqrt(sum((x1-x2).^2))+(sqrt(sum((x2-orgin).^2)));
   
   res = ( sqrt(sum((x1-orgin).^2))+(sqrt(sum((x2-orgin).^2))))/2;
end