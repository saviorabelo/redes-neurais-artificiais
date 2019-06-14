function [w,matriz_confusao] = aprendizado(dados_tre, num_atributos, eta, n_epocas)

%Vetor de pesos em um intervalo uniforme entre -0.5 e 0.5
a = -0.5;
b = 0.5;
w = ((b-a).*rand(num_atributos, 1) + a)';

cont = 0;
erro_parada = 1;

matriz_confusao = [0 0; 0 0];

%Épocas
while(erro_parada == 1 && cont < n_epocas)

    %Embaralhar a cada época
    [dados_tre] = embaralhar_dados(dados_tre);

    erro_parada = 0;

    for j = 1:length(dados_tre)

        u = dados_tre(j,1:num_atributos) * w';
        y = degrau(u);
        aux = dados_tre(j,num_atributos+1);
        erro = aux - y;
        w = w + (eta * erro) * dados_tre(j, 1:num_atributos);
        
        matriz_confusao(aux+1,y+1) = matriz_confusao(aux+1,y+1) + 1;
        
        
        if erro ~= 0
            erro_parada = 1;
        end
    end
    cont = cont + 1;
    matriz_confusao;
end

end