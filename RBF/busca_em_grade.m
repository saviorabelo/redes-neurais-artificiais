function [melhor_n_centro, melhor_abertura] = busca_em_grade(dados, num_classes)

n = length(dados);
n_centros = [4:2:20];
abertura = [4:2:20];
grade = [];


k = 5;
fatia = n/k;

for j = 1:length(abertura)
    for l = 1:length(n_centros)
        
        % Validação cruzada
        for i = 1:k
            %Intervalo do conjunto de teste
            a = (i-1)*fatia+1;
            b = i*fatia;

            dados_test = dados(a:b,:);

            dados_tre = [dados(1:a-1,:) ; dados(b+1:n,:)];

            [W, c] = treinamento(dados_tre, n_centros(l), num_classes, abertura(j)); 
            acerto = teste(dados_test, W, c, num_classes, abertura(j), n_centros(l));

            taxa_acerto(i) = acerto;
        end
        acuracia = mean(taxa_acerto);
        
        grade(j,l) = acuracia;
    end
end

%Índice do maior elemmento
[M, I] = max(grade(:));
[I_row, I_col] = ind2sub(length(grade), I);

melhor_n_centro = abertura(I_col);
melhor_abertura = abertura(I_row);

end