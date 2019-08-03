% Família Pereira Santos
pessoa(joao, pereira_santos, nascimento(27,05,1938), origem(curitiba), profissao(engenheiro)).
pessoa(maria, pereira_santos, nascimento(12,06,1945), origem(sao_paulo), profissao(professora)).
pessoa(julio, pereira_santos, nascimento(14,09,1972), origem(curitiba), profissao(medico)).
pessoa(ana, pereira_santos, nascimento(22,11,1975), origem(curitiba), profissao(dentista)).
pessoa(claudia, pereira_santos, nascimento(05,05,1978), origem(curitiba), profissao(musico)).

% Família Silva Pinheiro
pessoa(carlos, silva_pinheiro, nascimento(01,04,1962), origem(guarulhos), profissao(mecanico)).
pessoa(ana_claudia, silva_pinheiro, nascimento(18,07,1966), origem(castro), profissao(do_lar)).
pessoa(silvia, silva_pinheiro, nascimento(27,12,1998), origem(sao_paulo), profissao(nenhuma)).
pessoa(carolina, silva_pinheiro, nascimento(27,12,1998), origem(sao_paulo), profissao(nenhuma)).
pessoa(claudia, silva_pinheiro, nascimento(15,04,2003), origem(curitiba), profissao(nenhuma)).

% Família Nogueira Carvalho
pessoa(marcos, nogueira_carvalho, nascimento(12,07,1952), origem(curitiba), profissao(advogado)).
pessoa(patricia, nogueira_carvalho, nascimento(07,09,1952), origem(jau), profissao(enfermeira)).
pessoa(andrea,  nogueira_carvalho, nascimento(14,02,1978), origem(curitiba), profissao(nenhuma)).
pessoa(augusto, nogueira_carvalho, nascimento(22,12,1983), origem(curitiba), profissao(nenhuma)).


verifica(X) :-
    pessoa(_,Y,_,_,_),
    X = Y,
    pessoa(NOME,X,nascimento(DD,MM,AA),origem(O),profissao(P)),
    nl, write("Os membros dessa família são:"), nl,
    write("Nome: "), write(NOME), nl,
    write("Data de Nascimento: "), write(DD), write("/"), write(MM), write("/"),      write(AA), nl,
    write("Local de Nascimento: "), write(O), nl,
    write("Profissao: "), write(P), nl,nl,
    fail.
verifica(X):-
    pessoa(_,Y,_,_,_),
    X = Y,!.
verifica(_):-write("Nome de familia nao registrado"),!.

encontra_membros :-
    write('\e[2J'),
    write("Por favor, entre do o nome da família: "),
    read(X),verifica(X).
encontra_membros.

verifica_profissao(NOME,SOBRENOME,PROFISSAO) :-
    pessoa(NOME,SOBRENOME,_,_, profissao(PROFISSAO)),
    write("Profissao correta"), nl, nl,nl,
    write("===================================="),nl,nl,nl,
    sleep(2.0),write("Yes"),!.
verifica_profissao(NOME,SOBRENOME, _) :-
    pessoa(NOME,SOBRENOME,_,_,profissao(X)),
    write("Errado, a profissao de "), write(NOME), write(" "), write(SOBRENOME),
    write(" é "), write(X),  nl, nl,nl,
    write("===================================="),nl,nl,nl,
    sleep(2.0),write("No"),!.

ano(X,Y,Z):-
    D is X*360,
    K is Y*360,
    D>=K,
    Z is (D-K)/360,!.
ano(X,Y,Z):-
    D is X*360,
    K is Y*360,
    D<K,
    Z is (K-D)/360,!.
dias(X,Y,Z):-
    X>=Y,
    Z is X-Y,!.
dias(X,Y,Z):-
    X<Y,
    Z is Y-X,!.
mes(X,Y,Z):-
    D is X*30,
    K is Y*30,
    D>=K,
    Z is (D-K)/30,!.
mes(X,Y,Z):-
    D is X*30,
    K is Y*30,
    D<K,
    Z is (K-D)/30,!.

diferenca_idade(NOME_1,SOBRENOME_1,NOME_2,SOBRENOME_2,D,M,A):-
    pessoa(NOME_1,SOBRENOME_1,nascimento(D_1,M_1,A_1),_,_),
    pessoa(NOME_2,SOBRENOME_2,nascimento(D_2,M_2,A_2),_,_),
    write("A diferença de idade é de "),
    dias(D_1,D_2,D),
    mes(M_1,M_2,M),
    ano(A_1,A_2,A).

diferenca_idade(NOME_1,SOBRENOME_1,NOME_2,SOBRENOME_2):-
    pessoa(NOME_1,SOBRENOME_1,nascimento(D_1,M_1,A_1),_,_),
    pessoa(NOME_2,SOBRENOME_2,nascimento(D_2,M_2,A_2),_,_),
    dias(D_1,D_2,D),
    mes(M_1,M_2,M),
    ano(A_1,A_2,A),
    write("A diferença de idade é de "), write(D), write(" dias, "),
    write(M), write(" meses e "),
    write(A), write(" anos").

