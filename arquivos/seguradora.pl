:- dynamic automov
el/15.
:- dynamic quantidadeAuto/1.


menu:-
    write('\e[2J'),
    assert(quantidadeAuto(0)),
    writeln("    1. para incluir automovel
    2. Localizar Automóvel pelo Nome do Proprietário
    3. Excluir Automóvel pela Placa
    4. Localizar Automóvel pela Placa
    5. Localizar Automóvel pelo Renavam
    6. Relatório de Automóveis
    7. Informar Quantidade de Automóveis
    8. Salvar Dados em Arquivo
    9. Carregar Dados de Arquivo
    10.Limpar Dados de Cadastro
    11.Encerrar
    12. Para alterar automovel pela placa"),
    read(X), verifica(X),fail.
volta_menu:- nl,write('tecle algo para voltar'),read(_),menu.
verifica(1):-
    write('\e[2J'),
    writeln('Escreva o ranavam do automovel'),
    read(_ranavam),
    writeln('Escreva a placa do automovel'),
    read(_placa),
    writeln('Escreva a marca do automovel'),
    read(_marca),
    writeln('Escreva o modelo do automovel'),
    read(_modelo),
    writeln('Escreva o ano de frabricação do automovel'),
    read(_ano),write('\e[2J'),
    writeln('Escreva o nome do proprietario'),
    read(_nome),
    writeln('Escreva o sobrenome do proprietario'),
    read(_sobrenome),
    writeln('Escreva o logradouro do proprietario'),
    read(_logradouro),
    writeln('Escreva o numero da casa do proprietario'),
    read(_numero),
    writeln('Escreva o complemento da casa do proprietario'),
    read(_complemento),
    writeln('Escreva a cidade da casa do proprietario'),
    read(_cidade),
    writeln('Escreva o estado da casa do proprietario'),
    read(_estado),
    writeln('Escreva o cep da casa do proprietario'),
    read(_cep),
    writeln('Escreva o celular do proprietario'),
    read(_celular),
    writeln('Escreva o telefone do proprietario'),
    read(_telefone),
    assert(automovel(_ranavam,_placa,_nome,_sobrenome,_marca,_modelo,_ano,
          _logradouro,_numero,_complemento,_cidade,_estado,_cep,
           _celular,_telefone)),
    volta_menu.



verifica(2):-
    write('\e[2J'),
    writeln('Escreva o nome do proprietario'),
    read(_nome),
    writeln('Escreva o sobrenome do proprietario'),
    read(_sobrenome),passa(_nome,_sobrenome).

passa(_nome,_sobrenome):-
    automovel(_renavam,_placa,_nome,_sobrenome,_marca,_modelo,_ano,_logradouro,
              _numero,_complemento,_cidade,_estado,_cep,_celular,_telefone),nl,nl,
    write('_renavam '),writeln(_renavam),
    write('_placa '),writeln(_placa),
    write('_nome '),writeln(_nome),
    write('_sobrenome '),writeln(_sobrenome),
    write('_marca '),writeln(_marca),
    write('_modelo '),writeln(_modelo),
    write('_ano '),writeln(_ano),
    write('_logradouro '),writeln(_logradouro),
    write('_numero '),writeln(_numero),
    write('_complemento '),writeln(_complemento),
    write('_cidade '),writeln(_cidade),
    write('_estado '),writeln(_estado),
    write('_cep '),writeln(_cep),
    write('_celular '),writeln(_celular),
    write('_telefone '),writeln(_telefone),
    fail.

verifica(2):- volta_menu.


verifica(3):-
    write('\e[2J'),
    writeln('Escreva a placa do automovel'),
    read(_placa),
    retract(automovel(_,_placa,_,_,_,_,_,_,_,_,_,_,_,_,_)),
    volta_menu.

verifica(4):-
    write('\e[2J'),
    writeln('Escreva a placa do automovel'),
    read(_placa),
    automovel(_renavam,_placa,_nome,_sobrenome,_marca,_modelo,_ano,_logradouro,
              _numero,_complemento,_cidade,_estado,_cep,_celular,_telefone),
    write('_renavam '),writeln(_renavam),
    write('_placa '),writeln(_placa),
    write('_nome '),writeln(_nome),
    write('_sobrenome '),writeln(_sobrenome),
    write('_marca '),writeln(_marca),
    write('_modelo '),writeln(_modelo),
    write('_ano '),writeln(_ano),
    write('_logradouro '),writeln(_logradouro),
    write('_numero '),writeln(_numero),
    write('_complemento '),writeln(_complemento),
    write('_cidade '),writeln(_cidade),
    write('_estado '),writeln(_estado),
    write('_cep '),writeln(_cep),
    write('_celular '),writeln(_celular),
    write('_telefone '),writeln(_telefone),volta_menu.

verifica(5):-
    write('\e[2J'),
    writeln('Escreva o ranavam do automovel'),
    read(_renavam),
    automovel(_renavam,_placa,_nome,_sobrenome,_marca,_modelo,_ano,_logradouro,
              _numero,_complemento,_cidade,_estado,_cep,_celular,_telefone),
    write('_renavam '),writeln(_renavam),
    write('_placa '),writeln(_placa),
    write('_nome '),writeln(_nome),
    write('_sobrenome '),writeln(_sobrenome),
    write('_marca '),writeln(_marca),
    write('_modelo '),writeln(_modelo),
    write('_ano '),writeln(_ano),
    write('_logradouro '),writeln(_logradouro),
    write('_numero '),writeln(_numero),
    write('_complemento '),writeln(_complemento),
    write('_cidade '),writeln(_cidade),
    write('_estado '),writeln(_estado),
    write('_cep '),writeln(_cep),
    write('_celular '),writeln(_celular),
    write('_telefone '),writeln(_telefone),volta_menu.


verifica(6):-write('\e[2J'),automovel(_,_,_,_,_,_,_,_,_,_,_,_,_,_,_),listing(automovel/15),volta_menu.
verifica(6):-write('\e[2J'),write('base vazia.'), volta_menu.

verifica(7):-
    soma_tudo,
    write('O total de automeis eh: '),
    quantidadeAuto(X),
    format('~2f',X),
    retractall(quantidadeAuto(_)),
    assert(quantidadeAuto(0)),volta_menu.


soma_tudo:-
    automovel(_,_,_,_,_,_,_,_,_,_,_,_,_,_,_),
    retract(quantidadeAuto(S)),
    Z is S + 1,
    assert(quantidadeAuto(Z)),fail.
soma_tudo.

verifica(8):-
    write('\e[2J'),
    writeln('Escreva o nome do arquivo'),
    read(_arq),
    tell(_arq),listing(automovel/15),told, volta_menu.

verifica(9):-
    write('\e[2J'),
    writeln('Escreva o diretorio do arquivo'),
    read(_arq),
    consult(_arq),menu.

verifica(10):- retractall(automovel(_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)), volta_menu.

verifica(11):-!.

verifica(12):-
    write('\e[2J'),
    writeln('Escreva a placa do automovel'),
    read(_placa),
    automovel(_renavam,_placa,_nome,_sobrenome,_marca,_modelo,_ano,_,
              _,_,_,_,_,_celular,_telefone),
    retract(automovel(_,_placa,_,_,_,_,_,_,_,_,_,_,_,_,_)),
    writeln('Escreva o logradouro do proprietario'),
    read(_logradouro),
    writeln('Escreva o numero da casa do proprietario'),
    read(_numero),
    writeln('Escreva o complemento da casa do proprietario'),
    read(_complemento),
    writeln('Escreva a cidade da casa do proprietario'),
    read(_cidade),
    writeln('Escreva o estado da casa do proprietario'),
    read(_estado),
    writeln('Escreva o cep da casa do proprietario'),
    read(_cep),
    assert(automovel(_renavam,_placa,_nome,_sobrenome,_marca,_modelo,_ano,
          _logradouro,_numero,_complemento,_cidade,_estado,_cep,
           _celular,_telefone)),

    write('_renavam '),writeln(_renavam),
    write('_placa '),writeln(_placa),
    write('_nome '),writeln(_nome),
    write('_sobrenome '),writeln(_sobrenome),
    write('_marca '),writeln(_marca),
    write('_modelo '),writeln(_modelo),
    write('_ano '),writeln(_ano),
    write('_logradouro '),writeln(_logradouro),
    write('_numero '),writeln(_numero),
    write('_complemento '),writeln(_complemento),
    write('_cidade '),writeln(_cidade),
    write('_estado '),writeln(_estado),
    write('_cep '),writeln(_cep),
    write('_celular '),writeln(_celular),
    write('_telefone '),writeln(_telefone),
    volta_menu.

