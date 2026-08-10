%% CURVA 90-RAMPA
% figure(1)%............................................................
% hold on
% grid on
% set(gca,'GridLineStyle',':');
% set(gca,'GridColor','k');
% set(gca,'GridAlpha',1);
% a = plot3(dado_xd, dado_yd, dado_vd,'-', 'Color',[1.0,0.5,0.0], 'LineWidth', 4);
% b = plot3(dado_xr, dado_yr, dado_vr,':', 'Color',[0.0,0.0,0.0], 'LineWidth', 2);
% xlabel('x [m]','fontsize',17,'FontName','Century Schoolbook');
% set(gca,'xlim',[-0.20 1.7],'fontsize',12,'FontName','Century Schoolbook');
% ylabel('y [m]','fontsize',17,'FontName','Century Schoolbook');
% set(gca,'ylim',[-0.2 1.75],'fontsize',12,'FontName','Century Schoolbook');
% zlabel('v [m/s]','fontsize',17,'FontName','Century Schoolbook');
% set(gca,'zlim',[0 0.5],'fontsize',12,'FontName','Century Schoolbook');
% legend('\fontsize{12}Desejado','\fontsize{12}Robô (Pr)');
% pbaspect([1 1 1]);
% uistack(a,'top');
% uistack(b,'top');
% 
% figure(2)%............................................................
% hold on
% grid on
% set(gca,'GridLineStyle',':');
% set(gca,'GridColor','k');
% set(gca,'GridAlpha',1);
% a = plot(dado_t, dado_vd, '-', 'Color',[1.0,0.5,0.0], 'LineWidth', 4);
% b = plot(dado_t, dado_vr, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);
% xlabel('t [s]',  'fontsize', 17,'FontName','Century Schoolbook');
% set(gca,'xlim',[-1 9],'fontsize',12,'FontName','Century Schoolbook');
% ylabel('v [m/s]',  'fontsize', 17,'FontName','Century Schoolbook');
% set(gca,'ylim',[-0.05 0.5],'fontsize',12,'FontName','Century Schoolbook');
% line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
% line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
% legend('\fontsize{12}Desejado','\fontsize{12}Robô (Pr)');
% pbaspect([2 1 1]);
% uistack(a,'top');
% uistack(b,'top');

%% LINHA RETA-RAMPA
figure(1)%............................................................
hold on
grid on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
a = plot3(dado_xd, dado_yd, dado_vd,'-', 'Color',[1.0,0.5,0.0], 'LineWidth', 4);
b = plot3(dado_xr, dado_yr, dado_vr,':', 'Color',[0.0,0.0,0.0], 'LineWidth', 2);
xlabel('x [m]','fontsize',17,'FontName','Century Schoolbook');
set(gca,'xlim',[-0.20 3],'fontsize',12,'FontName','Century Schoolbook');
ylabel('y [m]','fontsize',17,'FontName','Century Schoolbook');
set(gca,'ylim',[-1 2],'fontsize',12,'FontName','Century Schoolbook');
zlabel('v [m/s]','fontsize',17,'FontName','Century Schoolbook');
set(gca,'zlim',[0 0.7],'fontsize',12,'FontName','Century Schoolbook');
legend('\fontsize{12}Desejado','\fontsize{12}Robô (Pr)');
pbaspect([1 1 1]);
uistack(a,'top');
uistack(b,'top');

figure(2)%............................................................
hold on
grid on
set(gca,'GridLineStyle',':');
set(gca,'GridColor','k');
set(gca,'GridAlpha',1);
a = plot(dado_t, dado_vd, '-', 'Color',[1.0,0.5,0.0], 'LineWidth', 4);
b = plot(dado_t, dado_vr, '-', 'Color',[0.0,0.0,0.0], 'LineWidth', 1);
xlabel('t [s]',  'fontsize', 17,'FontName','Century Schoolbook');
set(gca,'xlim',[-1 t_f+1],'fontsize',12,'FontName','Century Schoolbook');
ylabel('v [m/s]',  'fontsize', 17,'FontName','Century Schoolbook');
set(gca,'ylim',[-0.05 v+0.15],'fontsize',12,'FontName','Century Schoolbook');
line([0 0], ylim, 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
line(xlim, [0 0], 'Color',[0.5,0.5,0.5], 'LineStyle','-', 'LineWidth', 1);
legend('\fontsize{12}Desejado','\fontsize{12}Robô (Pr)');
pbaspect([2 1 1]);
uistack(a,'top');
uistack(b,'top');