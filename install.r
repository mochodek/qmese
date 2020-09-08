options(repos = c(CRAN = "http://cran.rstudio.com"))

if (!require(devtools)){
    install.packages("devtools", dependencies = TRUE)
}
if (!require(dplyr)){
    install.packages("dplyr", dependencies = TRUE)
}
if (!require(ggplot2)){
    install.packages("ggplot2", dependencies = TRUE)
}
if (!require(readxl)){
    install.packages("readxl", dependencies = TRUE)
}
if (!require(pwr)){
    install.packages("pwr", dependencies = TRUE)
}
if (!require(effsize)){
    install.packages("effsize", dependencies = TRUE)
}
if (!require(gmodels)){
    install.packages("gmodels", dependencies = TRUE)
}
if (!require(coin)){
    install.packages("coin", dependencies = TRUE)
}
if (!require(gdata)){
    install.packages("gdata", dependencies = TRUE)
}
if (!require(Hmisc)){
    install.packages("Hmisc", dependencies = TRUE)
    require(Hmisc)
}
