
# Interpolation

##Test data: Precipitation.RData

View(test) # shows the table of data
library(sp)

#coordinates(test)=~lon+lat    -> produces error: Error in coordinates(test) = ~lon + lat : could not find function "coordinates<-"

test=data.frame(test) # makes a data frame because of error:Error in coordinates(test) = ~lon + lat :
#could not find function "coordinates<-"
coordinates(test)=~lon+lat
plot(test)

proj4string(test) <- CRS("+init=epsg:4326") # to apply coordinate references
test2 <- spTransform(test,CRSobj = CRS("+init=epsg:32634"))  # transforms the coordinate reference system to our local projected one


library(mapview) # shows the map
mapview(test2)

library(raster) # needed to use getData
srtm <- getData('SRTM', lon=mean(coordinates(test)[,1]), lat=mean(coordinates(test)[,2])) #elevation model

plot(srtm) # elevation map

extent(test)  # shows the coordinates
srtm2=crop(srtm, extent(test)+1) # extends area
mapview(srtm2)  # shows chosen area

#######################################################################
#



