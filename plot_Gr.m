P = 0.001;
% P = 0.0033;
Q = 1;
% temp = 0.025;
temp = 0.042;
n = 101;
r = linspace(0.5,15,n);
Gr = r/2.*(1+8/3*pi*P*r.^2+Q*Q./(r.^2))-pi*temp*r.*r;
plot(r,Gr,'b-','linewidth',1);