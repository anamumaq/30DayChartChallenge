library(dplyr)
library(tidyverse)
library(ggradar)

df = read.csv('Sources/Agenda 2030 - 3 primeros.csv', sep = ',')

head(df)
summary(df)




# Dimensiones



ggradar(
  df[,1:6], 
  values.radar = c("0","10","20"),
  grid.min = 0, grid.mid = 10, grid.max = 20,
  group.line.width = 1.5, 
  group.point.size = 4,
  group.colours = c("#E32520", "#153f93", "#00FF00"),
  background.circle.colour = "white",
  gridline.min.colour = "black",
  gridline.mid.colour = "black",
  gridline.max.colour = "black",
  legend.position = 'top',
  plot.title = 'Puntos ODS por Dimensiones en los Planes de Gob',
  legend.title = '',
  legend.text.size = 14,
  axis.label.size = 4,
  base.size = 4,
  grid.label.size = 5
)



## Ejes

ggradar(
  df[,c(1,7,8,9,10)], 
  values.radar = c("0","10","20"),
  grid.min = 0, grid.mid = 10, grid.max = 20,
  group.line.width = 1.5, 
  group.point.size = 4,
  group.colours = c("#E32520", "#153f93", "#00FF00"),
  background.circle.colour = "white",
  gridline.min.colour = "black",
  gridline.mid.colour = "black",
  gridline.max.colour = "black",
  legend.position = 'top',
  plot.title = 'Puntos ODS por Ejes en los Planes de Gob',
  legend.title = '',
  legend.text.size = 14,
  axis.label.size = 5,
  base.size = 4,
  grid.label.size = 5
)
