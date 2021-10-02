#!/bin/bash
# File Name: archive.sh
# Description: responsible for archviving weekly reports into new archive folders
################################


# Get week and year from config files and put
# into variables
TMP=$(grep "NFL Landscape" NFL-Report.md)
WEEK=$( echo $TMP | tr -dc '0-9')
VAR="Week$WEEK"
echo $VAR

# create new file directories if they don't exist
[ ! -d archive/$VAR ] && mkdir archive/$VAR
[ ! -d archive/$VAR/NFL-Report_files ] && mkdir archive/$VAR/NFL-Report_files
[ ! -d archive/$VAR/NFL-Report_files/figure-gfm ] && mkdir archive/$VAR/NFL-Report_files/figure-gfm

# move new files (.md & .pngs) 
mv NFL-Report.md archive/$VAR/
#mv NFL-Report_files/figure-gfm/* archive/$VAR/NFL-Report_files/figure-gfm/
mv NFL-Report_files/figure-gfm/* archive/$VAR/NFL-Report_files/figure-gfm/

# push to github
git add archive/$VAR/*
git commit -m "adding archive for $VAR"
git push origin main

