# table_merged <- merge(NEI, SCC, by.y = as.character("SCC"), all.x = TRUE)

## Include motorcycles as they are a type of motor vehicle. Therefore grep 'motor'
## on SCC.Level.Three
# vehicles <- filter(table_merged, grepl("[mM]otor", SCC.Level.Three) & 
#                        (fips == "24510" | fips == "06037")) 

emissions <- table_merged %>%
    group_by(year, fips) %>%
    filter(grepl("[mM]otor", SCC.Level.Three) & 
               (fips == "24510" | fips == "06037")) %>%
    summarise(total = mean(Emissions))

g <- ggplot(emissions, aes(x = year, y = total, color = fips))
print (
    g + geom_point() +
        geom_line() +
        labs(x = "Year", y = "Total Emissions") +
        labs(title = "Comparison of Motor Vehicle Related PM25 Levels for Baltimore City and Los Angeles") +
        scale_color_discrete(name = "Cities", labels = c("Los Angeles", "Baltimore City"))
)




