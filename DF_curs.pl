rezolva1_d(N,Sol):-DF([], N, Sol).
DF(Drum, Nod, [Nod|Drum]) :- scop(Nod).
DF(Drum, Nod, Sol):-s(Nod, Nod1), \+(membru(Nod1, Drum)), DF([Nod|Drum], Nod1, Sol) .