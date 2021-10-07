

deficit <- read.csv("deficit.csv")
deficit

Location <- deficit$ï..LOCATION
Location

Time <- deficit$TIME
Time

Value <- as.numeric(deficit$Value)
Value


df <- data.frame(Time, Location,  Value)
df

b_deficit <- subset(df, Location!="AUS" & Location !="CAN" & Location!="ISL" & Location!="JPN" & Location!="KOR" & Location!="MEX" & Location!="USA" & Location!="CHL" & Location!="CHN" & Location!="ISR" & Location!="RUS" & Location!="ZAF" & Location!="EA" & Location!="EU" & Location!="NZL" & Location!="BRA" & Location!="COL" & Location!="CRI" & Location!="IDN" & Location!="CZE" & Location!="EST" & Location!="GRC" & Location!="HUN" & Location!="IRL" & Location!="LTU" & Location!="LVA" & Location!="SVK" & Location!="SVN" & Location!="CHE" & Location!="TUR")
b_deficit

dropna <- na.omit(b_deficit)
dropna

#line graph
library(gcookbook)
ggplot(b_deficit, aes(x = Time, y = Value, colour = Location)) +
  geom_line(size=1)

#heatmap
ggplot(b_deficit, aes(x=Location, y=Time, fill=Value)) +
  geom_tile()  + 
  scale_fill_gradient(low="lightcyan", high="navy") +
  theme_ipsum()

