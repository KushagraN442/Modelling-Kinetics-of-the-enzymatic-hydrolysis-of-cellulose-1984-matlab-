% parameters:
[km1, km2] = deal(13); % michaelis constant
[ki1, ki2] = deal(0.8); % cellubiose inhibiter constant
km3 = 15; % glucose reaction parameters
km4 = 32; % glucose reaction paramters
[ki3, ki4] = deal(11); % glucose inhibiter constnat
km5 = 0.6; % cellubiose reaction paramters
ki5 = 0.32; % cellubiose reaction paramters
k_in = 0.0025; % inactivation rate constant
Sam0 = 16; % amorphous cellulose moety
Scr0 = 64; % crystaline cellulose moety
G0 = 0; % cellulobiose initial conc
G02 = 0; % glucose initial conc
G20 = G02; % Both glucose and cellulobiose have initial concentration of 0

% Define a vector of parameters for further calculations
 V = [0.16, 0.16, 0.098, 0.022, 0.0036];
p = [km1, km2, ki1, ki2, km3, km4, ki3, ki4, km5, ki5, k_in, V(1), V(2), V(3), V(4), V(5)];

   V = [0.16, 0.16, 0.098, 0.022, 0.0036]; % maximum rates
tmins = linspace(0,72*60,10000); %not required, only for previous experimental purposes
tspan = linspace(0,72*60,10000);

% solution
y0 = [Sam0; Scr0;G20;G0];
legends = {}
km4_values = [0.8*32, 0.9*32, 32, 32*1.1, 32*1.2];
hold on
%% KM4 SENSITIVITY GRAPH:

for k = 1:length(km4_values)
    km4 = km4_values(k); % Update the inhibitor constant for the current iteration
p = [km1, km2, ki1, ki2, km3, km4, ki3, ki4, km5, ki5, k_in, V(1), V(2), V(3), V(4), V(5)];
[t,y] = ode45(@(t,y) hydroeqs(t,y,p), tspan, y0)

plot(t/60, y(:,3) + y(:,4))
legends{end+1} = sprintf('Km4 = %.3f', km4);
end
legend(legends);
xlabel('time (h)'); ylabel('Glucose + Cellobiose (g/L)');


%%
% for only ki2=  .08
%Sam = y(:,1); Scr = y(:,2); G2 = y(:,3); G = y(:,4);
%products=  G2 + G; % accumulated product 
%hold on
%plot(t/60,products);
%ylabel('Glucose + Cellubiose conc (g/L)');
%xlabel('time(h)');




