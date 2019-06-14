%% Configurando MATLAB

clc;
close all;
clearvars;
warning('off')

%% Atribuir os parâmetros e base de dados

porc_divisao = 80;
n_epocas = 1000;
n_realizacoes = 1;
precisao = 10^(-5);

%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente
tipo = 0;

melhor_eta = 0.05;
melhor_q = 5;

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
    dados_tre =  dados_aux; dados_test = dados_aux;
    
    %Busca em grade com validação cruzada
    %[melhor_eta, melhor_q] = busca_em_grade(dados_tre, n_epocas, tipo, precisao, num_classes);
    
    %% Aprendizado

    [w, m, vetor_erros] = treinamentoRegressao(dados_tre, melhor_eta, n_epocas, ...
        tipo, melhor_q, precisao, num_classes);
    
    %% Teste

    erro_q_medio = teste(dados_test, tipo, w, m, num_classes);
    
    rmse(i) = sqrt(erro_q_medio);
        
end

%% Plotagem dos erros no treinamento

figure(2)
hold on

plot(vetor_erros)

%title('Erros no Treinamento')
xlabel('Épocas')
ylabel('Erro')
grid on

hold off

%% Plotagem da curva gerada

for i = 1:length(dados)
    
    x = dados(i,2);

    H = [-1 x] * w';
    if(tipo == -1)
        H = tangente(H);
    else
        H = logistica(H);
    end

    H = [-1 H];
    Y = H * m';
    
    ans(i) = Y;
end

X = dados(:,2);

figure(3)
hold on

plot(dados(:,2), ans, '.', 'Color', [.1 .4 .6], 'DisplayName', 'Curva gerada')
plot(dados(:,2), dados(:,3), '.', 'Color', [0.00 0.45 0.74], 'DisplayName', 'Amostras')
%plot(dados(:,2), X .* X -4 * X + 4, '.', 'Color', [0.7 0.4 0.3], 'DisplayName', 'Curva original')

%title('MLP Aplicado à Regressão')
xlabel('Eixo x')
ylabel('Eixo y')
legend show
grid on

hold off

%% Resultados

rmse_medio = mean(erro_q_medio);
desv_padrao = std(erro_q_medio);
