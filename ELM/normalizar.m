function [dados_normal] = normalizar(dados, num_atributos)
    
    dados_normal = dados;

    [a,b] = size(dados);
    dados(:,1:num_atributos);

    n = size(dados, 1);
    menor = repmat(min(dados(:,1:num_atributos)), n, 1);
    maior = repmat(max(dados(:,1:num_atributos)), n, 1);
    dados_normal(:,1:num_atributos)  = (dados(:,1:num_atributos) - menor) ./ (maior - menor);

end

