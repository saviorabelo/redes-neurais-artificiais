%% Configurando MATLAB

clc;
close all;
clearvars;
warning('off')

%% Atribuir os parâmetros e base de dados

porc_divisao = 80;
n_epocas = 250;
n_realizacoes = 10;

%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente
tipo = 0;

precisao = 10^(-5);

melhor_eta = 0.04; 
melhor_q = 15;

%% Escolha da base de dados

dados = dadosIris(tipo);
num_classes = 3;

%dados = dadosColuna(tipo);
%num_classes = 3;

%dados = dadosDermatologia(tipo);
%num_classes = 6;

%Número de padrões no conjunto de dados aleatório
%n = 100;
%dados = dadosArtificial(n, tipo);
%num_classes = 3;

%% Realizações

for i = 1:n_realizacoes
    %% Divisão dos dados
    
    dados_aux = embaralhar_dados(dados);
    
    %Divide os dados em treino e teste
    [dados_tre, dados_test] = divisao_dados(dados_aux, porc_divisao);
    
    %Busca em grade com validação cruzada
    %[melhor_eta, melhor_q] = busca_em_grade(dados_tre, n_epocas, tipo, precisao, num_classes);
    
    %% Aprendizado

    [w1, w2] = treinamento(dados_tre, melhor_eta, n_epocas, tipo, melhor_q, precisao, num_classes);
    
    %% Teste

    acerto = teste(dados_test, tipo, w1, w2, num_classes)
    
    taxa_acerto(i) = acerto;
end

%% Resultados

acuracia = mean(taxa_acerto)
desv_padrao = std(taxa_acerto)

%mapa_cores(dados, n, w1, w2, tipo);
