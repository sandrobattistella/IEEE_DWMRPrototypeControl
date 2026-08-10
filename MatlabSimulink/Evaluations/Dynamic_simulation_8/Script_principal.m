clc
clear
close all
%% Parâmetros Gerais
fst = 0.001; % (fundamental sample time) Tempo de amostragem fundamental - [s]

% ENCODER------------------------------------------------------------------
fpr   = 40;       % Quantidade de furos por revolução em cada encoder - [furos/revolução]
k_enc = 2*pi/fpr; % Ganho do encoder - [rad*revolução/furos]

% FILTROS------------------------------------------------------------------
freq_pos     = 200;  % Frequência de corte do filtro passa-baixa para variáveis de posição - [rad/s]
freq_vel     = 200;  % Frequência de corte do filtro passa-baixa para variáveis de velocidade - [rad/s]
filter_order = 2;   % Ordem do filtro passa baixa.

% SENSIBILIDADE DA VELOCIDADE ZERO-----------------------------------------
svzD = 0; %[rad/s]
svzE = 0; %[rad/s]

% DETECTOR DE VELOCIDADE ZERO------------------------------------------------------------------
delayD = 0.1/fst;
delayE = 0.1/fst;

% INCERTEZAS NOS PARÂMETROS------------------------------------------------
var_RaD = 1;
var_RaE = 1;
var_KaD = 1;
var_KaE = 1;
var_KtD = 1;
var_KtE = 1;
var_fD  = 1;
var_fE  = 1;
var_Ir  = 1;
var_m   = 1;
var_I   = 1;

% PARÂMETROS ELÉTRICOS E MECÂNICOS DOS MOTORES-----------------------------
RaD = 8.4507; % Resistência de armadura do motor da direita - [ohms]
RaE = 7.7177; % Resistência de armadura do motor da esquerda - [ohms]
KaD = 0.4713; % Costande de força contraeletromotriz do motor da direita - [V*s/rad]
KaE = 0.5046; % Costande de força contraeletromotriz do motor da esquerda - [V*s/rad]
KtD = KaD;    % Constante de torque do motor da direita. Considera-se igual a KaD (cf. SI) - [kgf*m/A]
KtE = KaE;    % Constante de torque do motor da esquerda. Considera-se igual a KaE (cf. SI) - [kgf*m/A]
fD  = 0.0069; % Coeficiente de atrito viscoso no motor da direita - [kgf*m*s/rad]
fE  = 0.0053; % Coeficiente de atrito viscoso no motor da esquerda - [kgf*m*s/rad]

% PARÂMETROS ELÉTRICOS E MECÂNICOS DOS MOTORES COM INCERTEZAS--------------
RaD_v = var_RaD*8.4507; % Resistência de armadura do motor da direita - [ohms]
RaE_v = var_RaE*7.7177; % Resistência de armadura do motor da esquerda - [ohms]
KaD_v = var_KaD*0.4713; % Costande de força contraeletromotriz do motor da direita - [V*s/rad]
KaE_v = var_KaE*0.5046; % Costande de força contraeletromotriz do motor da esquerda - [V*s/rad]
KtD_v = var_KtD*KaD;    % Constante de torque do motor da direita. Considera-se igual a KaD (cf. SI) - [kgf*m/A]
KtE_v = var_KtE*KaE;    % Constante de torque do motor da esquerda. Considera-se igual a KaE (cf. SI) - [kgf*m/A]
fD_v  = var_fD*0.0069;  % Coeficiente de atrito viscoso no motor da direita - [kgf*m*s/rad]
fE_v  = var_fE*0.0053;  % Coeficiente de atrito viscoso no motor da esquerda - [kgf*m*s/rad]

% COMPENSAÇÃO DE ZONA-MORTA------------------------------------------------
VaD_min = 2; % Módulo da tensão de zona morta do motor direito;
VaE_min = 2; % Módulo da tensão de zona morta do motor esquerdo;

% TENSÃO MÁXIMA DE OPERAÇÃO------------------------------------------------
VaD_max = 14; % Constante multiplicadora do Duty Cycle no motor D - [V]
VaE_max = 14; % Constante multiplicadora do Duty Cycle no motor E - [V]

% CINEMÁTICA---------------------------------------------------------------
r_d = 0.0292;    % Raio da roda direita - [m]
r_e = 0.0293;    % Raio da roda esquerda - [m]
b   = 0.1210;    % Metade da distância entre as rodas - [m]
c_d = r_d/(2*b); % Constante adimensional
c_e = r_e/(2*b); % Constante adimensional

% DINÂMICA-----------------------------------------------------------------
Ir = 0.00094; % Momento de inércia de roda+rotor - [kg*m^2]
m  = 1.932;   % (mc + 2*mr)            - Massa total do robô - [kg]
I  = 0.0903;  % (Ic + 2*mr*b^2 + 2*Im) - Soma de valores de inércia - [kg*m^2]

% DINÂMICA COM INCERTEZAS--------------------------------------------------
Ir_v = var_Ir*0.00094; % Momento de inércia de roda+rotor - [kg*m^2]
m_v  = var_m*1.932;    % (mc + 2*mr)            - Massa total do robô - [kg]
I_v  = var_I*0.0903;   % (Ic + 2*mr*b^2 + 2*Im) - Soma de valores de inércia - [kg*m^2]

% CONTROLE-----------------------------------------------------------------
L  = 0.10; % Distância de Look Ahead - [m]
k0 = 25;   % Ganho proporcional da Realimentação Linearizante;
k1 = 25;   % Ganho derivativo da Realimentação Linearizante;

% NÃO IDEALIDADES----------------------------------------------------------
NL        = 0;             %Habilitar(1) ou desabilitar(0) as não-idealidades;
npD       = 0.0001;        %Noise power - ruído branco na roda direita;
npE       = 0.0001;        %Noise power - ruído branco na roda direita;
vel_ang_D = 4;             %Ciclo não ideal na direita - rotações/s;
vel_ang_E = 4;             %Ciclo não ideal na esquerda - rotações/s;

%% Trajetórias (descomentar para utilizar)
% run('Trajetoria_Circulo_RAMPA');
% T=1;

% run('Trajetoria_Curva_90_graus_RAMPA');
% T=2;

% run('Trajetoria_Curva_180_graus_RAMPA');
% T=3;

run('Trajetoria_OITO_8');
T=4;

%% Estado inicial
x0_1 = -L;               % estado inicial x
x0_2 = 0;              % estado inicial y
x0_3 = 0;        %(pi/2)/c; % estado inicial theta_D
x0_4 = 0;               % estado inicial theta_E
x0_5 = 0;               % estado inicial theta_D'
x0_6 = 0;               % estado inicial theta_E'      
x0   = [x0_1; x0_2; x0_3; x0_4; x0_5; x0_6];

% Simulação, Aquisição e Gráficos (Descomentar para utilizar)
sim('YUN_modelo_matematico');
run('YUN_aquisicao_dados_modelo_matematico');
run('Graficos');

% set_param('YUN_modelo_real', 'SimulationCommand', 'start');
% pause(t_f+5);
% run('YUN_aquisicao_dados_modelo_real');
% run('Graficos');
