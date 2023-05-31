% 实验三的解决方案
% 定义原点
orin=[15,-30,25];
% 定义两个正交向量，作为写字平面

dir_x=2*unitVec([1,1,-1]);
dir_y=-2*unitVec([3,7,10]);

% 画1
pt1_init=orin;pt1_1=pt1_init+0.5*dir_y;pt1_2=pt1_1+0.5*dir_y;pt1_3=pt1_2+0.5*dir_y;
pt1_4=pt1_3+dir_y;pt1_5=pt1_4+2*dir_y;pt1_6=pt1_5;pt1_7=pt1_4;pt1_8=pt1_3;pt1_dst=pt1_init;
pt1s=[pt1_init,pt1_1,pt1_2,pt1_3,pt1_4,pt1_5,pt1_6,pt1_7,pt1_8,pt1_dst];

% 画3
pt3_init=pt1_dst+2*dir_x;pt3_1=pt3_init+dir_x;pt3_2=pt3_1+1.5*dir_y;pt3_3=pt3_2-1.5*dir_x;
pt3_4=pt3_2;pt3_5=pt3_2+1.5*dir_y;pt3_6=pt3_5-1.5*dir_x;
pt3_7=pt3_5;pt3_8=pt3_2;pt3_dst=pt3_1;%返

pt3s=[pt3_init,pt3_1,pt3_2,pt3_3,pt3_4,pt3_5,pt3_6,pt3_7,pt3_8,pt3_dst];

% 画8
pt8_init=pt3_dst+2*dir_x;pt8_1=pt8_init+2*dir_x;pt8_2=pt8_1+2*dir_y;pt8_3=pt8_2-2*dir_x;
pt8_4=pt8_3+2*dir_y;pt8_5=pt8_4+2*dir_x;pt8_6=pt8_2;pt8_7=pt8_3;pt8_8=pt8_init;pt8_dst=pt8_init+2*dir_x;

pt8s=[pt8_init,pt8_1,pt8_2,pt8_3,pt8_4,pt8_5,pt8_6,pt8_7,pt8_8,pt8_dst];

% 画6
pt6_init=pt8_dst+2*dir_x;pt6_1=pt6_init+2*dir_y;pt6_2=pt6_1+2*dir_y;pt6_3=pt6_2+2*dir_x;pt6_4=pt6_3-2*dir_y;pt6_5=pt6_1;
pt6_6=pt6_init;pt6_dst=pt6_6+2*dir_x;

pt6s=[pt6_init,pt6_1,pt6_2,pt6_3,pt6_4,pt6_5,pt6_6,pt6_dst];

% 画C
ptc_init=pt6_dst+2*dir_x;ptc_1=ptc_init+2*dir_y;ptc_2=ptc_1+2*dir_y;ptc_3=ptc_2+2.5*dir_x;ptc_4=ptc_2;
ptc_5=ptc_1;ptc_6=ptc_init;ptc_dst=ptc_6+dir_x;

ptcs=[ptc_init,ptc_1,ptc_2,ptc_3,ptc_4,ptc_5,ptc_6,ptc_dst];

% 画J
ptj_init=ptc_dst+2*dir_x;ptj_1=ptj_init+2*dir_x;ptj_2=ptj_1+2*dir_y;ptj_3=ptj_2+2*dir_y;
ptj_4=ptj_3+dir_y-dir_x;ptj_5=ptj_4-dir_x-dir_y;ptj_6=ptj_4;ptj_7=ptj_3;ptj_8=ptj_2;ptj_dst=ptj_1;

ptjs=[ptj_init,ptj_1,ptj_2,ptj_3,ptj_4,ptj_5,ptj_6,ptj_7,ptj_8,ptj_dst];

% 画Z
ptz_init=ptj_dst+3*dir_x;ptz_1=ptz_init+2*dir_x;ptz_2=ptz_1+3*dir_y-2*dir_x;ptz_3=ptz_2+dir_y-2*dir_x;
ptz_4=ptz_3+2*dir_x;ptz_dst=ptz_4+2*dir_x;

ptzs=[ptz_init,ptz_1,ptz_2,ptz_3,ptz_4,ptz_dst];

