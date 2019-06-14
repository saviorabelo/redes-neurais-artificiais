function [W, c] = treinamento(dados_tre, n_centros, num_classes, abertura)
%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente

[n, num_atributos] = size(dados_tre);
num_atributos = num_atributos - num_classes;

x = dados_tre(:,1:num_atributos);
d = dados_tre(:,num_atributos+1:end);

% c = rand(1, n_centros);
% for i = 1:n
%     H(i,:) = saidas_centro(x(i,:), c, abertura);
% end

c = rand(n_centros, num_atributos);
for i = 1:n
    for j = 1:n_centros
        H(i,j) = saidas_centro(x(i,:), c(j,:), abertura);
    end
end

H = [-ones(length(H),1) H];
W = pinv(H) * d;

end