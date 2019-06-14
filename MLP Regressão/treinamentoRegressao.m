function [W, M, vetor_erros] = treinamentoRegressao(dados_tre, eta, n_epocas, tipo, q, precisao, num_classes)
%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente

[temp, num_atributos] = size(dados_tre);
num_atributos = num_atributos - num_classes;

%Camada oculta
W = rand(q, num_atributos);

%Camada de sa�da
M = rand(num_classes, q+1);

vetor_erros = [];
cont_epocas = 1;
erro_velho = 0;
%�pocas
while(true)

    %Embaralhar a cada �poca
    [dados_tre] = embaralhar_dados(dados_tre);
    
    %Erro quadr�tico para a �poca
    erro_q = 0;

    for j = 1:length(dados_tre)
        
        x = dados_tre(j,1:num_atributos); %Padr�o da rede
        
        %
        H = x * W';
        if(tipo == -1)
            H = tangente(H);
            y_linha1 = 0.5*(1 - H.^2);
        else
            H = logistica(H);
            y_linha1 = H .* (1 - H);
        end
          
        %
        H = [-1 H]; %Coloca o -1(Bias)
        Y = H * M';      

        %C�lculo do erro quadr�tico
        d = dados_tre(j,num_atributos+1:end); %Valor esperado
        erro = d - Y;
        erro_q = erro_q + sum(erro .^ 2);
        
        %Camada de sa�da
        delta2 = (erro);
        M = M + ((eta * delta2)' .* H);
        
        %Camada oculta
        delta1 = sum(delta2 * M) * y_linha1;
        W = W + ((eta * delta1)' .* x);        
            
    end
    
    erro_q_medio = erro_q / length(dados_tre);
    
    % Armazena o erro quadr�tico acumulado para cada �poca
    vetor_erros = [vetor_erros; erro_q_medio];
    
    if ((abs(erro_q - erro_velho) <= precisao) || (cont_epocas >= n_epocas))
        if((abs(erro_q - erro_velho) <= precisao))
            fprintf('\nParada pela precis�o!\n')
        else
            fprintf('\nParada pela �poca!\n')
        end
        break;
    end

    erro_velho = erro_q;
    
    cont_epocas = cont_epocas + 1;

end

end