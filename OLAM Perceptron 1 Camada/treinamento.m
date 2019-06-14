function [w] = treinamento(dados_tre, eta, n_epocas, tipo)
%tipo == 0 -> [1 0 0] Logistica
%tipo == 1 -> [1 -1 -1] Tangente


[temp, num_atributos] = size(dados_tre);
num_atributos = num_atributos - 3;

%Vetor de pesos em um intervalo uniforme entre -0.5 e 0.5
a = -0.5;
b = 0.5;
w1 = ((b-a).*rand(num_atributos, 1) + a)';
w2 = ((b-a).*rand(num_atributos, 1) + a)';
w3 = ((b-a).*rand(num_atributos, 1) + a)';
w = [w1; w2; w3];

cont = 0;
%Épocas
while(cont < n_epocas)

    %Embaralhar a cada época
    [dados_tre] = embaralhar_dados(dados_tre);

    for j = 1:length(dados_tre)
        
        x = dados_tre(j,1:num_atributos);
        u = x * w';
        d = dados_tre(j,num_atributos+1:end);
        
        if(tipo == -1)
            y = tangente(u);
            y_linha = 0.5*(1 - y.^2);
        else
            y = logistica(u);
            y_linha = y .* (1 - y);
        end
        
        erro = d - y;
        w = w + (((eta * erro') .* y_linha').* x);
            
    end
    
    cont = cont + 1;

end

end