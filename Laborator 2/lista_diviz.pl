%Author: Ilie Stefan Ionut 242
%Date: 29.05.2014

% Acest predicat va genera o lista de divizori pentru parametrul "Numar".
% gaseste_div va avea ca parametrii  2 numere, o lista care o vom folosi la incremenare si inca o lista 
% in care vom stoca lista finala de divizori.
divizori(Numar, Output):-gaseste_div(2, Numar, [1], Output).

% Acesta este predicatul care va atribui lista finala. El va fi apelat cand Incr va avea valoarea numarului in sine.
gaseste_div(Numar, Numar, Lista, Output):- Output = [Numar|Lista], ! .

% Acesta este predicatul care va calcula lisa propiu-zisa. El va avea ca parametrii un increment, numarul in sine, 
% lista care va fi costruita, si lista finala, cea care va contine divizorii lui "Numar".
gaseste_div(Incr, Numar, Lista, Output):- Incr2 is Incr+1, (mod(Numar, Incr) =:= 0, gaseste_div(Incr2, Numar, [Incr|Lista], Output); 
                                    mod(Numar, Incr) =\= 0, gaseste_div(Incr2, Numar, Lista, Output)).


% Predicatul este predicatul principal. Acesta va apela pe rand predicatul divizori pt a obtine 
% lista de parametrii, apoi va renunta la X (care este headul listei, si din linia 7 a scriptului, 
% se poate observa ca are valoarea 1) si va trece la apelarea predicatului verif_perfect, pentru
% ca in final sa verifice egalitatea dintre suma divizorilor si numarul in sine. 
perfect(Numar):- divizori(Numar, Lista), [X|List1] = Lista, verif_perfect(List1, Sum), Sum =:= Numar.

% Predicatul verif_perfect va parcurge lista si va calcula suma elementelor.
verif_perfect([1],1).
verif_perfect([X|Lista],Sum):-verif_perfect(Lista, Sum1), Sum is Sum1 + X.


/*Interogari
| ?- perfect(5).
no
| ?- perfect(6).
yes
| ?- perfect(7).
no
| ?- perfect(28).
yes
*/
