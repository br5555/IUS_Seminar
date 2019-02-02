clc 
clear all

        
load nn_on_kruznica_kvadrat.mat
y_mul_1 = y_mul;
u_mul_1 = u_mul;

load nn_ref_data.mat

y_mul = catsamples(y_mul,y_mul_1,'pad');

u_mul = catsamples(u_mul, u_mul_1,'pad');

[p,Pi,Ai,t] = preparets(narx_net,u_mul,{},y_mul);
narx_net = train(narx_net,p,t,Pi);