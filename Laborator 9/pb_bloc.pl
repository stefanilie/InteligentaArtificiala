% Author: Ilie Stefan Ionut impreuna cu Oana Stamate
% Date: 31.05.2014
%scop(+N)
%pred([1,2,3],X,P):-X=1 P=
%pred([H|_], H, 0).
%pred([_|T],X,C):-pred(T,X,C1), C is C1+1.

%scoate_cub(+Li, -Cub, -PozTurn, -Liaux)
scoate_cub([[Cub|Turn]|RTurnuri], Cub, 0, [Turn|RTurnuri]).
scoate_cub([Turn|T],X,C,[Turn|T1]):-scoate_cub(T,X,C1,T1), C is C1+1.

%pune_cub(+Cub, +Poz, +Liaux, -Lnoua)
pune_cub([Turn|RTurnuri], Cub, Poz, [[Cub|Turn]|RTurnuri]):-Poz\=0.
pune_cub([Turn|T],Cub,P,[Turn|T1]):-P1 is P-1,pune_cub(T,Cub,P1,T1).

succesor(Li, Ls):-scoate_cub(Li, Cub, P,Laux),pune_cub(Laux, Cub,P,Ls).

%Exemple de interogari
/*
?- pred([1,2,3],X,P).
X = 1,
P = 0 ;
X = 2,
P = 1 ;
X = 3,
P = 2 ;
false.

?- scoate_cub([[a],[e,c],[d]], Cub, P, Lrez).
Cub = a,
P = 0,
Lrez = [[], [e, c], [d]] ;
Cub = e,
P = 1,
Lrez = [[a], [c], [d]] ;
Cub = d,
P = 2,
Lrez = [[a], [e, c], []] ;
false.

?- pune_cub([[a],[], [c],[d]], b, 2, Lrez).
Lrez = [[b, a], [], [c], [d]] ;
Lrez = [[a], [b], [c], [d]] ;
Lrez = [[a], [], [c], [b, d]] ;
false.

?- succesor([[a],[e,c],[d]], Lrez).
Lrez = [[], [a, e, c], [d]] ;
Lrez = [[], [e, c], [a, d]] ;
Lrez = [[e, a], [c], [d]] ;
Lrez = [[a], [c], [e, d]] ;
Lrez = [[d, a], [e, c], []] ;
Lrez = [[a], [d, e, c], []] ;
false.
*/
