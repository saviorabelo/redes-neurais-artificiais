function aux = logistica(u)

    for i = 1:length(u)
        aux(i) = 1/(1+exp(-u(i)));
    end


end