%In this directory, you will find a derivaitve function representing a
%three gene circuit in which each gene product represses the transcription of another
%gene in a cycle. This simple three gene circuit displays oscillations and was one
%of the first synthetic circuits ever constructed (see Elowitz & Leibler
%Nature 2000). 

% 1. Start with initial conditions x(1) = 1, x(2) = x(3) = 0. 
% Run the model for 200 time units and plot the result. verify that it
% does indeed oscillate. 
figure(1)
sol = ode23(@repressilator,[0 200], [1 0 0]);
plot(sol.y(1,:),sol.y(2,:))

% 2. What happens if you start with initial conditions x(1) = x(2) = x(3) =
% 0.5? Why?
figure(2)
sol = ode23(@repressilator,[0 200], [0.5 0.5 0.5]);
plot(sol.y(1,:),sol.y(2,:))
% x(1) = x(2) = x(3) = 0.5 means dx1 = dx2 = dx3 = k*(1-0.5)-
% k2*0.5^n/(1+0.5^n)*0.5. Thus the gene expression rates do not change and
% the oscilation becomes a line instead. 

% 3. The strength of the repression is governed by the constant k2 which is
% the same for all the genes. What happens when you make k2 larger or
% smaller? Find the approximate value of k2 for which the system no longer
% oscillates. 
figure(3)
sol = ode23(@repressilator_k2_s,[0 200], [1 0 0]);
plot(sol.y(1,:),sol.y(2,:))
figure(4)
sol = ode23(@repressilator_k2_l,[0 200], [1 0 0]);
plot(sol.y(1,:),sol.y(2,:))
% k2 as low as 0.05 --> stops oscillating
% k2 higher --> curve more packed / leaning towards the origin, which 
% means more repression between the genes (less expression)

% 4. What happens when you make k2 larger or smaller for only one of the
% genes? 
figure(5)
sol = ode23(@repressilator_1_l,[0 200], [1 0 0]);
plot(sol.y(1,:),sol.y(2,:))

figure(6)
sol = ode23(@repressilator_1_s,[0 200], [1 0 0]);
plot(sol.y(1,:),sol.y(2,:))

% with the same value of k2 chosen for one or all three genes, the curve
% with only one higher k2 has greater oscillation, i.e. greater expression
% than the curve with all three k2 being higher. 
% the curve with only one lower k2 has less magnitude in change of
% repression rate as well. 
