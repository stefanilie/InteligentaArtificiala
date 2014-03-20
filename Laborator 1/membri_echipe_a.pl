% Autor : Constantinescu Andrei, grupa 242
% Data : 12.04.2014


membru(ionel,echipa1).
membru(gigel,echipa1).
membru(danel,echipa2).
membru(tudorel,echipa2).
adversari(X,Y):- membru(X,Z1), membru(Y,Z2), Z1 \== Z2.
colegi(X,Y):- membru(X,Z1), membru(Y,Z2), X\==Y, Z1 == Z2.

/*

Cod original :

membru(ionel,echipa1).
membru(gigel,echipa1).
membru(danel,echipa2).
membru(tudorel,echipa2).
adversari(X,Y):- membru(X,Z1), membru(Y,Z2), Z1 \== Z2.
colegi(X,Y):- membru(X,Z1), membru(Y,Z2), Z1 == Z2.

Cod corectat :

membru(ionel,echipa1).
membru(gigel,echipa1).
membru(danel,echipa2).
membru(tudorel,echipa2).
adversari(X,Y):- membru(X,Z1), membru(Y,Z2), Z1 \== Z2.
colegi(X,Y):- membru(X,Z1), membru(Y,Z2), X\==Y, Z1 == Z2.


Interogari (pe codul original)
| ?- adversari(ionel,danel).
yes
| ?- adversari(ionel,tudorel).
yes
| ?- adversari(ionel,gigel).  
no
| ?- colegi(ionel,gigel).
yes
| ?- colegi(ionel,danel).
no
| ?- colegi(X,danel).
X = danel ? ;  %AICI e problema, ar trebui sa apara doar tudorel
X = tudorel ? ; 
no
| ?- adversari(X,danel).
X = ionel ? 
yes
| ?- adversari(X,danel).
X = ionel ? ;
X = gigel ? ;
no

Interogari (pe codul corectat)
| ?- colegi(X,danel).
X = tudorel ? ;
no

*/