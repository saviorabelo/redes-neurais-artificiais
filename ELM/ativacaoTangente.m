function m = ativacaoTangente(matriz)

for j = 1:length(matriz)
    
    u = matriz(j,:);
    
    [x,y] = size(u);
    [~, i] = max(u);
    aux = -ones(x, y);
    aux(i) = 1;
    
    m(j,:) = aux;
    
end

end