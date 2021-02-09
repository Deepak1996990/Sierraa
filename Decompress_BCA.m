function [D_fPRB]=Decompress_BCA(cPRB,sblockScalar,iqWidth)
 
  for iRe = 1:length(cPRB)
    
        fRe_re = round(sblockScalar(iRe) * real(cPRB(iRe)) / 2^(iqWidth-9));
        
        fRe_im = round(sblockScalar(iRe) * imag(cPRB(iRe)) / 2^(iqWidth-9));
        
        D_fPRB(iRe) = complex(fRe_re, fRe_im); % Complex output value
   end

end
