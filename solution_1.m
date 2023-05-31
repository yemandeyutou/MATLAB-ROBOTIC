% 实验一的解决方案

% 插值点的数组
Points=[init,p1,p2,p3,p4,p5,p6,p7,dst];
% 用Track进行轨迹插值
circle_track=Track(Points);
% 给每个点构造齐次变换矩阵
T1=[];T2=[];T3=[];T4=[];T5=[];T6=[];

% 定义轨迹
track1=[];track2=[];track3=[];track4=[];track5=[];track6=[];
% 定义位置
pos1=[];pos2=[];pos3=[];pos4=[];pos5=[];pos6=[];
% 定义速度和加速度
A1=[];A2=[];A3=[];A4=[];A5=[];A6=[];
V1=[];V2=[];V3=[];V4=[];V5=[];V6=[];
time=0:0.0100:6.0100;
TransMatss=[];
TMatss=[];
T01s=[];


for i=1:3:length(circle_track)
%   取n，o，a，p
    p6x=circle_track(i);p6y=circle_track(i+1);p6z=circle_track(i+2);
    p6=[p6x,p6y,p6z];
    o6=unitVec([1*p6x,-1*p6y,-2*p6z]);
    a6=unitVec(center-p6);
    n6=cross(o6,a6);
%   获得相应的齐次变换矩阵，保存在数组中
    T6=TransMat(n6,o6,a6,p6);      %T06 \
    TransMatss=[TransMatss,T6];
%   对齐次变换矩阵进行逆运动学求解
    thetas=Ikin(T6);

    TMats=PUMA(thetas) %T01 T12 T23 T34 T45 T56
    TMatss=[TMatss,TMats];
    T01=[TMats(:,1),TMats(:,2),TMats(:,3),TMats(:,4)]
    T12=[TMats(:,5),TMats(:,6),TMats(:,7),TMats(:,8)]
    T23=[TMats(:,9),TMats(:,10),TMats(:,11),TMats(:,12)]
    T34=[TMats(:,13),TMats(:,14),TMats(:,15),TMats(:,16)]
    T45=[TMats(:,17),TMats(:,18),TMats(:,19),TMats(:,20)]
    T56=[TMats(:,21),TMats(:,22),TMats(:,23),TMats(:,24)]
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
    track6=circle_track;
%   获得位置
    pos1=[pos1,thetas(1)*180/pi]
    pos2=[pos2,thetas(2)*180/pi]
    pos3=[pos3,thetas(3)*180/pi]
    pos4=[pos4,thetas(4)*180/pi]
    pos5=[pos5,thetas(5)*180/pi]
    pos6=[pos6,thetas(6)*180/pi]
    

end
%   用fkin进行速度和加速度解算
    [V1,A1]=fkin(track1);
    [V2,A2]=fkin(track2);
    [V3,A3]=fkin(track3);
    [V4,A4]=fkin(track4);
    [V5,A5]=fkin(track5);
    [V6,A6]=fkin(circle_track);
    
% 实现往返运动
    halflen=length(V1);
    for i=1:1:halflen
        pos1=[pos1,pos1(halflen-i+1)];
        pos2=[pos2,pos2(halflen-i+1)];
        pos3=[pos3,pos3(halflen-i+1)];
        pos4=[pos4,pos4(halflen-i+1)];
        pos5=[pos5,pos5(halflen-i+1)];
        pos6=[pos6,pos6(halflen-i+1)];

        V1=[V1,V1(halflen-i+1)];
        V2=[V2,V2(halflen-i+1)];
        V3=[V3,V3(halflen-i+1)];
        V4=[V4,V4(halflen-i+1)];
        V5=[V5,V5(halflen-i+1)];
        V6=[V6,V6(halflen-i+1)];

        A1=[A1,A1(halflen-i+1)];
        A2=[A2,A2(halflen-i+1)];
        A3=[A3,A3(halflen-i+1)];
        A4=[A4,A4(halflen-i+1)];
        A5=[A5,A5(halflen-i+1)];
        A6=[A6,A6(halflen-i+1)];

    end



% 将数据导出为excel文件
    
    data=[time',pos1',V1',A1',...
          pos2',V2',A2',...
          pos3',V3',A3',...
          pos4',V4',A4',...
          pos5',V5',A5',...
          pos6',V6',A6'];
   
    csvwrite("solution_1.csv",data);
