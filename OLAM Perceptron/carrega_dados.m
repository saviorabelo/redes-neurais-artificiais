function dados = carrega_dados(nome_arquivo, num_atributos, atributo)

%Importa os dados
[dados, classe] = leitura_arquivo(nome_arquivo, num_atributos);

%Substituindo Iris-setosa por 1 e o resto por 0
for i = 1:length(classe)
    if strcmp(classe(i), atributo)
        classe_binaria(i,:) = 1;
    else
        classe_binaria(i,:) = 0;
    end
end

%Concatena para ficar as classes em dados
dados = [dados classe_binaria];

%Vetor de -1's para ficar na primeira posicao dos vetores de entrada
vetor_ones = -1 * ones(length(dados),1);
 
%Incrementa por adicionar outra coluna
%num_atributos = num_atributos + 1;
 
%Normaliza os dados
dados = normalizar(dados);
 
%Novo vetor de dados com -1's
dados = [vetor_ones dados];

end