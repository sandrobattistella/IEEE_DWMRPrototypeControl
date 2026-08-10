
%% Curva 90° (RAMPA) (raio de curvatura > 0)
a      = 0.15;                              % Módulo da aceleração inicial e desaceleração final
v      = 0.35;                              % Velocidade linear
dist_T = 5;                                % Distância total da trajetória fictícia
raio_c = 0.40;                             % Raio da curva

dist_0 = v^2/(2*a);                        % Distância necessária para alcançar a velocidade máxima
dist_1 = (dist_T/2)-raio_c-dist_0;         % Distância da primeira reta
dist_2 = (dist_T/2)-raio_c-dist_0;         % Distância da segunda reta
dist_c = pi*raio_c;                        % Distância da curva
dist_4 = dist_0;                           % Distância necessária para desacelerar

dur_0 = v/a;                               % Duração da rampa de velocidade inicial
dur_1 = dist_1/v;                          % Duração da primeira reta
dur_c = dist_c/v;                          % Duração da curva
dur_2 = dist_2/v;                          % Duração da segunda reta
dur_3 = dur_0;                             % Duração da rampa de velocidade final
dur_T = dur_0+dur_1+dur_c+dur_2+dur_3;     % Duração da trajetória completa

t_i   = 0;                                 % Instante inicial da trajetória completa
t_i_1 = t_i+dur_0;                         % Instante inicial da primeira reta
t_i_c = t_i+dur_0+dur_1;                   % Instante inicial da curva
t_i_2 = t_i+dur_0+dur_1+dur_c;             % Instante inicial da segunda reta
t_i_3 = t_i+dur_0+dur_1+dur_c+dur_2;       % Instante inicial da desaceleração
t_f   = t_i+dur_0+dur_1+dur_c+dur_2+dur_3; % Instante final da trajetória completa

%% Estado inicial
% x0     = [ -L;   % estado inicial x
%            0 ;   % estado inicial y
%            0 ;   % estado inicial theta_D
%            0 ;   % estado inicial theta_E
%            0 ;   % estado inicial theta_D'
%            0];   % estado inicial theta_E'