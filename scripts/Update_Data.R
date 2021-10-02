library(nflfastR)
pbp <- load_pbp(2021)

write.csv(pbp, "Data/play_by_play.csv")
