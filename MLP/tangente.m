function aux = tangente(u)
    
    for i = 1:length(u)
        aux(i) = (1-exp(-u(i)))/(1+exp(-u(i)));
    end

end