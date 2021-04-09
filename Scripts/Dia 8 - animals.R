library(ggthemes)
library(ggpomological)

#https://www.kaggle.com/jessicali9530/animal-crossing-new-horizons-nookplaza-dataset?select=villagers.csv

df = read.csv('Sources/villagers acnh.csv', sep = ',')

head(df)
summary(df)

#selecciono lo que usare
df = select(df, ï..Name, Species,Gender,Personality,Hobby)


#ggplot
ggplot(df, aes(x = Personality, y = Species))+
  geom_jitter(aes(color = Gender), size = 6, alpha = 0.5)+
  labs(title = "Villagers ACNH by Personalities and Gender", 
       x = 'Personality', y = 'Species',
       caption = '#30DayChartChallenge | Day 8 | @Anamumaq | Resource: kaggle.com')+
  theme_pomological()+
  scale_color_pomological()+
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.position = "bottom",
        axis.text = element_text(color="black", size = 12),
        plot.title = element_text(color = 'black', size = 20, hjust = -0.1, family = "FinkHeavy" ),
        text = element_text(color="black", size = 15, family = "FinkHeavy"))

# font de  AC

font_add(family = "FinkHeavy", regular = "./Fonts/FinkHeavy.ttf")