% 插值点的数组
pts=[pt1s,pt3s,pt8s,pt6s,ptcs,ptjs,ptzs];

% 用Track进行轨迹插值
id_track=Track2(pts);
% 给每个点构造齐次变换矩阵
T1=[];T2=[];T3=[];T4=[];T5=[];T6=[];

% 定义轨迹
track1=[];track2=[];track3=[];track4=[];track5=[];track6=[];
% 定义位置
pos1=[];pos2=[];pos3=[];pos4=[];pos5=[];pos6=[];
% 定义速度和加速度
A1=[];A2=[];A3=[];A4=[];A5=[];A6=[];
V1=[];V2=[];V3=[];V4=[];V5=[];V6=[];
time=0:0.0100:10;
TransMatss=[];
TMatss=[];
T01s=[];


for i=1:3:length(id_track)
%   取n，o，a，p
    p6x=id_track(i);p6y=id_track(i+1);p6z=id_track(i+2);
    p6=[p6x,p6y,p6z];
    a6=unitVec(dir_x);
    o6=unitVec(dir_y);
    n6=cross(o6,a6);
%   获得相应的齐次变换矩阵，保存在数组中
    T6=TransMat(n6,o6,a6,p6);      %T06 \
    TransMatss=[TransMatss,T6];
%   对齐次变换矩阵进行逆运动学求解
    thetas=Ikin(T6);

    TMats=PUMA(thetas) %T01 T12 T23 T34 T45 T56
    TMatss=[TMatss,TMats];
    T01=[TMats(:,1),TMats(:,2),TMats(:,3),TMats(:,4)];
    T12=[TMats(:,5),TMats(:,6),TMats(:,7),TMats(:,8)];
    T23=[TMats(:,9),TMats(:,10),TMats(:,11),TMats(:,12)];
    T34=[TMats(:,13),TMats(:,14),TMats(:,15),TMats(:,16)];
    T45=[TMats(:,17),TMats(:,18),TMats(:,19),TMats(:,20)];
    T56=[TMats(:,21),TMats(:,22),TMats(:,23),TMats(:,24)];
    T01s=[T01s,T01];
    T1=T01;
    T2=T1*T12;
    T3=T2*T23;
    T4=T3*T34;
    T5=T4*T45;
%   获得每个关节的位置
    p5x=T5(1,4);p5y=T5(2,4);p5z=T5(3,4);
    p4x=T4(1,4);p4y=T4(2,4);p4z=T4(3,4);
    p3x=T3(1,4);p3y=T3(2,4);p3z=T3(3,4);
    p2x=T2(1,4);p2y=T2(2,4);p2z=T2(3,4);
    p1x=T1(1,4);p1y=T1(2,4);p1z=T1(3,4);
%   获得轨迹
    track1=[track1,[p1x,p1y,p1z]];
    track2=[track2,[p2x,p2y,p2z]];
    track3=[track3,[p3x,p3y,p3z]];
    track4=[track4,[p4x,p4y,p4z]];
    track5=[track5,[p5x,p5y,p5z]];
    track6=id_track;
%   获得位置
    pos1=[pos1,thetas(1)*180/pi];
    pos2=[pos2,thetas(2)*180/pi];
    pos3=[pos3,thetas(3)*180/pi];
    pos4=[pos4,thetas(4)*180/pi];
    pos5=[pos5,thetas(5)*180/pi];
    pos6=[pos6,thetas(6)*180/pi];
   
end

%   用fkin进行速度和加速度解算
    [V1,A1]=fkin(track1);
    [V2,A2]=fkin(track2);
    [V3,A3]=fkin(track3);
    [V4,A4]=fkin(track4);
    [V5,A5]=fkin(track5);
    [V6,A6]=fkin(track6);
     
% 将数据导出为excel文件
    
    id_data=[time',pos1',V1',A1',...
          pos2',V2',A2',...
          pos3',V3',A3',...
          pos4',V4',A4',...
          pos5',V5',A5',...
          pos6',V6',A6']
   
    csvwrite("solution_3.csv",id_data);
