From rocker/verse:3.4.1

Maintainer Nicole Grunert <nicolegrunert@gmail.com>

Copy . /mytestpkg

Run . /etc/environment \

  && ls

  && R -e "devtools::install('mytestpkg', dep=TRUE)" \

  && R -e "rmarkdown::render('mytestpkg/analysis/paper.rmd')"

