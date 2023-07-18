data1=xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','B3:B66');%累积确诊
data2=xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','D3:D66');%累积死亡
data3=xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','E3:E66');%累积出院
data4=data1-data2-data3;%It
tspan=1:64;
y0=[482,2080];
[t,x]=ode45(@ill,tspan,y0);
r=1727-x(:,1)-x(:,2);  %x(:,1)是感染人数 x(:,2)是健康人数 
figure(1);
plot(t,x(:,1),t,x(:,2),t,r),grid
legend('i(t)','s(t)','r(t)');
figure(2);
ts=1:64;
plot(ts,x(:,1),'-*',ts,data4,'-o');
legend('拟合','实际')
function dx=ill(t,x)
a=8.82e-5;b=0.046;
dx=[a*x(1)*x(2)-b*x(1);-a*x(1)*x(2)];%前一个是感染的 后一个是健康的
end