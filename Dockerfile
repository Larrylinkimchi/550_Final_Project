From rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir output
RUN mkdir raw_data
COPY code code
COPY raw_data raw_data
COPY Makefile .
COPY 550_project_report_Xiuran_Lin.Rmd .
COPY .Rprofile .
COPY renv.lock .

RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.dcf renv

RUN Rscript -e "renv::restore(prompt=FALSE)"

RUN mkdir report
CMD make && mv 550_project_report_Xiuran_Lin.html report