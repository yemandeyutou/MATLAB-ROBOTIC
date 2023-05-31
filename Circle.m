% 定义圆弧中心
center=[10,6,5];
% 定义圆弧起点和终点
init=[-5,1,5]; % 起点
r=pdst(init,center); %半径
% 定义approach向量 a是单位向量，始终指向圆弧中心
a_init=unitVec(center-init);
% 定义圆弧终点
dst=2*center-init;
a_dst=unitVec(center-dst);

% 定义插值点
 par=unitVec(center-init);%定义圆弧面内的水平单位向量
 vtc=unitVec([-1,3,1])%定义圆弧面内的垂直单位向量

 p1=center+r*cos(deg(157.5))*par+r*sin(deg(157.5))*vtc;
 p2=center+r*cos(deg(135))*par+r*sin(deg(135))*vtc;
 p3=center+r*cos(deg(112.5))*par+r*sin(deg(112.5))*vtc;
 p4=center+r*cos(deg(90))*par+r*sin(deg(90))*vtc;
 p5=center+r*cos(deg(67.5))*par+r*sin(deg(67.5))*vtc;
 p6=center+r*cos(deg(45))*par+r*sin(deg(45))*vtc;
 p7=center+r*cos(deg(22.5))*par+r*sin(deg(22.5))*vtc;
