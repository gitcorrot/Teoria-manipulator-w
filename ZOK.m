function q = ZOK(L,p) 

% q11 = atan2(p(2), p(1)) - real(acos((L(1) ^ 2 + ...
%     (sqrt(p(1) ^ 2 + p(2) ^ 2)) ^ 2 - L(2) ^ 2) / ...
%     (2 * L(1) * sqrt(p(1) ^ 2 + p(2) ^ 2))));

q12 = atan2(p(2), p(1)) + real(acos((L(1) ^ 2 + ...
    (sqrt(p(1) ^ 2 + p(2) ^ 2)) ^ 2 - L(2) ^ 2) / ...
    (2 * L(1) * sqrt(p(1) ^ 2 + p(2) ^ 2))));

% Wykorzystuje tylko jedną konfiguracje, poniewaz nie ma 
% okreslonych dodatkowych warunkow

% q21 = pi - real(acos((L(2) ^ 2 + L(1) ^ 2 - ...
%      (sqrt(p(1) ^ 2 + p(2) ^ 2)) ^ 2) / (2 * L(1) * L(2))));

q22 = -pi + real(acos((L(2) ^ 2 + L(1) ^ 2 - ...
    (sqrt(p(1) ^ 2 + p(2) ^ 2)) ^ 2) / (2 * L(1) * L(2))));

% qa = [q11;q21];
qb = [q12;q22];

% q = [qa, qb];
q = qb;

end
