#install.packages("nflreadr")
library(nflreadr)
pbp <- load_pbp(2022)

write.csv(pbp, "Data/play_by_play.csv")
