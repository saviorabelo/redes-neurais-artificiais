function aux = logistica(u)

    [m, n] = size(u);
    
    for i = 1:m
        for j = 1:n
            aux(i,j) = 1/(1+exp(-u(i,j)));
        end
    end

end