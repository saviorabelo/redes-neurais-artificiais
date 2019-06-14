function [dados] = rotulo_classes(dados, classes, tipo)
%tipo == 0 -> [1 0 0] Logistica
%tipo == 1 -> [1 -1 -1] Tangente

    tmp_classes = unique(classes);
    
    k = size(tmp_classes, 1);

    i = size(dados,2);
    label_vector = (i+1):(i+k);

    for j = 1 : k
        class_i = strcmp(classes, tmp_classes(j));
        dados(class_i, label_vector(j)) = 1;
    end
    
    if(tipo == -1)
        dados(dados == 0) = -1;
    end
   
end

