
:- op(100,xfy,este).
:- op(90,xfy,+).
:- op(80,xfx,si).
:- op(70,xf,lei).
:- op(70,xf,bani).

Z este X1 lei si Y1 bani:- Y1>=100, !, C is Y1//100, C1 is Y1 mod 100, X is X1+C, Z=X lei si C1 bani ; Z=X1 lei si Y1 bani.
Z este X1 lei + Y1 lei:- Z1 is X1+Y1, Z=Z1 lei.
Z este X1 bani + Y1 bani:- Z1 is X1+Y1, Z este Z1 bani.
Z este X1 lei si X2 bani + Y1 lei si Y2 bani:- A1 is X1+Y1, A2 is X2+Y2, Z este A1 lei si A2 bani.
Z este X1 lei si X2 bani + Y1 bani:- A1 is X2+Y1, Z este X1 lei si A1 bani.
Z este X1 lei + Y1 bani:- Z este X1 lei si Y1 bani.
Z este X1 bani :- X1>=100, !, C is X1//60, C2 is X1 mod 100, Z=C lei si C2 bani ; Z=X1 bani.