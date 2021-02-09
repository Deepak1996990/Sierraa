function [cPRB sblockScalar]=blockScaling(fPRB,iqWidth)
  
      maxV=max(real(fPRB),imag(fPRB));

      minV=min(real(fPRB),imag(fPRB));

      maxValue=max(maxV,abs(minV)-1);

      sblockScalar=ceil(maxValue/(2^8));

      if(sblockScalar==0)
          sblockScalar=1;
      end

      inverse_blockScaler=(2^7)./sblockScalar;

      qs = 2^(iqWidth-1);

      for iRe =1:length(fPRB)
         cRe_re = round(inverse_blockScaler(iRe) * real(fPRB(iRe)) / 2^(16-iqWidth));
         
         cRe_re = min(max(cRe_re, -qs), qs-1); 
         
         cRe_im = round(inverse_blockScaler(iRe) * imag(fPRB(iRe)) / 2^(16-iqWidth));
         
         cRe_im = min(max(cRe_im, -qs), qs-1);
         
         cPRB(iRe) = complex(cRe_re, cRe_im); 
       end
        
        
end

