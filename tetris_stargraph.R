

library(readxl)
Tetris <- read_excel("Tetris.xlsx")
View(Tetris)

library(fmsb)
radarchart(Tetris, title="Tetris")



