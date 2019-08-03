% Ex 1
maiores([],_,[]).
maiores([X|Y],N,[X|F]):-
    X > N,
    !,
    maiores(Y,N,F).

maiores([_|Y],N,F):-  maiores(Y,N,F).

% Ex 2

media(X,Z):-
    T is 0,
    K is 0,
    calculaMedia(X,Z,0,0).
calculaMedia([],N,T,K) :- N is T/K.

calculaMedia([X|Y],N,T,K) :-
     W is X+T,
     Q is K+1,
     calculaMedia(Y,N,W,Q).


% Ex 3

maiores_media(Y,X) :-
     calculaMedia(Y,N,0,0),
     maiores(Y,N,X).

% 4
anteriores(Lista,Valor,X):-
    ant(Lista,Valor,X,0).
ant([],_,[],_).

ant([X|Y],N,[X|F],V):-
    V < N-1,
    K is V+1,
    !,
    ant(Y,N,F,K).
ant([_|Y],N,F,V):-
    K is V+1,
    ant(Y,N,F,K).

% 5

posteriores(Lista,Valor,X):-
    pos(Lista,Valor,X,0).
pos([],_,[],_).

pos([X|Y],N,[X|F],V):-
    V >= N-1,
    K is V+1,
    !,
    pos(Y,N,F,K).
pos([_|Y],N,F,V):-
    K is V+1,
    pos(Y,N,F,K).
%6

inteiros(N, L) :- inteiros1(N, [], L).

inteiros1(0, L, L) :- !.
inteiros1(N, R, L) :- N > 0, N1 is N-1, inteiros1(N1, [N|R], L).


%7
vizinhos(E,[A,E,B|_],[A,B]):-!.
vizinhos(E,[E,B|_],B):-!.
vizinhos(E,[_|Y],L):- vizinhos(E,Y,L).

%8
anteriores1(Lista,Valor,X):-
    ant1(Lista,Valor,X,0).
ant1([],_,[],_).

ant1([X|Y],N,[X|F],V):-
    V =< N-1,
    K is V+1,
    !,
    ant1(Y,N,F,K).
ant1([_|Y],N,F,V):-
    K is V+1,
    ant1(Y,N,F,K).

posteriores1(Lista,Valor,X):-
    pos1(Lista,Valor,X,0).
pos1([],_,[],_).

pos1([X|Y],N,[X|F],V):-
    V > N-1,
    K is V+1,
    !,
    pos1(Y,N,F,K).
pos1([_|Y],N,F,V):-
    K is V+1,
    pos1(Y,N,F,K).


divide(L,V,X,Y):-anteriores1(L,V,X),posteriores1(L,V,Y).

%9
intervalo(X,X,[X]).
intervalo(X,Y,[X|L]):-
    X < Y,
    Z is X+1,
    intervalo(Z,Y,L).

%10
tamanhos(L,S):-
    tamanhos(L,W,S).
tamanhos([],S,S):-!.
tamanhos([X|Y],T,W):-
    length(X,Valor),
    append(T,[Valor],K),
    tamanhos(Y,K,W).


%11
merge_ordenado(X,Y,O):-
    merge(X,Y,O).

%12
inverte(Lista,X):-
	inverte(Lista,X,[]).

inverte([],Z,Z).
 inverte([H|T],Z,Acc) :- inverte(T,Z,[H|Acc]).

%13
sublista(A,B):-sort(A,X),sort(B,Y),sublista1(X,Y).


%14
sublista1( [], _ ).
sublista1( [X|XS], [X|XSS] ) :- sublista1( XS, XSS ).
sublista1( [X|XS], [_|XSS] ) :- sublista1( [X|XS], XSS ).

%15
remove(X,[X|Tail],Tail):-!.

remove(X,[Y|Tail],[Y|Tail1]):-
        remove(X,Tail,Tail1),!.
%16

delMember(_, [], []):-!.
delMember(X, [X|Xs], Y) :-
    delMember(X, Xs, Y),!.
delMember(X, [T|Xs], [T|Y]) :-
    dif(X, T),
    delMember(X, Xs, Y),!.


%17
remove_posicao(X,L,Tail):-
		remove_posicao(X,L,Tail,0),!.

remove_posicao(X,[_|Tail],Tail,X):-!.
remove_posicao(X,[Y|Tail],[Y|Tail1],S):-
	S1 is S+1,
        remove_posicao(X,Tail,Tail1,S1),!.

%18
lista(X):- is_list(X).

%19
nivela([], []) :- !.
nivela([L|Ls], FlatL) :-
    !,
    nivela(L, NewL),
    nivela(Ls, NewLs),
    append(NewL, NewLs, FlatL).
nivela(L, [L]).

%20
inter([], _, []).

inter([H1|T1], L2, [H1|Res]) :-
    member(H1, L2),
    inter(T1, L2, Res).

inter([_|T1], L2, Res) :-
    inter(T1, L2, Res).
%21
encontra_elementos(L,V,X):-
	encontra_elementos(L,V,X,K),!.
encontra_elementos([],_,L,L):-!.
encontra_elementos([A|B],V,X,L):-
    nth1(V,A,K),append(L,[K],T),encontra_elementos(B,V,X,T),!.

%22
empacota_copias([],[]):-!.
empacota_copias([X],[[X]]):-!.
empacota_copias([X,X|T],[[X|K]|N]):- empacota_copias([X|T],[K|N]),!.

empacota_copias([X,Y|T],[[X]|N]):- empacota_copias([Y|T],N),!.

%23

codifica(X,R) :-
    conta(X,Y),
    reduz(Y,R),!.

conta([],[]):-!.
conta([H|T],[[H,1]|R]) :- conta(T,R).

reduz([],[]):-!.
reduz([X],[X]):-!.
reduz([[X,N1],[X,N2]|T],R) :- N is N1 + N2, reduz([[X,N]|T],R).
reduz([[X,N1],[Y,N2]|T],[[X,N1]|R]) :- X \= Y, reduz([[Y,N2]|T],R).

%24

repeat(X, N, L) :-
    length(L, N),
    maplist(=(X), L).

decode([], []).
decode([[X,N]|XNs], Decoded) :-
    decode(XNs, Decoded_rest),
    repeat(X, N, L),
    append(L, Decoded_rest, Decoded).

%25
replica([],_,[]).
replica([A|B],V,X):-
    replica(B,V,X1),
    repeat(A,V,L),
    append(L,X1,X).







