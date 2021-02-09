function [s,e,mant]=float(x)
    n=8; %no of bits in the binary conversion of integer part.
    m=8; %no of bits in the binary conversion of fractional part.
    mant=zeros(1,23);
    
    I_prb=x;
    
    if (I_prb>=0)
      signed_bit =0;
    else
      signed_bit =1;
    end
    
    A=log2(abs(I_prb));
    
    TF=logical(A==floor(A));
    
    if(TF==1)
       exponent=nextpow2(I_prb);
    else
       exponent=nextpow2(I_prb)-1;
    end
    
    offset_exponent=exponent+127;
    
    e=fix(rem(offset_exponent*pow2(-7:0),2));
    
    I_fprb=fix(rem(I_prb*pow2(-(n-1):m),2)); %Binary conversion
    
    mant_1=abs(I_fprb((n-exponent+1):(n+m)));
    
    for i=1:(exponent+m)
      mant(i)=mant_1(i);
    end
    s=signed_bit;
end
