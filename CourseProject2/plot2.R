## Have total emissions from PM2.5 decreased in the Baltimore City from 1999 to 2008?

## Answer: Yes, it looks like the total levels of PM2.5 have decreased from a
## little over 3200, to under 2000 from 1999 to 2008.

source("functions.R")

## les
readData()

## Switch graphics device to png
launchGraphicsDevice(name = "plot2.png")

table_emissions <- NEI %>% 
    group_by(year) %>%
    filter(fips == "24510") %>%
    summarise(total = sum(Emissions))

## Plot the data
plot(table_emissions$year, table_emissions$total, col = "blue", 
     xlab = "Year", ylab = "Total Emissions",
     main = "Levels of PM2.5 in Baltimore City from 1999 to 2008", pch = 20, type = "o")

## Close graphics device
closeGraphicsDevice()

