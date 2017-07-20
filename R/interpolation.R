
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

srtm3=projectRaster(srtm2, crs=CRS("+init=epsg:32634")) # first crop, then project, as raster might take ages to be build

#######################################################################
# Kriging


library(gstat)
rain_idw=idw(mean_r~1, test2,        # idw = makes the kriging funcion possible / mean of r with behaviour 1
             as(srtm3,"SpatialGridDataFrame")) # raster has to be transformed to Spatial grid data frame as gstat doesnt like raster
#rain_idw=idw(mean_r~1, test2,        # idw = makes the kriging funcion possible / mean of r with behaviour 1
#as(srtm3,"SpatialGridDataFrame"), #idp= 10 -> looks like thysenpolygon) -> default here is idp=2
# mapview(rain_idw) # shows precipitation --> creates error

plot(rain_idw)

plot(variogram(mean_r~1, loc=test2, cloud=T))

va <- variogram(mean_r~1, loc = test2,
                cutoff = 100000, width = 10000)  # cutoff: after what distance are we not interested anymore?
                  # width = distance between points, sensitive parameter
plot(va)
plot(va, vgm(8e+04, "Exp", 4e+04, 0)) # playing around with data, adds the result of the empirical variogram

vmf <- fit.variogram(va, vgm(8e+04, "Exp", 4e+04, 0), fit.method = 7) # 7 -> ordinary squares
plot(va,vmf) # fits the curve to the points


rain_krige=krige(mean_r~1, test2,
                  as(srtm3,"SpatialGridDataFrame"),
                  vmf) # uses ordinary kriging
plot(rain_krige)

rain_krige_brick=brick(rain_krige) # transforms it into a raster brick

plot(rain_krige_brick)

library(automap)
srtm4=aggregate(srtm3, 10)


autkrig=autoKrige(mean_r~1, test2,
                   as(srtm4, "SpatialGridDataFrame"))

plot(autkrig)







