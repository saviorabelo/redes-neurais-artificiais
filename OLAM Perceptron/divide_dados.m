function [dados_tre,dados_test,classe_trei,classe_test] = divide_dados(dados, n_atributos, porcentagem_treino)


%Dimensão da matriz
[n_linhas, n_colunas] = size(dados);

%Tamanho do treinamento
n_trei = floor((porcentagem_treino/100) * n_linhas);

%Tamanho do teste
n_test = n_linhas - n_trei;

dados_tre = dados(1:n_trei,1:n_atributos);

dados_test = dados(n_trei+1:n_linhas, 1:n_atributos);

classe_trei = dados(1:n_trei, n_atributos+1:n_colunas);

classe_test = dados(n_trei+1:n_linhas, n_atributos+1:n_colunas);

end