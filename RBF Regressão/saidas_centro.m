function [aux] = saidas_centro(x, c, abertura)

    for i = 1:length(c)
        aux(i) = exp(-0.5 * ((x - c(i)) * (x - c(i))') / (abertura.^2) );
    end
    
end