/* Autor: Ilie Stefan Ionut 
 Date: 11.05.2014 */

/* This program generate a list of all factors a number has and uses said list to determine if a number is perfect or not.   */

/* Help predicate: */
/* help(+X) */

help('List') :- write('getAllDivisors(+Number,-List)').
help('Perfect') :- write('isPerfect(+Number)').

/* Corner Cases: */
/* corner(X) */
 
corner(X) :- write('None.').

/*
    --- Am incercat sa rezolv problema in acest mod, insa nu merge.
         Problema este ca nu pot modifica lista.
         Ori intra in bucla infinita, ori imi genereaza o lista de forma [2,2,2,...], ori imi spune "no", fara sa imi dea o valoare pentru L.
         Cum pot adaga un element unei liste? Add de unul singur merge, insa in cadrul programului nu functuoneaza.  
*/

/*
isDivisor(N,ToCheck) :- ToCheck>0, N>ToCheck, mod(N,ToCheck) =:= 0.

add(X, L, [X|L]).

iterate(N,ToCheck,L) :- (ToCheck =< N),
                                    (
                                        ( 
                                            isDivisor(N,ToCheck) ,
                                            /* Problema, nu pot adauga elemente listei. Nu este singurul mod in care am incercat, am folosit si append, dar nu reusesc sa il fac se mearga */
                                            add(ToCheck,L,LNew),
                                            NextCheck is ToCheck + 1,
                                            iterate(N,NextCheck,LNew )
                                        )
                                        ;
                                        ( 
                                            \+isDivisor(N,ToCheck), 
                                            NextCheck is ToCheck + 1, 
                                            iterate(N,NextCheck,L ) 
                                        )
                                    ).

getDivisors(N,L) :- iterate(N,2,L).
*/

/*
The program makes use of the pre-built "between" predicate.

isDivisor(+N,+ToCheck) checks if ToCheck is a factor of N.
getADivisor(+Number,-Divisor) will return a factor of Number. It does so by generating all numbers between 1 and Number/2 ( will generate one number at a time ) ( used // to always get integers ) and
return the first number that verifies isDivisor().
getAllDivisors(+Number,+List) will bag all divisors in a List.
isPerfect(+Number) generates the list of divisors, sums the elements of the list and compares it against the Number. If they are equal the number is Perfect. Else, it is Imperfect.
*/

/* --- Solution --- */
:- use_module(library(between)).

isDivisor(N,ToCheck) :- ToCheck>0, N>ToCheck, mod(N,ToCheck) =:= 0.
getADivisor(Number,Divisor) :- Optimization is Number//2, between(1,Optimization,Divisor),isDivisor(Number,Divisor).
getAllDivisors(Number,List) :- bagof(Divisor , getADivisor(Number,Divisor) , List).

sumList([], 0).
sumList([H|T], Sum) :- sumList(T, Rest), Sum is H + Rest.

isPerfect(Number) :- getAllDivisors(Number,L),sumList(L,Sum),(Number =:= Sum)->(write('Perfect.'));(write('Imperfect.')).
/* --- -------- --- */