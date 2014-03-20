%Ilie Stefan Ionut 242
%15.03.2014

produs(X,Y,Rez):- Rez is X*Y.
impartire(X, Y, Rez) :- Rez is X/Y.

/*de ce nu merge in loc de is sa folosim =:= ?
 (explicati in comentariu) 

Nu merge sa folosim is in loc de =:= pentru ca
 =:= nu este instructiune de atribuire, 
ci de verificare, operatie logica.

Listing:
| ?- consult('unificare_is.pl').
compiling /home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/unificare_is.pl for byte code...
/home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/unificare_is.pl compiled, 3 lines read - 777 bytes written, 12 ms

yes
| ?- impartire(4,2, Rez).

Rez = 2.0

yes
| ?- impartire(4, 3, Rez).      

Rez = 1.3333333333333333

yes


 */