function [dis] = pdst(p1,p2)
%PDST 用于计算三维空间两点之间的距离
clc;
xdis=p1(1)-p2(1);
ydis=p1(2)-p2(2);
zdis=p1(3)-p2(3);
dis=sqrt(xdis^2+ydis^2+zdis^2);
end

