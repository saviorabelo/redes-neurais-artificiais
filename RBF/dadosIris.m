function dados = dadosIris()

%Banco de dados da flor
nome_arquivo = 'iris.dat';
num_atributos = 4;

dados = carrega_dados(nome_arquivo, num_atributos);

end