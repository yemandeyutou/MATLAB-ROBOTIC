function [TMats]=PUMA(Thetas)
% 此函数用于设置PUMA560机器人的主要参数
% 以及获取齐次变换矩阵
%连杆偏移
d1 = 0.660;
d2 = 0;
d3 = 0.150;
d4 = -0.432;
d5 = 0;
d6 = -0.056;
%连杆长度
a1 = 0;
a2 = 0.432;
a3 = 0.020;
a4 = 0;
a5 = 0;
a6 = 0;
%连杆扭角
alpha1 = pi/2;
alpha2 = pi;
alpha3 = pi/2;
alpha4 = pi/2;
alpha5 = pi/2;
alpha6 = -pi;
% 连杆转角θ 
theta1=Thetas(1);
theta2=Thetas(2);
theta3=Thetas(3);
theta4=Thetas(4);
theta5=Thetas(5);
theta6=Thetas(6);
% DH参数矩阵
DH=[theta1 d1 a1 alpha1;
    theta2 d2 a2 alpha2;
    theta3 d3 a3 alpha3;
    theta4 d4 a4 alpha4;
    theta5 d5 a5 alpha5;
    theta6 d6 a6 alpha6;];
% 各个关节的齐次变换矩阵
T01=[cos(DH(1,1))               -sin(DH(1,1))                   0         DH(1,3)*cos(theta1);
     sin(DH(1,1))*cos(DH(1,4))  cos(DH(1,1))*cos(DH(1,4))  -sin(DH(1,4))  DH(1,2)*sin(theta1);
     sin(DH(1,1))*sin(DH(1,4))  cos(DH(1,1))*sin(DH(1,4))   cos(DH(1,4))  DH(1,2);
      0                           0                             0              1];
T12=[cos(DH(2,1))               -sin(DH(2,1))                   0        DH(2,3)*cos(theta2);
     sin(DH(2,1))*cos(DH(2,4))  cos(DH(2,1))*cos(DH(2,4))  -sin(DH(2,4)) DH(2,2)*sin(theta2);
     sin(DH(2,1))*sin(DH(2,4))  cos(DH(2,1))*sin(DH(2,4))   cos(DH(2,4))  DH(2,2);
      0                           0                             0              1];

T23=[cos(DH(3,1))               -sin(DH(3,1))                   0        DH(3,3)*cos(theta3);
     sin(DH(3,1))*cos(DH(3,4))  cos(DH(3,1))*cos(DH(3,4))  -sin(DH(3,4)) DH(3,2)*sin(theta3);
     sin(DH(3,1))*sin(DH(3,4))  cos(DH(3,1))*sin(DH(3,4))   cos(DH(3,4))  DH(3,2);
      0                           0                             0              1];

T34=[cos(DH(4,1))               -sin(DH(4,1))                   0        DH(4,3)*cos(theta4);
     sin(DH(4,1))*cos(DH(4,4))  cos(DH(4,1))*cos(DH(4,4))  -sin(DH(4,4)) DH(4,2)*sin(theta4);
     sin(DH(4,1))*sin(DH(4,4))  cos(DH(4,1))*sin(DH(4,4))   cos(DH(4,4))  DH(4,2);
      0                           0                             0              1];

T45=[cos(DH(5,1))               -sin(DH(5,1))                   0         DH(5,3)*cos(theta4);
     sin(DH(5,1))*cos(DH(5,4))  cos(DH(5,1))*cos(DH(5,4))  -sin(DH(5,4)) DH(5,2)*sin(theta4);
     sin(DH(5,1))*sin(DH(5,4))  cos(DH(5,1))*sin(DH(5,4))   cos(DH(5,4))  DH(5,2);
      0                           0                             0              1];

T56=[cos(DH(6,1))               -sin(DH(6,1))                   0        DH(6,3)*cos(theta4);
     sin(DH(6,1))*cos(DH(6,4))  cos(DH(6,1))*cos(DH(6,4))  -sin(DH(6,4)) DH(6,2)*sin(theta4);
     sin(DH(6,1))*sin(DH(6,4))  cos(DH(6,1))*sin(DH(6,4))   cos(DH(6,4))  DH(6,2);
      0                           0                             0              1];

TMats=[T01,T12,T23,T34,T45,T56];

end
