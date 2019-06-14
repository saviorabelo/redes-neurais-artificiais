%% Configurando MATLAB

clc;
close all;
clearvars;
format LONG;

%% Atribuir os parâmetros

porc_divisao = 80;
eta = 0.05;
n_epocas = 100;
n_realizacoes = 20;

%% Escolha da base de dados e dos parâmetros

%Banco de dados da coluna vertebral
nome_arquivo = 'column_2C.dat';
%atributo = 'NO';
atributo = 'AB';
num_atributos = 6;

%Banco de dados da flor
%nome_arquivo = 'iris.dat';
%atributo = 'Iris-setosa';
%atributo = 'Iris-versicolor';
%atributo = 'Iris-virginica';
%num_atributos = 4;

%% Leitura e divisão dos dados

dados = carrega_dados(nome_arquivo, num_atributos, atributo);

%Incrementa por adicionar outra coluna
num_atributos = num_atributos + 1;
 
%% Realizações

m = [];
for i = 1:n_realizacoes
    %% Divisão dos dados
    
    dados_aux = embaralhar_dados(dados);
    
    %Divide os dados em treino e teste
    [dados_tre, dados_test] = divisao_dados(dados_aux, porc_divisao);
    
    
    %% Aprendizado
    
    [w,matriz_confusao] = aprendizado(dados_tre, num_atributos, eta, n_epocas);
    
    %% Teste

    acerto = teste(dados_test, num_atributos, w)
    
    taxa_acerto(i) = acerto;
    %m(i) = matriz_confusao;

end

%% Resultados

%Média do acertos
acuracia = mean(taxa_acerto)
desv_padrao = std(taxa_acerto)

% fprintf('Banco de dados: %s\n', nome_arquivo);
% fprintf('Atributo a ser analisado: %s\n', atributo);
% fprintf('Número de realizações: %d\n', n_realizacoes);
% fprintf('Número de épocas: %d\n', n_epocas);
% fprintf('Acurácia média: %f\n', mean(taxa_acerto));
% fprintf('Acurácia mínima: %f\n', min(taxa_acerto));
% fprintf('Acurácia máxima: %f\n', max(taxa_acerto));
% fprintf('Desvio padrão: %f\n\n', std(taxa_acerto));