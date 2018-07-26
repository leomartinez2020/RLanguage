# My code

# Load needed libraries
library(dplyr)
library(ggplot2)
library(ggthemes)
library(ggrepel)

misdatos <- read.csv('df_murders2017.csv')
head(misdatos)
# Calculamos el slope de los datos:
r <- misdatos %>% 
  summarize(rate=sum(Homicidios) / sum(Poblacion)) %>% .$rate

#k <- ggplot(data = misdatos)
k <- misdatos %>% ggplot(aes(Poblacion, Homicidios, label = abb)) +
  geom_abline(slope = r, lty=2, color='darkgrey') +
  geom_point(aes(col = Región), size=3) +
  #geom_text(nudge_x = 100000, nudge_y = 90) +
  geom_text_repel() +
  xlab("Población por departamento") +
  ylab("Número de homicidios") +
  ggtitle("Homicidios en Colombia en 2017") +
  theme_economist()

k
slope <- sum(misdatos$Homicidios) / sum(misdatos$Poblacion)
slope
