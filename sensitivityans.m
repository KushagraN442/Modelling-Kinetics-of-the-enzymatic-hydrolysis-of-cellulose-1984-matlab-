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
tmins = linspace(0,72*60,10000);
tspan = linspace(0,72*60,10000);

% solution
y0 = [Sam0; Scr0;G20;G0];
legends = {}
sens = [0.8, 0.9, 1, 1.1, 1.2]; % Sensitivity
hold on

    
   
p = [km1, km2, ki1, ki2, km3, km4, ki3, ki4, km5, ki5, k_in, V(1), V(2), V(3), V(4), V(5)];
[t,y] = ode45(@(t,y) hydroeqs(t,y,p), tspan, y0)
baseval = y(end,3) + y(end,4);

paramNames = {'km1','km2','ki1','ki2','km3','km4','ki3','ki4', ...
              'km5','ki5','k_in','V1','V2','V3','V4','V5'}; % not required

sensitivity = zeros(length(p), length(sens)); % making matrix for storage
for j = 1:length(p)
for m = 1:length(sens)
    px = p;
    px(j) = p(j)*sens(m);
    [t,y] = ode45(@(t,y) hydroeqs(t,y,px), tspan, y0)
    finalval = y(end,3) + y(end,4);
    sensitivity(j,m) = 100*abs(finalval - baseval)/baseval
end
end

maxsens = -inf;
mostsens = '';
for j = 1:length(p)
    deviation = abs(sensitivity(j,5) - sensitivity(j,1));
    if deviation>maxsens
        maxsens = deviation;
        mostsens = paramNames{j}
    end
end




