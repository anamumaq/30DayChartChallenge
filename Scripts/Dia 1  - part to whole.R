library(dplyr)
library(ggplot2)
library(ggthemes)
library(scales)

url = "https://www.datosabiertos.gob.pe/sites/default/files/Bonos__1.csv"
df = read.csv(url, sep = ";")
df = select(df, DE_GENERO, DE_DEPARTAMENTO) # solo me interesa usar los varones y mujeres que recibieron el bono
df = df %>%  # Agrupo por sexo y departmento cuantos bonos fueron entregados
  mutate(GENERO = ifelse(df$DE_GENERO == 1, 'Masculino', 'Fememino'))%>%
  group_by(GENERO, DE_DEPARTAMENTO)%>%
  summarise(FREQ = n())
  

# uso ggplot
ggplot(df, aes(fill = GENERO, y = FREQ , x = DE_DEPARTAMENTO)) + 
  geom_bar(position = 'fill' , stat = 'identity')+
  labs(title = "Bonos COVID-19 Otorgados por Genero en Departamentos de Zonas Urbanas", 
       subtitle = "Subsidio monetario de 380 soles para los hogares en condición de pobreza o pobreza extrema",
       x = '', y = '',
       caption = '#30DayChartChallenge | Day 1 | @Anamumaq | Resource: www.datosabiertos.gob.pe')+
  geom_hline(yintercept = 0.5, linetype = "dashed", color = "black", size = 1)+
  coord_flip()+
  theme_economist()+ # tema escogido
  theme(panel.grid.major.y = element_blank(), #cambios en el tema
        axis.text.y = element_text(size=10, face = 'bold'),
        legend.position = 'right')+ 
  scale_y_continuous(labels = percent)+ # escala %
  scale_fill_manual(name = 'Genero',values=c("#E8BE3A", "#367C9C")) # escojo colores para los sexos

