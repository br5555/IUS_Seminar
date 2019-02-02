clc
clear all
load nn_kruznica_data.mat


for i = 1:length(stranica_kvadrat)
    x_0 = 0.03 + (0.36-0.03)*rand();
    y_0 = 0.03 + (0.46-0.03)*rand();
    disp('kvadrat')
    i
    [u_x_values, u_y_values, y_x_values, y_y_values] = simuliraj_kvadrat(stranica_kvadrat(i),x_0, y_0);
    C = mat2cell(y_x_values(1:end)',1, ones(length(y_x_values),1));
    C1 = mat2cell(y_y_values(1:end)',1, ones(length(y_y_values),1));
    y_mul = catsamples(y_mul, C,C1,'pad');

    C = mat2cell(u_x_values(1:end)',1, ones(length(u_x_values),1));
    C1 = mat2cell(u_y_values(1:end)',1, ones(length(u_y_values),1));
    u_mul = catsamples(u_mul, C,C1,'pad');
    
end