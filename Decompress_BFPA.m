 function [D_fPRB]=Decompress_BFPA(cPRB,Common_Expo); 
    
    scaler = 2.^Common_Expo ;

    for iRe = 1:length(cPRB)
      
        fre_re = scaler.*real(cPRB(iRe)) ;

        fre_im = scaler.*imag(cPRB(iRe));

        D_fPRB(iRe) = complex(fre_re,fre_im);
        
     end
   
 end