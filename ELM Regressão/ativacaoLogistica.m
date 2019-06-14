function aux = ativacaoLogistica(u)

%     [a,b] = size(u);
%     aux = ones(1,b);
%     aux(u<0.5) = 0;
    
    [x,y] = size(u);
    [~, i] = max(u);
    aux = zeros(x, y);
    aux(i) = 1;

end