function dados = carrega_dados(nome_arquivo, num_atributos, tipo)

%Importa os dados
[dados, classe] = leitura_arquivo(nome_arquivo, num_atributos);

[dados] = rotulo_classes(dados, classe, tipo);
 
%Normaliza os dados
dados = normalizar(dados, num_atributos);
 
%Vetor de -1's para ficar na primeira posicao dos vetores de entrada
vetor_ones = -1 * ones(length(dados),1);

%Novo vetor de dados com -1's
dados = [vetor_ones dados];

end