clc 
clear all

%%
%Simulink

load simulate_NOE_NARX_performance.mat
sim ball_and_plate_za_nn_2
narx_net_closed = closeloop(narx_net);
view(narx_net_closed)

figure();
plot(NARX.time, NARX.signals(1).values, 'LineWidth', 6); hold on; plot(NARX.time, NARX.signals(2).values, 'LineWidth', 3); title('NARX net');
legend( 'NARX', 'Process'); xlabel('Time [s]'); ylabel('Position [m]')

figure();
plot(NOE.time, NOE.signals(1).values, 'LineWidth', 6); hold on; plot(NOE.time, NOE.signals(2).values, 'LineWidth', 3); title('NOE net');
legend('NOE', 'Process');xlabel('Time [s]'); ylabel('Position [m]')

%%
%Script
radijus_kruz = linspace(0.01, 0.19, 100);
stranica_kvadrat = linspace(0.01, 0.336, 100);
referenca_x = linspace(0.03, 0.36, 100);
referenca_y = linspace(0.03, 0.46, 100);


[u_x_values, u_y_values, y_x_values, y_y_values] = simuliraj_kruznicu(radijus_kruz(randi([1 length(radijus_kruz)])),referenca_x(randi([1 length(referenca_x)])), referenca_x(randi([1 length(referenca_y)])));
figure();
plot(linspace(1,length(y_x_values), length(y_x_values)),y_x_values)
%%
load only_nn_flate_plate.mat
y = mat2cell(y_x_values(1:end)',1, ones(length(y_x_values),1));


u = mat2cell(u_x_values(1:end)',1, ones(length(u_x_values),1));


[p,Pi,Ai,t] = preparets(narx_net,u,{},y);

%NARX
x1 = cell2mat(p(1,:)); % Convert each input to matrix
x2 = cell2mat(p(2,:));
xi1 = cell2mat(Pi(1,:)); % Convert each input state to matrix
xi2 = cell2mat(Pi(2,:));
xi1_1 = xi1;
xi2_1 = xi2;
[izlaz2,xf1,xf2] = simulate_narx_matrix(x1,x2,xi1,xi2);
figure();
plot(linspace(1,length(t), length(t)),cell2mat(t), 'LineWidth', 6); hold on; plot(linspace(1,length(izlaz2), length(izlaz2)),izlaz2, 'LineWidth', 3); title('NARX')
legend('Process', 'NARX'); xlabel('Time [s]'); ylabel('Position [m]')


%%
%NOE2
[p1,Pi1,Ai1,t1] = preparets(narx_net_closed,u,{},y);
yp1 = narx_net_closed(p1,Pi1,Ai1);
figure();
plot(linspace(1,length(t1), length(t1)),cell2mat(t1), 'LineWidth', 6); hold on;
hold on; plot(linspace(1,length(yp1), length(yp1)),cell2mat(yp1), 'LineWidth', 3); title('NOE') ;legend('Process', 'NOE'); xlabel('Time [s]'); ylabel('Position [m]')

[p,Pi,Ai,t] = preparets(narx_net_closed,u,{},y);
x1 = cell2mat(p(1,:)); % Convert each input to matrix
xi1 = cell2mat(Pi(1,:)); % Convert each input state to matrix
xi2 = cell2mat(Ai(end,:));
figure();
[izlaz2,xf1,xf2] = simulate_noe_matrix(x1,xi1,xi2);
plot(linspace(1,length(t), length(t)),cell2mat(t), 'LineWidth', 6); hold on; plot(linspace(1,length(izlaz2), length(izlaz2)),izlaz2, 'LineWidth', 3); title('NOE') ;legend('Process', 'NOE'); xlabel('Time [s]'); ylabel('Position [m]')

