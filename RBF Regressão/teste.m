function erro_q_medio = teste(dados_test, W, c, num_classes, abertura)

[n, num_atributos] = size(dados_test);
num_atributos = num_atributos - num_classes;

erro_q = 0;

for k = 1:length(dados_test)
    
    x = dados_test(k,1:num_atributos);

    H = saidas_centro(x, c, abertura);

    H = [-1 H];

    Y = H * W;
    
    d = dados_test(k,num_atributos+1:end);
    erro = d - Y;
    
    erro_q = erro_q + erro^2;
    
end

erro_q_medio = erro_q / length(dados_test);

end