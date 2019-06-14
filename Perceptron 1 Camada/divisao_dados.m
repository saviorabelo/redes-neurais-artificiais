function [dados_tre, dados_test] = divisao_dados(dados, porcentagem_treino)
% Divide somente entre dados e teste

%Dimensão da matriz
[n_linhas, n_colunas] = size(dados);

%Tamanho do treinamento
n_trei = floor((porcentagem_treino/100) * n_linhas);

%Tamanho do teste
n_test = n_linhas - n_trei;

dados_tre = dados(1:n_trei, :);

dados_test = dados(n_trei+1:n_linhas, :);

end