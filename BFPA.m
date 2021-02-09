clc ;

clear all;

fPRB=[-17.24-15.45i,-23.34-8.99i,-34.25-65i,-58.31-43.33i,-39.654-78.88i,-12.11-12.122i,-23.45-56.444i,-36.45-40.44i,-78.33-34.33i,-67.56-36.45i,-34.345-33.34i,-56.44-45.46i];

iqWidth=12;

[cPRB Common_Expo]=blockFloating(fPRB,iqWidth); 

[D_fPRB]=Decompress_BFPA(cPRB,Common_Expo);

[re_s re_expo re_mant im_s im_expo im_mant]=C_float(cPRB);