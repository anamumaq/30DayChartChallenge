library(dplyr)
library(ggplot2)
library(ggthemes)


url = "Sources/pokemon.csv"
img = "https://assets.bakker.com/ProductPics/560x676/10028-00-BAKI_20170109094316.jpg"
df = read.csv(url, sep = ",",encoding="utf8")



df = select(df, type1, type2,hp,name,generation)
head(df)
summary(df)
df$generation = as.character(df$generation)

df = df %>%  
  filter(df$type1 == "fairy" |df$type2 == "fairy")%>%
  group_by(generation, name)%>%
  summarise(pokemon = n(), hp = mean(hp))


ggplot(df, aes(x = generation, y = hp, fill = generation))+
          geom_boxplot()+
          geom_hline(yintercept = mean(df$hp), linetype = "dashed", color = "black", size = 1)+
          guides(fill=FALSE)+
          ylim(15, 125)+
          labs(title = "HP Fairy Pokemon by Generation", 
               x = 'Generation', y = 'Hit Points',
               caption = '#30DayChartChallenge | Day 4 | @Anamumaq | Resource: kaggle.com')+
          theme_economist()+
          theme(panel.grid.major.x = element_blank(),
                panel.grid.major.y = element_line(linetype = "dotted"))


            
