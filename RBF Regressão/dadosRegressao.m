function dados = dadosRegressao(n)

%% Gera a base de dados

% X = linspace(0,10,n)';
% desvio = 0.2;
% ruido = desvio * randn(n,1);
% Y = sin(X) + ruido;

% X = linspace(0,10,n)';
% desvio = 3;
% ruido = desvio * randn(n,1);
% Y = X .* X -4 * X + 4 + ruido;

X = linspace(-5,5,n)';
desvio = 0.2;
ruido = desvio * randn(n,1);
Y = tanh(X) + ruido;


dados = [X Y];
dados = normalizar(dados, 2);
%dados = [-ones(n,1) dados];

% figure
% hold on
% 
% plot(X, Y - ruido, '.', 'Color', [.1 .4 .6], 'DisplayName', 'Fun��o do 2� Grau')
% xlabel('x')
% ylabel('f(x)')
% %title('Fun��o Original')
% grid on
% 
% legend show
% hold off

end