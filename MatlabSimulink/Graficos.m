close all
clc

%% TRAJETÓRIA "180"--------------------------------------------------------
%% Dynamic - x vs y - vd & vr
figure(1)%-----------------------------------------------------------------

load('.\Evaluations\Dynamic_simulation_180\Modelo-Matematico_21-Feb-2025_19-40-18')
dado_xr_sim = zeros;
dado_yr_sim = zeros;
j = 1;
for i = 1: 527 : size(dado_xr)
  dado_xr_sim(j,1) = dado_xr(i);
  dado_yr_sim(j,1) = dado_yr(i);
  j=j+1;
end

load('.\Evaluations\Dynamic_real_180\Modelo-Real_12-Feb-2025_18-55-18_180')
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(0, 0,   'square', 'Color',[0.0,0.0,0.0], 'MarkerSize', 12);
c = plot(dado_xr_sim, dado_yr_sim, '.', 'Color',[1.0,0.0,0.0], 'MarkerSize', 10);
d = plot(dado_xd, dado_yd, '-', 'Color',[1.0,0.7,0.0], 'LineWidth', 2);
e = plot(dado_xr, dado_yr, ':', 'Color',[0.0,0.0,0.0], 'LineWidth', 2);

xlabel('x [ m ]','fontsize',10,'FontName','Arial');
ylabel('y [ m ]','fontsize',10,'FontName','Arial');

set(gca,'xlim',[-0.20 2.7],'fontsize',10,'FontName','Aria');
set(gca,'ylim',[-0.2 1],   'fontsize',10,'FontName','Aria');

set(gca,'xTick',0:0.5:2.7);
set(gca,'yTick',0:0.2:1);
legend({'\fontsize{10}Starting Point','\fontsize{10}Simulation','\fontsize{10}Desired','\fontsize{10}Experimental'}, 'Position',[0.483 0.493 0.07 0.05]);
pbaspect([5/2 1 1]);
uistack(a,'top');
uistack(d,'top');
uistack(c,'top');
uistack(e,'top');

figure(2)%-----------------------------------------------------------------

load('.\Evaluations\Dynamic_simulation_180\Modelo-Matematico_21-Feb-2025_19-40-18')
dado_t_sim = zeros;
dado_vr_sim = zeros;
j = 1;
for i = 1: 527 : size(dado_t)
  dado_t_sim(j,1) = dado_t(i);
  dado_vr_sim(j,1) = dado_vr(i);
  j=j+1;
end

load('.\Evaluations\Dynamic_real_180\Modelo-Real_12-Feb-2025_18-55-18_180')
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(dado_t, dado_vd, '-', 'Color',[1.0,0.7,0.0], 'LineWidth', 4);
b = plot(dado_t_sim, dado_vr_sim, '.', 'Color',[1.0,0.0,0.0], 'MarkerSize', 10);
c = plot(dado_t, dado_vr, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);

xlabel('t [ s ]',   'fontsize', 10,'FontName','Aria');
ylabel('v [ m/s ]', 'fontsize', 10,'FontName','Aria');

set(gca,'xlim',[-1    19],  'fontsize',10,'FontName','Aria');
set(gca,'ylim',[-0.05 0.45],'fontsize',10,'FontName','Aria');

set(gca,'xTick',0:2:18);
set(gca,'yTick',0:0.1:0.4);

line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend({'\fontsize{10}Desired','\fontsize{10}Simulation','\fontsize{10}Experimental'}, 'Position',[0.48 0.48 0.07 0.05]);
pbaspect([14/4.4 1 1])
uistack(a,'top');
uistack(c,'top');
uistack(b,'top');

%% Dynamic - e_pos - e_vel
figure(1)%-----------------------------------------------------------------

load('.\Evaluations\Dynamic_simulation_180\Modelo-Matematico_21-Feb-2025_19-40-18')
dado_t_sim_ex = zeros;
dado_t_sim_ey = zeros;
dado_ex_sim = zeros;
dado_ey_sim = zeros;
j = 1;
for i = 1: 1054 : size(dado_t)
  dado_t_sim_ex(j,1) = dado_t(i);
  dado_ex_sim(j,1) = dado_ex(i);
  j=j+1;
