function dydt = hydroeqs(t,y,p)

Sam = y(1); Scr = y(2); G2 = y(3); G = y(4);
Sam0 = 16;
Scr0 = 64;
G0 = 0;
G02 = 0;
G20 = G02;

  km1=p(1); km2=p(2); ki1=p(3); ki2=p(4);
    km3=p(5); km4=p(6); ki3=p(7); ki4=p(8);
    km5=p(9); ki5=p(10); k_in=p(11);
    V(1) =p(12); V(2) =p(13); V(3)=p(14); V(4)=p(15); V(5)=p(16);

   V = [0.16, 0.16, 0.098, 0.022, 0.0036]; 

v1 = (V(1) * Sam * exp(-k_in*t)) / ...
     (km1 * (1 + G2/ki1 + Scr/km2) + Sam);

v2 = (V(2) * Scr * exp(-k_in*t)) / ...
     (km2 * (1 + G2/ki2 + Sam/km1) + Scr);

v3 = (V(3) * Sam) / ...
     (km3 * (1 + G/ki3 + Scr/km4) + Sam);

v4 = (V(4) * Scr) / ...
     (km4 * (1 + G/ki4 + Sam/km3) + Scr);

v5 = (V(5) * G2) / ...
     (km5 * (1 + G/ki5) + G2);

% differential equations
dSam = -v1 - v3;
dScr = -v2 - v4;
dG2 = v1 + v2 - v5;
dG = v3 + v4 + v5;
dydt = [dSam;dScr;dG2;dG];