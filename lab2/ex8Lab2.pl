/*in X+Y=Z nu este unificare. */

list_str([sum(X, Y)|T], [exp(X+Y=Z, E)|Texp]) :- number(X), number(Y), Z is x+y, este_nr(E,Z), list_str(T, Texp) . 


este_nr(E,Z) :- numar(Z), E=exista; \+numar(Z), E=nu_exista.