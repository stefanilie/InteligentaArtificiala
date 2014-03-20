%Ilie Stefan Ionut grupa 242
%20.3.2014

/*
Scrieti un predicat cu doua variabile.
Una din variabile sa reprezinte numarul unei luni (exemplu: 1 pentru ianuarie),
iar cealalta sa reprezente numarul de zile. 

Unde in acest caz primul parametu e cel corespunzator lunii, 
iar al doilea este cel corespunzator numarului de zile.

Numele predicatului e doar un exemplu. Puteti sa il denumiti si altfel.
Indicatie: lunile cu numarul mai mic sau egal decat 7 daca sunt impare au 
31 de zile si daca sunt pare au 30 (cu exceptia lui februarie, care are 28 sau 29 de zile)
*/

nr_zile(A,B) :- (A =< 7, (A%2 =:= 1, B is 31), (A%2 =:= 0, B is 30)),
				(A =:= 2, B is 28),
				(A>7, (A%2 =:= 0, B is 31), (A%2 =:= 1, B is 30)) .

