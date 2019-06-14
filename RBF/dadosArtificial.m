function [dados] = dadosArtificial(n)

%Padrão 1
x1 = ((0.4-0.2).*rand(n, 1) + 0.2);
y1 = ((0.4-0.2).*rand(n, 1) + 0.2);

%Padrão 2
x2 = ((0.6-0.4).*rand(n, 1) + 0.4);
y2 = ((0.8-0.6).*rand(n, 1) + 0.6);

%Padrão 3
x3 = ((0.9-0.7).*rand(n, 1) + 0.7);
y3 = ((0.4-0.2).*rand(n, 1) + 0.2);

%Matriz de dados gerada artificial

% if(tipo == -1)
%     dados = [-ones(n,1) x1 y1 [1 -1 -1].*ones(n,1); ...
%         -ones(n,1) x2 y2 [-1 1 -1].*ones(n,1); ...
%         -ones(n,1) x3 y3 [-1 -1 1].*ones(n,1)];
% else
%     dados = [-ones(n,1) x1 y1 [1 0 0].*ones(n,1); ...
%         -ones(n,1) x2 y2 [0 1 0].*ones(n,1); ...
%         -ones(n,1) x3 y3 [0 0 1].*ones(n,1)];
% end

dados = [x1 y1 [1 0 0].*ones(n,1); ...
    x2 y2 [0 1 0].*ones(n,1); ...
    x3 y3 [0 0 1].*ones(n,1)];

end