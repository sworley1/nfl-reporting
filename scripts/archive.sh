#!/bin/bash
# File Name: archive.sh
# Description: responsible for archviving weekly reports into new archive folders
################################

# move to parent directory 
cd .. 


# Get week and year from config files and put
# into variables
TMP=$(grep "NFL Landscape" NFL-Report.md)
WEEK=$( echo $TMP | tr -dc '0-9')
VAR="Week$WEEK"

# create new file name
mkdir archive/$VAR
mkdir archive/$VAR/NFL-Report_files
mkdir archive/$VAR/NFL-Report_files/figure_gfm

# move new files (.md & .pngs) 
mv NFL-Report.md archive/$VAR/
mv NFL-Report_files/figure-gfm/* archive/$VAR/NFL-Report_files/figure-gfm/
mv NFL-Report_files/figure-gfm/* archive/$VAR/NFL-Report_files/figure-gfm/

