/*lista1N(N, L) :-lista1Noux(N, 1, L).
lista1Noux(N, C, [C|T]) :- C<N, C1 is C+1, lista1Noux(N, C1, T).
lista1Noux(N, N, [N]).
*/

/*
generare invers:*/

lista1NL(N,L) : lista1noux(N, [], L) .
lista1noux(N, laux, L) :- N>0, N1 is N-1, 
							lista1noux(N1, [N|laux], L) .
lista1noux(0, L, L) .