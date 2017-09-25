emissions <- NEI %>% 
    group_by(year) %>%
    filter(fips == "24510") %>%
    summarise(total = sum(Emissions))

plot(emissions$year, emissions$total, col = "blue", xlab = "Year", ylab = "Total Emissions",
     main = "Levels of PM2.5 in Baltimore City from 1999 to 2008", pch = 20, type = "o")


