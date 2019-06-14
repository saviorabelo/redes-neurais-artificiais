function acerto = teste(dados_test, tipo, W, M, num_classes)
%tipo == 0 -> [1 0 0] Logistica
%tipo == -1 -> [1 -1 -1] Tangente

[temp, num_atributos] = size(dados_test);
num_atributos = num_atributos - num_classes;

x = dados_test(:,1:num_atributos);
d = dados_test(:,num_atributos+1:end);
        
%
H = x * W';
if(tipo == -1)
    H = tangente(H);
else
    H = logistica(H);
end

H = [-ones(length(H),1) H];

Y = H * M;

if(tipo == -1)
    Y = ativacaoTangente(Y);
else
    Y = ativacaoLogistica(Y);
end

erro = Y - d;

contador = 0;
for k = 1:length(dados_test)
    if(erro(k,:) == zeros(1, num_classes))
       contador = contador + 1;
   end
end

acerto = (contador/length(dados_test))*100;

end