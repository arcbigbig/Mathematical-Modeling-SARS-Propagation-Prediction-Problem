% %求解单个微分方程
% syms y(t)
% s= dsolve('-Dy=y +1','y(0) =1');  %求出方程
% %作图
% t = 0:0.1:5
% y = eval(subs(s)) 
% %eval函数  勉强当作计算函数吧
% plot(t,y)
% 
%同时求解多个微分方程
syms x(t) y(t) z(t);

eqn=[diff(x)==2*x-3*y+3*z,diff(y)==4*x-5*y+3*z,diff(z)==4*x-4*y+2*z,x(0)==1,y(0)==2,z(0)==1];
s=dsolve(eqn,t);

t = 0:1:6
y = eval(subs(s.x)) 
%eval函数  勉强当作计算函数吧
plot(t,y)