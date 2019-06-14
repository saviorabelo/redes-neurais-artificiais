clc;
close all;
clearvars;
%format LONG;
format short;

%% Gera a base de dados aleatória
n = 100;
num_atributos = 2;
eta = 0.1;
n_epocas = 50;
n_realizacoes = 1;

%Padrão 1
a1 = 0.01;
b1 = 0.49;
y1 = ((b1-a1).*rand(n, 1) + a1);
x1 = ((b1-a1).*rand(n, 1) + a1);

%Padrão 2
a2 = 0.51;
b2 = 0.99;
y2 = ((b2-a2).*rand(n, 1) + a2);
x2 = ((b2-a2).*rand(n, 1) + a2);

%Matriz de dados gerada eleatória
dados = [-ones(n,1) y1 x1 ones(n,1); -ones(n,1) y2 x2 zeros(n,1)];

%Incrementa por adicionar outra coluna
num_atributos = num_atributos + 1;
 

%% Aprendizado

w = aprendizado(dados, num_atributos, eta, n_epocas);

%% Plotagem

%Configurando a reta
theta = w(1);
w1 = w(2);
w2 = w(3);
x1 = linspace(0,1,10);
y1 = -(w1/w2)*x1 + (theta/w2);
%Reta
% hold on
% plot(x1,y1, 'Color', [0 0 0], 'DisplayName', 'Reta');
% hold off

%Mapa de cores
cor1 = [];
cor2 = [];
i = 1;
j = 1;
for x1 = 0:0.005:1
    for x2 = 0:0.005:1
        u = w * [-1; x1; x2];
        p = [x1 x2];

        if u >= 0
            cor1(i,:) = p;
            i = i + 1;
        
        elseif u < 0
            cor2(j,:) = p;
            j = j + 1;
        end
    end
end

figure
hold on

axis([0 1 0 1])

% %Cor da classe 1
% plot(cor1(:,1), cor1(:,2), '.', 'Color', [0 0.82 1], 'LineStyle', '-', 'LineWidth', 3.0, 'HandleVisibility', 'off')
% %Cor da classe 2
% plot(cor2(:,1), cor2(:,2), '.', 'Color', [0.15 0.71 0.55], 'LineStyle', '-', 'LineWidth', 3.0, 'HandleVisibility', 'off')
% %Cor dos pontos da classe 1
% plot(dados(1:n,2), dados(1:n,3), '*', 'Color', [0 0 0], 'DisplayName', 'Classe 1')
% %Cor dos pontos da classe 2
% plot(dados(n+1:end,2), dados(n+1:end,3), 'o', 'Color', [0 0 0], 'DisplayName', 'Classe 2')


plot(cor1(:,1), cor1(:,2), '.', 'Color', [0.80 0.80 0.80], 'LineStyle', '-', 'LineWidth', 3.0, 'HandleVisibility', 'off')
plot(cor2(:,1), cor2(:,2), '.', 'Color', [0.80 0.88 0.97], 'LineStyle', '-', 'LineWidth', 3.0, 'HandleVisibility', 'off')

plot(dados(1:n,2), dados(1:n,3), '*', 'Color', [0.31 0.31 0.31], 'DisplayName', 'Classe 1')
plot(dados(n+1:end,2), dados(n+1:end,3), 'o', 'Color', [0.00 0.45 0.74], 'DisplayName', 'Classe 2')

%plot(x1,y1, 'Color', [0 0 0], 'DisplayName', 'Reta');

title('Mapa de Cores')
xlabel('Eixo x')
ylabel('Eixo y')
legend show
pause(0.05)
hold off


