.PHONY: data
data :
	#[ ! -d Data/ ] && mkdir Data/
	Rscript scripts/Update_Data.R

.PHONY: render
render :
	Rscript -e 'library(rmarkdown); rmarkdown::render("scripts/NFL-Report.Rmd", "rmarkdown::github_document")'
	# mv to correct directory
	mv scripts/NFL-Report.md ./NFL-Report.md # move .md report file to root directory
	#mkdir NFL-Report_files/
	mv scripts/NFL-Report_files/* NFL-Report_files/ # move support images to root directory

.PHONY: git
git :
	git add NFL-Report.md
	git add NFL-Report_files/*
	git commit -m "`date +'%Y-%m-%d'`"
	git push origin main

.PHONY: archive
archive :
	./scripts/archive.sh

clean : 
	rm Data/play_by_play.csv
	rm -rf scripts/NFL-Report_files
	rm scripts/*.html

.PHONY: all
all : 
	make data
	make archive
	make render 
	make clean
	make git

