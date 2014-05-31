% Autor: Ilie Stefan Ionut grupa 2421
% Data: 31.05.2014


:-use_module(library(random)).
:-use_module(library(system)).

rezolva([H|_],[P|_],X,C,H):-C=<X,X<C+P ,!.
rezolva([_|T],[P|RestProb],X,C,Rez):-C1 is C+P,rezolva(T,RestProb,X,C1,Rez).

p_random:-now(X1), X is X1 mod 30000,now(Y),setrand(random(X,100,100,Y)).

/*Predicatul principal.*/
prob_termeni(List_in, List_prob, Output):-p_random,random(X), rezolva(List_in, List_prob, X, 0, Output).

/*
| ?- prob_termeni([a,b,c],[0.1,0.2,0.7],Sol).
Sol = c ? ;
no


| ?- prob_termeni([a,b,c],[0.8,0.2,0.7],Sol).
Sol = b ?
*/