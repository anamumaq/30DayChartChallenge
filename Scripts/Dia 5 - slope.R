library(ggplot2)
library(ggthemes)
library(dplyr)
library(tidyverse)
library(CGPfunctions)

#https://www.ipsos.com/es-pe/simulacro-de-votacion-y-encuesta-nacional-urbana-rural-el-comercio-ipsos-31-marzo-2021
#https://twitter.com/tuesta/media

url = "Sources/tv.csv"
df = read.csv(url, sep = ',')
summary(df)

df$Candidato[df$Candidato == 'YL'] = 'Yonhy Lescano'
df$Candidato[df$Candidato == 'HdS'] = 'Hernando de Soto'
df$Candidato[df$Candidato == 'VM'] = 'Veronika Mendoza'
df$Candidato[df$Candidato == 'GF'] = 'George Forsyth'
df$Candidato[df$Candidato == 'KF'] = 'Keiko Fujimori'
df$Candidato[df$Candidato == 'RLA'] = 'Rafael Lopez'
df$Candidato[df$Candidato == 'PC'] = 'Pedro Castillo'



#entrevistas en tv por fecha

df_t = df %>% #Filtro candidatos TOP
  filter(df$Candidato %in% c('Yonhy Lescano', 'Hernando de Soto','Veronika Mendoza','George Forsyth','Keiko Fujimori','Rafael Lopez','Pedro Castillo'))%>% 
  mutate(Fecha.2 = ifelse(Fecha.2 == '14/03/2021', '14 marzo','28 marzo'))%>%
  group_by(Candidato, Fecha.2)%>%
  summarise(entrev_t = sum(Entrevistas), encuesta = round(mean(Ipsos)*100,2))


newggslopegraph(df_t, Fecha.2, entrev_t, Candidato,
                Title = "Entrevistas Candidatos Presidenciales en TV",
                SubTitle = '7 Primeros Candidatos - IPSOS | Entrevistas Acumuladas al 14/03 y 28/03',
                Caption = '#30dayChartChallenge | Day 5 | @Anamumaq | Resource: GIPE PUCP', 
                XTextSize = 13, YTextSize = 3, LineThickness = 3)

newggslopegraph(df_t, Fecha.2, encuesta, Candidato,
                Title = "Encuestas Ipsos Intencion de Voto", Caption = 'imaginary', XTextSize = 10, YTextSize = 3, LineThickness = 3)

                
#LineColor = c('GF' = 'red', 'YL' = 'gray', 'RLA' = 'deepskyblue', 'Hds' = 'gray', 'KF' = 'darkorange1', 'DU' = 'gray','PC' = 'gray', 'VM' = 'chartreuse3' ))

# entrevistas en tv por canal

df_c = df %>%
  filter(df$Ipsos > 0.07, df$Fecha.2 == '28/03/2021' )%>% 
  group_by(Candidato, Canal)%>%
  summarise(entrev_t = sum(Entrevistas), encuesta = round(mean(Ipsos)*100,2))

newggslopegraph(df_c, Canal, entrev_t, Candidato,
                Title = "Entrevistas TV", Caption = NULL, XTextSize = 15, YTextSize = 3,  LineThickness = 2)

# encuesta ipsos
newggslopegraph(df_t, Fecha.2, encuesta, Candidato, 
                Title = "Encuestas Ipsos Intencion de Voto", Caption = NULL, XTextSize = 15, YTextSize = 5)
