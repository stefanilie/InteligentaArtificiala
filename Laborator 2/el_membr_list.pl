/* Autor: Ilie Stefan Ionut 
Date:  10.05.2014*/

membru([], X):-fail.
membru([X|_], X).
membru([H|T], X):-membru(T, X).