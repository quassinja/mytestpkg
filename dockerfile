FROM rocker/verse:3.4.1

MAINTAINER Nicole Grunert <nicolegrunert@gmail.com>

COPY . /mytestpkg

RUN . /etc/environment \

  && R --vanilla "devtools::install('/mytestpkg', dep=TRUE)" \

  && R --vanilla "rmarkdown::render('/mytestpkg/analysis/PackageTest.Rmd')"

