fisier(Fisin):- seeing(Input_curent),
                       see(Fisin),
                       repeat,
                         read(X),
                           (X==end_of_file
                           ;
                           write(X),nl,fail),
                       !,
                       seen,
                       see(Input_curent).
