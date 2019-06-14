function [w,vetor_erros] = treinamento(dados_tre, eta, n_epocas, precisao)

[m,n] = size(dados_tre);
num_atributos  = n - 1;

%Vetor de pesos em um intervalo uniforme entre -0.5 e 0.5
a = -0.5;
b = 0.5;
w = ((b-a).*rand(num_atributos, 1) + a)';


cont_epocas = 1;
erro_velho = 0;
vetor_erros = [];

%Épocas
while(true)

    %Embaralhar a cada época
    [dados_tre] = embaralhar_dados(dados_tre);

    % Erro quadrático para a época
    erro_q = 0;
    
    for j = 1:length(dados_tre)

        u = dados_tre(j,1:num_atributos) * w';

        d = dados_tre(j,num_atributos+1);
        
        erro = d - u;
        
        delta = (eta * erro) * dados_tre(j, 1:num_atributos);
        
        w = w + delta;
        
        erro_q = erro_q + erro^2;
        
    end
    
    erro_q_medio = erro_q / length(dados_tre);
    
    % Armazena erro quadrático acumulado para cada época
    vetor_erros = [vetor_erros; erro_q_medio];
    
    if ((abs(erro_q - erro_velho) <= precisao) || (cont_epocas >= n_epocas))
%         if((abs(erro_q - erro_velho) <= precisao))
%             fprintf('\nParada pela precisão!\n')
%         else
%             fprintf('\nParada pela época!\n')
%         end
        break;
    end

    erro_velho = erro_q;
    
    cont_epocas = cont_epocas + 1;
end

end