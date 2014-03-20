%Ilie Stefan Ionut grupa 242
%13.03.2014

membru(ionel,echipa1).
membru(gigel,echipa1).
membru(danel,echipa2).
membru(tudorel,echipa2).
adversari(X,Y):- membru(X,Z1), membru(Y,Z2), Z1 \== Z2, X\==Y.
colegi(X,Y):- membru(X,Z1), membru(Y,Z2), Z1 == Z2, X\==Y.

/*
Ceea ce era gresit la acest script era ca permitea ca 
verificarea sa se faca pe acelasi om. Exemplu fiind 
apelarea colegi(ionel, ionel). ce a returnat true. 

S-a remediat aceasta problema prin adaugarea 
"X\==Y", fapt ce reprezinta ca pe langa ca multimile
sa fie diferite, trebuie si ca indivizii sa fie diferiti. 

Listing:
| ?- consult('membri_echipa.pl').
compiling /home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/membri_echipa.pl for byte code...
/home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/membri_echipa.pl compiled, 6 lines read - 1470 bytes written, 12 ms

yes
| ?- membru(ionel, ionel).

no
| ?- colegi(ionel, ionel).

yes
| ?- consult('membri_echipa.pl').
compiling /home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/membri_echipa.pl for byte code...
/home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/membri_echipa.pl compiled, 6 lines read - 1697 bytes written, 11 ms

yes
| ?- colegi(ionel, ionel).

no
| ?- colegi(gigel, gigel).
*/