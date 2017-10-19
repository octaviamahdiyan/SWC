download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data/gapminder-FiveYearData.csv")
gapminder <- read.csv("data/gapminder-FiveYearData.csv")
mean(gapminder$lifeExp)

max(gapminder$year)
gapminder$year == 2007
gapminder2007 <- gapminder[gapminder$year == 2007,]
mean(gapminder2007$lifeExp)
mean(gapminder$lifeExp)

min(gapminder$year)
gapminder$year == 1952
gapminder1952 <- gapminder[gapminder$year == 1952,]
mean(gapminder1952$lifeExp)

plot(gapminder$lifeExp,gapminder$gdpPercap)
# this is how you write comments 
# for people to read, not a R command 

# start of ggplot2 section
library(tidyverse)
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp))
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point()

library(tidyverse)
ggplot(data = gapminder, aes(x=year, y=lifeExp)) + geom_point()

ggplot(data = gapminder, aes(x=year, y=lifeExp, color=continent)) + geom_point()
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country, color=continent)) + geom_point() + geom_line()

ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point()
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) + geom_point()
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) + geom_point() + scale_x_log10()
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) + geom_point() + scale_x_log10() + geom_smooth(method="lm")
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, color=continent, by=country)) + geom_point() + scale_x_log10() + geom_smooth(method="lm") + facet_wrap( ~ continent)

ggplot(data = gapminder[gapminder$continent=="Americas",], aes(x=gdpPercap, y=lifeExp, color=continent, by=country)) + geom_point() + scale_x_log10() + geom_smooth(method="lm") + facet_wrap( ~ country)

#labels
ggplot(data = gapminder[gapminder$continent=="Americas",], aes(x=gdpPercap, y=lifeExp, color=continent, by=country)) + geom_point() + scale_x_log10() + geom_smooth(method="lm") + facet_wrap( ~ country)
installed.packages("plotly")

#interactive plotting with plotly 
library(plotly)

install.packages("plotly")
library(plotly)
p <- ggplot(data = gapminder[gapminder$continent=="Americas",], aes(x=gdpPercap, y=lifeExp, color=continent, by=country)) + geom_point() + scale_x_log10() + geom_smooth(method="lm") + facet_wrap( ~ country)
p
ggplotly(p)

#if you don't have the package installed
if(!require("plotly")){install.packages("plotly")}

#how to make nice labels 
p + labs(x="GDP per Capita")
p + labs(x="GDP per Capita", y="Life Expectancy (y)", 
         title="Figure 1")
p + labs(x="GDP per Capita", y="Life Expectancy (y)", 
         title="Figure 1") +
           scale_color_discrete(name="Continent")
