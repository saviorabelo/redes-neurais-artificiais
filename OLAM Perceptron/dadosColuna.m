function dados = dadosColuna()

%Banco de dados da coluna vertebral
nome_arquivo = 'column_2C.dat';
atributo = 'NO';
%atributo = 'AB';
num_atributos = 6;

%% Leitura e divisão dos dados

dados = carrega_dados(nome_arquivo, num_atributos, atributo);

end