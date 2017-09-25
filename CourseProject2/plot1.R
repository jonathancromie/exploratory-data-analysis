## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

## Answer: Judging from the plot, yes it looks like emissions have reduced a 
## little over half from 1999 to 2008 going from a total of 7,332,967 to 3,464,206.

source("functions.R")

## Read in the two tables
readData()

## Switch graphics device to png
launchGraphicsDevice(name = "plot1.png")

## Total emissions of PM2.5 in the United States for years 1999, 2002, 2005 and 2008 
table_emissions <- NEI %>%
    group_by(year) %>%
    filter(any(year == 1999 | year == 2002 | year == 2005 | year == 2008)) %>%
    summarise(total = sum(Emissions, na.rm = TRUE))

## Plot the data
plot(table_emissions$year, table_emissions$total, col = "blue", 
     xlab = "Year", ylab = "Total Emissions",
     main = "Levels of PM2.5 from 1999 to 2008", pch = 20, type = "o", xaxt = "n", yaxt = "n")
axis(1, at = table_emissions$year)
axis(2, at = table_emissions$total)

## Close graphics device
closeGraphicsDevice()




