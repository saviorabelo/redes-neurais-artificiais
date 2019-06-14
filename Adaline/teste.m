function erro_q_medio = teste(dados_teste, w)

    [m,n] = size(dados_teste);
    num_atributos  = n - 1;
    erro_q = 0;

    for j = 1:length(dados_teste)

        u = dados_teste(j,1:num_atributos) * w';

        d = dados_teste(j,num_atributos+1);

        erro = d - u;

        erro_q = erro_q + erro^2;

    end
    
    erro_q_medio = erro_q / length(dados_teste);


end