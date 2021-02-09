function [re_s re_expo re_mant im_s im_expo im_mant]=C_float(cPRB)
     
      re_s=zeros(1,length(cPRB));

      re_expo= cell(1,length(cPRB));

      re_mant= cell(1,length(cPRB));
      
      im_s=zeros(1,length(cPRB));

      im_expo= cell(1,length(cPRB));

      im_mant= cell(1,length(cPRB));
      
       for i=1:length(cPRB)
          
          [re_s(i) re_expo(i) re_mant(i)]=float(real(cPRB(i)));
          
        end
        
        for i=1:length(cPRB)
          
          [im_s(i) im_expo(i) im_mant(i)]=float(imag(cPRB(i)));
          
        end
      
end
 