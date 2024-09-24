
P = 0.001;
% P = 0.0033;
Q = 1;
T1 = 2*sqrt(P)*(1-32*pi*P*Q*Q+sqrt(1-96*pi*P*Q*Q))/(sqrt(pi)*(1+sqrt(1-96*pi*P*Q*Q))^(3/2));
T2 = 2*sqrt(P)*(1-32*pi*P*Q*Q-sqrt(1-96*pi*P*Q*Q))/(sqrt(pi)*(1-sqrt(1-96*pi*P*Q*Q))^(3/2));
Ti = T1+0.001;
Tf = T2-0.001;
nT = 21;
para = linspace(Ti,Tf,nT);
BH = zeros(nT,2);
Gr = @(x,Temp)x/2.*(1+8/3*pi*P*x.^2+Q*Q./(x.^2))-pi*Temp*x.*x;
dGr = @(x,Temp)0.5+4*pi*P*x.^2-Q*Q/(2*x.^2)-2*pi*Temp*x;
syms x
tic
for i=1:nT
    Temp = para(i);
    sol = solve( dGr(x,Temp),x,'real',true);
    x_sol = double(sol);
    x_sol(x_sol<0) = [];
    r = sort(x_sol);
    BH(i,:) = [Gr(r(2),Temp)-Gr(r(1),Temp),Gr(r(2),Temp)-Gr(r(3),Temp)];
end
toc
plot(para,BH(:,1),'b-x',para,BH(:,2),'k-o');
% r = linspace(0.5,15,n);
% plot(r,Gr(r),'b-','linewidth',1)
% hold on;
% plot(x_sol,Gr(x_sol),'ro')