## Of the four types of sources indicated by the 'type' (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from
## 1999–2008 ## for Baltimore City? Which have seen increases in emissions from 1999–2008?

## Answer: The three types Non-Road, Non-Point, and On-Road all seem to have 
## decreasing trends. The type Point however saw an increase in the year 2005 but
## has since decreased in 2008.

source("functions.R")

## Read in the two tables
readData()

## Switch graphics device to png
launchGraphicsDevice(name = "plot3.png")

table_emissions <- NEI %>% 
    filter(fips == "24510") %>%
    group_by(year, type) %>%
    summarise(total = sum(Emissions))

## Plot the data
g <- ggplot(table_emissions, aes(x = year, y = total, color = type))
print (
    g + geom_point() + 
        geom_line() + 
        labs(x = "Year", y = "Total Emissions") +
        labs(title = "Levels of PM2.5 in Baltimore City from 1999 to 2008 by Type") +
        scale_color_discrete(name = "Type", labels = c("Non-Road", "Non-Point", "On-Road", "Point"))
)

## Close graphics device
closeGraphicsDevice()

