function [W, M] = treinamento(dados_tre, tipo, q, num_classes)
%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente

[n, num_atributos] = size(dados_tre);
num_atributos = num_atributos - num_classes;

%Camada oculta
W = rand(q, num_atributos);

x = dados_tre(:,1:num_atributos);
d = dados_tre(:,num_atributos+1:end);

%
H = x * W';
if(tipo == -1)
    H = tangente(H);
else
    H = logistica(H);
end

%
H = [-ones(length(H),1) H];

M = pinv(H) * d;

end