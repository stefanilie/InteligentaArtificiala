%Ilie Stefan Ionut 242
%16.03.2014

unificare(X,Y):- X=Y.
unificare1(X,X).
produs1(X,Y,Rez):- Rez = X*Y.
produs2(X, Y, Rez) :- Rez is X*Y.

/*
unificare(X,Y), face verificare intre termenii X si Y, si verifica
daca x=y ca termeni. 
Se poate vedea in listing, la momentul apelarii unificare(1+4,5). 
ca aceasta va returna no pentru ca 1+4 si 5, luati ca termeni, 
sunt diferiti.

unificare1 nu am inteles ce face...

Listing:

| ?- consult('unificare_egal.pl').
compiling /home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/unificare_egal.pl for byte code...
/home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/unificare_egal.pl compiled, 9 lines read - 714 bytes written, 12 ms

yes
| ?- unificare(3, 4).

no
| ?- unificare(3, 3).

yes
| ?- unificare1(1, 1).

yes
| ?- unificare1(1, 3).

no
| ?- unificare1(1).   
uncaught exception: error(existence_error(procedure,unificare1/1),top_level/0)
| ?- unificare1(1+4, 5).

no
| ?- unificare(1+4, 5).  

no
| ?- produs1(2,3, rez).

no
| ?- produs1(2,3, 6).  

no
| ?- produs1(2, 3, 6).

no
| ?- produs1(2, 3, 5).

no
| ?- produs1(2, 3, 0).

no
| ?- produs1(2, 3, Rez).

Rez = 2*3

yes
| ?- produs2(2, 3, Rez).
uncaught exception: error(existence_error(procedure,produs2/3),top_level/0)
| ?- consult('unificare_egal.pl').
compiling /home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/unificare_egal.pl for byte code...
/home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/unificare_egal.pl compiled, 16 lines read - 1158 bytes written, 11 ms

yes
| ?- produs2(2, 3, Rez).          

no
| ?- consult('unificare_egal.pl').
compiling /home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/unificare_egal.pl for byte code...
/home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/unificare_egal.pl compiled, 16 lines read - 1158 bytes written, 12 ms

yes
| ?- produs2(2, 3, Rez).          

no
| ?- consult('unificare_egal.pl').
compiling /home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/unificare_egal.pl for byte code...
/home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/unificare_egal.pl compiled, 16 lines read - 963 bytes written, 11 ms

(4 ms) yes
| ?- produs2(2, 3, Rez).          

Rez = 6

yes
| ?- 

*/