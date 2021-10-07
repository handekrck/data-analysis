

library(readxl)
turist <- read_excel("turist.xlsx")
View(turist)


GERMANY <- turist$"GERMANY"
DATE <- turist$"DATE"

df <- data.frame(GERMANY)
df

#mean
mean(GERMANY)

#mode
mode(GERMANY)

#median
median(GERMANY)

#standard deviations
sd(GERMANY)

#variance
var(GERMANY)


#coefficient of variation
sd(GERMANY) / mean(GERMANY) * 100

#skewness and kurtosis
library(moments)
skewness(df)
kurtosis(df)


#histograms
library(plotly)
pal <- c("slateblue2", "pink2", "steelblue2")
fig <- plot_ly(data = turist, x = ~DATE, y = ~GERMANY, ~color = GERMANY, colors = pal)
fig

#plygon plot
plot(GERMANY, type="n")
polygon(GERMANY)
text(GERMANY, 1:length(GERMANY))


#dot plot
dotchart(GERMANY, labels = DATE, pch = 21, bg = "pink4", pt.cex = 1.5)

#line graphs
plot(GERMANY, col="plum", xlab="DATE", ylab="VALUE",
     main="GERMANY", type = "o", lwd="3")

#stem and leaf 
stem(GERMANY)

#boxplot
boxplot(GERMANY, xlab="Germany", ylab = "Value", col = "red", border = "black")
title("GERMANY")

#box and whisker
boxplot(GERMANY, xlab="Value", ylab="Germany", range = 0.0, horizontal = TRUE, varwidth = FALSE,
        notch = FALSE, outline = TRUE, boxwex = 0.3, 
        col = "deepskyblue", border = "black", ylab = "Value")
title("GERMANY")

#Normal probability graph
library(ggplot2)
library(qqplotr)

ggplot(mapping = aes(sample = GERMANY)) 
qqnorm(GERMANY, main="Germany")
qqline(GERMANY)

#Distribution of our data
library(fitdistrplus) 
descdist(GERMANY, discrete = FALSE) 




plot(GERMANY, col= "blue")

library(ggplot2)
library(hrbrthemes)

#normal probability graph
library(ggplot2)
library(qqplotr)
ggplot(mapping = aes(sample = GERMANY)) + stat_qq_point(size = 1, color = "magenta")+ stat_qq_line(color = "deepskyblue2")

#one of the graphs to show outliers
plot(GERMANY,  main="Scatterplot",
     xlab="DATE", ylab="GERMANY", pch=19, col="coral1")