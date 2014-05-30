
%Author: Ilie Stefan Ionut 242
%Date: 30.05.2014

:-use_module(library(file_systems)).
:-dynamic bench/4.
:-dynamic angry/2.
:-dynamic line/1.

read_file(File):- retractall(line(_)), 
				  retractall(bench(_,_,_,_)), 
				  retractall(angry(_,_)), 
				  assert(line(1)),
				  close_all_streams,
				  open(File, read, Stream),
				  	repeat,
				  		read_row_from_file(Stream).

read_row_from_file(Stream):- read(Stream, StudentName1), 
							 (
							 	StudentName1 == 'suparati' -> read_angry_people(Stream); 
									read(Stream, StudentName2), once(retract(line(Nr))), assert(bench(1, Nr, StudentName1, StudentName2)),
									read(Stream, StudentName3), read(Stream, StudentName4), assert(bench(2, Nr, StudentName3, StudentName4)),
									read(Stream, StudentName5), read(Stream, StudentName6), assert(bench(3, Nr, StudentName5, StudentName6)),
									Nr1 is Nr+1, assert(line(Nr1)), fail
							 ).

read_angry_people(Stream):- repeat, 
							read(Stream, StudentName1), 
							(	
								(StudentName1 \== end_of_file -> (read(Stream, StudentName2), assert(angry(StudentName1, StudentName2)), assert(angry(StudentName2, StudentName1)), fail);
								StudentName1 == end_of_file, !, close(Stream))
							).





is_available(StudentName1, StudentName2):- StudentName1 \== 'liber', StudentName2 \== 'liber', \+angry(StudentName1, StudentName2), \+angry(StudentName2, StudentName1).



% Cazul unu. Stau unul langa celelalt.
succ(st(Bench, Row, Student1), st(Bench, Row, Student2)):- bench(Bench, Row, Student1, Student2), is_available(Student1, Student2);
														   bench(Bench, Row, Student2, Student1), is_available(Student1, Student2).

%2 Cazul 2. Sunt pe rand diferit.
succ(st(Bench, Row, Student1), st(Bench, Row1, Student2)):- 
			bench(Bench, Row, Student1, _), bench(Bench, Row1, Student2,_ ), Row\==Row1, (Row1 is Row+1;Row is Row1+1), is_available(Student1, Student2);
			bench(Bench, Row, _, Student1), bench(Bench, Row1, _, Student2), Row\==Row1, (Row1 is Row+1;Row is Row1+1), is_available(Student1, Student2).
			
%3 Cazul3. Sunt in "banci" diferite si sunt pe randul 6 si 7.
succ(st(Bench, Row, Student1), st(Bench1, Row, Student2)):- 
			bench(Bench, Row, _,Student1 ), bench(Bench1, Row, Student2,_ ), (Row ==6; Row ==7),  Bench\==Bench1, Bench1 is Bench+1, is_available(Student1, Student2);
			bench(Bench, Row, Student1, _), bench(Bench1, Row, _,Student2 ),(Row ==6; Row ==7), Banca\==Banca1, Banca is Banca1+1, is_available(Student1, Student2).				



				
						
/*
| ?- read_file('inputt2.txt').
| ?- listing(bench).
| ?- listing(angry).
| ?- succ(st(1,1,ionel), S).
	banca(1-3),rand(1-7)
	

Listing

| ?- succ(st(1,1,ionel),st(1,1,alina)).                                                                          
yes
| ?- succ(st(1,1,ionel), X).           
X = st(1,1,alina) ? 
yes
| ?- succ(st(1,1,ionel), X).
X = st(1,1,alina) ? ;
no
| ?- succ(st(1,2,diana), X).
X = st(1,2,george) ? ;
X = st(1,1,alina) ? ;
X = st(1,3,costin) ? ;
no
| ?- succ(st(1,3,cosi=tin), X).
no
| ?- succ(st(1,3,costin), X).  
X = st(1,2,diana) ? ;
X = st(1,4,simona) ? ;
no




| ?- listing(bench).
bench(1, 1, ionel, alina).
bench(2, 1, teo, eliza).
bench(3, 1, carmen, monica).
bench(1, 2, george, diana).
bench(2, 2, bob, liber).
bench(3, 2, nadia, mihai).
bench(1, 3, liber, costin).
bench(2, 3, anda, bogdan).
bench(3, 3, dora, marin).
bench(1, 4, luiza, simona).
bench(2, 4, dana, cristian).
bench(3, 4, alina, dragos).
bench(1, 5, mihnea, razvan).
bench(2, 5, radu, patricia).
bench(3, 5, gigel, elena).
bench(1, 6, liber, andrei).
bench(2, 6, oana, victor).
bench(3, 6, liber, dorel).
bench(1, 7, viorel, alex).
bench(2, 7, ela, nicoleta).
bench(3, 7, maria, gabi).

yes
| ?- listing(angry).
angry(george, ionel).
angry(ionel, george).
angry(ela, nicoleta).
angry(nicoleta, ela).
angry(victor, oana).
angry(oana, victor).
angry(teo, eliza).
angry(eliza, teo).
angry(teo, luiza).
angry(luiza, teo).
angry(elena, dragos).
angry(dragos, elena).
angry(alina, dragos).
angry(dragos, alina).

yes


yes
| ?- listing(line). 
line(8).

*/



