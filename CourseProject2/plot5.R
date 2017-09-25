## How have emissions from motor vehicle sources changed from 1999–2008 in 
## Baltimore City?

## Answer: Emissions of motor vehicle sources in Baltimore have also seen a 
## decrease since 1999. The total number of emissions in 1999 were above 70
## and have decreased to just below 30 in 2008.

source("functions.R")

## Read in the two tables
readData()
## This plot requires the two datasets to be merged. 
## This may take a while on first run
mergeTables()

## Switch graphics device to png
launchGraphicsDevice(name = "plot5.png")

## Include motorcycles as they are a type of motor vehicle. Therefore grep 'motor'
## on SCC.Level.Three
# vehicles <- filter(table_merged, grepl("[mM]otor", SCC.Level.Three) & fips == "24510")

table_emissions <- table_merged %>%
    group_by(year) %>%
    filter(grepl("[mM]otor", SCC.Level.Three) & fips == "24510") %>%
    summarise(total = sum(Emissions))

## Plot the data
g <- ggplot(emissions, aes(x = year, y = total))
print (
    g + geom_point(color = "#000099") +
        geom_line(color = "#000099") +
        labs(x = "Year", y = "Total Emissions") +
        labs(title = "Levels of Motor Vehicle Related PM2.5 in Baltimore City from 1999 to 2008")
)

## Close graphics device
closeGraphicsDevice()




