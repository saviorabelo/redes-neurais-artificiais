function [melhor_eta, melhor_q] = busca_em_grade(dados, n_epocas, tipo, precisao, num_classes)

n = length(dados);
eta = [0.04:0.01:0.1];
q = [2:1:10];
grade = [];


k = 5;
fatia = n/k;

for j = 1:length(q)
    for l = 1:length(eta)
        
        % Validação cruzada
        for i = 1:k
            %Intervalo do conjunto de teste
            a = (i-1)*fatia+1;
            b = i*fatia;

            dados_test = dados(a:b,:);

            dados_tre = [dados(1:a-1,:) ; dados(b+1:n,:)];

            [w1, w2] = treinamento(dados_tre, eta(l), n_epocas, tipo, q(j), precisao, num_classes);
            acerto = teste(dados_test, tipo, w1, w2, num_classes);

            taxa_acerto(i) = acerto;
        end
        acuracia = mean(taxa_acerto);
        
        grade(j,l) = acuracia;
    end
end

%Índice do maior elemmento
[M, I] = max(grade(:));
[I_row, I_col] = ind2sub(length(grade), I);

melhor_eta = eta(I_col);
melhor_q = q(I_row);

end