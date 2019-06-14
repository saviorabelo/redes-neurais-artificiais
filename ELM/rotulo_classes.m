function [dados] = rotulo_classes(dados, classes, tipo)
%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente


    tmp_classes = unique(classes);
    
    k = size(tmp_classes, 1);

    i = size(dados,2);
    label_vector = (i+1):(i+k);

    for j = 1 : k
        class_i = strcmp(classes, tmp_classes(j));
        dados(class_i, label_vector(j)) = 1;
    end
    
    [m,n] = size(dados);
    
    if(tipo == -1)
        for i = 1:m
            for j = 1:k
                if(dados(i,n-k+j)) == 0
                    dados(i,n-k+j) = -1;
                end
            end
        end
    end
  
end