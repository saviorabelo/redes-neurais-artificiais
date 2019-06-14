function acerto = teste(dados_test, W, c, num_classes, abertura, n_centros)

[n, num_atributos] = size(dados_test);
num_atributos = num_atributos - num_classes;

x = dados_test(:,1:num_atributos);
d = dados_test(:,num_atributos+1:end);

for i = 1:n
    for j = 1:n_centros
        H(i,j) = saidas_centro(x(i,:), c(j,:), abertura);
    end
end

H = [-ones(n,1) H];

Y = H * W;

Y = ativacao(Y);

erro = Y - d;

contador = 0;
for k = 1:length(dados_test)
    if(erro(k,:) == zeros(1, num_classes))
       contador = contador + 1;
   end
end

acerto = (contador/length(dados_test))*100;

end