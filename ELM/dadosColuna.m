function dados = dadosColuna(tipo)

%Banco de dados da coluna vertebral
nome_arquivo = 'column_3C.dat';
num_atributos = 6;

dados = carrega_dados(nome_arquivo, num_atributos, tipo);

end