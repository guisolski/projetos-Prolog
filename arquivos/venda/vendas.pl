:- dynamic vendas_totais/1.

carrega_vendas:-
    consult('venda.txt'),
    retractall(vendas_totais(_)),
    assert(vendas_totais(0)).

soma_vendas:-
    venda(_,_,Q,_,V),
    soma_tudo(Q,V),
    fail.

soma_vendas:-
    write('O total de vendas eh: '),
    vendas_totais(X),
    format('~2f',X),
    retractall(vendas_totais(_)),
    assert(vendas_totais(0)).

soma_tudo(Q,V):-
    retract(vendas_totais(S)),
    Z is S + Q * V,
    assert(vendas_totais(Z)).

soma_mes(M,A):-
    venda(_,data(_,M,A),Q,_,V),
    soma_tudo(Q,V),
    fail.

soma_mes(_,_):-
    write('O total de vendas no mes eh: '),
    vendas_totais(X),
    format('~2f',X),
    retractall(vendas_totais(_)),
    assert(vendas_totais(0)).

salva_base:-
    open('vendas1.txt',write,B),
    salva(B),
    close(B),
    write('Ok').

salva(B):-
    venda(N,data(D,M,A),Q,P,V),
    write(B,venda(N,data(D,M,A),Q,P,V)),
    writeln(B,'.'),
    fail.
salva(_).

salvaTell:-
    tell('vendas2.txt'),listing(venda/5),told.
