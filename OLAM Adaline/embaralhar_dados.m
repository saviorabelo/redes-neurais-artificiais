function [dados] = embaralhar_dados(dados)

    n = length(dados);
    aux = randperm(n);
    dados = dados(aux, :);

end
