%确定参数
I0=497
R0=33
%估计参数
S0=1290
beta=8e-5
gama=4e-2
[t,P] = ode45(@SIR_model,[1:1:70],[S0 I0 R0 beta gama]);
S = P(:,1); %Susceptible 未感染者；未感染节点；
I = P(:,2);%Infective 感染者；感染节点；
R = P(:,3); %Removal 移出者（死亡或者治愈并且免疫者）；移出节点；
% for i=1:70
%     detadata1(i)=data1(i+1)-data1(i);
% end
for i=1:70
   RI(i)=R(i)+I(i);
end
figure(1)
plotnum = 70
subplot(2,1,1)
realI =[530,685,708,734,761,800,840,883,928,970,998,1059,1108,1150,1190,1232,1268,1297,1327,1358,1380,1402,1434,1458,1488,1510,1527,1543,1557,1572,1589,1600,1611,1621,1629,1637,1646,1654,1661,1667,1674,1678,1683,1689,1698,1703,1706,1710,1713,1714,1718,1719,1722,1724,1724,1725,1726,1728,1730,1732,1736,1739,1742,1746,1747,1748,1748,1750,1752,1752,1753,1754,1755];
prealI = get_head_elements(realI,plotnum)
num = 1:plotnum
plot(num,prealI,'-x');
title('SARS期间累计个案趋势图')
xlabel('时间（以3月31日为第一天）')
ylabel('累计个案数')

subplot(2,1,2);
RI=R+I
plot(t,RI,'-ro')
title('SIR模型预估SARS期间累计个案趋势图')
xlabel('时间（以3月31日为第一天）')
ylabel('累计个案数')

figure(2)
plot(num,prealI,'*');
hold on;
plot(t,RI,'o');
legend('真实数据','模拟数据','location','southeast')

title('香港2003年SARS感染数据图')
xlabel('时间')
ylabel('人数')
figure(3);
plot(1:1:70,detadata1,1:1:70,RI);
xlabel('天数（4月21日为第一天）');ylabel('新增人数');
title('每日新增数据数据对比图');
legend('真实数据','模拟数据')

function dx = SIR_model(t,x) %t是时间，P中含有模型的五个参数SIRβγ
beta = x(4);
gama = x(5);
dx = zeros(5,1);
dx(1) = -beta*x(1)*x(2);
dx(2) = beta*x(1)*x(2) - gama*x(2);
dx(3) = gama*x(2);
end

function head = get_head_elements(colVect,len)
    for i =1:len
        head(i)=colVect(i);
    end
    header = head';
end
