
data1=xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','B2:B66');%累积确诊
data2=xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','D2:D66');%累积死亡
data3=xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','E2:E66');%累积出院
%%画出2003年北京市SARS累计确诊，死亡，出院人数图，得到初步的治愈率
% t=1:1:65;
% plot(t,data1,'-o',t,data2,'-*',t,data3,'-^');
% title('2003年北京市SARS累计确诊，死亡，出院人数图');
% xlabel('天');ylabel('人数');
% legend('累积确诊','累积死亡 ','累积出院');
% %gama=1/19

% %画出2003年北京市SARS每日新增确诊人数图
% xinzeng=[];
% for i=1:64
%     xinzeng(i)=data1(i+1)-data1(i);
% end
% t=1:1:64;
% plot(t,xinzeng,'-o');
% title('2003年北京市SARS每日新增确诊人数图');
% xlabel('天');ylabel('新增人数');

%画出2003年北京市SARS每日实际感染者观测图
data4=data1-data2-data3;%It
% t=1:1:65;
% figure(1);
% plot(t,data4,'-o');
% title('2003年北京市SARS每日感染者观测图');
% xlabel('天');ylabel('人数');
data4=data4';
gama=5.263e-2;
bat=1.12e-4;

for s0=500:1:2000
    s0;
    tspan=1:1:64;
    y0=[288, s0];%x(1)是I（x(2)
    [t,x]=ode45(@ill,tspan,[S0 I0 R0 beta gama]);
    SSE=0;SSEmin=0;
    for i=1:64
        SSE=SSE+(x(i,1)-data4(i))*(x(i,1)-data4(i));
    end
    
end

function dx=ill(t,x)
dx=[bat*x(1)*x(2)-gama*x(1);-bat*x(1)*x(2)];
end

function dx = ill(t,x) %t是时间，P中含有模型的五个参数SIRβγ
beta = x(4);
gama = x(5);
dx = zeros(5,1);
dx(1) = -beta*x(1)*x(2);
dx(2) = beta*x(1)*x(2) - gama*x(2);
dx(3) = gama*x(2);
end