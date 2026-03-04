
clear; clc;

Ts = 0.1;
Tend = 300;
t = 0:Ts:Tend;

K = 1.0;
tau = 40.0;

Kp = 4.0;
Ki = 0.05;
Kd = 0.0;

r = 0.6*ones(size(t));
r(t >= 60) = 0.8;

u_min = 0.0; u_max = 1.0;

h = zeros(size(t));
u = zeros(size(t));
e = zeros(size(t));

I = 0;
e_prev = 0;

for k = 2:length(t)

    e(k) = r(k) - h(k-1);

    P = Kp * e(k);
    I = I + Ki * Ts * e(k);
    D = Kd * (e(k) - e_prev) / Ts;

    u_unsat = P + I + D;

    u(k) = min(max(u_unsat, u_min), u_max);

    dh = (K*u(k) - h(k-1)) / tau;
    h(k) = h(k-1) + Ts * dh;

    e_prev = e(k);
end

figure;
plot(t, r, '--', t, h, 'LineWidth',1.5);
grid on;
xlabel('Zeit [s]');
ylabel('Level');
legend('Sollwert','Level');
title('Tank Level Control mit PID');

figure;
plot(t, u, 'LineWidth',1.5);
grid on;
xlabel('Zeit [s]');
ylabel('Stellgröße u');
title('Reglerausgang');
