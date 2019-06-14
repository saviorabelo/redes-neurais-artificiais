clc;
close all;
clearvars;

%% Setando atributos
n = 1000;
eta = 0.01;
n_epocas = 100;
n_realizacoes = 20;
precisao = 0.000001;
porcentagem_treino = 80;

desvio = 2;
a = 2;
b = 4;
c = 5;

%% Gera a base de dados

% Entradas
X = linspace(0,10,n)';

%Padrão 1
l1 = 0;
l2 = 10;
Y = ((l2-l1).*rand(n, 1) + l1);

% Saídas desejadas - reta com ruído
ruido = desvio*randn(n,1);
Z = a*X + b*Y + c + ruido;

dados = normalizar([X Y Z]);

%Matriz de dados
dados = [-ones(n,1) dados];

% figure
% hold on
% grid on
% 
% plot3(X, Y, Z, '.', ...
%     'Color', [.1 .4 .6], 'DisplayName', 'Amostras')
% xlabel('x')
% ylabel('y')
% zlabel('z')
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

figure
hold on
grid on

syms x y
h = ezsurf(w(2)*x + w(3)*y - w(1), [0, 1]);
h.EdgeColor = 'none';
h.LineStyle= '-';
%h.FaceColor= 'b'
colormap(jet)

plot3(dados(:,2), dados(:,3), dados(:,4), '.', ...
    'Color', [.1 .4 .6], 'DisplayName', 'Amostras')
title('')
xlabel('x')
ylabel('y')
zlabel('z')

%legend show
hold off
