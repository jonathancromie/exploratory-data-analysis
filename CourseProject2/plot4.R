## Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999–2008?

## Answer: The total amount of emissions from coal combustion-related sources 
## has seen a dramatic drop since 2005 going from just about 550,000 to
## just under 350,000. According to Wikipedia, "In 2007, 59 proposed coal plants 
## [in the USA] were cancelled, abandoned, or placed on hold by sponsors as a 
## result of financing obstacles, regulatory decisions, judicial rulings, and 
## new global warming legislation". Perhaps this explains why but this isn't the
## point. This is meant to be purely exploratory.
## Source: https://en.wikipedia.org/wiki/Coal_power_in_the_United_States

source("functions.R")

## Read in the two tables
readData()
## This plot requires the two datasets to be merged. 
## This may take a while on first run
mergeTables()

## Switch graphics device to png
launchGraphicsDevice(name = "plot4.png")

## Short.Name yields more observations relating to coal. 40400 entries versus 
## 28480 entries for EI.Sector
# coal <- filter(table_merged, grepl("[cC]oal", Short.Name) & grepl("[cC]ombustion", SCC.Level.One))

table_emissions <- table_merged %>%
    group_by(year) %>%
    filter(grepl("[cC]oal",Short.Name) & grepl("[cC]ombustion", SCC.Level.One)) %>%
    summarise(total = sum(Emissions))

## Plot the data
g <- ggplot(table_emissions, aes(x = year, y = total))
print (
    g + geom_point(color = "#000099") +
        geom_line(color = "#000099") +
        labs(x = "Year", y = "Total Emissions") +
        labs(title = "Levels of Coal Combustible Related PM2.5 across USA from 1999 to 2008")
)

## Close graphics device
closeGraphicsDevice()




