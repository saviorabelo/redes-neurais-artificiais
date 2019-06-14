function acerto = teste(dados_test, w, tipo)
%tipo == 0 -> [1 0 0] Logistica
%tipo == 1 -> [1 -1 -1] Tangente

[temp, num_atributos] = size(dados_test);
num_atributos = num_atributos - 3;

contador = 0;

for k = 1:length(dados_test)
   
   x = dados_test(k,1:num_atributos);
   u = x * w';
      
    y = ativacao(u);
   
   d = dados_test(k,num_atributos+1:end);
   erro = d - y;

   if isequal(erro, [0 0 0])
       contador = contador + 1;
   end
    
end

acerto = (contador/length(dados_test))*100;

end