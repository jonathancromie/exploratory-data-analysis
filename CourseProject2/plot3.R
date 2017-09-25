emissions <- NEI %>% 
    group_by(year, type) %>%
    filter(fips == "24510") %>%
    summarise(total = mean(Emissions))

g <- ggplot(emissions, aes(x = year, y = total, color = type))
print (
    g + geom_point() + 
    geom_line() + 
    labs(x = "Year", y = "Total Emissions") +
    labs(title = "Levels of PM2.5 in Baltimore City from 1999 to 2008 by Type") +
    scale_color_discrete(name = "Type", labels = c("Non-Road", "Non-Point", "On-Road", "Point"))
)

