%Ilie Stefan Ionut grupa 242
%20.03.2014

/*Scrieti un predicat cu 2 parametri care calculeaza numarul de zile al unei luni.
Unul din parametri va reprezenta numele lunii iar celalalt numarul de zile. 
Folositi o baza de cunostinte care asociaza numele unei luni cu numarul acesteia. */

ianuarie(31) .
februarie(28) .
februarie(29) .
martie(31) .
aprilie(30) .
mai(31) .
iunie(30) .
iulie(31) .
august(31) .
septembie(30) .
octombie(31) .
noiembrie(30) .
decembrie(31) .

luna(ianuarie) .
luna(februarie) .
luna(martie) .
luna(aprilie) .
luna(mai) .
luna(iunie) .
luna(iulie) .
luna(august) .
luna(septembie) .
luna(octombie) .
luna(noiembrie) .
luna(decembrie) .

nr_zile(A, B) :- luna(A), write(A(X)).