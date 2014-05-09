:-dynamic nr/1.
:-dynamic lista/1.	
pred_e(Fisier, Litera, Lcuvant, Nr):-assert(nr(0)), seeing(IC), see(Fisier),
									repeat, read(X), (X\==end_of_file -> atom_Chars(X, Lx), 
										once(membru(Litera, Lx)), once(retract(nr(Naux)), 
										Naux1 is Naux+1, assert(nr(Naux))),
										Lx=[Litera|_], once(retract(lista(L))), assert(lista([X|L]));
										true), !, 
										seen, see(IC), retract(nr(Nr)), retract(lista(Lcuvant))