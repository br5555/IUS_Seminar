clc
clear all
load parametri.mat
load only_nn_flate_plate.mat
radijus= 0.1;
x0_poc= 0.1
y0_poc = 0.1
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
    
   