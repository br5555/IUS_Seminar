function [u_x_values, u_y_values, y_x_values, y_y_values] = simuliraj_kvadrat(stranica,x0_poc, y0_poc)

    load parametri.mat
    load najbolji_ga_brute_force.mat
    y0_loptica = y0_poc;
    x0_loptica = x0_poc;
    konstanta  = 0.03;
    Ak_x = stranica;
    Ak_y = stranica;
    
    for i = 1:max(size(bestx))
        fuzzy_FIS.output.mf(i).params = [bestx(i)-1,bestx(i),bestx(i)+1];
    end

    
    odabir = 2;
    options = simset('SrcWorkspace','current');
    
    simOut = sim('ball_and_plate_za_nn_2',[],options);
    error_x_out = x_error;
    error_y_out = y_error;
    x_ref_out  = x_ref;
    y_ref_out = y_ref;
    x_current_out = x_current;
    y_current_out = y_current;
    
    u_x_values = u_x.signals.values;
    u_y_values = u_y.signals.values;
    y_x_values = y_x.signals.values;
    y_y_values = y_y.signals.values;
end