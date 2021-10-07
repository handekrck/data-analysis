
library(readxl)
score <- read_excel("D:/Rdata/score.xlsx")
View(score)

library(ggplot2)
library(ggtern)

ggtern(data = score, aes(x = teamA, y = teamB, z = teamC)) + 
  geom_point(aes(fill = Date), size = 4, shape = 21, color = "black") +
  ggtitle("Match Scores") + labs(fill = "Date") + 
  theme_rgbw() + theme(legend.position = c(0, 1), legend.justification = c(1, 1))


