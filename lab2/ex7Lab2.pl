inversa(L, Li) :- inversa_aux(L, [], Li) .
inversa_aux([H|T], Laux, Li) :- inversa_aux(T, [H|Laux], Li) .
inversa_aux([], Laux, Laux) .