
library(readxl)
harcama <- read_excel("harcama.xlsx")
View(harcama)

#Veri al�rken string format�ndaki s�tunlar� fakt�r gibi g�rme
options(stringsAsFactors = FALSE)

#Veri tablolar�n�n b�t�n s�tunlar�n� g�ster
options(dplyr.width = Inf)

#Ondal�k veri g�sterme format� ile ilgili bir ayar
options(scipen = 7)

library(ggplot2)
ggplot(data = harcama, aes(x = Years, y = Values)) +
  geom_line(aes(y = Luxembourg, color = "Luxembourg")) +
  geom_line(aes(y = Switzerland, color = "Switzerland")) +
  geom_line(aes(y = Ireland, color = "Ireland")) +
  geom_line(aes(y = Norway, color = "Norway")) +
  geom_line(aes(y = USA, color = "USA")) +
  geom_line(aes(y = Singapore, color = "Singapore")) +
  geom_line(aes(y = Denmark, color = "Denmark")) +
  geom_line(aes(y = Australia, color = "Australia")) +
  geom_line(aes(y = Sweden, color = "Sweden")) +
  geom_line(aes(y = Finland, color = "Finland")) + 
  ylim(0, max(harcama$USA))

