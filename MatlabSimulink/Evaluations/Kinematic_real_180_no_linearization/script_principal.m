clc
clear
close all
%% Parâmetros Gerais
fst = 0.001; % (fundamental sample time) Tempo de amostragem fundamental - [s]

% ENCODER------------------------------------------------------------------------------------------------------
fpr   = 40;       % Quantidade de furos por revolução em cada encoder - [furos/revolução]
k_enc = 2*pi/fpr; % Ganho do encoder - [rad*revolução/furos]

% FILTROS------------------------------------------------------------------------------------------------------
freq_pos     = 200; % Frequência de corte do filtro passa-baixa para variáveis de posição - [rad/s]
freq_vel     = 200; % Frequência de corte do filtro passa-baixa para variáveis de velocidade - [rad/s]
filter_order = 2;   % Ordem do filtro passa baixa.

% SENSIBILIDADE DA VELOCIDADE ZERO-----------------------------------------
svzD = 0; %[rad/s]
svzE = 0; %[rad/s]

% DETECTOR DE VELOCIDADE ZERO------------------------------------------------------------------
delayD = 0.1/fst;
delayE = 0.1/fst;

% INCERTEZAS NOS PARÂMETROS------------------------------------------------
var_KaD = 1;
var_KaE = 1;

% PARÂMETROS ELÉTRICOS E MECÂNICOS DOS MOTORES-----------------------------
KaD = 0.4713; % Costande de força contraeletromotriz do motor da direita - [V*s/rad]
KaE = 0.5046; % Costande de força contraeletromotriz do motor da esquerda - [V*s/rad]

% PARÂMETROS ELÉTRICOS E MECÂNICOS DOS MOTORES COM INCERTEZAS--------------
KaD_v = var_KaD*0.4713; % Costande de força contraeletromotriz do motor da direita - [V*s/rad]
KaE_v = var_KaE*0.5046; % Costande de força contraeletromotriz do motor da esquerda - [V*s/rad]

% COMPENSAÇÃO DE ZONA-MORTA------------------------------------------------
VaD_min = 2; % Módulo da tensão de zona morta do motor direito  = 1V;
VaE_min = 2; % Módulo da tensão de zona morta do motor esquerdo = 1V;

% PARÂMETROS DA TENSÃO DE ARMADURA-----------------------------------------
VaD_max = 14;    % Módulo da tensão máxima de armadura permitida para o motor D
VaE_max = 14;    % Módulo da tensão máxima de armadura permitida para o motor E

% CINEMÁTICA---------------------------------------------------------------
r_d = 0.0292;    % Raio da roda direita - [m]
r_e = 0.0293;    % Raio da roda esquerda - [m]
b   = 0.1210;    % Metade da distância entre as rodas - [m]
c_d = r_d/(2*b); % Constante adimensional
c_e = r_e/(2*b); % Constante adimensional

% CONTROLE-----------------------------------------------------------------
L  = 0.1;   % Distância de Look Ahead - [m]
k0 = 5; % Ganho proporcional da Realimentação Linearizante;

%--------------------------------------------------------------------------
% Trajetória 3 - Curva 8 (raio de curvatura > 0)
% v        = 0.30;                % Velocidade linear
% raio_x   = 0.5;                 % Raio da elipse em x
% raio_y   = 0.5;                 % Raio da elipse em y
% w_x      = v/raio_x;            % Frequência angular em x
% w_y      = v/raio_y;            % Frequência angular em y
% t_i      = 0;                   % Instante inicial da trajetória completa
% t_f      = 4*pi()/min(w_x,w_y); % Instante final da trajetória completa

%% Estado inicial
x0_1 = 0;      % estado inicial x
x0_2 = 0;       % estado inicial y
x0_3 = 0;        %pi/2; % estado inicial phi     
x0   = [x0_1; x0_2; x0_3];

%% Trajetórias
% run('Trajetoria_Circulo_RAMPA');
% T=1;

% run('Trajetoria_Curva_90_graus_RAMPA');
% T=2;

run('Trajetoria_Curva_180_graus_RAMPA');
T=3;

% run('Trajetoria_OITO_8');
% T=4;

%% Simulação, Aquisição e Gráficos
% sim('DIAZ_modelo_matematico');
% run('DIAZ_aquisicao_dados_modelo_matematico');
% run('Graficos');

set_param('DIAZ_modelo_real', 'SimulationCommand', 'start');
pause(t_f+5);
run('DIAZ_aquisicao_dados_modelo_real');
run('Graficos');