% y=ax.^2+b;
x=[1,51,52];
y=[1,339,482];
P=polyfit(x,y,2);
t=1:51;
Y=polyval(P,t);
plot(t,Y,'-*')