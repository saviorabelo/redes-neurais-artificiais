%https://www.mathworks.com/help/matlab/ref/linespec.html
%[.5 0.9 0.94] azul claro
clc;
close all;
clearvars;

aux = 1:10;

nome_arquivo = 'iris.dat';
num_atributos = 4;
for i = 1:10
   [acuracia, desv_padrao] = metodologia(nome_arquivo, num_atributos, i);
   acur1(i) =  acuracia;
   desv1(i) = desv_padrao;
end

nome_arquivo = 'column_3C.dat';
num_atributos = 6;
for i = 1:10
   [acuracia, desv_padrao] = metodologia(nome_arquivo, num_atributos, i);
   acur2(i) =  acuracia;
   desv2(i) = desv_padrao;
end

acur3 = 100*ones(length(aux),1)';
desv3 = zeros(length(aux),1)';

%% Plotagem Acurácia

figure(1)
hold on

plot(aux,acur1,'-*','Color', [0.60 0.20 0.00],'DisplayName', 'Iris')
plot(aux,acur2,'-d','Color', [0.00 0.45 0.74],'DisplayName', 'Coluna')
plot(aux,acur3,'-o','Color', [0.31 0.31 0.31],'DisplayName', 'Artificial')

xlabel('Realizações')
ylabel('Acurácia')
title('Base de Dados')

legend show
pause(0.05)
hold off

%% Plotagem Desvio Padrão

figure(2)
desvios = [mean(desv1), mean(desv2), mean(desv3)];
banco_dados = {'Iris', 'Coluna', 'Artificial'};

hold on

bar(desvios,0.5,'FaceColor',[.5 0.45 0.74])

title('Desvio Padrão')
xlabel('Conjunto de Dados')
ylabel('Valores')
set(gca, 'XTick', 1:length(banco_dados))
set(gca, 'XTickLabel', banco_dados)

pause(0.05)
hold off

mean(acur1)
mean(acur2)
mean(acur3)

mean(desv1)
mean(desv2)
mean(desv3)


