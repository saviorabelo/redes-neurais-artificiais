function erro_q_medio = teste(dados_test, tipo, W, M, num_classes)

[n, num_atributos] = size(dados_test);
num_atributos = num_atributos - num_classes;

erro_q = 0;

for k = 1:length(dados_test)
    
    x = dados_test(k,1:num_atributos);
    
    %
    H = x * W';
    if(tipo == -1)
        H = tangente(H);
    else
        H = logistica(H);
    end

    H = [-1 H];

    Y = H * M;
    
    d = dados_test(k,num_atributos+1:end);
    erro = d - Y;
    
    erro_q = erro_q + erro^2;
    
end

erro_q_medio = erro_q / length(dados_test);

end