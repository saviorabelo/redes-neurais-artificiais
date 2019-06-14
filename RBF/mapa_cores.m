function [] = mapa_cores(dados, n , w1, w2, tipo)

cor1 = [];
cor2 = [];
cor3 = [];
i = 1;
j = 1;
k = 1;
for aux1 = 0:0.005:1
    for aux2 = 0:0.005:1
        
        x = [-1 aux1 aux2];
        
        I1 = x * w1';
        if(tipo == -1)
            Y1 = tangente(I1);
        else
            Y1 = logistica(I1);
        end

        %
        Y1 = [-1 Y1]; %Coloca o -1(Bias)
        I2 = Y1 * w2';
        if(tipo == -1)
            Y2 = tangente(I2);
            y = ativacaoTangente(Y2);
        else
            Y2 = logistica(I2);
            y = ativacaoLogistica(Y2);
        end
        
        p = [aux1 aux2];

        if isequal(y, [1 tipo tipo])
            cor1(i,:) = p;
            i = i + 1;
        elseif isequal(y, [tipo 1 tipo])
            cor2(j,:) = p;
            j = j + 1;
        elseif isequal(y, [tipo tipo 1])
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