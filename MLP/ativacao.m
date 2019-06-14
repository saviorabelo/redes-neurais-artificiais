function aux = ativacao(u)

    [x,y] = size(u);

    [~, i] = max(u);
    aux = zeros(x, y);
    aux(i) = 1;

end