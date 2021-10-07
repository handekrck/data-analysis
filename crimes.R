
library(readxl)
crimes <- read_excel("crimes.xlsx")
View(crimes)
options(scipen = 999)

#line graph
library(gcookbook)
ggplot(crimes, aes(x = Year, y = Value, colour = Country)) +
  geom_line(size=0.9)

#lollipop graph
ggplot(crimes, aes(x=Country, y=Value)) +
  geom_segment( aes(x=Country, xend=Country, y=0, yend=Value), color="grey") +
  geom_point( color="orange", size=2) +
  theme_light() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.border = element_blank(),
    axis.ticks.x = element_blank()
  ) +
  xlab("Country") +
  ylab("Value")

#bar graph
ggplot(crimes, aes(fill=Country, y=Value, x=Year)) + 
  geom_bar(position="stack", stat="identity")

#bar graph
library(ggplot2)
library(viridis)
library(hrbrthemes)
ggplot(crimes, aes(fill=Country, y=Value, x=Year)) + 
  geom_bar(position="stack", stat="identity") +
  scale_fill_viridis(discrete = T) +
  ggtitle("Crime") +
  theme_ipsum() +
  xlab("Year")

#bar graphs of each country
library(ggplot2)
library(viridis)
library(hrbrthemes)
ggplot(crimes, aes(fill=Country, y=Value, x=Year)) + 
  geom_bar(position="dodge", stat="identity") +
  scale_fill_viridis(discrete = T, option = "E") +
  ggtitle("Crimes") +
  facet_wrap(~Country) +
  theme_ipsum() +
  theme(legend.position="none") +
  xlab("Year")

library(ggplot2)
library(dplyr)
library(hrbrthemes)
ggplot(crimes, aes(x=Value, fill=Country)) +
  geom_histogram( color="#e9ecef", alpha=0.6, position = 'identity') +
  scale_fill_manual(values=c("#69b3a2", "#404080", "grey", "darkmagenta", "skyblue")) +
  theme_ipsum() +
  labs(fill="")

#area graph
ggplot(crimes, aes(x=Year, y=Value, fill=Country)) + 
  geom_area(alpha=0.6 , size=.5, colour="white") +
  scale_fill_viridis(discrete = T) +
  theme_ipsum() + 
  ggtitle("Crimes")

#bar graph
ggplot(crimes, aes(fill=Country, y=Value, x=Year)) + 
  geom_bar(position="dodge", stat="identity")

#heatmap
ggplot(crimes, aes(x=Country, y=Year, fill=Value)) +
  geom_tile()  + 
  scale_fill_distiller(palette = "RdPu") +
  theme_ipsum()
  
  
  
  
  
  
  
  
  
  
  








