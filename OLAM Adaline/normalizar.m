function [dados_normal] = normalizar(dados)

    n = size(dados, 1);
    menor = repmat(min(dados), n, 1);
    maior = repmat(max(dados), n, 1);
    dados_normal  = (dados - menor) ./ (maior - menor);

end

