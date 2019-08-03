caminho(portoAlegre,florianopolis,1).
caminho(florianopolis, curitiba,1).
caminho(curitiba,saoPaulo,1).
caminho(curitiba,campoGrande,1).
caminho(saoPaulo,rioDeJaneiro,1).
caminho(saoPaulo,campoGrande,1).
caminho(saoPaulo,beloHorizonte,1).
caminho(campoGrande,cuiaba,1).
caminho(campoGrande,goiania,1).
caminho(campoGrande,beloHorizonte,1).
caminho(rioDeJaneiro,beloHorizonte,1).
caminho(rioDeJaneiro,vitoria,1).
caminho(vitoria,beloHorizonte,1).
caminho(vitoria,salvador,1).
caminho(beloHorizonte,salvador,1).
caminho(beloHorizonte,goiania,1).
caminho(goiania,brasilia,1).
caminho(goiania,cuiaba,1).
caminho(goiania,palmas,1).
caminho(goiania,salvador,1).
caminho(cuiaba,portoVelho,1).
caminho(cuiaba,manaus,1).
caminho(cuiaba,belem,1).
caminho(cuiaba,palmas,1).
caminho(palmas,belem,1).
caminho(palmas,saoLuis,1).
caminho(palmas,teresina,1).
caminho(palmas,salvador,1).
caminho(salvador,teresina,1).
caminho(salvador,aracaju,1).
caminho(salvador,maceio,1).
caminho(salvador,recife,1).
caminho(aracaju,maceio,1).
caminho(maceio,recife,1).
caminho(recife,joaoPessoa,1).
caminho(recife,fortaleza,1).
caminho(recife,teresina,1).
caminho(joaoPessoa,natal,1).
caminho(joaoPessoa,fortaleza,1).
caminho(natal,fortaleza,1).
caminho(fortaleza,teresina,1).
caminho(teresina,saoLuis,1).
caminho(saoLuis,belem,1).
caminho(belem,manaus,1).
caminho(belem,macapa,1).
caminho(belem,boaVista,1).
caminho(manaus,boaVista,1).
caminho(manaus,rioBranco,1).
caminho(manaus,portoVelho,1).
caminho(rioBranco,portoVelho,1).
caminho(brasilia,beloHorizonte,1).

conectado(X,Y,P):-
    caminho(X,Y,P).

conectado(X,Y,P):-
    caminho(Y,X,P).

prox_nodo(Atual, Prox, Visitados,P):-
    conectado(Atual, Prox,P),
    \+member(Prox, Visitados). %Not member.

prox_nodo(Atual, Prox, Visitados):-
    conectado(Atual, Prox,_),
    \+member(Prox, Visitados). %Not member.

%Exercicios 2
busca_profundidade1(Meta, Meta, _,[Meta]):-!.

busca_profundidade1(Inicio, Meta, Visitados,[Inicio|Caminho]):-
    prox_nodo(Inicio, Prox, Visitados),
    reverse(Visitados, RVisitados),
    %writeln(RVisitados),
    busca_profundidade1(Prox, Meta, [Prox|RVisitados], Caminho),!.

%Exercicio 3
busca_profundidade(Meta, Meta, _,[Meta],Distancia,Distancia):-!.
busca_profundidade(Inicio, Meta, Visitados,[Inicio|Caminho],Peso,Distancia):-
    prox_nodo(Inicio, Prox, Visitados,P),
    reverse(Visitados, RVisitados),
    %writeln(RVisitados),
    DistanciaX is Peso + P,
    %writeln(DistanciaX),
    busca_profundidade(Prox, Meta, [Prox|Visitados], Caminho,DistanciaX,Distancia),!.

%Exercicio 4
busca_larg(Inicio,Meta,Caminho):-
busca_larg_a(Meta,[n(Inicio,[])],[],RCaminho),
append(RCaminho,[Inicio],C),
reverse(C,Caminho).

busca_larg_a(Meta,[n(Meta,Caminho)|_],_,Caminho).

busca_larg_a(Meta,[n(Inicio,CI)|RCI],Visitados,Caminho):-
%write("--------"),nl,
%write(Meta),write(" I:"),write(Inicio),write("CI"),
%write(CI),write( "RCI:"),write(RCI),nl,
findall(n(I1,[I1|CI]),(caminho(Inicio,I1,A),\+member(I1,Visitados)),Cs),
%write(Cs),nl,
append(RCI,Cs,NC),
%write(NC),nl,
       %NVisitados?
       %write(Visitados),
busca_larg_a(Meta,NC,[Inicio|Visitados],Caminho),!.


%Exercicio 5

busca_profundidade2(Meta, Meta, X,[Meta],Distancia,Distancia):- reverse(X, RVisitados),writeln(RVisitados),writeln(Distancia).
busca_profundidade2(Inicio, Meta, Visitados,[Inicio|Caminho],Peso,Distancia):-
    prox_nodo(Inicio, Prox, Visitados,P),
    reverse(Visitados, RVisitados),
    %writeln(RVisitados),
    DistanciaX is Peso + P,
    %writeln(DistanciaX),
    busca_profundidade2(Prox, Meta, [Prox|Visitados], Caminho,DistanciaX,Distancia),sleep(2),fail.










