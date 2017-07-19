From rocker/verse:3.4.1

Maintainer Nicole Grunert <nicolegrunert@gmail.com>

Copy . /mytestpkg

Run . /etc/environment \

  && ls

  && R --vanilla "devtools::install('mytestpkg', dep=TRUE)" \

  && R --vanilla "rmarkdown::render('mytestpkg/analysis/PackageTest.Rmd')"

