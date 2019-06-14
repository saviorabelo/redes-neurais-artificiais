%% Configurando MATLAB

clc;
close all;
clearvars;
warning('off')

%% Atribuir os parâmetros e base de dados

porc_divisao = 80;
n_realizacoes = 1;

%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente
tipo = 0;

q = 20;

%% Escolha da base de dados

n = 1000;
dados = dadosRegressao(n);
num_classes = 1;

%% Realizações

for i = 1:n_realizacoes
    %% Divisão dos dados
    
    dados_aux = embaralhar_dados(dados);
    
    %Divide os dados em treino e teste
    %[dados_tre, dados_test] = divisao_dados(dados_aux, porc_divisao);
    dados_tre =  dados_aux;
    dados_test = dados_aux;
    
    %Busca em grade com validação cruzada
    %[melhor_eta, melhor_q] = busca_em_grade(dados_tre, n_epocas, tipo, precisao, num_classes);
    
    %% Aprendizado

    [W, M] = treinamento(dados_tre, tipo, q, num_classes);
    
    %% Teste

    erro_q_medio = teste(dados_test, tipo, W, M, num_classes)
    
    rmse(i) = sqrt(erro_q_medio);
        
end


%% Plotagem da curva gerada

for i = 1:length(dados)
    
    
    x = dados(i,1);
    %
    H = x * W';
    if(tipo == -1)
        H = tangente(H);
    else
        H = logistica(H);
    end

    H = [-1 H];

    Y = H * M;
    
    ans(i) = Y;
end


figure(2)
hold on

plot(dados(:,1), ans, '.', 'Color', [.1 .4 .6], 'DisplayName', 'Curva gerada')
plot(dados(:,1), dados(:,2), '.', 'Color', 'r', 'DisplayName', 'Amostras')

xlabel('Eixo x')
ylabel('Eixo y')
legend show
grid on

hold off

%% Resultados

rmse_medio = mean(erro_q_medio);
desv_padrao = std(erro_q_medio);
