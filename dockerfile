#FROM rocker/verse:3.4.1

#MAINTAINER Nicole Grunert <nicolegrunert@gmail.com>

#COPY . /mytestpkg

#RUN . /etc/environment \

#  && R --vanilla "devtools::install('/mytestpkg', dep=TRUE)" \

#  && R --vanilla "rmarkdown::render('/mytestpkg/analysis/PackageTest.Rmd')"


# get the base image, this one has R, RStudio and pandoc
FROM rocker/verse:3.4.1

# required
MAINTAINER Martin Hinz <martin.hinz@ufg.uni-kiel.de>

COPY . /coursepackageberlin

RUN . /etc/environment \

 && R --vanilla "options(repos='$MRAN'); devtools::install('/mytestpkg', dep=TRUE)" \

 && R --vanilla "rmarkdown::render('/mytestpkg/analysis/PackageTest.Rmd')"


