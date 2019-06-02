clc
clear all
close all

% dlugosc ramion
L = [1.5 ; 1];

% punkty destynacji (w przesrrzeni kartezjanskiej)
p1 = [-1; 1.5];
p2 = [2; 1.3];

% punkty destynacji (w przesrrzeni konfiguracyjna)
q1 = ZOK(L,p1);
q2 = ZOK(L,p2);
%Q = [q1, q2]';

% predkosci liniowe w danych punktach
v1 = [0; -1];
v2 = [0; 1];
%V  = [v1; v2]';

% predkosci konfigurayjne w danych punktach
dq1 = V2dQ(L, v1, q1);
dq2 = V2dQ(L, v2, q2);

% czasy manipulatora w kolejnych punktach
t1 = 0;
t2 = 5;

% wspolczynniki a0, a1, a2, a3
A = wsp_traj(t1, t2, q1, q2, dq1, dq2);

% czas w ilosci probek
t = linspace(t1, t2, 50);

trajektoria = []

for i=1:length(t)
    
    % aktualny punkt trajektorii w przestrzeni konfiguracyjnej
    Q = A(:,1) + A(:,2) * t(i) + ...
        A(:,3) * t(i)^2 + A(:,4) * t(i)^3;
    
    % aktualny punkt trajektorii w przestrzeni kartezjanskiej
    P_temp = ZPK(L, Q);
    trajektoria = [trajektoria, P_temp];
    
    % segment 1 ( [0,0] -> [x1, y1] )
    plot([0, cos(Q(1)) * L(1)], ...
         [0, sin(Q(1)) * L(1)], 'Color', 'blue')
    
    hold on
    
    % segment 2 ( [x1, y1] -> [x2, y2] )
    plot([cos(Q(1)) * L(1), P_temp(1)], ...
         [sin(Q(1)) * L(1), P_temp(2)], 'Color', 'red')
     
    hold on
     
    % linia trajektorii
    scatter(trajektoria(1,:), trajektoria(2,:))
     
    % wlasciwosci wykresu
    xlim([-2.5, 2.5])
    ylim([-1.5, 2.5])
    text(1, 2.2, ["CURRENT TIME", num2str(t(i))])
    drawnow
    hold off
    
end


