clc;
close all;
clearvars;
format longG;

%% Setando atributos
n = 1000;
eta = 0.01;
n_epocas = 100;
n_realizacoes = 20;
precisao = 0.000001;
porcentagem_treino = 80;

desvio = 0.1;
a = 2;
b = 10;

%% Gera a base de dados

% Entradas
X = linspace(0,10,n)';

% Saídas desejadas - reta com ruído
ruido = desvio*randn(n,1);
Y = a*X + b + ruido;

dados = normalizar([X Y]);

%Matriz de dados
dados = [-ones(n,1) dados];


% figure
% hold on
% grid on
% 
% plot(X,Y, '.', 'Color', [.1 .4 .6], 'DisplayName', 'Amostra')
% xlabel('x')
% ylabel('f(x)')
% 
% legend show
% hold off

vetor_erros = [];
%% Realizações
for i = 1:n_realizacoes
    
    %Embaralha os dados
    dados_aux = embaralhar_dados(dados);

    %Divide os dados
    [dados_tre, dados_teste] = divisao_dados(dados_aux, porcentagem_treino);

    %% Aprendizado

    [w,vetor_erros] = treinamento(dados_tre, eta, n_epocas, precisao);

    %% Teste

    mse = teste(dados_teste, w);
    
    rmse(i) = sqrt(mse);
end

fprintf('Média do RMSE: %f\n', mean(rmse));
fprintf('Desvio Padrão do RMSE: %f\n', std(rmse));

%% Plotagem


figure
hold on

plot(vetor_erros, '.-', 'Color', [.1 .4 .6])
grid on
xlabel('Época')
ylabel('Erro Quadrático')
%title('Erro Quadrático Médio por Época de Treinamento')

hold off

reta = w(2)*dados(:,2) - w(1);

figure
hold on
grid on

plot(dados(:,2), dados(:,3), '.', 'Color', [.1 .4 .6], 'DisplayName', 'Amostras de Teste')
plot(dados(:,2),reta, '.', 'Color', [0 0 0], 'DisplayName', 'Reta Obtida pelo Adaline')
%title('Resultado do Adaline')
xlabel('x')
ylabel('f(x)')

legend show
hold off

