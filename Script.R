
setwd("C:\\Users\\felipe.DESKTOP-F1LNIKE\\Downloads\\Escola_da_Ciencia-master") #Seleciona um diretorio
getwd() #Mostra o diretorio que esta sendo utilizado
dir() #Mostra os arquivos existentes neste diretorio
filmes <- read.csv("filmes_subset.csv",header=T,sep=";",dec=".") #Carrega um arquivo csv

names(filmes) #Mostra todos os titulos das colunas
dim(filmes) #Mostra a quantidade de objetos e variaveis

str(filmes) #Detalha o elemento, dizendo sua caracteristica e seus objetos

install.packages("ggplot2") #Instala o pacote desejado
library(ggplot2) #Carrega o pacote 
gg <- ggplot(filmes, aes(Orcamento, Duracao)) + # Eixos X e Y
  geom_point(aes(col=Genero, size=Receita)) + # Color e qual categoria sera diferenciada pela cor e Size e qual categoria sera diferenciada pelo tamanho
  geom_smooth(method="loess", se=F) + 
  xlim(c(27000, 225000000)) + # Limites minimo e maximo do eixo X
  ylim(c(60, 200)) + # Limites minimo e maximo do eixo Y
  labs(subtitle="Orcamento vs Duracao", # Subtitulo do grafico
       y="Duracao", # Nome do eixo Y
       x="Orcamento", # Nome do eixo X
       title="Grafico 1", # Titulo do grafico
       caption = "Source: Filmes") # Fonte dos dados
plot(gg)

# O grafico mostra no eixo x o orcamento (quanto mais a direita estiver, maior o orcamento), 
# O eixo y mostra a duracao (quanto mais para cima estiver, maior a duracao),
# As bolhas demonstram a receita (quanto maior a bolha, maior a receita) e as cores identificam os generos.
# A linha de suavizacao (loess) ajuda a explorar as relacoes potenciais entre as duas variaveis (x e y).

filmes$Popularidade <- as.integer(filmes$Popularidade) # as. interger para classificar como integral no Global Environment
filmes$Classificacao <- as.integer(filmes$Classificacao)

bp<- ggplot(filmes, aes(x="", y=filmes$Popularidade, fill=filmes$Genero))+
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0)
bp

#Gráfico demonstra nº de popularidade atribuída para cada gênero de filme presente da database, nº a quantidade de filmes com esse gênero

summary(filmes) #Mostra resumos dos resultados

var(filmes$Popularidade); var(filmes$Orcamento); var(filmes$Receita) #Mostra a variancia do objeto
var(filmes$Duracao); var(filmes$Classificacao); var(filmes$contagem_de_votos)

sd(filmes$Popularidade); sd(filmes$Orcamento) ; sd(filmes$Receita) #Mostra o desvio padrão do objeto #sd(x)
sd(filmes$Duracao); sd(filmes$Classificacao); sd(filmes$contagem_de_votos)

max (filmes$Popularidade) - min(filmes$Popularidade) #Mostra a amplitude (maximo e minimo) #max(x)- min(x)
max (filmes$Orcamento) - min(filmes$Orcamento) 
max (filmes$Receita) - min(filmes$Receita)
max (filmes$Duracao)- min(filmes$Duracao)
max (filmes$Classificacao) - min(filmes$Classificacao)

sd(filmes$Popularidade) / sqrt(length(filmes$Popularidade)) #Mostra o erro padrao de media #sd(x)/sqrt(length(x))
sd(filmes$Orcamento) / sqrt(length(filmes$Orcamento)) 
sd(filmes$Receita) / sqrt(length(filmes$Receita))
sd(filmes$Duracao) / sqrt(length( filmes$Duracao)) 

sd(filmes$Popularidade) / mean(filmes$Popularidade) * 100 #Mostra o coeficiente de variacao do conjunto de dados #sd(x)/ mean(x) * 100 
sd(filmes$Orcamento)/ mean(filmes$Orcamento) * 100
sd(filmes$Receita) / mean(filmes$Receita) * 100
sd(filmes$Duracao) / mean(filmes$Duracao) * 100