end
j = 1;
for i = 527: 1054 : size(dado_t)
  dado_t_sim_ey(j,1) = dado_t(i);
  dado_ey_sim(j,1) = dado_ey(i);
  j=j+1;
end

load('.\Evaluations\Dynamic_real_180\Modelo-Real_12-Feb-2025_18-55-18_180')
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(dado_t, dado_ex, '-.', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);
b = plot(dado_t, dado_ey, '-',  'Color',[0.0,0.0,0.0], 'LineWidth', 1);
c = plot(dado_t_sim_ex, dado_ex_sim, '.', 'Color',[1.0,0.3,0.0], 'MarkerSize', 8);
d = plot(dado_t_sim_ey, dado_ey_sim, '*', 'Color',[1.0,0.3,0.0], 'MarkerSize', 6);

xlabel('t [ s ]',              'fontsize', 10,'FontName','Arial');
ylabel('position error [ m ]', 'fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-1 19],      'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.03 0.042],'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:19);
set(gca,'yTick',-0.02:0.02:0.04);

ytickangle(90)

ex_re  = '\fontsize{12}e\fontsize{9}x\fontsize{10} (experimental)';
ey_re  = '\fontsize{12}e\fontsize{9}y\fontsize{10} (experimental)';
ex_sim  = '\fontsize{12}e\fontsize{9}x\fontsize{10} (simulation)';
ey_sim  = '\fontsize{12}e\fontsize{9}y\fontsize{10} (simulation)';
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend({ex_re,ey_re,ex_sim,ey_sim},'Orientation','vertical','Position',[0.380 0.600 0.525 0.11],'NumColumns',2);
pbaspect([2.8571 1 1]);
uistack(c,'top');
uistack(d,'top');
uistack(a,'top');
uistack(b,'top');

%% Dynamic - VaD - VaE
load('.\Evaluations\Dynamic_simulation_180\Modelo-Matematico_21-Feb-2025_19-40-18')
figure(1)

subplot(1,2,1)%............................................................
hold on
box  on
grid on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a1 = plot(dado_t, dado_VaDd, ':', 'Color',[1.0,0.3,0.0], 'LineWidth', 2);

title('right side','fontsize', 10,'FontName','Arial');

