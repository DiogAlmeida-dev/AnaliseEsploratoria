#Carregando pacotes 
library(tidyverse)
library(readxl)
library(naniar)

#Lendo base 
base <- read_excel("Base_trabalho.xlsx")
dicionario <- read_excel("dicionario_Base_trabalho.xlsx")

#Transformando variaveis qualitativas em fatores 
base2 = base %>% 
  mutate(
    filhos = ifelse(filhos == 1, "Sim", "Nao"),
    casado = ifelse(casado == 1, "Sim", "Nao"),
    reincidente = ifelse(reincidente == 1, "Sim", "Nao"),
    sexo = ifelse(sexo == 1, "Masculino", "Feminino"),
    escolaridade = ifelse(escolaridade == 1, "Fundamental", ifelse(escolaridade == 2, "Medio", "Superior")),
  )


#Verificando existencia de dados faltantes 
View(miss_var_summary(base2))
#Nao existe dados faltantes na base 

path = "/home/aluno/Área de Trabalho/AnaliseEsploratoria/Graficos"

#Histograma da variavel idade 
histograma_idade = hist(base2$idade,
     main = "Histograma Variável Idade",
     xlab = "Idade", 
     ylab = "Frequência")




 #Box plot da variavel tempo_preso
boxplot(base2$tempo_preso, 
        main = "Tempo Preso",
         ylab = "Meses")

#Box plot da variavel score_periculosidade
boxplot(base2$score_periculosidade,
        main = "Score Periculosidade")

#Grafico de barras variavel reincidente 
table(base2$reincidente)
freq = table(base2$reincidente)

barplot(freq, 
        main = "Reincidente",
        ylab = "Frequência")



