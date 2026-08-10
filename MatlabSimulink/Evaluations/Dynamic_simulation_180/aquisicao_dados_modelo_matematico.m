%% Recolhimento dos dados do modelo matemático
% TEMPO
dado_t        = xd.time;
% DADOS TRAJETÓRIA DESEJADA
dado_vd       = vd.signals.values;
dado_xd       = xd.signals.values;
dado_yd       = yd.signals.values;
dado_xd_d     = xd_d.signals.values;
dado_yd_d     = yd_d.signals.values;
dado_xd_dd    = xd_dd.signals.values;
dado_yd_dd    = yd_dd.signals.values;
% DADOS ERRO
dado_ex       = ex.signals.values;
dado_ey       = ey.signals.values;
dado_ex_d     = ex_d.signals.values;
dado_ey_d     = ey_d.signals.values;
% DADOS CONTROLE
dado_ux       = ux.signals.values;
dado_uy       = uy.signals.values;
dado_microD   = microD.signals.values;
dado_microE   = microE.signals.values;
dado_tauDd    = tauDd.signals.values;
dado_tauEd    = tauEd.signals.values;
dado_IaDd     = IaDd.signals.values;
dado_IaEd     = IaEd.signals.values;
dado_VaDd     = VaDd.signals.values;
dado_VaEd     = VaEd.signals.values;
dado_VaDw     = VaDw.signals.values;
dado_VaEw     = VaEw.signals.values;
dado_IaDw     = IaDw.signals.values;
dado_IaEw     = IaEw.signals.values;
dado_tauDw    = tauDw.signals.values;
dado_tauEw    = tauEw.signals.values;
% DADOS ESTADOS
dado_vo       = vo.signals.values;
dado_xo       = xo.signals.values;
dado_yo       = yo.signals.values;
dado_thetaD   = thetaD.signals.values;
dado_thetaE   = thetaE.signals.values;
dado_thetaD_d = thetaD_d.signals.values;
dado_thetaE_d = thetaE_d.signals.values;
% DADOS SAÍDA
dado_vr       = vr.signals.values;
dado_xr       = xr.signals.values;
dado_yr       = yr.signals.values;

s1='dado_t';
s2='dado_vd';
s3='dado_xd';
s4='dado_yd';
s5='dado_xd_d';
s6='dado_yd_d';
s7='dado_xd_dd';
s8='dado_yd_dd';
s9='dado_ex';
s10='dado_ey';
s11='dado_ex_d';
s12='dado_ey_d';
s13='dado_ux';
s14='dado_uy';
s15='dado_microD';
s16='dado_microE';
s17='dado_tauDd';
s18='dado_tauEd';
s19='dado_IaDd';
s20='dado_IaEd';
s21='dado_VaDd';
s22='dado_VaEd';
s23='dado_VaDw';
s24='dado_VaEw';
s25='dado_IaDw';
s26='dado_IaEw';
s27='dado_tauDw';
s28='dado_tauEw';
s29='dado_vo';
s30='dado_xo';
s31='dado_yo';
s32='dado_thetaD';
s33='dado_thetaE';
s34='dado_thetaD_d';
s35='dado_thetaE_d';
s36='dado_vr';
s37='dado_xr';
s38='dado_yr';

hora = clock;
nome = ['YUN-Modelo-Matematico_' date '_' num2str(hora(4)) '-' num2str(hora(5)) '-' num2str(round(hora(6)))];
save([nome '.mat'], s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29, s30, s31, s32, s33, s34, s35, s36, s37, s38);