clear;
% k1=0.16204;N01=1;t1=1:1:45;
% N1=N01*(1+k1).^t1;
% k2=0.0273;N02=860;t2=46:1:105;
% N2=N02*((1+k2).^t2);
% plot(1:1:45,N1,'-*',46:1:105,N2,'-o')
data1 =xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','B2:B66');
data2 =xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','H2:H66');
data3 =xlsread('E:\数学建模2022\202207训练题\数据.xlsx','Sheet1','I2:I66');
dataI=data1-data2-data3;
plot(1:1:65,dataI,'-o')
% for i=2:65
%     dedata=data(i)-data(i-1);
% end
k1=0.16204;k2=0.0273;N0=339;
N(1)=394;
t1=1:11;
N=N0*(1+k1).^t1;
N(12)=(N(11)-N0)*(1+k2);
N(13)=(N(12)-N(1))*(1+k2);

plot(1:13,N,'-*',1:65,data1,'o')