# table_merged <- merge(NEI, SCC, by.y = as.character("SCC"), all.x = TRUE)

## Short.Name yields more observations relating to coal. 40400 entries versus 
## 28480 entries for EI.Sector
# coal <- filter(table_merged, grepl("[cC]oal", Short.Name) & grepl("[cC]ombustion", SCC.Level.One))

emissions <- table_merged %>%
    group_by(year) %>%
    filter(grepl("[cC]oal",Short.Name) & grepl("[cC]ombustion", SCC.Level.One)) %>%
    summarise(total = mean(Emissions))

g <- ggplot(emissions, aes(x = year, y = total))
print (
    g + geom_point() + 
    geom_line() + 
    # coord_cartesian(ylim = c(-10, 10), expand = TRUE) +
    labs(x = "Year", y = "Total Emissions") +
    labs(title = "Levels of Coal Combustible Related PM2.5 across USA from 1999 to 2008")
)




