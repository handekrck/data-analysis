
library(readxl)
okuma <- read_excel("okuma.xlsx")      #OKUMA YAZMA BÝLEN, BÝLMEYEN, BÝLÝNMEYEN VERÝ SETÝ
View(okuma)

okumayazmabilen <- okuma$`Okuma Yazma Bilen`
okumayazmabilmeyen <- okuma$`Okuma Yazma Bilmeyen`
ilceler <- okuma$Ýlçeler
bilinmeyen <- okuma$Bilinmeyen

colMeans(okuma[sapply(okuma, is.numeric)])  # calculate mean for each column

df <- data.frame(bilinmeyen, okumayazmabilen, okumayazmabilmeyen) # create a new dataframe with numeric values
df

#mode
mode(df)                                    
mode(bilinmeyen)
mode(okumayazmabilen)
mode(okumayazmabilmeyen)

#median
median(bilinmeyen)              
median(okumayazmabilen)
median(okumayazmabilmeyen)

#standard deviation
sd(bilinmeyen)
sd(okumayazmabilen)
sd(okumayazmabilmeyen)

#variance
var(df)

#coefficient of variation
sd(bilinmeyen) / mean(bilinmeyen) * 100
sd(okumayazmabilen) / mean(okumayazmabilen) * 100
sd(okumayazmabilmeyen) / mean(okumayazmabilmeyen) * 100

#skewness and kurtosis
skewness(df)
kurtosis(df)

#histograms
library(plotly)
         #bilinmeyen
pal <- c("darkmagenta", "lightcoral", "aquamarine")
fig <- plot_ly(data = okuma,  x = ~ilceler, y = ~bilinmeyen, color= ~bilinmeyen,  colors = pal)
fig 
        #bilen
pal <- c("indianred3", "plum3", "palegreen1")
fig <- plot_ly(data = okuma,  x = ~ilceler, y = ~okumayazmabilen, color= ~okumayazmabilen,  colors = pal) 
fig
        #bilmeyen
pal <- c("deeppink", "skyblue", "orange")
fig <- plot_ly(data = okuma,  x = ~ilceler, y = ~okumayazmabilmeyen, color= ~okumayazmabilmeyen,  colors = pal)
fig

#plygon plot
plot(okumayazmabilen, okumayazmabilmeyen, type="n")
polygon(okumayazmabilen, okumayazmabilmeyen)
text(okumayazmabilen, okumayazmabilmeyen, 1:length(okumayazmabilen))

#dot plot
dotchart(bilinmeyen, main="Bilinmeyenler", labels = ilceler, pch = 21, bg = "violetred", pt.cex = 1.5)
dotchart(okumayazmabilen, main="Okuma Yazma Bilenler" ,labels = ilceler, pch = 21, bg = "pink", pt.cex = 1.5)
dotchart(okumayazmabilmeyen, main="Okuma Yazma Bilmeyenler", labels = ilceler, pch = 21, bg = "mediumorchid", pt.cex = 1.5)

#line graphs
plot(bilinmeyen, col="orange", xlab="Ýlçeler", ylab="Deðerler", main="Bilinmeyenler", type = "o", lwd="3")
plot(okumayazmabilen, col="deeppink", xlab="Ýlçeler", ylab="Deðerler", main="Okuma Yazma Bilenler", type = "o", lwd="3")
plot(okumayazmabilmeyen, col="skyblue", xlab="Ýlçeler", ylab="Deðerler", main="Okuma Yazma Bilmeyenler", type = "o", lwd="3")

#Stem and Leaf graphs
stem(bilinmeyen)
stem(okumayazmabilen)
stem(okumayazmabilmeyen)

#boxplot
boxplot(df)

df2 <- data.frame(bilinmeyen, okumayazmabilmeyen)  #we created a new df to see bilinmeyen and bilmeyen graphs clearly
df2
boxplot(df2)

#box and whisker
boxplot(x = df, range=0.0, horizontal=TRUE, varwidth=FALSE, notch=FALSE,
        outline=TRUE, boxwex=0.3, border=c("black"), xlab="Value", ylab="Category")

boxplot(x = df2, range=0.0, horizontal=TRUE, varwidth=FALSE, notch=FALSE,
        outline=TRUE, boxwex=0.3, border=c("black"), xlab="Value", ylab="Category")

#Normal probability graph
library(ggplot2)
library(qqplotr)

ggplot(mapping = aes(sample = bilinmeyen)) 
qqnorm(bilinmeyen, main="Bilinmeyen")
qqline(bilinmeyen)

ggplot(mapping = aes(sample = okumayazmabilen)) 
qqnorm(okumayazmabilen, main="Okuma Yazma Bilenler")
qqline(okumayazmabilen)

ggplot(mapping = aes(sample = okumayazmabilmeyen)) 
qqnorm(okumayazmabilmeyen, main="Okuma Yazma Bilmeyenler")
qqline(okumayazmabilmeyen)

#Distribution of our data
library(fitdistrplus) 
descdist(bilinmeyen, discrete = FALSE)  #close to uniform dist
descdist(okumayazmabilen, discrete = FALSE) #close to normal dist
descdist(okumayazmabilmeyen, discrete = FALSE) #close to beta dist

#one of the graphs to show outliers
plot(okumayazmabilen, okumayazmabilmeyen, main="Scatterplot",
     xlab="Okuma Yazma Bilen", ylab="Okuma Yazma Bilmeyen", pch=19, col="coral1")
lines(lowess(okumayazmabilen, okumayazmabilmeyen), col="skyblue") # lowess line (x,y)

#normal probability graphs
library(ggplot2)
library(qqplotr)

ggplot(mapping = aes(sample = bilinmeyen)) + stat_qq_point(size = 1.5, color = "steelblue3")+ stat_qq_line(color = "pink2")

ggplot(mapping = aes(sample = okumayazmabilen)) + stat_qq_point(size = 1.5, color = "mediumpurple3")+ stat_qq_line(color = "gold")

ggplot(mapping = aes(sample = okumayazmabilmeyen)) + stat_qq_point(size = 1.5, color = "salmon")+ stat_qq_line(color = "springgreen")








