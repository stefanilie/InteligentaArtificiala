%Ilie Stefan Ionut grupa 242
%13.03.2014


copil(ion).
copil(ana).
copil(mihai).
copil(alina).
fata(ana).
fata(alina).
baiat(X):- copil(X), \+ (fata(X)).

/*
Am corectat prin adaugarea caracteristicii potrivit careia, 
baiatul este de asemenea un copil, si mai apoi este diferit de fata.

Listing:	
| ?- consult('fata_baiat.pl').
compiling /home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/fata_baiat.pl for byte code...
/home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/fata_baiat.pl compiled, 13 lines read - 1002 bytes written, 11 ms

yes
| ?- baiat(X).

X = ion ? ;

X = mihai ? ;

no
| ?- fata(X).

X = ana ? ;

X = alina

yes
| ?- copil(X).

X = ion ? ;

X = ana ? ;

X = mihai ? ;

X = alina

yes
| ?- baiat(ion).

yes
| ?- baiat(ana).

no

*/