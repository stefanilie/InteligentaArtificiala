/*desparte_perechi(E1, E2, [E1, E2|T]).
desparte_perechi(E1, E2, [_, _|T]) :- desparte_perechi(E1, E2, T).
desparte_perechi(E1, _, [E1]). */

/*desparte_perechi(E1, E2, [A, B |T]) :-desparte_perechi(E1, E2, T) ; E1=A, E2=B.
desparte_perechi(E1, _, [E1]). */

desparte_perechi(E1, E2, [E1, E2|_]).
desparte_perechi(E1, E2, [_|T]) :- desparte_perechi(E1, E2, T).

/* o sa mearga pana mai ramane un sg element si atunci intra pe instructiunea 3 si afiseaza doar un element.*/