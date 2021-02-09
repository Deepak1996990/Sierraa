function [cPRB Common_Expo]=blockFloating(fPRB,iqWidth)

      real_cPRB=zeros(1,length(fPRB));

      imag_cPRB=zeros(1,length(fPRB));

      maxV=max(real(fPRB),imag(fPRB));

      minV=min(real(fPRB),imag(fPRB));

      maxValue=max(maxV,abs(minV)-1);

      raw_exp=floor(log2(maxValue)+1);

      exponent_1=max(raw_exp-iqWidth+2);

      scalar=2.^(-exponent_1);

      for iRe=1:length(fPRB)
        
        real_cPRB(iRe)=round(scalar.*real(fPRB(iRe)));
        
        imag_cPRB(iRe)=round(scalar.*imag(fPRB(iRe)));
        
      end

      cPRB=complex(real_cPRB,imag_cPRB);

      Common_Expo=exponent_1;
       
 end