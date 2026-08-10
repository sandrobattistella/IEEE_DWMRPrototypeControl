% DIAZ
%% Recolhimento dos dados do modelo matemático
% TEMPO
dado_t         = xd.time;
% DADOS TRAJETÓRIA DESEJADA
dado_vd        = vd.signals.values;
dado_xd        = xd.signals.values;
dado_yd        = yd.signals.values;
dado_xd_d      = xd_d.signals.values;
dado_yd_d      = yd_d.signals.values;
% DADOS ERRO
dado_ex        = ex.signals.values;
dado_ey        = ey.signals.values;
% DADOS CONTROLE
dado_ux        = ux.signals.values;
dado_uy        = uy.signals.values;
dado_thetaDd_d = thetaDd_d.signals.values;
dado_thetaEd_d = thetaEd_d.signals.values;
dado_VaDd      = VaDd.signals.values;
dado_VaEd      = VaEd.signals.values;
dado_VaDw      = VaDw.signals.values;
dado_VaEw      = VaEw.signals.values;
dado_thetaDw_d = thetaDw_d.signals.values;
dado_thetaEw_d = thetaEw_d.signals.values;
dado_thetaDw   = thetaDw.signals.values;
dado_thetaEw   = thetaEw.signals.values;
% DADOS ESTADOS
dado_xr        = xr.signals.values;
dado_yr        = yr.signals.values;
dado_phi       = phi.signals.values;
% OUTROS DADOS
dado_xr_d      = xr_d.signals.values;
dado_yr_d      = yr_d.signals.values;
dado_vr        = vr.signals.values;

%--------------------------------------------------------------------------
s1 =  'dado_t';
s2 =  'dado_vd';
s3 =  'dado_xd';
s4 =  'dado_yd';
s5 =  'dado_xd_d';
s6 =  'dado_yd_d';
s7 =  'dado_ex';
s8 =  'dado_ey';
s9 =  'dado_ux';
s10 = 'dado_uy';
s11 = 'dado_thetaDd_d';
s12 = 'dado_thetaEd_d';
s13 = 'dado_VaDd';
s14 = 'dado_VaEd';
s15 = 'dado_VaDw';
s16 = 'dado_VaEw';
s17 = 'dado_thetaDw_d';
s18 = 'dado_thetaEw_d';
s19 = 'dado_thetaDw';
s20 = 'dado_thetaEw';
s21 = 'dado_xr';
s22 = 'dado_yr';
s23 = 'dado_phi';
s24 = 'dado_xr_d';
s25 = 'dado_yr_d';
s26 = 'dado_vr';
%--------------------------------------------------------------------------

hora = clock;
nome = ['DIAZ-Modelo-Matematico_' date '_' num2str(hora(4)) '-' num2str(hora(5)) '-' num2str(round(hora(6)))];
save([nome '.mat'],s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26);