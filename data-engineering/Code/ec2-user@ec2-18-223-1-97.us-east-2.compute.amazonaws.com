# start from the rocker/r-ver:3.5.0 image
FROM rocker/r-ver:3.5.0

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev

# install libraries, 
RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('dplyr')"
RUN R -e "install.packages('data.table')"
RUN R -e "install.packages('fastDummies')"
RUN R -e "install.packages('lubridate')"
RUN R -e "install.packages('stringr')"
RUN R -e "install.packages('DescTools')"
RUN R -e "install.packages('readxl')"
RUN R -e "install.packages('bit64')"
RUN R -e "install.packages('vcd')"
RUN R -e "install.packages('caret')"
RUN R -e "install.packages('ranger')"
RUN R -e "install.packages('randomForest')"
RUN R -e "install.packages('xgboost')"
RUN R -e "install.packages('gbm')"
RUN R -e "install.packages('e1071')"
RUN R -e "install.packages('MASS')"

# copy everything from the current directory into the container
COPY / /

# open port 80 to traffic
EXPOSE 80

# when the container starts, start the main.R script
ENTRYPOINT ["Rscript", "main.R"]

#Todo: look in the version of plumber. 