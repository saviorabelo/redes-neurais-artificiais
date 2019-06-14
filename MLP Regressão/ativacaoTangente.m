function aux = ativacaoTangente(u)

    %[a,b] = size(u);
    %aux = ones(1,b);
    %aux(u<0) = -1;
    
    [x,y] = size(u);
    [~, i] = max(u);
    aux = -1*ones(x, y);
    aux(i) = 1;

end