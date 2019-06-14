clc;
close all;
clearvars;
format longG;

%% Setando atributos
n = 1000;
eta = 0.05;
n_epocas = 300;
n_realizacoes = 20;
porcentagem_treino = 80;

desvio = 2;
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

figure
hold on
grid on

plot(X,Y, '.', 'Color', [.1 .4 .6], 'DisplayName', 'Amostra')
xlabel('x')
ylabel('f(x)')

legend show
hold off

vetor_erros = [];
%% Realizações
for i = 1:n_realizacoes
    
    %Embaralha os dados
    dados_aux = embaralhar_dados(dados);

    %Divide os dados
    [dados_tre, dados_test] = divisao_dados(dados_aux, porcentagem_treino);


    %% Aprendizado
    
    [temp, num_atributos] = size(dados_tre);
    num_atributos = num_atributos - 1;
    
    x = dados_tre(:,1:num_atributos);
    d = dados_tre(:,num_atributos+1:end);
    
    w = ((inv(x' * x)) * x') * d;
    %w = (x' * x)\(x' * d);
    
    %% Teste
    
    erro_q = 0;
    for k = 1:length(dados_test)
   
       x = dados_test(k,1:num_atributos);
       u = x * w;
       
       y = u;

       d = dados_test(k,num_atributos+1:end);
       erro = d - y;

       erro_q = erro_q + erro^2;

    end
    
    erro_q_medio = erro_q / length(dados_test);
    
    rmse(i) = sqrt(erro_q_medio);

end

fprintf('Média do RMSE: %f\n', mean(rmse));
fprintf('Desvio Padrão do RMSE: %f\n', std(rmse));

%% Plotagem


reta = w(2)*dados(:,2) - w(1);

figure
hold on
grid on

plot(dados(:,2), dados(:,3), '.', 'Color', [.1 .4 .6], 'DisplayName', 'Amostras')
plot(dados(:,2),reta, '.', 'Color', [0 0 0], 'DisplayName', 'Reta Obtida')
%title('Resultado do Adaline')
xlabel('x')
ylabel('f(x)')

legend show
hold off

