function [u_x_values, u_y_values, y_x_values, y_y_values] = simuliraj_kruznicu(radijus,x0_poc, y0_poc)

    load parametri.mat
    x0 = a_x/2.0;
    y0 = a_y/2.0;
    load najbolji_ga_brute_force.mat
    cost_func = 0;
    y0_loptica = y0_poc;
    x0_loptica = x0_poc;
    for i = 1:max(size(bestx))
        fuzzy_FIS.output.mf(i).params = [bestx(i)-1,bestx(i),bestx(i)+1];
    end

    A_x =radijus;
    A_y = radijus;
    odabir = 3;
    options = simset('SrcWorkspace','current');
    
    simOut = sim('ball_and_plate_za_nn_2',[],options);

    u_x_values = u_x.signals.values;
    u_y_values = u_y.signals.values;
    y_x_values = y_x.signals.values;
    y_y_values = y_y.signals.values;
%     figure();
%     plot(linspace(1,length(y_x_values), length(y_x_values)),y_x_values)
end