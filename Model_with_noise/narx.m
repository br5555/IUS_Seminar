clc
clear all


load ball_and_plate_sum.mat
d1 = [1:5];
d2 = [1:5];
narx_net = narxnet(d1,d2,[10, 10, 10, 10]);
narx_net.divideFcn = '';
narx_net.trainParam.min_grad = 1e-10;
[p,Pi,Ai,t] = preparets(narx_net,u_mul,{},y_mul);
narx_net = train(narx_net,p,t,Pi);
