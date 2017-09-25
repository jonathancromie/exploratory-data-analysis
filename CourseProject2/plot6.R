## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California. Which city 
## has seen greater changes over time in motor vehicle emissions?

## Answer: Depending on your definition of "great", Baltimore has seen a more
## environmentally friendly impact. Emissions have only exceeded just above 10.
## Such low numbers could of course be due to an incomplete dataset however
## each city has roughly the same number of observations so let's continue. 
## Just remember this is exploratory and definitely not conclusive.
## Los Angeles has seen a steady increase each year from 1999 to 2005. 
## It's only decrease is in 2008 and it's not by very much.

source("functions.R")

## Read in the two tables
readData()

## Switch graphics device to png
# launchGraphicsDevice(name = "plot6.png")

# table_merged <- merge(NEI, SCC, by.y = as.character("SCC"), all.x = TRUE)
if (!exists("table_merged")) {
    mergeTables()
}

## Include motorcycles as they are a type of motor vehicle. Therefore grep 'motor'
## on SCC.Level.Three
vehicles <- filter(table_merged, grepl("[mM]otor", SCC.Level.Three) &
                       (fips == "24510" | fips == "06037"))

# baltimore <- subset(vehicles, fips == "24510")
# la <- subset(vehicles, fips == "06037")
nrow(baltimore) # 88
nrow(la) # 91

table_emissions <- table_merged %>%
    group_by(year, fips) %>%
    filter(grepl("[mM]otor", SCC.Level.Three) & 
               (fips == "24510" | fips == "06037")) %>%
    summarise(total = sum(Emissions))

## Plot the data
g <- ggplot(table_emissions, aes(x = year, y = total, color = fips))
print (
    g + geom_point() +
        geom_line() +
        labs(x = "Year", y = "Total Emissions") +
        labs(title = "Comparison of Motor Vehicle Related PM25 Levels for Baltimore City and Los Angeles") +
        scale_color_discrete(name = "Cities", labels = c("Los Angeles", "Baltimore City"))
)

## Close graphics device
closeGraphicsDevice()




