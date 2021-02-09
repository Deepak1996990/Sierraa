clc ;

clear all;

fPRB=[-17.24-15.45i,-23.34-8.99i,-34.25-65i,-58.31-43.33i,-39.654-78.88i,-12.11-12.122i,-23.45-56.444i,-36.45-40.44i,-78.33-34.33i,-67.56-36.45i,-34.345-33.34i,-56.44-45.46i];

iqWidth=9;

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