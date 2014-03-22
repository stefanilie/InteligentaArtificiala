object(a).
object(b).
object(c).
object(d).
object(20).
object(30).
object(40).
object(50).
object(51).

pred(X, Y, Z, T) :- object(x), object(Y), object(Z), object(T),
				0 =/= mod(X, 4), Y /= Z, 0 == mod(X, 10), T==b, T==d;	 