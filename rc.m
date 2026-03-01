% Análisis de Circuitos RC - Casos de Estudio A y B
clear; clc; close all;

% --- CASO A: Aumento de Capacitancia ---
R_A = 10000;      % Resistencia: 10 kOhms
C_A = 0.000470;   % Capacitor: 470 uF
num_A = 1;
den_A = [R_A*C_A 1];
H_A = tf(num_A, den_A); % Función de Transferencia Caso A

% --- CASO B: Reducción de Resistencia ---
R_B = 1000;       % Resistencia: 1 kOhms
C_B = 0.000470;   % Capacitor: 470 uF
num_B = 1;
den_B = [R_B*C_B 1];
H_B = tf(num_B, den_B); % Función de Transferencia Caso B

% --- Resultados Matemáticos ---
disp('--- CASO A ---');
disp(['Constante de tiempo (Tau): ', num2str(R_A*C_A), ' segundos']);
disp(['Tiempo de establecimiento (5*Tau): ', num2str(5*R_A*C_A), ' segundos']);
disp('Polo del Caso A:'); 
pole(H_A)

disp('--- CASO B ---');
disp(['Constante de tiempo (Tau): ', num2str(R_B*C_B), ' segundos']);
disp(['Tiempo de establecimiento (5*Tau): ', num2str(5*R_B*C_B), ' segundos']);
disp('Polo del Caso B:'); 
pole(H_B)

% --- Gráficas Comparativas ---
t_sim = 0:0.1:30; % Vector de tiempo para simulación (30 segundos)

% 1. Mapas de Polos y Ceros
figure(1);
subplot(1,2,1);
pzmap(H_A);
title('Polos y Ceros - Caso A');
grid on;

subplot(1,2,2);
pzmap(H_B);
title('Polos y Ceros - Caso B');
grid on;

% 2. Respuesta al Escalón (Comparación)
figure(2);
step(5*H_A, t_sim);
hold on;
step(5*H_B, t_sim);
grid on;
title('Comparación de Respuesta al Escalón (Entrada de 5V)');
legend('Caso A (R=10k, C=470uF)', 'Caso B (R=1k, C=470uF)', 'Location', 'best');
xlabel('Tiempo (segundos)');
ylabel('Voltaje (V)');
hold off;