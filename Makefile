550_project_report_Xiuran_Lin.html: 550_project_report_Xiuran_Lin.Rmd code/03_render_report.R output/mosaicplot.png output/table_one.rds output/data_clean.rds
	Rscript code/03_render_report.R

output/data_clean.rds:
	Rscript code/clean_data.R
	
output/mosaicplot.png:
	Rscript code/02_make_mosaic.R

output/table_one.rds: code/01_make_table.R
	Rscript code/01_make_table.R

