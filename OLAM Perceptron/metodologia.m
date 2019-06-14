%% Configurando MATLAB

clc;
close all;
clearvars;
format LONG;

%% Atribuir os parâmetros

porc_divisao = 80;
n_realizacoes = 20;

%% Escolha da base de dados

%dados = dadosIris();
%dados = dadosColuna();
dados = dadosArtificial(100);


%% Realizações

for i = 1:n_realizacoes
    %% Divisão dos dados
    
    dados_aux = embaralhar_dados(dados);
    
    %Divide os dados em treino e teste
    [dados_tre, dados_test] = divisao_dados(dados_aux, porc_divisao);
    
    %% Aprendizado
    
    [temp, num_atributos] = size(dados_tre);
    num_atributos = num_atributos - 1;
    
    x = dados_tre(:,1:num_atributos);
    d = dados_tre(:,num_atributos+1:end);
    
    %w = ((inv(x' * x)) * x') * d;
    w = (x' * x)\(x' * d);
    
    %% Teste
    
    contador = 0;
    for k = 1:length(dados_test)
   
       x = dados_test(k,1:num_atributos);
       u = x * w;
       
       y = degrau(u);

       d = dados_test(k,num_atributos+1:end);
       erro = d - y;

       if erro == 0
           contador = contador + 1;
       end

    end
    
    acerto = (contador/length(dados_test))*100;
    
    taxa_acerto(i) = acerto;

end

%% Resultados

%Média do acertos
acuracia = mean(taxa_acerto)
desv_padrao = std(taxa_acerto)
