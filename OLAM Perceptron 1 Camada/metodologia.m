%% Configurando MATLAB

clc;
close all;
clearvars;

%% Atribuir os parâmetros e base de dados

porc_divisao = 80;
n_realizacoes = 20;
tipo = -1;

n = 100; %Número de padrões
%dados = dadosArtificial(n, tipo);
%dados = dadosIris(tipo);
dados = dadosColuna(tipo);
n_classes = 3;

%% Realizações

for i = 1:n_realizacoes
    %% Divisão dos dados
    
    dados_aux = embaralhar_dados(dados);
    
    %Divide os dados em treino e teste
    [dados_tre, dados_test] = divisao_dados(dados_aux, porc_divisao);
    
    %% Aprendizado
    
    [temp, num_atributos] = size(dados_tre);
    num_atributos = num_atributos - n_classes;
    
    x = dados_tre(:,1:num_atributos);
    d = dados_tre(:,num_atributos+1:end);
    
    w = ((inv(x'*x)) * x') * d;
    
    %% Teste
    
    contador = 0;
    for k = 1:length(dados_test)
   
       x = dados_test(k,1:num_atributos);
       u = x * w;
       
       if(tipo == -1)
            aux = tangente(u);
            y = ativacaoTangente(aux);  
        else
            aux = logistica(u);
            y = ativacaoLogistica(aux);
       end

        %y = ativacao(u);

       d = dados_test(k,num_atributos+1:end);
       erro = d - y;

       if isequal(erro, zeros(1,n_classes))
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

%mapaCores(dados, n, w);