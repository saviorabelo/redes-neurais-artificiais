%https://www.mathworks.com/help/matlab/ref/linespec.html
%[.5 0.9 0.94] azul claro
clc;
close all;
clearvars;

aux = 1:10;

nome_arquivo = 'iris.dat';
num_atributos = 4;

atributo = 'Iris-setosa';
for i = 1:10
   [acuracia, desv_padrao] = perceptron(aux(i), atributo, nome_arquivo, num_atributos);
   acur1(i) =  acuracia;
   desv1(i) = desv_padrao;
end

atributo = 'Iris-versicolor';
for i = 1:10
   [acuracia, desv_padrao] = perceptron(aux(i), atributo, nome_arquivo, num_atributos);
   acur2(i) =  acuracia;
   desv2(i) = desv_padrao;
end

atributo = 'Iris-virginica';
for i = 1:10
   [acuracia, desv_padrao] = perceptron(aux(i), atributo, nome_arquivo, num_atributos);
   acur3(i) =  acuracia;
   desv3(i) = desv_padrao;
end

% nome_arquivo = 'column_2C.dat';
% num_atributos = 6;
% 
% atributo = 'NO';
% for i = 1:10
%    [acuracia, desv_padrao] = perceptron(aux(i), atributo, nome_arquivo, num_atributos);
%    acur4(i) =  acuracia;
%    desv4(i) = desv_padrao;
% end
% 
% atributo = 'AB';
% for i = 1:10
%    [acuracia, desv_padrao] = perceptron(aux(i), atributo, nome_arquivo, num_atributos);
%    acur5(i) =  acuracia;
%    desv5(i) = desv_padrao;
% end

%% Plotagem Acurácia Íris

hold on

plot(aux,acur1,'-d','Color', [0.00 0.45 0.74],'DisplayName', 'Iris-setosa')
plot(aux,acur2,'-.s','Color', [.5 0.45 0.74],'DisplayName', 'Iris-versicolor')
plot(aux,acur3,':o','Color', [0 0 0],'DisplayName', 'Iris-virginica')

xlabel('Realizações')
ylabel('Acurácia')
%title('Íris')

legend show
pause(0.05)
hold off

% %% Plotagem Desvio padrão Íris
% 
% desvios = [mean(desv1), mean(desv2), mean(desv3)];
% banco_dados = {'Iris-setosa', 'Iris-versicolor','Iris-virginica'};
% 
% hold on
% 
% bar(desvios,0.5,'FaceColor',[.5 0.45 0.74])
% 
% title('Desvio Padrão')
% xlabel('Conjunto de Dados')
% ylabel('Valores')
% set(gca, 'XTick', 1:length(banco_dados))
% set(gca, 'XTickLabel', banco_dados)
% 
% pause(0.05)
% hold off
% %% Plotagem Acurácia Coluna Vertebral
% 
% hold on
% 
% plot(aux,acur4,'-.s','Color', [.5 0.45 0.74],'DisplayName', 'Normal')
% plot(aux,acur5,':o','Color', [0 0 0],'DisplayName', 'Anormal')
% 
% xlabel('Realizações')
% ylabel('Acurácia')
% title('Coluna Vertebral')
% 
% legend show
% hold off
% 
% %% Plotagem Desvio padrão Coluna Vertebral
% 
% desvios = [mean(desv4), mean(desv5)];
% banco_dados = {'Normal', 'Anormal'};
% 
% hold on
% 
% bar(desvios,0.5,'FaceColor',[.5 0.45 0.74])
% 
% title('Desvio Padrão')
% xlabel('Conjunto de Dados')
% ylabel('Valores')
% set(gca, 'XTick', 1:length(banco_dados))
% set(gca, 'XTickLabel', banco_dados)
% 
% pause(0.05)
% hold off

