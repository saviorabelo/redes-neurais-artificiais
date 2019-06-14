function acerto = teste(dados_test, tipo, w1, w2, num_classes)
%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente

[temp, num_atributos] = size(dados_test);
num_atributos = num_atributos - num_classes;

contador = 0;

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
    I2 = Y1 * w2';
    if(tipo == -1)
        Y2 = tangente(I2);
        y = ativacaoTangente(Y2);
    else
        Y2 = logistica(I2);
        y = ativacaoLogistica(Y2);
    end
    
    d = dados_test(k,num_atributos+1:end);
    erro = d - y;
    
    %
    if isequal(erro, zeros(1,num_classes))
        contador = contador + 1;
    end
    
end

acerto = (contador/length(dados_test))*100;

end