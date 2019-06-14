function [melhor_q] = busca_em_grade(dados, tipo, num_classes)

n = length(dados);
q = [4:2:20];
grade = [];

k = 5;
fatia = n/k;

for j = 1:length(q)
    % Validação cruzada
    for i = 1:k
        %Intervalo do conjunto de teste
        a = (i-1)*fatia+1;
        b = i*fatia;

        dados_test = dados(a:b,:);

        dados_tre = [dados(1:a-1,:) ; dados(b+1:n,:)];

        [w1, w2] = treinamento(dados_tre, tipo, q(j), num_classes);  
        acerto = teste(dados_test, tipo, w1, w2, num_classes);

        taxa_acerto(i) = acerto;
    end
    acuracia = mean(taxa_acerto);

    grade(j) = acuracia;
end

%Índice do maior elemmento
[elemento, indice] = max(grade(:));

melhor_q = q(indice);

end