%Author: Ilie Stefan Ionut
%Date: 28.04.2014


desparte1(L,H,T):- [H|T]=L.
desparte2(L,H1,H2,T):- [H1,H2|T]=L.

desparte2el(L) :- desparte1(L, H, T), desparte1(T, H1, T1), write(H1).
desparte2el_b(L) :- desparte2(L, H1, H2, T), write(H2).


/*
	Primul predicat va folosi de 2 ori si va afisa Head-ul celei de-a doua liste rezultate din apelarea predicatului.
	A doua metoda se foloseste exact de predicatul desparte2 si afiseaza al doilea element.
*/