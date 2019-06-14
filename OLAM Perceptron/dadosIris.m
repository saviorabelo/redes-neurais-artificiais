function dados = dadosIris()

%Banco de dados da coluna vertebral
%nome_arquivo = 'column_2C.dat';
%atributo = 'NO';
%atributo = 'AB';
%num_atributos = 6;

%Banco de dados da flor
nome_arquivo = 'iris.dat';
atributo = 'Iris-setosa';
%atributo = 'Iris-versicolor';
%atributo = 'Iris-virginica';
num_atributos = 4;


%% Leitura e divisão dos dados

dados = carrega_dados(nome_arquivo, num_atributos, atributo);

end