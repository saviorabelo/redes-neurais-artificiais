function erro_q_medio = teste(dados_test, tipo, w1, w2, num_classes)
%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente

[temp, num_atributos] = size(dados_test);
num_atributos = num_atributos - num_classes;

erro_q = 0;

for k = 1:length(dados_test)
    
    %
    x = dados_test(k,1:num_atributos);
    
    %
    I1 = x * w1';
    if(tipo == -1)
        Y1 = tangente(I1);
    else
        Y1 = logistica(I1);
    end

    %
    Y1 = [-1 Y1]; %Coloca o -1(Bias)
    y = Y1 * w2';
    
    d = dados_test(k,num_atributos+1:end);
    erro = d - y;
    
    erro_q = erro_q + erro^2;
    
end

erro_q_medio = erro_q / length(dados_test);

end