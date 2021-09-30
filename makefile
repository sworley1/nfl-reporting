.PHONY: data
data :
	Rscript Update_Data.R

.PHONY: render
render :
	Rscript -e 'library(rmarkdown); rmarkdown::render("NFL-Report.Rmd", "rmarkdown::github_document")'
	git add	*
	git commit -m "`date +'%Y-%m-%d'`"
	git push origin main

clean : 
	rm Data/play_by_play.csv
	rm *html

.PHONY: all
all : 
	make data
	make render 
	make clean

