#Photo-Identification Analysis of Bottlenose Dolphins off Lewes, Delaware
#Melissa Laurino - Stockton University


#Create a map of only photo-identified dolphin sightings:

setwd("/Users/Melis/OneDrive/Documents/Tableu")
library (tidyverse) #Call in necessary libraries for mapping in R
library(leaflet)
library(ggmap)
library(ggplot2)
library(maps)
library(plotGoogleMaps)
library(lubridate)
library(maptools)
gpclibPermit()
library(grid)

#Read in the data:
DEData <- read_csv("LewesDEsightings.csv") #All observations #1058

#Preview the data:
DEData

#Populate the latitude and longitude fields for mapping from DEData
lat <- DEData$lat
long <- DEData$long

#Create a test map:
m <- leaflet() 
m <- addTiles(m) #Add a tile layer
#Add a single marker not from the data and label it with a popup:
m <- addMarkers(m,lng=-75.132494, lat=38.781076, popup="Lewes, Delaware")
#Preview the map
m 
#Add a scale bar and assign position based on data view
m = addScaleBar(m, position="bottomleft")

#Add the designated data, do not add pop ups, choose fill color and opacity. You have the option to assign a legend.
#Add satellite layer from website http://server.arcgisonline.com
leaflet(m) %>% addTiles(urlTemplate="http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}") %>% addCircleMarkers(long, lat, radius=1, color = "yellow", fillColor = "yellow")%>% addScaleBar(m, position="topright") #%>% addLegend("topright", colors=color, title = "Dolphin Sightings")

#Clear the environment
#Create a map of all dolphin sightings:

setwd("/Users/Melis/OneDrive/Documents/")

Data <- read_csv("LewesDelawareData2.csv") #All observations #1058

Data

lat <- Data$lat
long <- Data$long
#remove(m)
#Test the map:
m <- leaflet()
m <- addTiles(m)
m <- addMarkers(m,lng=-75.132494, lat=38.781076, popup="Lewes, Delaware")
m 
m = addScaleBar(m, position="bottomleft")
#Add the real data:
leaflet(m) %>% addTiles(urlTemplate="http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}") %>% addCircleMarkers(long, lat, radius=1.75, opacity = .55, color = "yellow", fillColor = "yellow")%>% addScaleBar(m, position="topright") #%>% addLegend("topright", colors=color, title = "Dolphin Sightings")
