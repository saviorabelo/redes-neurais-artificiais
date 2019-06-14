%function [acuracia, desv_padrao] = metodologia(nome_arquivo, num_atributos, n_realizacoes)

%% Configurando MATLAB

clc;
close all;
clearvars;

%% Atribuir os parâmetros e base de dados

porc_divisao = 80;
eta = 0.05;
n_epocas = 300;
n_realizacoes = 20;
n = 100;
tipo = -1;

%dados = dadosArtificial(n, tipo);
%dados = dadosIris(tipo);
dados = dadosColuna(tipo);

%% Realizações

for i = 1:n_realizacoes
    %% Divisão dos dados
    
    dados_aux = embaralhar_dados(dados);
    
    %Divide os dados em treino e teste
    [dados_tre, dados_test] = divisao_dados(dados_aux, porc_divisao);
    
    
    %% Aprendizado
    
    [w] = treinamento(dados_tre, eta, n_epocas, tipo);
    
    %% Teste

    acerto = teste(dados_test, w, tipo)
    
    taxa_acerto(i) = acerto;
end

%% Resultados

%Média do acertos
acuracia = mean(taxa_acerto)
desv_padrao = std(taxa_acerto)

%mapaCores(dados, n, w);
%end