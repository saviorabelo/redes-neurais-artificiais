%% Configurando MATLAB

clc;
close all;
clearvars;
warning('off')

%% Atribuir os parâmetros e base de dados

porc_divisao = 80;
n_realizacoes = 1;

n_centros = 20;
abertura = 0.3;

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

    [W, c] = treinamentoRegressao(dados_tre, n_centros, num_classes, abertura);
    
    %% Teste

    erro_q_medio = teste(dados_test, W, c, num_classes, abertura);
    
    rmse(i) = sqrt(erro_q_medio);
        
end


%% Plotagem da curva gerada

for i = 1:length(dados)
    
    x = dados(i,1);

    H = saidas_centro(x, c, abertura);

    H = [-1 H];

    Y = H * W;
    
    ans(i) = Y;
end


figure(1)
hold on

plot(dados(:,1), ans, '.', 'Color', [.1 .4 .6], 'DisplayName', 'Curva gerada')
plot(dados(:,1), dados(:,2), '.', 'Color', 'r', 'DisplayName', 'Amostras')

%title('MLP Aplicado à Regressão')
xlabel('Eixo x')
ylabel('Eixo y')
legend show
grid on

hold off

%% Resultados

rmse_medio = mean(erro_q_medio);
desv_padrao = std(erro_q_medio);
