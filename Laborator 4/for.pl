% Author: Ilie Stefan Ionut 242
% Date: 31.05.2014

% acest program simuleaza instructiunea for

for(N1, N2, _):-N1>N2, !.
for(N1, N2, Scop):- Scop, N is N1+1, for(N, N2, Scop).
% ---------------------------------

% predicat auxiliar apelat in cadrul instructiunii for
pred:- write('moloz ').

% Exemple de interogari
/*
?- for(-1, 2, pred).
moloz moloz moloz moloz 
true.
*/
