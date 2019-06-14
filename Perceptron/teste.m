function acerto = teste(dados_test, num_atributos, w)

contador = 0;
matriz_confusao = [0 0; 0 0];
for k = 1:length(dados_test)
    
    
   u = dados_test(k,1:num_atributos) * w';
   y = degrau(u);
   aux = dados_test(k, num_atributos+1);
   erro = aux - y;
   %Matriz de confusão
   matriz_confusao(aux+1,y+1) = matriz_confusao(aux+1,y+1) + 1;

   if erro == 0
       contador = contador + 1;
   end
    
end
matriz_confusao;
acerto = (contador/length(dados_test))*100;

end