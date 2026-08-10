
%% Curva 90° (RAMPA) (raio de curvatura > 0)
v      = 0.30;                   % Velocidade linear
raio_x = 1;                     % Raio do circulo em x
raio_y = raio_x/2;              % Raio do circulo em y
dist_r = raio_y;                % Distância necessária para acelerar ou desacelerar
a      = v^2/(2*dist_r);        % Módulo da aceleração inicial e desaceleração final
wx     = v/raio_x;              % Frequência angular em x
wy     = v/raio_y;              % Frequência angular em y
dur_8  = 2*pi()/wx;             % Duração da trajetória em 8
dur_r  = v/a;                   % Duração da rampa de velocidade inicial

t_i    = 0;                     % Instante inicial da trajetória completa
t_i_1  = t_i+dur_r;             % Instante inicial da trajetória em 8
t_i_2  = t_i+dur_r+dur_8;       % Instante inicial da desaceleração
t_f    = t_i+dur_r+dur_8+dur_r; % Instante final da trajetória completa

%% Estado inicial
% x0_1 = 0;         % estado inicial x
% x0_2 = -L; % estado inicial y
% x0_3 = (pi/2)/c;  %(pi/2)/c; % estado inicial theta_D
% x0_4 = 0;         % estado inicial theta_E
% x0_5 = 0;         % estado inicial theta_D'
% x0_6 = 0;         % estado inicial theta_E'      
% x0   = [x0_1; x0_2; x0_3; x0_4; x0_5; x0_6];