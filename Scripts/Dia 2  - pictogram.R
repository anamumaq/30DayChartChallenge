library(ggplot2)
library(ggthemes)
library(dplyr)
library(emoGG)

url = "Sources/population-growth-rate-vs-median-age.csv"
df = read.csv(url, sep = ',')

colnames(df)[4] <- "pop_increase"
colnames(df)[5] <- "median_age"

df = select(df,c(1,3,4,5))

summary(df)

df = na.omit(df) 

df = df %>%  #
  filter(df$Year == 2020)%>%
  mutate(pop_increase = pop_increase/100)
  
emoji_search('globe')

ggplot(df, aes(median_age, pop_increase))+
  geom_emoji(emoji="1f30e", size = 0.025)+
  labs(title = "Ratio de Crecimiento Poblacional y Edad Mediana en el 2020 por Pais", 
       subtitle = "Cada punto representa un pais",
       x = 'Edad Mediana', y = '%Incremento',
       caption = '#30dayChartChallenge | Day 2 | @Anamumaq | Resource: ourworldindata.org/age-structure')+
  theme_hc(style = 'darkunica')+
  scale_y_continuous(labels = percent)+ # escala %
  theme(axis.text.y = element_text(size=10, face = 'bold', color = 'white'),
        axis.text.x = element_text(size=10, face = 'bold', color = 'white'),
        panel.grid.major.x = element_line (linetype = 'dotted'),
        panel.grid.major.y = element_line (linetype = 'dotted'))
 