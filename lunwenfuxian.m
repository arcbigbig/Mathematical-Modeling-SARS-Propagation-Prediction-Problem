data1=xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','B3:B66');%累积确诊
data2=xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','D3:D66');%累积死亡
data3=xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','E3:E66');%累积出院
%画出2003年北京市SARS累计确诊，死亡，出院人数图，得到初步的治愈率

t=1:1:64;
figure(1);
plot(t,data1,'-o',t,data2,'-*',t,data3,'-^');
title('2003年北京市SARS累计确诊，死亡，出院人数图');
xlabel('天');ylabel('人数');
legend('累积确诊','累积死亡 ','累积出院');
%gama=1/19

%画出2003年北京市SARS每日新增确诊人数图
xinzeng=[];
for i=1:63
    xinzeng(i)=data1(i+1)-data1(i);
end
t=1:1:63;
figure(2);
plot(t,xinzeng,'-o');
title('2003年北京市SARS每日新增确诊人数图');
xlabel('天');ylabel('新增人数');

data4=data1-data2-data3;%It
t=1:1:64;
figure(3);
plot(t,data4,'-o');
title('2003年北京市SARS每日感染者观测图');
xlabel('天');ylabel('人数');



