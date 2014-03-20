%Ilie Stefan Ionut 242
%20.03.2014

/*
Scrieti un predicat cu 3 parametri. 
Primul reprezinta a cata zi din luna este, al doilea reprezinta numarul lunii si al 3-lea reprezinta anul. 
Predicatul va trebui sa verifice daca o data este corecta, in caz ca da, va returna yes, 
altfel va returna no. Atentie la anii bisecti! 
*/

data(A, B, C) :- (A >= 1, (B =<7, B%2 =:= 1))