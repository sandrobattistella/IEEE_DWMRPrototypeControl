
%% Recolhimento dos dados do modelo real
% TEMPO
dado_t             = xd.time;
% DADOS TRAJETÓRIA DESEJADA
dado_vd            = vd.signals.values;
dado_xd            = xd.signals.values;
dado_yd            = yd.signals.values;
dado_xd_d          = xd_d.signals.values;
dado_yd_d          = yd_d.signals.values;
dado_xd_dd         = xd_dd.signals.values;
dado_yd_dd         = yd_dd.signals.values;
% DADOS ERRO
dado_ex            = ex.signals.values;
dado_ey            = ey.signals.values;
dado_ex_d          = ex_d.signals.values;
dado_ey_d          = ey_d.signals.values;
% DADOS CONTROLE
dado_ux            = ux.signals.values;
dado_uy            = uy.signals.values;
dado_microD        = microD.signals.values;
dado_microE        = microE.signals.values;
dado_tauD          = tauD.signals.values;
dado_tauE          = tauE.signals.values;
dado_IaD           = IaD.signals.values;
dado_IaE           = IaE.signals.values;
dado_VaD           = VaD.signals.values;
dado_VaE           = VaE.signals.values;
dado_DC_D          = DC_D.signals.values;
dado_DC_E          = DC_E.signals.values;
% DADOS ESTADOS
dado_vo            = vo.signals.values;
dado_xo            = xo.signals.values;
dado_yo            = yo.signals.values;
dado_thetaD        = thetaD.signals.values;
dado_thetaE        = thetaE.signals.values;
dado_thetaD_orig   = thetaD_orig.signals.values;
dado_thetaE_orig   = thetaE_orig.signals.values;
dado_thetaD_d      = thetaD_d.signals.values;
dado_thetaE_d      = thetaE_d.signals.values;
dado_thetaD_d_orig = thetaD_d_orig.signals.values;
dado_thetaE_d_orig = thetaE_d_orig.signals.values;
% DADOS SAÍDA
dado_vr            = vr.signals.values;
dado_xr            = xr.signals.values;
dado_yr            = yr.signals.values;

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
s17='dado_tauD';
s18='dado_tauE';
s19='dado_IaD';
s20='dado_IaE';
s21='dado_VaD';
s22='dado_VaE';
s23='dado_DC_D';
s24='dado_DC_E';
s25='dado_vo';
s26='dado_xo';
s27='dado_yo';
s28='dado_thetaD';
s29='dado_thetaE';
s30='dado_thetaD_orig';
s31='dado_thetaE_orig';
s32='dado_thetaD_d';
s33='dado_thetaE_d';
s34='dado_thetaD_d_orig';
s35='dado_thetaE_d_orig';
s36='dado_vr';
s37='dado_xr';
s38='dado_yr';

hora = clock;
nome = ['YUN-Modelo-Real_' date '_' num2str(hora(4)) '-' num2str(hora(5)) '-' num2str(round(hora(6)))];
save([nome '.mat'], s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29, s30, s31, s32, s33, s34, s35, s36, s37, s38);