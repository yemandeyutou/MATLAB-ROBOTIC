% MATLAB允许沿x轴和y轴，网格线添加标题，标签，并且还可以调整轴来绘制图形。
% 
% xlabel和ylabel命令沿x轴和y轴生成标签。title命令用于在图表上设置标题。
% grid on命令用于将网格线放在图形上。
% axis equal命令允许生成具有相同比例因子的绘图和两个轴上的空格。
% axis square命令生成一个方形图。

% ti=0:0.01:6.01;
% figure;
% plot(ti,pos6);
% xlabel('t(时间)');
% ylabel('角度(位置）');
% xlim([0,6]);
% % ylim([0,3]);
% legend('末端位置pos6');
% 
% figure;
% plot(ti,V6);
% xlabel('t(时间)');
% ylabel('V(速度）');
% xlim([0,6]);
%  ylim([16.5,16.7]);
% legend('末端速度V');
% 
% figure;
% plot(ti,A6);
% xlabel('t(时间)');
% ylabel('A(加速度）');
% xlim([0,6]);
% ylim([0.15,0.2]);
% legend('末端加速度A');

figure;
plot(ti,pos1,ti,pos2,ti,pos3,ti,pos4,ti,pos5,ti,pos6);
xlabel('t(时间)');
ylabel('pos(角度）');
xlim([0,6]);
ylim([-180,180]);
legend('pos1','pos2','pos3','pos4','pos5','pos6');


figure;
plot(ti,V1,ti,V2,ti,V3,ti,V4,ti,V5,ti,V6);
xlabel('t(时间)');
ylabel('V(速度）');
xlim([0,6]);
ylim([0,2.5]);
legend('V1','V2','V3','V4','V5','V6');

figure;
plot(ti,A1,ti,A2,ti,A3,ti,A4,ti,A5,ti,A6);
xlabel('t(时间)');
ylabel('A(加速度）');
xlim([0,6]);
ylim([0,0.2]);
legend('A1','A2','A3','A4','A5','A6');