function dados = dadosArtificial(n)

%% Gera a base de dados aleat�ria
%n = 100;

%Padr�o 1
a1 = 0.01;
b1 = 0.49;
y1 = ((b1-a1).*rand(n, 1) + a1);
x1 = ((b1-a1).*rand(n, 1) + a1);

%Padr�o 2
a2 = 0.51;
b2 = 0.99;
y2 = ((b2-a2).*rand(n, 1) + a2);
x2 = ((b2-a2).*rand(n, 1) + a2);

%Matriz de dados gerada eleat�ria
dados = [-ones(n,1) y1 x1 ones(n,1); -ones(n,1) y2 x2 zeros(n,1)];
%dados = [y1 x1 ones(n,1); y2 x2 zeros(n,1)];

 
end


