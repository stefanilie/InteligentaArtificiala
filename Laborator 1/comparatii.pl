%Ilie Stefan Ionut Grupa 242
%Data : 12.03.2014

mmicnr(X1,X2):- X1 < X2.
mmarenr(X1,X2):- X1 > X2.
mmicenr(X1,X2):- X1 =< X2.
mmareenr(X1,X2):- X1 >= X2.
egalexp(X1,X2):- X1 =:= X2.
diferitexp(X1,X2):- X1 =\= X2.
egalterm(X1,X2):- X1 == X2.
diferitterm(X1,X2):- X1 \== X2.

mmicterm(X1,X2):- X1 @< X2.
mmareterm(X1,X2):- X1 @> X2.
mmiceeterm(X1,X2):- X1 @=< X2.
mmareeterm(X1,X2):- X1 @>= X2.

/*
| ?- consult('comparatii.pl').
compiling /home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/comparatii.pl for byte code...
/home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/comparatii.pl compiled, 13 lines read - 1602 bytes written, 4 ms

yes
| ?- egalterm(2+3, 5*1).

no
| ?- egalexp(2+3, 5*1).

yes
| ?- 

Prima este adevarata pentru ca avem o egalitate aritmetica,
in schimb a doua este una intre termeni, deci este falsa, 
pentru ca 2+3 != 5*1 ca expresie, nu ca rezultat.
*/