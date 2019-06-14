function desv_padrao = desvio_padrao(taxa_acerto)

acuracia = mean(taxa_acerto);

%Variância
variancia = 0;  
for i = 1:length(taxa_acerto)
  variancia = variancia + (taxa_acerto(i) - acuracia)^2;
end
variancia = variancia/(length(taxa_acerto)-1);

desv_padrao = sqrt(variancia);

end