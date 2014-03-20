%Ilie Stefan Ionut grupa 242
%13.03.2014

pisica('Miaunel').
tigru('Tigrila').
felina(X):-pisica(X).
felina(X):-tigru(X).

/*
Am adaugat si instructiunea felina(X):-tigru(X), pentru ca si tigru este o felina.
Astfel, cand parcurgem toate tipurile de felina, avem si pe Maiunel, si pe Tigrila.

Listing:
| ?- consult('felina.pl').
compiling /home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/felina.pl for byte code...
/home/stefan/Documents/An2Sem2/Inteligenta Artificiala/Laborator 1/felina.pl compiled, 10 lines read - 665 bytes written, 12 ms

yes
| ?- felina(X).

X = 'Miaunel' ? ;

X = 'Tigrila'

yes
| ?- 

*/