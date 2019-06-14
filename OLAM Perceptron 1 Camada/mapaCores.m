function [] = mapaCores(dados, n , w)

cor1 = [];
cor2 = [];
cor3 = [];
i = 1;
j = 1;
k = 1;
for aux1 = 0:0.005:1
    for aux2 = 0:0.005:1
        u = w * [-1; aux1; aux2];
        u = logsig(u);
        u = ativacao(u);
        p = [aux1 aux2];

        if isequal(u', [1 0 0])
            cor1(i,:) = p;
            i = i + 1;
        elseif isequal(u', [0 1 0])
            cor2(j,:) = p;
            j = j + 1;
        elseif isequal(u', [0 0 1])
            cor3(k,:) = p;
            k = k + 1;
        else
            fprintf('ERRO!')
        end
    end
end

figure(1)
hold on

axis([0 1 0 1])

plot(cor1(:,1), cor1(:,2), '.', 'Color', [0.95 0.87 0.73], 'LineStyle', '-', 'LineWidth', 3.0, 'HandleVisibility', 'off')
plot(cor2(:,1), cor2(:,2), '.', 'Color', [0.80 0.88 0.97], 'LineStyle', '-', 'LineWidth', 3.0, 'HandleVisibility', 'off')
plot(cor3(:,1), cor3(:,2), '.', 'Color', [0.80 0.80 0.80], 'LineStyle', '-', 'LineWidth', 3.0, 'HandleVisibility', 'off')

plot(dados(1:n,2), dados(1:n,3), '*', 'Color', [0.60 0.20 0.00], 'DisplayName', 'Classe 1')
plot(dados(n+1:2*n,2), dados(n+1:2*n,3), '*', 'Color', [0.00 0.45 0.74], 'DisplayName', 'Classe 2')
plot(dados(2*n+1:3*n,2), dados(2*n+1:3*n,3), '*', 'Color', [0.31 0.31 0.31], 'DisplayName', 'Classe 3')

title('Mapa de Cores')
xlabel('Eixo x')
ylabel('Eixo y')
legend show
pause(0.05)
hold off



figure(2)
hold on

axis([0 1 0 1])

plot(dados(1:n,2), dados(1:n,3), '*', 'Color', [0.60 0.20 0.00], 'DisplayName', 'Classe 1')
plot(dados(n+1:2*n,2), dados(n+1:2*n,3), '*', 'Color', [0.00 0.45 0.74], 'DisplayName', 'Classe 2')
plot(dados(2*n+1:3*n,2), dados(2*n+1:3*n,3), '*', 'Color', [0.31 0.31 0.31], 'DisplayName', 'Classe 3')

title('Distribuição das Classes')
xlabel('Eixo x')
ylabel('Eixo y')
legend show
pause(0.05)
hold off
end