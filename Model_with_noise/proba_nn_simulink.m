clc
clear all
load parametri.mat
    x0 = a_x/2.0;
    y0 = a_y/2.0;
    load najbolji_ga_brute_force.mat
    cost_func = 0;
    y0_loptica = 0.1;
    x0_loptica = 0.1;
    for i = 1:max(size(bestx))
        fuzzy_FIS.output.mf(i).params = [bestx(i)-1,bestx(i),bestx(i)+1];
    end

    A_x =0.1;
    A_y = 0.1;
    odabir = 3;
    load only_nn_flate_plate.mat