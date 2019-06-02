function p = ZPK(L, q)

p1 = L(1) * cos(q(1)) + L(2) * cos(q(1) + q(2));
p2 = L(1) * sin(q(1)) + L(2) * sin(q(1) + q(2));

p = [p1;p2];

end
