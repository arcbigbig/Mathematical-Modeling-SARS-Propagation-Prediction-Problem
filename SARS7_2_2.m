%确定参数
%推迟5天
I0=482;R0=0;S0=2080;beta=10e-5;gama=0.046
[t,P] = ode45(@SIR_model,[1:1:70],[S0 I0 R0 beta gama]);
S = P(:,1); %Susceptible 未感染者；未感染节点；
I = P(:,2);%Infective 感染者；感染节点；
R = P(:,3); %Removal 移出者（死亡或者治愈并且免疫者）；移出节点；
RI=R+I;%累积感染者数
data1 =xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','B3:B66');
data2 =xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','H3:H66');
data3 =xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','I3:I66');
% data4=data1'-data2'-data3';
% 
% dataR=data2'+data3';
detadata1=[];detaIR=[];data4=data2+data3;
for i=1:63
    detadata1(i)=data1(i+1)-data1(i);
end
for i=1:63
   detaIR(i)=RI(i+1)-RI(i);
end

figure(1);
plot(1:1:70,S,1:1:70,I,1:1:70,R);
xlabel('天数（4月21日为第一天）');ylabel('人数');
legend('易感者','感染者','移出者');
figure(2);
subplot(2,1,1);
plot(1:1:64,data1,'-x');
title('2003年北京市SARS累计确诊-实际数据');
xlabel('天数（4月21日为第一天）');ylabel('人数');

subplot(2,1,2);

plot(1:1:70,RI,'-ro')
title('2003年北京市SARS累计确诊-SIR模型预测')
xlabel('天数（4月21日为第一天）')
ylabel('人数')

figure(3)
plot(1:1:64,data1,'-x');hold on;
plot(1:1:70,RI,'-ro')
legend('真实数据','模拟数据')
title('病毒毒性增大50%');xlabel('天数（4月21日为第一天）');ylabel('人数')

% figure(3);
% plot(1:1:64,data4,1:1:70,I);
% legend('真实数据','模拟数据')
% 
% figure(4);
% plot(1:1:64,dataR,1:1:70,R);
% legend('真实数据','模拟数据')

% figure(3);
% plot(1:1:64,dataR,1:1:70,R);
% legend('真实数据','模拟数据')

figure(4);
plot(1:1:63,detadata1,1:1:63,detaIR);
xlabel('天数（4月21日为第一天）');ylabel('新增人数');
title('每日新增数据数据对比图');
legend('真实数据','模拟数据')
% figure(4);
% plot(1:1:70,I,'-*')
%推迟5天，提前5天
%



function dx = SIR_model(t,x) %t是时间，P中含有模型的五个参数SIRβγ
beta = x(4);
gama = x(5);
dx = zeros(5,1);
dx(1) = -beta*x(1)*x(2);
dx(2) = beta*x(1)*x(2) - gama*x(2);
dx(3) = gama*x(2);
end


