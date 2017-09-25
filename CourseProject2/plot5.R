# table_merged <- merge(NEI, SCC, by.y = as.character("SCC"), all.x = TRUE)

## Include motorcycles as they are a type of motor vehicle. Therefore grep 'motor'
## on SCC.Level.Three
# vehicles <- filter(table_merged, grepl("[mM]otor", SCC.Level.Three) & fips == "24510")

emissions <- table_merged %>%
    group_by(year) %>%
    filter(grepl("[mM]otor", SCC.Level.Three) & fips == "24510") %>%
    summarise(total = sum(Emissions))

g <- ggplot(emissions, aes(x = year, y = total))
print (
    g + geom_point(color = "#000099") +
    geom_line(color = "#000099") +
    labs(x = "Year", y = "Total Emissions") +
    labs(title = "Levels of Motor Vehicle Related PM2.5 in Baltimore City from 1999 to 2008")
)




