



devtools::use_readme_rmd()



#afterwards on the readme.Rmd:

devtools::use_travis()


#then in the readme.rmd: copy from the console after devtools::use_travis()

[![Travis-CI Build Status](https://travis-ci.org/quassinja/mytestpkg.svg?branch=master)](https://travis-ci.org/quassinja/mytestpkg)

#then knit
# knit creates the .md file


