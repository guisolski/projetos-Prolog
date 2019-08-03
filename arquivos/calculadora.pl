verifica0(0,Y):-
         write("Nao e possivel dividir por zero "),nl,sleep(1.50),
        calcul.
verifica0(X,Y):-
        Z is X/Y,
        write("Resultado "),
        writeln(Z),sleep(1.50),
        calcul.



ope(1):-
        write("enter value A"),nl,
        read(A), nl,
        write("enter value B"),nl,
        read(B), nl,
        Z is A+B,
        write("Resultado "),
        writeln(Z),nl,sleep(1.50),
        calcul.

ope(2):-
        write("enter value A"),nl,
        read(A), nl,
        write("enter value B"),nl,
        read(B), nl,
        Z is A-B,
        write("Resultado "),
        writeln(Z),sleep(1.50),
        calcul.

ope(3):-
        write("enter value A"),nl,
        read(A), nl,
        write("enter value B"),nl,
        read(B), nl,
        Z is A*B,
        write("Resultado "),
        writeln(Z),sleep(1.50),
        calcul.

ope(4):-
        write("enter value A"),nl,
        read(A), nl,
        write("enter value B"),nl,
        read(B), nl,
        verifica0(A,B).


ope(5):- write('\e[2J'),!.

ope(Y):- write("Valor "),write(Y),write(" invalido"),nl,sleep(1.50),
        calcul.

calcul:-write('\e[2J'),writeln("***************************************
*       CALCULADORA SIMPLES           *
***************************************


Escolha qual a opção deseja executar

1-Soma.
2-Subtracao.
3-Multiplicacao.
4-Divisao.
5-Sair.

Informe a opcao:"),nl,
        read(X), nl,
        ope(X).


media(X,Y,Z):-
    T is(X+Y+Z)/3, format('~1f',T).

cardenetas:-
    write('======================
** Notas da Turma **
NOME N1 N2 N3 Media'),
    aluno(Nome,N1,N2,N3),nl,
    write(Nome), tab(1),write(N1), tab(1),write(N2), tab(2),write(N3), tab(2),media(N1,N2,N3),nl,fail.

cardenetas.


