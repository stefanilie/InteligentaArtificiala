%Author: Ilie Stefan Ionut
%Date: 30.05.2014


% Acesta este predicatul de tip case/2. Ne vom folosi de istrue si de call pentru a mima case
/*:-op(100,xfx,:::).
X ::: Y :- istrue(X),call(Y);\+istrue(X).

case(X,List):- asserta(istrue(X)), checkList(List).
checkList([]):-retractall(istrue(_)).
checkList([H|List]):-call(H),checkList(List).*/


% Acesta este predicatul de tip case/1
p(a).
p(b).
p(c).

:-op(100,xfx,:::).
X ::: Y :-(X,Y);\+X.

case([]).
case([H|List]):-H,case(List).
