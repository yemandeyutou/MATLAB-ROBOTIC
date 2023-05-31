function [V,A]=fkin(track)
% fkin的作用是根据轨迹track解算每个点的速度和加速度
% 速度保存在V中，加速度保存在A中
track_x=[];track_y=[];track_z=[];
for i=1:3:length(track)
    track_x=[track_x,track(i)];
    track_y=[track_y,track(i+2)];
    track_z=[track_z,track(i+1)];
   
end
track_vx=[track_x(1),track_x];track_ax=[track_vx,track_x(end)];
track_vy=[track_y(1),track_y];track_ay=[track_vy,track_y(end)];
track_vz=[track_z(1),track_z];track_az=[track_vz,track_z(end)];
 % 求导解出速度和加速度
    V_X=diff(track_vx,1)/0.01;
    V_Y=diff(track_vy,1)/0.01;
    V_Z=diff(track_vz,1)/0.01;
    V=sqrt(power(V_X,2)+power(V_Y,2)+power(V_Z,2));

    A_X=diff(track_ax,2)/0.01;
    A_Y=diff(track_ay,2)/0.01;
    A_Z=diff(track_az,2)/0.01;
    A=sqrt(power(A_X,2)+power(A_Y,2)+power(A_Z,2));
end
