function dados = dadosColuna()

%Banco de dados da coluna vertebral
nome_arquivo = 'column_2C.dat';
atributo = 'NO';
%atributo = 'AB';
num_atributos = 6;

%% Leitura e divis�o dos dados

dados = carrega_dados(nome_arquivo, num_atributos, atributo);

end