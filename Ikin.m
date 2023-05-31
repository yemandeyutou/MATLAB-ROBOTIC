function [J] = Ikin(Mat)
%% MOD-DH参数 Ikin的作用是进行逆运动学解算
%定义连杆的D-H参数
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
    
% 参数赋值
nx=Mat(1,1);ox=Mat(1,2);ax=Mat(1,3);px=Mat(1,4);
ny=Mat(2,1);ox=Mat(2,2);ay=Mat(2,3);py=Mat(2,4);
nz=Mat(3,1);ox=Mat(3,2);az=Mat(3,3);pz=Mat(3,4);


% 求解关节角1
    theta1 = atan2(py,px)-atan2(d2,sqrt(px^2+py^2-d2^2));
% 求解关节角3
	k = (px^2+py^2+pz^2-a2^2-a3^2-d2^2-d4^2)/(2*a2);
    if (a3^2+d4^2-k^2)>0
	    theta3 = atan2(a3,d4)-atan2(k,sqrt(a3^2+d4^2-k^2));
% 	
    else 
        theta3 = atan2(a3,d4)-atan2(k,sqrt(k^2-a3^2-d4^2));
    end
% 求解关节角2
    c3=cos(theta3);s3=sin(theta3);s1=sin(theta1);c1=cos(theta1);
    theta23_y=(-a3-a2*c3)*pz+(c1*px+s1*py)*(a2*s3-d4);
    theta23_x=(-d4+a2*c3)*pz-(c1*px+s1*py)*(-a2*c3-a3);
    theta23=atan2(theta23_y,theta23_x);
    theta2=theta23-theta3;
    c23=cos(theta23);s23=sin(theta23);
% 求解关节角4
    theta4_y=-ax*s1+ay*c1;
    theta4_x=-ax*c1*c23-ay*s1*c23+az*s23;
    theta4=atan2(theta4_y,theta4_x);
    c4=cos(theta4);s4=sin(theta4);
% 求解关节角5
	s5=-1*(ax*(c1*c23*c4+s1*s4)+ay*(s1*c23*c4-c1*s4)-az*(s23*c4));
    c5=ax*(-c1*s23)+ay*(-s1*s23)+az*(-c23);
    theta5=atan2(s5,c5);
% 求解关节角6
	s6=-nx*(c1*c23*s4-s1*s4)-ny*(s1*c23*s4+c1*c4)+nz*(s23*s4);
    c6=nx*((c1*c23*s4+s1*s4)*c5-c1*c23*s5)+ny*((s1*c23*c4-c1*c4)*c5-s1*s23*s5)-nz*(s23*c4*c5+c23*s5);
	theta6=atan2(s6,c6);
	
% 整理得到解数组
    J=[theta1,theta2,theta3,theta4,theta5,theta6];


end
