function [dados_normal] = normalizar(dados)
    
    dados_normal = dados;

    [a,b] = size(dados);
    dados(:,1:b-3);

    n = size(dados, 1);
    menor = repmat(min(dados(:,1:b-3)), n, 1);
    maior = repmat(max(dados(:,1:b-3)), n, 1);
    dados_normal(:,1:b-3)  = (dados(:,1:b-3) - menor) ./ (maior - menor);

end

