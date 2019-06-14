function [W, c] = treinamentoRegressao(dados_tre, n_centros, num_classes, abertura)
%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente

[n, num_atributos] = size(dados_tre);
num_atributos = num_atributos - num_classes;

c = rand(1, n_centros);

x = dados_tre(:,1:num_atributos);
d = dados_tre(:,num_atributos+1:end);

for i = 1:n
    H(i,:) = saidas_centro(x(i,:), c, abertura);
end

%
H = [-ones(n,1) H];
W = pinv(H) * d;

end