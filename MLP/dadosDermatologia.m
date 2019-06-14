function dados = dadosDermatologia(tipo)

%Banco de dados de dermatologia
nome_arquivo = 'dermatology.dat';
num_atributos = 34;

dados = carrega_dados(nome_arquivo, num_atributos, tipo);

end