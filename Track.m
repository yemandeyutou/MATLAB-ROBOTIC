function [track] = Track(point)
%TRACK track的作用是输入一组点，输出由这些散点构成的三次样条插值轨迹
%   此处显示详细说明
PointX=[];PointY=[];PointZ=[];
for i=1:3:length(point)
    PointX=[PointX,point(i)];
    PointY=[PointY,point(i+1)];
    PointZ=[PointZ,point(i+2)];
end

% 数组长度
len=length(PointX);
% 时间
t_len=3;% 总时间长度
t=0:0.01:t_len;
% 步长

step=linspace(0,t_len,len);
% 计算三次样条插值
track_X=interp1(step,PointX,t,'spline');
track_Y=interp1(step,PointY,t,'spline');
track_Z=interp1(step,PointZ,t,'spline');

tracklen=length(track_X);
track=[];
%   输出轨迹，轨迹是由三维向量构成的点的集合
for i=1:1:tracklen
    track=[track,[track_X(i),track_Y(i),track_Z(i)]];

end

