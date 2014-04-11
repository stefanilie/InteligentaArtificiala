%author

pred(N, Lrez) :- read(X),
				(X==gata, !, Lrez=[], N=0;
				x==0, !, write(eroare), fail;
				number(X), !, Lrez=[X|L], pred(N,L);
				atom(X), pred(N1, Lrez), N is N1+1);