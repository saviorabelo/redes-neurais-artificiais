%% Configurando MATLAB

clc;
close all;
clearvars;
warning('off')

%% Atribuir os parâmetros e base de dados

porc_divisao = 80;
n_realizacoes = 20;

melhor_n_centros = 20;
melhor_abertura = 10;

%% Escolha da base de dados

%dados = dadosIris();
%num_classes = 3;

%dados = dadosColuna();
%num_classes = 3;

dados = dadosDermatologia();
num_classes = 6;

%Número de padrões no conjunto de dados aleatório
%n = 100;
%dados = dadosArtificial(n);
%num_classes = 3;

%% Realizações

for i = 1:n_realizacoes
    %% Divisão dos dados
    
    dados_aux = embaralhar_dados(dados);
    
    %Divide os dados em treino e teste
    [dados_tre, dados_test] = divisao_dados(dados_aux, porc_divisao);
    
    %Busca em grade com validação cruzada
    %[melhor_n_centros, melhor_abertura] = busca_em_grade(dados_tre, num_classes);
    
    %% Aprendizado
        
    [W, c] = treinamento(dados_tre, melhor_n_centros, num_classes, ...
        melhor_abertura);   
    
    %% Teste
    
    acerto = teste(dados_test, W, c, num_classes, melhor_abertura, ...
        melhor_n_centros);
    
    taxa_acerto(i) = acerto;
end

%% Resultados

acuracia = mean(taxa_acerto)
desv_padrao = std(taxa_acerto)
