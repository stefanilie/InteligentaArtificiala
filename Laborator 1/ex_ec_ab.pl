% Author: Ilie STefan Ionut 242
% Date: 16.03.2014

ec1(A,B):-(var(A), X=A, Sign is -1, A1=0; \+var(A), A1=A), (var(B), (var(Sign), X=B, Sign is 1, B1=0; \+var(Sign), B1=1, B=B1);
           +var(B), B1=B),
          (var(Sign), -A+B=:=2; \+var(Sign), X is (2-B1+A1)*Sign).
						
						
						
						
	
	
/*

Predicatul ec1(A,B):
var(A) - verifica daca A este variabila neinstantiata
X=A - variabila X este unificata cu vaiabila A
Sign is-1 - semnul lui A este -1
A1=0 - cream o variabila A1 pe care o egalam cu 0
\+var(A) - verifica daca variabila A a fost instantiata
A1=A - A1 preia aceasta valoare [ 0 - daca a variabila nu a fost instantiata sau A, daca a fost insantiata ]
   
var(B) - verifica daca B este variabila neinstantiata
var(Sign) - verifica daca Sign este variabila neinstantiata [In acest caz A a fost instantiat]
X=B - variabila X este unificata cu variabila B
Sign is 1 - semnul lui B  devine 1 [-A + B = 2, semnul lui B este pozitiv]
B1=0 - cream o variabila B1 pe care o egalam cu 0
\+var(Sign) - verifica daca variabila Sign a fost instantiata [ In acest caz A nu a fost instantiat ]
B1=1 - variabila B1 este egaalata cu 1 
B=B1 - variabila B este unificata cu variabila B1
\+var(B) - verifica daca variabila B a fost instantiata
B1=B - B1 preia aceasta valoare [ In vazul in care B a fost deja instantiat ]
   
var(Sign) - verifica daca Sign este variabila neinstantiata [ In avest caz A si B au fost instantiate ]
-A+B=:=2 - verifica daca egalitatea aritmetica -A + B = 2 este adevarata
\+var(Sign) - verifica daca variabila Sign a fost instantiata [ In acest caz A si B nu a fost instantiate ]
X is (2-B1+A1)*Sign - variabila X este instantiata (2 - B + A ) * Sign, folosing variabilele auxiliare A1 si B1
						


						
*/