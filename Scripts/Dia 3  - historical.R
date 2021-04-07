library(ggplot2)
library(ggthemes)
library(dplyr)

url = "Sources/population-growth-rate-vs-median-age.csv"
df = read.csv(url, sep = ',')

colnames(df)[5] <- "median_age"
colnames(df)[1] <- "Paises"

df = select(df,c(1,3,5))

summary(df)

df = na.omit(df) 

df = df %>% 
  filter(df$Paises %in% c('Peru', 'Chile','Bolivia','Colombia', 'Argentina'))


ggplot(df, aes(x = Year, y = median_age, group = Paises, color = Paises))+
  geom_line()+
  geom_point()+
  labs(title = "Proyeccion Edad Promedio de Paises Sudamericanos", 
     x = 'Años', y = 'Edad Prom',
     caption = "#30DayChartChallenge | Day 3 | @Anamumaq | Resource: ourworldindata.org/age-structure")+
  theme_hc(style = 'darkunica')+ # tema escogido
  theme(axis.text.y = element_text(size=10, face = 'bold', color = 'white'),
        axis.text.x = element_text(size=10, face = 'bold', color = 'white'),
        panel.grid.major.x = element_line (linetype = 'dotted'),
        panel.grid.major.y = element_line (linetype = 'dotted'),
        legend.position = 'right')+
  scale_fill_manual(name = 'Paises', values = df$Paises)
