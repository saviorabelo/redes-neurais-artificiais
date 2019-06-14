%% Configurando MATLAB

clc;
close all;
clearvars;
warning('off')

%% Atribuir os parâmetros e base de dados

porc_divisao = 80;
n_realizacoes = 20;

%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente
tipo = 0;

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
    [melhor_q] = busca_em_grade(dados_tre, tipo, num_classes);
    
    %% Aprendizado
        
    [W, M] = treinamento(dados_tre, tipo, melhor_q, num_classes);   
    
    %% Teste
    
    acerto = teste(dados_test, tipo, W, M, num_classes);
    
    taxa_acerto(i) = acerto;
end

%% Resultados

acuracia = mean(taxa_acerto)
desv_padrao = std(taxa_acerto)
