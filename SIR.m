% syms s(t) i(t) r(t);
% 
% eqn=[diff(s)==-B*(i*s),diff(i)==B*(i*s)-Y*i,diff(r)==y*i,s(0)==s0,i(0)==i0];
% s=dsolve(eqn,t);
% s.x

tspan=0:200;
y0=[228,1749];
[t,x]=ode45(@ill,tspan,y0);
r=2000-x(:,1)-x(:,2);  %x(:,1)是感染人数 x(:,2)是健康人数 
plot(t,x(:,1),t,x(:,2),t,r),grid
xlabel('天数');ylabel('人数');
legend('i(t)','s(t)','r(t)');
title('SIR模型例证图')

function dx=ill(t,x)
a=1.12e-4;b=5.263e-2;
dx=[a*x(1)*x(2)-b*x(1);-a*x(1)*x(2)];
end


% 
% 
% function y=ill(t,x)
% a=1;
% b=0.5;
% y=[a*x(1)*x(2)-b*x(1);-a*x(1)*x(2)];
% end
% 
% clear;
% [t,y]=ode45(@odefun,[0 5],0);
% plot(t,y,'o');
% 
% function dy=odefun(t,y)
% dy(1)=2*t;
% end
