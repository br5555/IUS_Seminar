clc
clear all
radijus_kruz = linspace(0.01, 0.19, 100);
stranica_kvadrat = linspace(0.01, 0.336, 100);
referenca_x = linspace(0.03, 0.36, 100);
referenca_y = linspace(0.03, 0.46, 100);


[u_x_values, u_y_values, y_x_values, y_y_values] = simuliraj_kruznicu(radijus_kruz(1),referenca_x(1), referenca_x(1));
%%

C = mat2cell(y_x_values(1:end)',1, ones(length(y_x_values),1));
C1 = mat2cell(y_y_values(1:end)',1, ones(length(y_y_values),1));
y_mul = catsamples(C,C1,'pad');

C = mat2cell(u_x_values(1:end)',1, ones(length(u_x_values),1));
C1 = mat2cell(u_y_values(1:end)',1, ones(length(u_y_values),1));
u_mul = catsamples(C,C1,'pad');



for i = 1:40
    for j = 1:15
    x_0 = 0.03 + (0.36-0.03)*rand();
    y_0 = 0.03 + (0.46-0.03)*rand();
    disp('referenca')
    i
    [u_x_values, u_y_values, y_x_values, y_y_values] = simuliraj_referenca(referenca_x(randi([1 length(referenca_x)])), referenca_y(randi([1 length(referenca_y)])),x_0, y_0);
    C = mat2cell(y_x_values(1:end)',1, ones(length(y_x_values),1));
    C1 = mat2cell(y_y_values(1:end)',1, ones(length(y_y_values),1));
    y_mul = catsamples(y_mul, C,C1,'pad');

    C = mat2cell(u_x_values(1:end)',1, ones(length(u_x_values),1));
    C1 = mat2cell(u_y_values(1:end)',1, ones(length(u_y_values),1));
    u_mul = catsamples(u_mul, C,C1,'pad');
    end   
end