xlabel('t [ s ]',                             'fontsize', 10,'FontName','Arial');
ylabel('$V_{a}$ [ V ]','Interpreter','latex', 'fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-0.50 18.50],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 10],    'fontsize',10,'FontName','Arial');

pbaspect([1.5 1 1]);

set(gca,'xTick',0:2:18);
set(gca,'yTick',-2:2:10);

subplot(1,2,2)%............................................................
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a2 = plot(dado_t, dado_VaEd, ':', 'Color',[1.0,0.3,0.0], 'LineWidth', 2);

title('left side','fontsize', 10,'FontName','Arial');

xlabel('t [ s ]','fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-0.50 18.50],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 10],    'fontsize',10,'FontName','Arial');

pbaspect([1.5 1 1]);

set(gca,'xTick',0:2:18);
set(gca,'yTick',-2:2:10);

load('.\Evaluations\Dynamic_real_180\Modelo-Real_12-Feb-2025_18-55-18_180')

subplot(1,2,1)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b1 = plot(dado_t, dado_VaD, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{10}Simulation', '\fontsize{10}Experimental', 'Position',[0.19 0.39 0.21 0.09]);
uistack(b1,'top');
uistack(a1,'top');

subplot(1,2,2)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b2 = plot(dado_t, dado_VaE, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{10}Simulation', '\fontsize{10}Experimental', 'Position',[0.63 0.39 0.21 0.09]);
uistack(b2,'top');
uistack(a2,'top');


%% Dynamic - thetaD_d - thetaE_d
load('.\Evaluations\Dynamic_simulation_180\Modelo-Matematico_21-Feb-2025_19-40-18')
figure(1)

subplot(1,2,1)%............................................................
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a1 = plot(dado_t, dado_thetaD_d, ':', 'Color',[1.0,0.3,0.0], 'LineWidth', 2);

title('right wheel','fontsize', 10,'FontName','Arial');

xlabel('t [ s ]',                                     'fontsize',10,'FontName','Arial');
ylabel('$\dot\theta$ [ rad/s ]','Interpreter','latex','fontsize',10,'FontName','Arial');

set(gca,'xlim',[-0.5 18.50],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 16.75],'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:18);
set(gca,'yTick',-0:2:16);

pbaspect([1.5 1 1]);

subplot(1,2,2)%............................................................
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a2 = plot(dado_t, dado_thetaE_d, ':', 'Color',[1.0,0.3,0.0], 'LineWidth', 2);

title('left wheel','fontsize', 10,'FontName','Century Schoolbook');

xlabel('t [ s ]',                                               'fontsize',10,'FontName','Arial');

set(gca,'xlim',[-0.50 18.50],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 16.75], 'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:18);
set(gca,'yTick',-0:2:16);

pbaspect([1.5 1 1]);

load('.\Evaluations\Dynamic_real_180\Modelo-Real_12-Feb-2025_18-55-18_180')

subplot(1,2,1)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b1 = plot(dado_t, dado_thetaD_d, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{10}Simulation','\fontsize{10}Experimental','Position',[0.19 0.39 0.21 0.09]);
uistack(b1,'top');
uistack(a1,'top');

subplot(1,2,2)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b2 = plot(dado_t, dado_thetaE_d, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{10}Simulation','\fontsize{10}Experimental','Position',[0.63 0.39 0.21 0.09]);
uistack(b2,'top');
uistack(a2,'top');

%% Kinematic - x vs y - vd & vr

load('.\Evaluations\Kinematic_simulation_180\Modelo-Matematico_25-Feb-2025_12-41-44')

dado_xr_sim = zeros;
dado_yr_sim = zeros;
j = 1;
for i = 1: 527 : size(dado_xr)
  dado_xr_sim(j,1) = dado_xr(i);
  dado_yr_sim(j,1) = dado_yr(i);
  j=j+1;
end

load('.\Evaluations\Kinematic_real_180\Modelo-Real_12-Feb-2025_19-39-59_180')
figure(3)%-----------------------------------------------------------------

hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(0, 0,   'square', 'Color',[0.0,0.0,0.0], 'MarkerSize', 12);
c = plot(dado_xr_sim, dado_yr_sim, '.', 'Color',[1.0,0.0,0.0], 'MarkerSize', 10);
d = plot(dado_xd, dado_yd, '-', 'Color',[0.0,0.9,1.0], 'LineWidth', 2);
e = plot(dado_xr, dado_yr, ':', 'Color',[0.0,0.0,0.0], 'LineWidth', 2);

xlabel('x [ m ]','fontsize',10,'FontName','Arial');
ylabel('y [ m ]','fontsize',10,'FontName','Arial');

set(gca,'xlim',[-0.20 2.7],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.2 1],   'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:0.5:2.7);
set(gca,'yTick',0:0.2:1);

legend({'\fontsize{10}Starting point','\fontsize{10}Simulation','\fontsize{10}Desired','\fontsize{10}Experimental'}, 'Position',[0.483 0.493 0.07 0.05]);
pbaspect([5/2 1 1]);
uistack(a,'top');
uistack(d,'top');
uistack(c,'top');
uistack(e,'top');

figure(4)%-----------------------------------------------------------------

load('.\Evaluations\Kinematic_simulation_180\Modelo-Matematico_25-Feb-2025_12-41-44')

dado_t_sim = zeros;
dado_vr_sim = zeros;
j = 1;
for i = 1: 550 : size(dado_t)
  dado_t_sim(j,1) = dado_t(i);
  dado_vr_sim(j,1) = dado_vr(i);
  j=j+1;
end

load('.\Evaluations\Kinematic_real_180\Modelo-Real_12-Feb-2025_19-39-59_180')

hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(dado_t, dado_vd, '-', 'Color',[0.0,0.9,1.0], 'LineWidth', 4);
b = plot(dado_t_sim, dado_vr_sim, '.', 'Color',[1.0,0.0,0.0], 'MarkerSize', 10);
c = plot(dado_t, dado_vr, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);

xlabel('t [ s ]',   'fontsize', 10,'FontName','Arial');
ylabel('v [ m/s ]', 'fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-1    19],  'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.05 0.45],'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:18);
set(gca,'yTick',0:0.1:0.4);

line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);

legend({'\fontsize{10}Desired','\fontsize{10}Simulation','\fontsize{10}Experimental'}, 'Position',[0.48 0.48 0.07 0.05]);
pbaspect([14/4.4 1 1]);
uistack(a,'top');
uistack(c,'top');
uistack(b,'top');

%% Kinematic - e_pos - e_vel
figure(1)

load('.\Evaluations\Kinematic_simulation_180\Modelo-Matematico_25-Feb-2025_12-41-44')
dado_t_sim_ey = zeros;
dado_ex_sim = zeros;
dado_ey_sim = zeros;
j = 1;
for i = 1: 1054 : size(dado_t)
  dado_t_sim_ex(j,1) = dado_t(i);
  dado_ex_sim(j,1) = dado_ex(i);
  j=j+1;
end
j = 1;
for i = 527: 1054 : size(dado_t)
  dado_t_sim_ey(j,1) = dado_t(i);
  dado_ey_sim(j,1) = dado_ey(i);
  j=j+1;
end

load('.\Evaluations\Kinematic_real_180\Modelo-Real_12-Feb-2025_19-39-59_180')
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(dado_t, dado_ex, '-.', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);
b = plot(dado_t, dado_ey, '-',  'Color',[0.0,0.0,0.0], 'LineWidth', 1);
c = plot(dado_t_sim_ex, dado_ex_sim, '.', 'Color',[0.0,0.5,1.0], 'MarkerSize', 8);
d = plot(dado_t_sim_ey, dado_ey_sim, '*', 'Color',[0.0,0.5,1.0], 'MarkerSize', 6);

xlabel('t [ s ]',               'fontsize', 10,'FontName','Arial');
ylabel('position error [ m ]', 'fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-1 19],     'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.022 0.038],'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:19);
set(gca,'yTick',-0.02:0.02:0.02);

ytickangle(90)

ex_re  = '\fontsize{12}e\fontsize{9}x\fontsize{10} (experimental)';
ey_re  = '\fontsize{12}e\fontsize{9}y\fontsize{10} (experimental)';
ex_sim  = '\fontsize{12}e\fontsize{9}x\fontsize{10} (simulation)';
ey_sim  = '\fontsize{12}e\fontsize{9}y\fontsize{10} (simulation)';
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend({ex_re,ey_re,ex_sim,ey_sim},'Orientation','vertical','Position',[0.373 0.557 0.525 0.11],'NumColumns',2);
pbaspect([2 0.6 1]);
uistack(c,'top');
uistack(d,'top');
uistack(a,'top');
uistack(b,'top');

%% Kinematic - VaD - VaE
load('.\Evaluations\Kinematic_simulation_180\Modelo-Matematico_25-Feb-2025_12-41-44')
figure(1)

subplot(1,2,1)%............................................................
hold on
box  on
grid on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a1 = plot(dado_t, dado_VaDd, '-', 'Color',[0.0,0.9,1.0], 'LineWidth', 2);

title('right side','fontsize', 10,'FontName','Arial');

xlabel('t [ s ]',                            'fontsize', 10,'FontName','Arial');
ylabel('$V_{a}$ [ V ]','Interpreter','latex','fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-0.50 18.50],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 10],    'fontsize',10,'FontName','Arial');

pbaspect([1.5 1 1]);

set(gca,'xTick',0:2:18);
set(gca,'yTick',-2:2:10);

subplot(1,2,2)%............................................................
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a2 = plot(dado_t, dado_VaEd, '-', 'Color',[0.0,0.9,1.0], 'LineWidth', 2);

title('left side','fontsize', 10,'FontName','Arial');

xlabel('t [ s ]','fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-0.50 18.50],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 10],    'fontsize',10,'FontName','Arial');

pbaspect([1.5 1 1]);

set(gca,'xTick',0:2:18);
set(gca,'yTick',-2:2:10);

load('.\Evaluations\Kinematic_real_180\Modelo-Real_12-Feb-2025_19-39-59_180')

subplot(1,2,1)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b1 = plot(dado_t, dado_VaD, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{10}Simulation', '\fontsize{10}Experimental', 'Position',[0.19 0.39 0.21 0.09]);
uistack(b1,'top');
uistack(a1,'top');

subplot(1,2,2)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b2 = plot(dado_t, dado_VaE, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{10}Simulation', '\fontsize{10}Experimental', 'Position',[0.63 0.39 0.21 0.09]);
uistack(b2,'top');
uistack(a2,'top');

%% Kinematic - thetaD_d - thetaE_d
load('.\Evaluations\Kinematic_simulation_180\Modelo-Matematico_25-Feb-2025_12-41-44')
figure(1)

subplot(1,2,1)%............................................................
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a1 = plot(dado_t, dado_thetaDw_d, ':', 'Color',[0.0,0.9,1.0], 'LineWidth', 2);

title('right wheel','fontsize', 10,'FontName','Arial');

xlabel('t [ s ]',                                     'fontsize',10,'FontName','Arial');
ylabel('$\dot\theta$ [ rad/s ]','Interpreter','latex','fontsize',10,'FontName','Arial');

set(gca,'xlim',[-0.50 18.50],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 16.75], 'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:18);
set(gca,'yTick',-0:2:16);

pbaspect([1.5 1 1]);

subplot(1,2,2)%............................................................
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a2 = plot(dado_t, dado_thetaEw_d, ':', 'Color',[0.0,0.9,1.0], 'LineWidth', 2);

title('left wheel','fontsize', 10,'FontName','Arial');

xlabel('t [ s ]',                                               'fontsize',10,'FontName','Arial');

set(gca,'xlim',[-0.50 18.50],  'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 16.75],   'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:18);
set(gca,'yTick',-0:2:16);

pbaspect([1.5 1 1]);

load('...\Evaluations\Kinematic_real_180\Modelo-Real_12-Feb-2025_19-39-59_180')

subplot(1,2,1)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b1 = plot(dado_t, dado_thetaDw_d, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{10}Simulation','\fontsize{10}Experimental','Position',[0.19 0.39 0.21 0.09]);
uistack(b1,'top');
uistack(a1,'top');

subplot(1,2,2)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b2 = plot(dado_t, dado_thetaEw_d, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{10}Simulation','\fontsize{10}Experimental','Position',[0.63 0.39 0.21 0.09]);
uistack(b2,'top');
uistack(a2,'top');

%% TRAJETÓRIA "8"----------------------------------------------------------
%% Dynamic - x vs y - vd & vr
figure(1)

load('.\Evaluations\Dynamic_simulation_8\Modelo-Matematico_25-Feb-2025_16-29-49')
dado_xr_sim = zeros;
dado_yr_sim = zeros;
j = 1;
for i = 1: 511 : size(dado_xr)
  dado_xr_sim(j,1) = dado_xr(i);
  dado_yr_sim(j,1) = dado_yr(i);
  j=j+1;
end

load('.\Evaluations\Dynamic_real_8\Modelo-Real_12-Feb-2025_20-53-56 - 8')
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

b = plot(0, 0, 'square', 'Color',[0.0,0.0,0.0], 'MarkerSize', 12);
c = plot(dado_xr_sim, dado_yr_sim, '.', 'Color',[1.0,0.0,0.0], 'MarkerSize', 10);
d = plot(dado_xd, dado_yd, '-', 'Color',[1.0,0.7,0.0], 'LineWidth', 2);
e = plot(dado_xr, dado_yr, ':', 'Color',[0.0,0.0,0.0], 'LineWidth', 2);

xlabel('x [m]','fontsize',10,'FontName','Arial');
ylabel('y [m]','fontsize',10,'FontName','Arial');

set(gca,'xlim',[-2.2 0.2],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.1 1.1],'fontsize',10,'FontName','Arial');

set(gca,'xTick',-2.0:0.2:0.0);
set(gca,'yTick',0:0.2:1);

legend({'\fontsize{9}Starting Point','\fontsize{9}Simulation','\fontsize{9}Desired','\fontsize{9}Experimental'}, 'Position',[0.83 0.39642 0.1472 0.29]);
pbaspect([2.4/1.2 1 1]);
uistack(b,'top');
uistack(d,'top');
uistack(c,'top');
uistack(e,'top');

figure(2)%-----------------------------------------------------------------

load('.\Evaluations\Dynamic_simulation_8\Modelo-Matematico_25-Feb-2025_16-29-49')
dado_t_sim = zeros;
dado_vr_sim = zeros;
j = 1;
for i = 1: 511 : size(dado_t)
  dado_t_sim(j,1) = dado_t(i);
  dado_vr_sim(j,1) = dado_vr(i);
  j=j+1;
end

load('.\Evaluations\Dynamic_real_8\Modelo-Real_12-Feb-2025_20-53-56 - 8')
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(dado_t, dado_vd, '-', 'Color',[1.0,0.8,0.0], 'LineWidth', 4);
b = plot(dado_t_sim, dado_vr_sim, '.', 'Color',[1.0,0.0,0.0], 'MarkerSize', 10);
c = plot(dado_t, dado_vr, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);

xlabel('t [ s ]',   'fontsize', 10,'FontName','Century Arial');
ylabel('v [ m/s ]', 'fontsize', 10,'FontName','Century Arial');

set(gca,'xlim',[-1    28.5],  'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.05 0.5],   'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:28);
set(gca,'yTick',0:0.1:0.5);

line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend({'\fontsize{10}Desired','\fontsize{10}Simulation','\fontsize{10}Experimental'}, 'Position',[0.49 0.36 0.07 0.05],'Orientation','horizontal');
pbaspect([14/4 1 1]);
uistack(a,'top');
uistack(c,'top');
uistack(b,'top');

%% Dynamic - e_pos - e_vel
figure(1)%-----------------------------------------------------------------

load('.\Evaluations\Dynamic_simulation_8\Modelo-Matematico_25-Feb-2025_16-29-49')
dado_t_sim_ex = zeros;
dado_t_sim_ey = zeros;
dado_ex_sim = zeros;
dado_ey_sim = zeros;
j = 1;
for i = 1: 2044 : size(dado_t)
  dado_t_sim_ex(j,1) = dado_t(i);
  dado_ex_sim(j,1) = dado_ex(i);
  j=j+1;
end
j = 1;
for i = 1022: 2044 : size(dado_t)
  dado_t_sim_ey(j,1) = dado_t(i);
  dado_ey_sim(j,1) = dado_ey(i);
  j=j+1;
end

load('.\Evaluations\Dynamic_real_8\Modelo-Real_12-Feb-2025_20-53-56 - 8')
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(dado_t, dado_ex, '-.', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);
b = plot(dado_t, dado_ey, '-',  'Color',[0.0,0.0,0.0], 'LineWidth', 1);
c = plot(dado_t_sim_ex, dado_ex_sim, '.', 'Color',[1.0,0.3,0.0], 'MarkerSize', 8);
d = plot(dado_t_sim_ey, dado_ey_sim, '*', 'Color',[1.0,0.3,0.0], 'MarkerSize', 6);

xlabel('t [ s ]',               'fontsize', 10,'FontName','Arial');
ylabel('position error [ m ]', 'fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-1 28.5],   'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.04 0.08],'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:4:28);
set(gca,'yTick',-0.04:0.02:0.06);

ex_re  = '\fontsize{12}e\fontsize{9}x\fontsize{10} (experimental)';
ey_re  = '\fontsize{12}e\fontsize{9}y\fontsize{10} (experimental)';
ex_sim  = '\fontsize{12}e\fontsize{9}x\fontsize{10} (simulation)';
ey_sim  = '\fontsize{12}e\fontsize{9}y\fontsize{10} (simulation)';
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend({ex_re,ey_re,ex_sim,ey_sim}, 'Position',[0.239 0.587 0.525 0.1012],'Orientation','vertical','NumColumns',2);
pbaspect([3 1 1]);
uistack(c,'top');
uistack(d,'top');
uistack(a,'top');
uistack(b,'top');

%% Dynamic - VaD - VaE
load('.\Evaluations\Dynamic_simulation_8\Modelo-Matematico_25-Feb-2025_16-29-49')
figure(1)

subplot(1,2,1)%............................................................
hold on
box  on
grid on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a1 = plot(dado_t, dado_VaDd, ':', 'Color',[1.0,0.3,0.0], 'LineWidth', 2);

title('right side','fontsize', 10,'FontName','Arial');

xlabel('t [ s ]',                             'fontsize', 10,'FontName','Arial');
ylabel('$V_{a}$ [ V ]','Interpreter','latex', 'fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-0.50 28],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 10.5], 'fontsize',10,'FontName','Arial');

pbaspect([1.5 1 1]);

set(gca,'xTick',0:4:28);
set(gca,'yTick',-2:2:10);

subplot(1,2,2)%............................................................
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a2 = plot(dado_t, dado_VaEd, ':', 'Color',[1.0,0.3,0.0], 'LineWidth', 2);

title('left side','fontsize', 10,'FontName','Arial');

xlabel('t [ s ]',                               'fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-0.50 28],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 10.5], 'fontsize',10,'FontName','Arial');

pbaspect([1.5 1 1]);

set(gca,'xTick',0:4:28);
set(gca,'yTick',-2:2:10);

load('.\Evaluations\Dynamic_real_8\Modelo-Real_12-Feb-2025_20-53-56 - 8')

subplot(1,2,1)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b1 = plot(dado_t, dado_VaD, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{8}Sim.', '\fontsize{8}Exp.', 'Position',[0.19 0.39 0.21 0.09]);
uistack(b1,'top');
uistack(a1,'top');

subplot(1,2,2)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b2 = plot(dado_t, dado_VaE, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{8}Sim.', '\fontsize{8}Exp.', 'Position',[0.63 0.39 0.21 0.09]);
uistack(b2,'top');
uistack(a2,'top');

%% Dynamic - thetaD_d - thetaE_d
load('.\Evaluations\Dynamic_simulation_8\Modelo-Matematico_25-Feb-2025_16-29-49')
figure(1)

subplot(1,2,1)%............................................................
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a1 = plot(dado_t, dado_thetaD_d, ':', 'Color',[1.0,0.3,0.0], 'LineWidth', 2);

title('right wheel','fontsize', 10,'FontName','Arial');

xlabel('t [ s ]',                                     'fontsize',10,'FontName','Arial');
ylabel('$\dot\theta$ [ rad/s ]','Interpreter','latex','fontsize',10,'FontName','Arial');

set(gca,'xlim',[-0.50 28],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 16],'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:4:28);
set(gca,'yTick',0:2:16);

pbaspect([1.5 1 1]);

subplot(1,2,2)%............................................................
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a2 = plot(dado_t, dado_thetaE_d, ':', 'Color',[1.0,0.3,0.0], 'LineWidth', 2);

title('left wheel','fontsize', 10,'FontName','Arial');

xlabel('t [ s ]','fontsize',10,'FontName','Arial');

set(gca,'xlim',[-0.50 28],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.5 16], 'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:4:28);
set(gca,'yTick',0:2:16);

pbaspect([1.5 1 1]);

load('.\Evaluations\Dynamic_real_8\Modelo-Real_12-Feb-2025_20-53-56 - 8')

subplot(1,2,1)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b1 = plot(dado_t, dado_thetaD_d, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{8}Sim.','\fontsize{8}Exp.','Position',[0.19 0.39 0.21 0.09]);
uistack(b1,'top');
uistack(a1,'top');

subplot(1,2,2)%............................................................
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
b2 = plot(dado_t, dado_thetaE_d, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{8}Sim.','\fontsize{8}Exp.','Position',[0.63 0.39 0.21 0.09]);
uistack(b2,'top');
uistack(a2,'top');

%% TRAJETÓRIA "180" - sem linearização por DC------------------------------
%% Dynamic - x vs y - vd & vr
load('.\Evaluations\Dynamic_real_180_no_linearization\Modelo-Real_28-Feb-2025_18-6-59')
figure(1)

hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(0, 0,   'square', 'Color',[0.0,0.0,0.0], 'MarkerSize', 10);
c = plot(dado_xd, dado_yd, '-', 'Color',[1.0,0.7,0.0], 'LineWidth', 2);
d = plot(dado_xr, dado_yr, '--', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);

xlabel('x [ m ]','fontsize',10,'FontName','Arial');
ylabel('y [ m ]','fontsize',10,'FontName','Arial');

set(gca,'xlim',[-0.3 2.7],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.2 1.0],'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:0.5:2.7);
set(gca,'yTick',0:0.2:1);

legend({'\fontsize{10}Starting Point','\fontsize{10}Desired','\fontsize{10}Experimental'}, 'Position',[0.483 0.483 0.07 0.05]);
pbaspect([3/1.2 1 1]);
uistack(a,'top');
uistack(c,'top');
uistack(d,'top');

figure(2)
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(dado_t, dado_vd, '-', 'Color',[1.0,0.7,0.0], 'LineWidth', 5);
b = plot(dado_t, dado_vr, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);

xlabel('t [ s ]',   'fontsize', 10,'FontName','Arial');
ylabel('v [ m/s ]', 'fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-0.5    18.5],  'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.05 0.55],'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:18);
set(gca,'yTick',0:0.1:0.5);

line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend({'\fontsize{10}Desired','\fontsize{10}Experimental'}, 'Position',[0.456 0.417 0.129 0.112]);
pbaspect([14/4.4 1 1]);
uistack(a,'top');
uistack(b,'top');

%% Dynamic - e_pos - e_vel
load('.\Evaluations\Dynamic_real_180_no_linearization\Modelo-Real_28-Feb-2025_18-6-59')
figure(2)

hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(dado_t, dado_ex, '-.', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);
b = plot(dado_t, dado_ey, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);

xlabel('t [ s ]',              'fontsize', 10,'FontName','Arial');
ylabel('position error [ m ]', 'fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-1 19],     'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.35 0.55],'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:19);
set(gca,'yTick',-0.3:0.1:0.5);

ex  = '\fontsize{12}e\fontsize{9}x';
ey  = '\fontsize{12}e\fontsize{9}y';
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend({ex,ey}, 'Position',[0.188 0.542 0.118 0.106],'Orientation','vertical');
pbaspect([3 1 1]);
uistack(a,'top');
uistack(b,'top');

%% TRAJETÓRIA "180" - sem linearização por DC -(k0=5)----------------------
%% Kinematic - x vs y - vd & vr
load('.\Evaluations\Kinematic_real_180_no_linearization\Modelo-Real_08-Jun-2025_16-20-55')
figure(1)

hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(0, 0,   'square', 'Color',[0.0,0.0,0.0], 'MarkerSize', 12);
c = plot(dado_xd, dado_yd, '-', 'Color',[0.0,0.9,1.0], 'LineWidth', 2);
d = plot(dado_xr, dado_yr, '--', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);

xlabel('x [ m ]','fontsize',10,'FontName','Arial');
ylabel('y [ m ]','fontsize',10,'FontName','Arial');

set(gca,'xlim',[-0.55 2.7],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.2 1.0] ,'fontsize',10,'FontName','Arial');

set(gca,'xTick',-0.5:0.5:2.7);
set(gca,'yTick',0:0.2:1);
legend({'\fontsize{10}Starting Point','\fontsize{10}Desired','\fontsize{10}Experimental'}, 'Position',[0.483 0.483 0.07 0.05]);
pbaspect([3.25/1.2 1 1]);
uistack(a,'top');
uistack(c,'top');
uistack(d,'top');

figure(2)
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(dado_t, dado_vd, '-', 'Color',[0.0,0.9,1.0], 'LineWidth', 4);
b = plot(dado_t, dado_vr, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 0.5);

xlabel('t [ s ]',   'fontsize', 10,'FontName','Arial');
ylabel('v [ m/s ]', 'fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-0.5 18.5],'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.05 0.8],'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:18);
set(gca,'yTick',0:0.1:0.8);

line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend({'\fontsize{10}Desired','\fontsize{10}Experimental'}, 'Position',[0.160 0.576 0.230 0.092]);
pbaspect([14/4.4 1 1]);
uistack(a,'top');
uistack(b,'top');

%% Kinematic - e_pos - e_vel
load('.\Evaluations\Kinematic_real_180_no_linearization\Modelo-Real_08-Jun-2025_16-20-55')
figure(1)
hold on
grid on
box  on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);

a = plot(dado_t, dado_ex, '-.', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);
b = plot(dado_t, dado_ey, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);

xlabel('t [ s ]',              'fontsize', 10,'FontName','Arial');
ylabel('position error [ m ]', 'fontsize', 10,'FontName','Arial');

set(gca,'xlim',[-1 19],     'fontsize',10,'FontName','Arial');
set(gca,'ylim',[-0.35 0.55],'fontsize',10,'FontName','Arial');

set(gca,'xTick',0:2:19);
set(gca,'yTick',-0.3:0.1:0.6);

ex  = '\fontsize{12}e\fontsize{9}x';
ey  = '\fontsize{12}e\fontsize{9}y';
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend({ex,ey}, 'Position',[0.188 0.542 0.118 0.106],'Orientation','vertical');
pbaspect([3 1 1]);
uistack(a,'top');
uistack(b,'top');