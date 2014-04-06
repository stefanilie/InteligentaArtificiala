membru(ionel,echipa1).
membru(gigel,echipa1).
membru(danel,echipa2).
membru(tudorel,echipa2).
adversari(X,Y):- membru(X,Z1), membru(Y,Z2), Z1 \== Z2.
colegi(X,Y):- membru(X,Z1), membru(Y,Z2), Z1 == Z2.


