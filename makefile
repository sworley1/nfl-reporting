.PHONY: data
data :
	Rscript scripts/Update_Data.R

.PHONY: render
render :
	./scripts/archive.sh
	Rscript -e 'library(rmarkdown); rmarkdown::render("scripts/NFL-Report.Rmd", "rmarkdown::github_document")'
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

