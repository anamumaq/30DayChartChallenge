<<<<<<< HEAD
library(dplyr)
library(tidyverse)
library(leaflet)

#https://www.kaggle.com/nasa/meteorite-landings

df = read.csv('Sources/meteorite-landings.csv', sep = ',')

head(df)
summary(df)

# selecciono solo las variables que usare
df = select(df, name, fall,year,reclong,GeoLocation)

df = df %>%  #quito NAs y ubicaciones 0,0
  filter(!is.na(df), df$reclong != 0, year >= 2000, fall == "Fell")

#ubico la coma para separas la geolocalizacion en lat y long
coma = str_locate(df$GeoLocation,',')
largo = str_count(df$GeoLocation)
  
#latitud
df$lat = str_sub(df$GeoLocation, 2, coma[,1]-1)
#longitud
df$long = str_sub(df$GeoLocation, coma[,1]+2,largo-1)

# transformo a numero la latitud y longitud
df$lat = as.numeric(df$lat)
df$long = as.numeric(df$long)



#Avistamiento de caida de meteoritos desde el 2000 - nasa

leaflet(df) %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(~long, ~lat, popup = ~as.character(year), label = ~as.character(year), icon = meteorito)

# icono de meteorito
meteorito = makeIcon(
  iconUrl = "Sources/meteorite icon.svg",
  iconWidth = 35, iconHeight = 92,
  iconAnchorX = 19, iconAnchorY = 91)
=======
library(dplyr)
library(tidyverse)
library(leaflet)

#https://www.kaggle.com/nasa/meteorite-landings

df = read.csv('Sources/meteorite-landings.csv', sep = ',')

head(df)
summary(df)

# selecciono solo las variables que usare
df = select(df, name, fall,year,reclong,GeoLocation)

df = df %>%  #quito NAs y ubicaciones 0,0
  filter(!is.na(df), df$reclong != 0, year >= 2000, fall == "Fell")

#ubico la coma para separas la geolocalizacion en lat y long
coma = str_locate(df$GeoLocation,',')
largo = str_count(df$GeoLocation)
  
#latitud
df$lat = str_sub(df$GeoLocation, 2, coma[,1]-1)
#longitud
df$long = str_sub(df$GeoLocation, coma[,1]+2,largo-1)

# transformo a numero la latitud y longitud
df$lat = as.numeric(df$lat)
df$long = as.numeric(df$long)



#Avistamiento de caida de meteoritos desde el 2000 - nasa

leaflet(df) %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(~long, ~lat, popup = ~as.character(year), label = ~as.character(year), icon = meteorito)

# icono de meteorito
meteorito = makeIcon(
  iconUrl = "Sources/meteorite icon.svg",
  iconWidth = 35, iconHeight = 92,
  iconAnchorX = 19, iconAnchorY = 91)
>>>>>>> c50b5d7cad214c7d400f6d4e55a8e19c77c0ff17
